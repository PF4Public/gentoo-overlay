/*
 * Copyright (C) 2006 Apple Computer, Inc.
 * Copyright (C) Research In Motion Limited 2009-2010. All rights reserved.
 *
 * Portions are Copyright (C) 2001 mozilla.org
 *
 * Other contributors:
 *   Stuart Parmenter <stuart@mozilla.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 * Alternatively, the contents of this file may be used under the terms
 * of either the Mozilla Public License Version 1.1, found at
 * http://www.mozilla.org/MPL/ (the "MPL") or the GNU General Public
 * License Version 2.0, found at http://www.fsf.org/copyleft/gpl.html
 * (the "GPL"), in which case the provisions of the MPL or the GPL are
 * applicable instead of those above.  If you wish to allow use of your
 * version of this file only under the terms of one of those two
 * licenses (the MPL or the GPL) and not to allow others to use your
 * version of this file under the LGPL, indicate your decision by
 * deletingthe provisions above and replace them with the notice and
 * other provisions required by the MPL or the GPL, as the case may be.
 * If you do not delete the provisions above, a recipient may use your
 * version of this file under any of the LGPL, the MPL or the GPL.
 */
#include <memory>
#include "base/compiler_specific.h"
#include "base/numerics/checked_math.h"
#include "third_party/blink/renderer/platform/image-decoders/fast_shared_buffer_reader.h"
#include "third_party/blink/renderer/platform/image-decoders/png/png_image_decoder.h"
#include "third_party/blink/renderer/platform/image-decoders/segment_reader.h"
#include "zlib.h"
namespace {
inline blink::PngImageDecoder* imageDecoder(png_structp png) {
  return static_cast<blink::PngImageDecoder*>(png_get_progressive_ptr(png));
}
void PNGAPI pngHeaderAvailable(png_structp png, png_infop) {
  imageDecoder(png)->HeaderAvailable();
}
void PNGAPI pngRowAvailable(png_structp png,
                            png_bytep row,
                            png_uint_32 rowIndex,
                            int state) {
  imageDecoder(png)->RowAvailable(row, rowIndex, state);
}
void PNGAPI pngFrameComplete(png_structp png, png_infop) {
  imageDecoder(png)->FrameComplete();
}
void PNGAPI pngFailed(png_structp png, png_const_charp) {
  longjmp(JMPBUF(png), 1);
}
}  // namespace
namespace blink {
PNGImageReader::PNGImageReader(PngImageDecoder* decoder,
                               wtf_size_t initial_offset)
    : width_(0),
      height_(0),
      decoder_(decoder),
      initial_offset_(initial_offset),
      read_offset_(initial_offset),
      progressive_decode_offset_(0),
      ihdr_offset_(0),
      idat_offset_(0),
      idat_is_part_of_animation_(false),
      expect_idats_(true),
      is_animated_(false),
      parsed_signature_(false),
      parsed_ihdr_(false),
      parse_completed_(false),
      reported_frame_count_(0),
      next_sequence_number_(0),
      fctl_needs_dat_chunk_(false),
      ignore_animation_(false) {
  png_ = png_create_read_struct(PNG_LIBPNG_VER_STRING, nullptr, pngFailed,
                                nullptr);
  // Configure the PNG encoder to always keep the cICP, cLLI and mDCV chunks if
  // present.
  // TODO(veluca): when libpng starts supporting cICP/cLLI chunks explicitly,
  // remove this code.
  png_set_keep_unknown_chunks(
      png_, PNG_HANDLE_CHUNK_ALWAYS,
      reinterpret_cast<const png_byte*>("cICP\0cLLi\0mDCv\0cLLI\0mDCV"), 5);
  info_ = png_create_info_struct(png_);
  png_set_progressive_read_fn(png_, decoder_, nullptr, pngRowAvailable,
                              pngFrameComplete);
  // This setting ensures that we display images with incorrect CMF bytes.
  // See crbug.com/807324.
  png_set_option(png_, PNG_MAXIMUM_INFLATE_WINDOW, PNG_OPTION_ON);
}
PNGImageReader::~PNGImageReader() {
  png_destroy_read_struct(png_ ? &png_ : nullptr, info_ ? &info_ : nullptr,
                          nullptr);
  DCHECK(!png_ && !info_);
}
// This method reads from the FastSharedBufferReader, starting at offset,
// and returns |length| bytes in the form of a pointer to a const png_byte*.
// This function is used to make it easy to access data from the reader in a
// png friendly way, and pass it to libpng for decoding.
//
// Pre-conditions before using this:
// - |reader|.size() >= |read_offset| + |length|
// - |buffer|.size() >= |length|
// - |length| <= |kPngReadBufferSize|
//
// The reason for the last two precondition is that currently the png signature
// plus IHDR chunk (8B + 25B = 33B) is the largest chunk that is read using this
// method. If the data is not consecutive, it is stored in |buffer|, which must
// have the size of (at least) |length|, but there's no need for it to be larger
// than |kPngReadBufferSize|.
static constexpr wtf_size_t kPngReadBufferSize = 33;
const png_byte* ReadAsConstPngBytep(const FastSharedBufferReader& reader,
                                    wtf_size_t read_offset,
                                    wtf_size_t length,
                                    base::span<uint8_t> buffer) {
  DCHECK_LE(length, kPngReadBufferSize);
  return reinterpret_cast<const png_byte*>(
      reader.GetConsecutiveData(read_offset, length, buffer).data());
}
bool PNGImageReader::ShouldDecodeWithNewPNG(wtf_size_t index) const {
  if (!png_) {
    return true;
  }
  const bool first_frame_decode_in_progress = progressive_decode_offset_;
  const bool frame_size_matches_ihdr =
      frame_info_[index].frame_rect == gfx::Rect(0, 0, width_, height_);
  if (index) {
    return first_frame_decode_in_progress || !frame_size_matches_ihdr;
  }
  return !first_frame_decode_in_progress && !frame_size_matches_ihdr;
}
// Return false on a fatal error.
bool PNGImageReader::Decode(SegmentReader& data, wtf_size_t index) {
  if (index >= frame_info_.size()) {
    return true;
  }
  const FastSharedBufferReader reader(&data);
  if (!is_animated_) {
    if (setjmp(JMPBUF(png_))) {
      return false;
    }
    DCHECK_EQ(0u, index);
    progressive_decode_offset_ += ProcessData(
        reader, frame_info_[0].start_offset + progressive_decode_offset_, 0);
    return true;
  }
  DCHECK(is_animated_);
  const bool decode_with_new_png = ShouldDecodeWithNewPNG(index);
  if (decode_with_new_png) {
    ClearDecodeState(0);
    png_ = png_create_read_struct(PNG_LIBPNG_VER_STRING, nullptr, pngFailed,
                                  nullptr);
    info_ = png_create_info_struct(png_);
    png_set_progressive_read_fn(png_, decoder_, pngHeaderAvailable,
                                pngRowAvailable, pngFrameComplete);
  }
  if (setjmp(JMPBUF(png_))) {
    return false;
  }
  if (decode_with_new_png) {
    StartFrameDecoding(reader, index);
  }
  if (!index && (!FirstFrameFullyReceived() || progressive_decode_offset_)) {
    const bool decoded_entire_frame = ProgressivelyDecodeFirstFrame(reader);
    if (!decoded_entire_frame) {
      return true;
    }
    progressive_decode_offset_ = 0;
  } else {
    DecodeFrame(reader, index);
  }
  static png_byte iend[12] = {0, 0, 0, 0, 'I', 'E', 'N', 'D', 174, 66, 96, 130};
  png_process_data(png_, info_, iend, 12);
  png_destroy_read_struct(&png_, &info_, nullptr);
  DCHECK(!png_ && !info_);
  return true;
}
void PNGImageReader::StartFrameDecoding(const FastSharedBufferReader& reader,
                                        wtf_size_t index) {
  DCHECK_GT(ihdr_offset_, initial_offset_);
  ProcessData(reader, initial_offset_, ihdr_offset_ - initial_offset_);
  const gfx::Rect& frame_rect = frame_info_[index].frame_rect;
  if (frame_rect == gfx::Rect(0, 0, width_, height_)) {
    DCHECK_GT(idat_offset_, ihdr_offset_);
    ProcessData(reader, ihdr_offset_, idat_offset_ - ihdr_offset_);
    return;
  }
  // Process the IHDR chunk, but change the width and height so it reflects
  // the frame's width and height. ImageDecoder will apply the x,y offset.
  constexpr wtf_size_t kHeaderSize = 25;
  std::array<uint8_t, kHeaderSize> read_buffer;
  const png_byte* chunk =
      ReadAsConstPngBytep(reader, ihdr_offset_, kHeaderSize, read_buffer);
  png_byte* header = reinterpret_cast<png_byte*>(read_buffer.data());
  if (chunk != header) {
    UNSAFE_TODO(memcpy(header, chunk, kHeaderSize));
  }
  png_save_uint_32(UNSAFE_TODO(header + 8), frame_rect.width());
  png_save_uint_32(UNSAFE_TODO(header + 12), frame_rect.height());
  // IHDR has been modified, so tell libpng to ignore CRC errors.
  png_set_crc_action(png_, PNG_CRC_QUIET_USE, PNG_CRC_QUIET_USE);
  png_process_data(png_, info_, header, kHeaderSize);
  // Process the rest of the header chunks.
  DCHECK_GE(idat_offset_, ihdr_offset_ + kHeaderSize);
  ProcessData(reader, ihdr_offset_ + kHeaderSize,
              idat_offset_ - ihdr_offset_ - kHeaderSize);
}
// Determine if the bytes 4 to 7 of |chunk| indicate that it is a |tag| chunk.
// - The length of |chunk| must be >= 8
// - The length of |tag| must be = 4
static inline bool IsChunk(const png_byte* chunk, const char* tag) {
  return UNSAFE_TODO(memcmp(chunk + 4, tag, 4)) == 0;
}
bool PNGImageReader::ProgressivelyDecodeFirstFrame(
    const FastSharedBufferReader& reader) {
  wtf_size_t offset = frame_info_[0].start_offset;
  // Loop while there is enough data to do progressive decoding.
  while (reader.size() >= offset + 8) {
    std::array<uint8_t, 8> read_buffer;
    // At the beginning of each loop, the offset is at the start of a chunk.
    const png_byte* chunk = ReadAsConstPngBytep(reader, offset, 8, read_buffer);
    // A large length would have been rejected in Parse.
    const png_uint_32 length = UNSAFE_TODO(png_get_uint_32(chunk));
    DCHECK_LE(length, PNG_UINT_31_MAX);
    // When an fcTL or IEND chunk is encountered, the frame data has ended.
    if (IsChunk(chunk, "fcTL") || IsChunk(chunk, "IEND")) {
      return true;
    }
    const wtf_size_t chunk_end_offset = offset + length + 12;
    DCHECK_GT(chunk_end_offset, offset);
    // If this chunk was already decoded, move on to the next.
    if (progressive_decode_offset_ >= chunk_end_offset) {
      offset = chunk_end_offset;
      continue;
    }
    // Three scenarios are possible here:
    // 1) Some bytes of this chunk were already decoded in a previous call.
    //    Continue from there.
    // 2) This is an fdAT chunk. Convert it to an IDAT chunk to decode.
    // 3) This is any other chunk. Pass it to libpng for processing.
    if (progressive_decode_offset_ >= offset + 8) {
      offset = progressive_decode_offset_;
    } else if (IsChunk(chunk, "fdAT")) {
      ProcessFdatChunkAsIdat(length);
      // Skip the sequence number.
      offset += 12;
    } else {
      png_process_data(png_, info_, const_cast<png_byte*>(chunk), 8);
      offset += 8;
    }
    wtf_size_t bytes_left_in_chunk = chunk_end_offset - offset;
    wtf_size_t bytes_decoded = ProcessData(reader, offset, bytes_left_in_chunk);
    progressive_decode_offset_ = offset + bytes_decoded;
    if (bytes_decoded < bytes_left_in_chunk) {
      return false;
    }
    offset += bytes_decoded;
  }
  return false;
}
void PNGImageReader::ProcessFdatChunkAsIdat(png_uint_32 fdat_length) {
  // An fdAT chunk is built as follows:
  // - |length| (4B)
  // - fdAT tag (4B)
  // - sequence number (4B)
  // - frame data (|length| - 4B)
  // - CRC (4B)
  // Thus, to reformat this into an IDAT chunk, do the following:
  // - write |length| - 4 as the new length, since the sequence number
  //   must be removed.
  // - change the tag to IDAT.
  // - omit the sequence number from the data part of the chunk.
  png_byte chunk_idat[] = {0, 0, 0, 0, 'I', 'D', 'A', 'T'};
  DCHECK_GE(fdat_length, 4u);
  png_save_uint_32(chunk_idat, fdat_length - 4u);
  // The CRC is incorrect when applied to the modified fdAT.
  png_set_crc_action(png_, PNG_CRC_QUIET_USE, PNG_CRC_QUIET_USE);
  png_process_data(png_, info_, chunk_idat, 8);
}
void PNGImageReader::DecodeFrame(const FastSharedBufferReader& reader,
                                 wtf_size_t index) {
  wtf_size_t offset = frame_info_[index].start_offset;
  wtf_size_t end_offset = offset + frame_info_[index].byte_length;
  std::array<uint8_t, 8> read_buffer;
  while (offset < end_offset) {
    const png_byte* chunk = ReadAsConstPngBytep(reader, offset, 8, read_buffer);
    const png_uint_32 length = UNSAFE_TODO(png_get_uint_32(chunk));
    DCHECK_LE(length, PNG_UINT_31_MAX);
    if (IsChunk(chunk, "fdAT")) {
      ProcessFdatChunkAsIdat(length);
      // The frame data and the CRC span |length| bytes, so skip the
      // sequence number and process |length| bytes to decode the frame.
      ProcessData(reader, offset + 12, length);
    } else {
      png_process_data(png_, info_, const_cast<png_byte*>(chunk), 8);
      ProcessData(reader, offset + 8, length + 4);
    }
    offset += 12 + length;
  }
}
// Compute the CRC and compare to the stored value.
static bool CheckCrc(const FastSharedBufferReader& reader,
                     wtf_size_t chunk_start,
                     wtf_size_t chunk_length) {
  constexpr wtf_size_t kSizeNeededForfcTL = 26 + 4;
  std::array<uint8_t, kSizeNeededForfcTL> read_buffer;
  DCHECK_LE(chunk_length + 4u, kSizeNeededForfcTL);
  const png_byte* chunk = ReadAsConstPngBytep(reader, chunk_start + 4,
                                              chunk_length + 4, read_buffer);
  std::array<uint8_t, 4> crc_buffer;
  const png_byte* crc_position = ReadAsConstPngBytep(
      reader, chunk_start + 8 + chunk_length, 4, crc_buffer);
  png_uint_32 crc = UNSAFE_TODO(png_get_uint_32(crc_position));
  return crc == crc32(crc32(0, Z_NULL, 0), chunk, chunk_length + 4);
}
bool PNGImageReader::CheckSequenceNumber(const png_byte* position) {
  png_uint_32 sequence = UNSAFE_TODO(png_get_uint_32(position));
  if (sequence != next_sequence_number_ || sequence > PNG_UINT_31_MAX) {
    return false;
  }
  ++next_sequence_number_;
  return true;
}
// Return false if there was a fatal error; true otherwise.
bool PNGImageReader::Parse(SegmentReader& data, ParseQuery query) {
  if (parse_completed_) {
    return true;
  }
  const FastSharedBufferReader reader(&data);
  if (!ParseSize(reader)) {
    return false;
  }
  if (!decoder_->IsDecodedSizeAvailable()) {
    return true;
  }
  // For non animated images (identified by no acTL chunk before the IDAT),
  // there is no need to continue parsing.
  if (!is_animated_) {
    FrameInfo frame;
    frame.start_offset = read_offset_;
    // This should never be read in this case, but initialize just in case.
    frame.byte_length = kFirstFrameIndicator;
    frame.duration = 0;
    frame.frame_rect = gfx::Rect(0, 0, width_, height_);
    frame.disposal_method = ImageFrame::DisposalMethod::kDisposeKeep;
    frame.alpha_blend = ImageFrame::AlphaBlendSource::kBlendAtopBgcolor;
    DCHECK(frame_info_.empty());
    frame_info_.push_back(frame);
    parse_completed_ = true;
    return true;
  }
  if (query == ParseQuery::kSize) {
    return true;
  }
  DCHECK_EQ(ParseQuery::kMetaData, query);
  DCHECK(is_animated_);
  // Loop over the data and manually register all frames. Nothing is passed to
  // libpng for processing. A frame is registered on the next fcTL chunk or
  // when the IEND chunk is found. This ensures that only complete frames are
  // reported, unless there is an error in the stream.
  std::array<uint8_t, kPngReadBufferSize> read_buffer;
  for (;;) {
    constexpr wtf_size_t kChunkHeaderSize = 8;
    wtf_size_t chunk_start_offset;
    if (!base::CheckAdd(read_offset_, kChunkHeaderSize)
             .AssignIfValid(&chunk_start_offset)) {
      // Overflow.
      return false;
    }
    if (reader.size() < chunk_start_offset) {
      // Insufficient data to decode the next chunk header.
      break;
    }
    const png_byte* chunk = ReadAsConstPngBytep(reader, read_offset_,
                                                kChunkHeaderSize, read_buffer);
    const wtf_size_t length = UNSAFE_TODO(png_get_uint_32(chunk));
    if (length > PNG_UINT_31_MAX) {
      return false;
    }
    wtf_size_t chunk_end_offset;
    if (!base::CheckAdd(read_offset_, base::CheckAdd(12, length))
             .AssignIfValid(&chunk_end_offset)) {
      // Overflow.
      return false;
    }
    const bool idat = IsChunk(chunk, "IDAT");
    if (idat && !expect_idats_) {
      return false;
    }
    const bool fdat = IsChunk(chunk, "fdAT");
    if (fdat && expect_idats_) {
      return false;
    }
    if (fdat || (idat && idat_is_part_of_animation_)) {
      fctl_needs_dat_chunk_ = false;
      if (!new_frame_.start_offset) {
        // Beginning of a new frame's data.
        new_frame_.start_offset = read_offset_;
        if (frame_info_.empty()) {
          // This is the first frame. Report it immediately so it can be
          // decoded progressively.
          new_frame_.byte_length = kFirstFrameIndicator;
          frame_info_.push_back(new_frame_);
        }
      }
      if (fdat) {
        if (length < 4) {
          // The sequence number requires 4 bytes. Further,
          // ProcessFdatChunkAsIdat expects to be able to create an IDAT with
          // |newLength| = length - 4. Prevent underflow in that calculation.
          return false;
        }
        if (reader.size() < read_offset_ + 8 + 4) {
          return true;
        }
        const png_byte* sequence_position =
            ReadAsConstPngBytep(reader, read_offset_ + 8, 4, read_buffer);
        if (!CheckSequenceNumber(sequence_position)) {
          return false;
        }
      }
    } else if (IsChunk(chunk, "fcTL") || IsChunk(chunk, "IEND")) {
      // This marks the end of the previous frame.
      if (new_frame_.start_offset) {
        new_frame_.byte_length = read_offset_ - new_frame_.start_offset;
        if (frame_info_[0].byte_length == kFirstFrameIndicator) {
          frame_info_[0].byte_length = new_frame_.byte_length;
        } else {
          frame_info_.push_back(new_frame_);
          if (IsChunk(chunk, "fcTL")) {
            if (frame_info_.size() >= reported_frame_count_) {
              return false;
            }
          } else {  // IEND
            if (frame_info_.size() != reported_frame_count_) {
              return false;
            }
          }
        }
        new_frame_.start_offset = 0;
      }
      if (reader.size() < chunk_end_offset) {
        return true;
      }
      if (IsChunk(chunk, "IEND")) {
        parse_completed_ = true;
        return true;
      }
      if (length != 26 || !CheckCrc(reader, read_offset_, length)) {
        return false;
      }
      chunk =
          ReadAsConstPngBytep(reader, read_offset_ + 8, length, read_buffer);
      if (!ParseFrameInfo(chunk)) {
        return false;
      }
      expect_idats_ = false;
    } else if (IsChunk(chunk, "acTL")) {
      // There should only be one acTL chunk, and it should be before the
      // IDAT chunk.
      return false;
    }
    read_offset_ = chunk_end_offset;
  }
  return true;
}
// If `length` == 0, read until the stream ends. Return number of bytes
// processed.
wtf_size_t PNGImageReader::ProcessData(const FastSharedBufferReader& reader,
                                       wtf_size_t offset,
                                       wtf_size_t length) {
  wtf_size_t total_processed_bytes = 0;
  while (reader.size() > offset) {
    base::span<const uint8_t> segment = reader.GetSomeData(offset);
    if (length > 0 && segment.size() > length - total_processed_bytes) {
      segment = segment.first(length - total_processed_bytes);
    }
    png_process_data(png_, info_, const_cast<uint8_t*>(segment.data()),
                     segment.size());
    offset += segment.size();
    total_processed_bytes += segment.size();
    if (total_processed_bytes == length) {
      return length;
    }
  }
  return total_processed_bytes;
}
// Process up to the start of the IDAT with libpng.
// Return false for a fatal error. True otherwise.
bool PNGImageReader::ParseSize(const FastSharedBufferReader& reader) {
  if (decoder_->IsDecodedSizeAvailable()) {
    return true;
  }
  std::array<uint8_t, kPngReadBufferSize> read_buffer;
  if (setjmp(JMPBUF(png_))) {
    return false;
  }
  if (!parsed_signature_) {
    constexpr wtf_size_t kNumSignatureBytes = 8;
    wtf_size_t signature_end_offset;
    if (!base::CheckAdd(read_offset_, kNumSignatureBytes)
             .AssignIfValid(&signature_end_offset)) {
      return false;
    }
    if (reader.size() < signature_end_offset) {
      return true;
    }
    const png_byte* chunk = ReadAsConstPngBytep(
        reader, read_offset_, kNumSignatureBytes, read_buffer);
    png_process_data(png_, info_, const_cast<png_byte*>(chunk),
                     kNumSignatureBytes);
    read_offset_ = signature_end_offset;
    parsed_signature_ = true;
    new_frame_.start_offset = 0;
  }
  // Process some chunks manually, and pass some to libpng.
  for (png_uint_32 length = 0; reader.size() >= read_offset_ + 8;
       // This call will not overflow since it was already checked below, after
       // calculating chunk_end_offset.
       read_offset_ += length + 12) {
    const png_byte* chunk =
        ReadAsConstPngBytep(reader, read_offset_, 8, read_buffer);
    length = UNSAFE_TODO(png_get_uint_32(chunk));
    if (length > PNG_UINT_31_MAX) {
      return false;
    }
    wtf_size_t chunk_end_offset;
    if (!base::CheckAdd(read_offset_, base::CheckAdd(12, length))
             .AssignIfValid(&chunk_end_offset)) {
      // Overflow
      return false;
    }
    if (IsChunk(chunk, "IDAT")) {
      // Done with header chunks.
      idat_offset_ = read_offset_;
      fctl_needs_dat_chunk_ = false;
      if (ignore_animation_) {
        is_animated_ = false;
      }
      // SetSize() requires bit depth information to correctly fallback to 8888
      // decoding if there is not enough memory to decode to f16 pixel format.
      // SetBitDepth() requires repition count to correctly fallback to 8888
      // decoding for multi-frame APNGs (https://crbug.com/874057). Therefore,
      // the order of the next three calls matters.
      if (!is_animated_ || 1 == reported_frame_count_) {
        decoder_->SetRepetitionCount(kAnimationNone);
      }
      decoder_->SetBitDepth();
      if (!decoder_->SetSize(width_, height_)) {
        return false;
      }
      decoder_->SetColorSpace();
      decoder_->HeaderAvailable();
      return true;
    }
    // Wait until the entire chunk is available for parsing simplicity.
    if (reader.size() < chunk_end_offset) {
      break;
    }
    if (IsChunk(chunk, "acTL")) {
      if (ignore_animation_) {
        continue;
      }
      if (is_animated_ || length != 8 || !parsed_ihdr_ ||
          !CheckCrc(reader, read_offset_, 8)) {
        ignore_animation_ = true;
        continue;
      }
      chunk =
          ReadAsConstPngBytep(reader, read_offset_ + 8, length, read_buffer);
      reported_frame_count_ = UNSAFE_TODO(png_get_uint_32(chunk));
      if (!reported_frame_count_ || reported_frame_count_ > PNG_UINT_31_MAX) {
        ignore_animation_ = true;
        continue;
      }
      png_uint_32 repetition_count = UNSAFE_TODO(png_get_uint_32(chunk + 4));
      if (repetition_count > PNG_UINT_31_MAX) {
        ignore_animation_ = true;
        continue;
      }
      is_animated_ = true;
      decoder_->SetRepetitionCount(static_cast<int>(repetition_count) - 1);
    } else if (IsChunk(chunk, "fcTL")) {
      if (ignore_animation_) {
        continue;
      }
      if (length != 26 || !parsed_ihdr_ ||
          !CheckCrc(reader, read_offset_, 26)) {
        ignore_animation_ = true;
        continue;
      }
      chunk =
          ReadAsConstPngBytep(reader, read_offset_ + 8, length, read_buffer);
      if (!ParseFrameInfo(chunk) ||
          new_frame_.frame_rect != gfx::Rect(0, 0, width_, height_)) {
        ignore_animation_ = true;
        continue;
      }
      idat_is_part_of_animation_ = true;
    } else if (IsChunk(chunk, "fdAT")) {
      ignore_animation_ = true;
    } else {
      auto is_necessary_ancillary = [](const png_byte* chunk) {
        for (const char* tag : {"tRNS", "cHRM", "iCCP", "sRGB", "gAMA", "cICP",
                                "cLLi", "cLLI", "mDCv", "mDCV", "eXIf"}) {
          if (IsChunk(chunk, tag)) {
            return true;
          }
        }
        return false;
      };
      // Determine if the chunk type of |chunk| is "critical".
      // (Ancillary bit == 0; the chunk is required for display).
      bool is_critical_chunk = (UNSAFE_TODO(chunk[4]) & 1u << 5) == 0;
      if (is_critical_chunk || is_necessary_ancillary(chunk)) {
        png_process_data(png_, info_, const_cast<png_byte*>(chunk), 8);
        ProcessData(reader, read_offset_ + 8, length + 4);
        if (IsChunk(chunk, "IHDR")) {
          parsed_ihdr_ = true;
          ihdr_offset_ = read_offset_;
          width_ = png_get_image_width(png_, info_);
          height_ = png_get_image_height(png_, info_);
        }
      }
    }
  }
  // Not enough data to call HeaderAvailable.
  return true;
}
void PNGImageReader::ClearDecodeState(wtf_size_t index) {
  if (index) {
    return;
  }
  png_destroy_read_struct(png_ ? &png_ : nullptr, info_ ? &info_ : nullptr,
                          nullptr);
  DCHECK(!png_ && !info_);
  progressive_decode_offset_ = 0;
}
const PNGImageReader::FrameInfo& PNGImageReader::GetFrameInfo(
    wtf_size_t index) const {
  DCHECK(index < frame_info_.size());
  return frame_info_[index];
}
// Extract the fcTL frame control info and store it in new_frame_. The length
// check on the fcTL data has been done by the calling code.
bool PNGImageReader::ParseFrameInfo(const png_byte* data) {
  if (fctl_needs_dat_chunk_) {
    return false;
  }
  png_uint_32 frame_width = UNSAFE_TODO(png_get_uint_32(data + 4));
  png_uint_32 frame_height = UNSAFE_TODO(png_get_uint_32(data + 8));
  png_uint_32 x_offset = UNSAFE_TODO(png_get_uint_32(data + 12));
  png_uint_32 y_offset = UNSAFE_TODO(png_get_uint_32(data + 16));
  png_uint_16 delay_numerator = UNSAFE_TODO(png_get_uint_16(data + 20));
  png_uint_16 delay_denominator = UNSAFE_TODO(png_get_uint_16(data + 22));
  if (!CheckSequenceNumber(data)) {
    return false;
  }
  if (!frame_width || !frame_height) {
    return false;
  }
  {
    png_uint_32 frame_right;
    if (!base::CheckAdd(x_offset, frame_width).AssignIfValid(&frame_right) ||
        frame_right > width_) {
      return false;
    }
  }
  {
    png_uint_32 frame_bottom;
    if (!base::CheckAdd(y_offset, frame_height).AssignIfValid(&frame_bottom) ||
        frame_bottom > height_) {
      return false;
    }
  }
  new_frame_.frame_rect =
      gfx::Rect(x_offset, y_offset, frame_width, frame_height);
  if (delay_denominator) {
    new_frame_.duration = delay_numerator * 1000 / delay_denominator;
  } else {
    new_frame_.duration = delay_numerator * 10;
  }
  enum DisposeOperations : png_byte {
    kAPNG_DISPOSE_OP_NONE = 0,
    kAPNG_DISPOSE_OP_BACKGROUND = 1,
    kAPNG_DISPOSE_OP_PREVIOUS = 2,
  };
  const png_byte& dispose_op = UNSAFE_TODO(data[24]);
  switch (dispose_op) {
    case kAPNG_DISPOSE_OP_NONE:
      new_frame_.disposal_method = ImageFrame::DisposalMethod::kDisposeKeep;
      break;
    case kAPNG_DISPOSE_OP_BACKGROUND:
      new_frame_.disposal_method =
          ImageFrame::DisposalMethod::kDisposeOverwriteBgcolor;
      break;
    case kAPNG_DISPOSE_OP_PREVIOUS:
      new_frame_.disposal_method =
          ImageFrame::DisposalMethod::kDisposeOverwritePrevious;
      break;
    default:
      return false;
  }
  enum BlendOperations : png_byte {
    kAPNG_BLEND_OP_SOURCE = 0,
    kAPNG_BLEND_OP_OVER = 1,
  };
  const png_byte& blend_op = UNSAFE_TODO(data[25]);
  switch (blend_op) {
    case kAPNG_BLEND_OP_SOURCE:
      new_frame_.alpha_blend = ImageFrame::AlphaBlendSource::kBlendAtopBgcolor;
      break;
    case kAPNG_BLEND_OP_OVER:
      new_frame_.alpha_blend =
          ImageFrame::AlphaBlendSource::kBlendAtopPreviousFrame;
      break;
    default:
      return false;
  }
  fctl_needs_dat_chunk_ = true;
  return true;
}
}  // namespace blink

/*
 * Copyright (C) 2006 Apple Computer, Inc.
 * Copyright (C) Research In Motion Limited 2009-2010. All rights reserved.
 *
 * Portions are Copyright (C) 2001 mozilla.org
 *
 * Other contributors:
 *   Stuart Parmenter <stuart@mozilla.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 * Alternatively, the contents of this file may be used under the terms
 * of either the Mozilla Public License Version 1.1, found at
 * http://www.mozilla.org/MPL/ (the "MPL") or the GNU General Public
 * License Version 2.0, found at http://www.fsf.org/copyleft/gpl.html
 * (the "GPL"), in which case the provisions of the MPL or the GPL are
 * applicable instead of those above.  If you wish to allow use of your
 * version of this file only under the terms of one of those two
 * licenses (the MPL or the GPL) and not to allow others to use your
 * version of this file under the LGPL, indicate your decision by
 * deletingthe provisions above and replace them with the notice and
 * other provisions required by the MPL or the GPL, as the case may be.
 * If you do not delete the provisions above, a recipient may use your
 * version of this file under any of the LGPL, the MPL or the GPL.
 */
#ifdef UNSAFE_BUFFERS_BUILD
// TODO(crbug.com/351564777): Remove this and convert code to safer constructs.
#pragma allow_unsafe_buffers
#endif
#include "third_party/blink/renderer/platform/image-decoders/png/png_image_decoder.h"
#include <memory>
#include "base/containers/adapters.h"
#include "base/numerics/checked_math.h"
#include "media/base/video_color_space.h"
#include "skia/ext/cicp.h"
#include "third_party/blink/renderer/platform/wtf/text/atomic_string.h"
#include "third_party/skia/include/core/SkColorSpace.h"
#include "third_party/skia/modules/skcms/skcms.h"
#if (defined(__ARM_NEON__) || defined(__ARM_NEON))
#include <arm_neon.h>
#endif
namespace blink {
PngImageDecoder::PngImageDecoder(
    AlphaOption alpha_option,
    HighBitDepthDecodingOption high_bit_depth_decoding_option,
    ColorBehavior color_behavior,
    wtf_size_t max_decoded_bytes,
    wtf_size_t offset)
    : ImageDecoder(alpha_option,
                   high_bit_depth_decoding_option,
                   color_behavior,
                   cc::AuxImage::kDefault,
                   max_decoded_bytes),
      offset_(offset),
      current_frame_(0),
      // It would be logical to default to kAnimationNone, but BitmapImage uses
      // that as a signal to never check again, meaning the actual count will
      // never be respected.
      repetition_count_(kAnimationLoopOnce),
      has_alpha_channel_(false),
      current_buffer_saw_alpha_(false),
      decode_to_half_float_(false),
      bit_depth_(0) {}
PngImageDecoder::~PngImageDecoder() = default;
String PngImageDecoder::FilenameExtension() const {
  return "png";
}
const AtomicString& PngImageDecoder::MimeType() const {
  DEFINE_STATIC_LOCAL(const AtomicString, png_mime_type, ("image/png"));
  return png_mime_type;
}
bool PngImageDecoder::SetFailed() {
  reader_.reset();
  return ImageDecoder::SetFailed();
}
wtf_size_t PngImageDecoder::DecodeFrameCount() {
  Parse(ParseQuery::kMetaData);
  return Failed() ? frame_buffer_cache_.size() : reader_->FrameCount();
}
void PngImageDecoder::DecodeSize() {
  Parse(ParseQuery::kSize);
}
void PngImageDecoder::Decode(wtf_size_t index) {
  Parse(ParseQuery::kMetaData);
  if (Failed()) {
    return;
  }
  UpdateAggressivePurging(index);
  bool incomplete_parse = false;
  Vector<wtf_size_t> frames_to_decode = FindFramesToDecode(index);
  for (const auto& frame : base::Reversed(frames_to_decode)) {
    current_frame_ = frame;
    if (!reader_->Decode(*data_, frame)) {
      SetFailed();
      return;
    }
    // If this returns false, we need more data to continue decoding.
    if (!PostDecodeProcessing(frame)) {
      incomplete_parse = true;
      break;
    }
  }
  // It is also a fatal error if all data is received and we have decoded all
  // frames available but the file is truncated.
  if (index >= frame_buffer_cache_.size() - 1 && IsAllDataReceived()) {
    incomplete_parse |= (reader_ && !reader_->ParseCompleted());
    if (incomplete_parse) {
      SetFailed();
    }
  }
}
void PngImageDecoder::Parse(ParseQuery query) {
  if (Failed() || (reader_ && reader_->ParseCompleted())) {
    return;
  }
  if (!reader_) {
    reader_ = std::make_unique<PNGImageReader>(this, offset_);
  }
  if (!reader_->Parse(*data_, query)) {
    SetFailed();
  }
}
void PngImageDecoder::ClearFrameBuffer(wtf_size_t index) {
  if (reader_) {
    reader_->ClearDecodeState(index);
  }
  ImageDecoder::ClearFrameBuffer(index);
}
bool PngImageDecoder::CanReusePreviousFrameBuffer(wtf_size_t index) const {
  DCHECK(index < frame_buffer_cache_.size());
  return frame_buffer_cache_[index].GetDisposalMethod() !=
         ImageFrame::kDisposeOverwritePrevious;
}
void PngImageDecoder::SetRepetitionCount(int repetition_count) {
  repetition_count_ = repetition_count;
}
int PngImageDecoder::RepetitionCount() const {
  return Failed() ? kAnimationLoopOnce : repetition_count_;
}
void PngImageDecoder::InitializeNewFrame(wtf_size_t index) {
  const PNGImageReader::FrameInfo& frame_info = reader_->GetFrameInfo(index);
  ImageFrame& buffer = frame_buffer_cache_[index];
  if (decode_to_half_float_) {
    buffer.SetPixelFormat(ImageFrame::PixelFormat::kRGBA_F16);
  }
  DCHECK(gfx::Rect(Size()).Contains(frame_info.frame_rect));
  buffer.SetOriginalFrameRect(frame_info.frame_rect);
  buffer.SetDuration(base::Milliseconds(frame_info.duration));
  buffer.SetDisposalMethod(frame_info.disposal_method);
  buffer.SetAlphaBlendSource(frame_info.alpha_blend);
  wtf_size_t previous_frame_index = FindRequiredPreviousFrame(index, false);
  buffer.SetRequiredPreviousFrameIndex(previous_frame_index);
}
// Returns nullptr if the cICP chunk is invalid, or if it describes an
// unsupported color profile.
// See https://w3c.github.io/PNG-spec/#11cICP for the definition of this chunk.
static std::unique_ptr<ColorProfile> ParseCicpChunk(
    const png_unknown_chunk& chunk) {
  // First, validate the cICP chunk.
  // cICP must be 4 bytes.
  if (chunk.size != 4) {
    return nullptr;
  }
  // Memory layout: ptmf, with p representing the colour primaries, t
  // representing the transfer characteristics, m the matrix coefficients, and f
  // whether the data is full or limited range.
  uint8_t primaries = chunk.data[0];
  uint8_t trc = chunk.data[1];
  uint8_t matrix_coefficients = chunk.data[2];
  uint8_t range_u8 = chunk.data[3];
  sk_sp<SkColorSpace> sk_color_space = skia::CICPGetSkColorSpace(
      primaries, trc, matrix_coefficients, range_u8, /*prefer_srgb_trfn=*/true);
  if (!sk_color_space) {
    return nullptr;
  }
  skcms_ICCProfile profile;
  sk_color_space->toProfile(&profile);
  return std::make_unique<ColorProfile>(profile);
}
static inline std::unique_ptr<ColorProfile> ReadColorProfile(png_structp png,
                                                             png_infop info) {
  png_unknown_chunkp unknown_chunks;
  size_t num_unknown_chunks =
      png_get_unknown_chunks(png, info, &unknown_chunks);
  for (size_t i = 0; i < num_unknown_chunks; i++) {
    const auto& chunk = unknown_chunks[i];
    if (strcmp(reinterpret_cast<const char*>(chunk.name), "cICP") == 0) {
      // We found a cICP chunk, which takes priority over other chunks.
      std::unique_ptr<ColorProfile> cicp_color_profile = ParseCicpChunk(chunk);
      // Ignore cICP if it is invalid or if the color profile it describes is
      // not supported.
      if (cicp_color_profile) {
        return cicp_color_profile;
      }
    }
  }
  if (png_get_valid(png, info, PNG_INFO_sRGB)) {
    return std::make_unique<ColorProfile>(*skcms_sRGB_profile());
  }
  png_charp name;
  int compression;
  png_bytep buffer;
  png_uint_32 length;
  if (png_get_iCCP(png, info, &name, &compression, &buffer, &length)) {
    return ColorProfile::Create(base::as_bytes(base::span(buffer, length)));
  }
  png_fixed_point inverse_gamma;
  bool got_gama_chunk = png_get_gAMA_fixed(png, info, &inverse_gamma);
  if (!got_gama_chunk) {
    return nullptr;
  }
  struct pngFixedToFloat {
    explicit pngFixedToFloat(png_fixed_point value)
        : float_value(.00001f * value) {}
    operator float() { return float_value; }
    float float_value;
  };
  png_fixed_point chrm[8];
  if (!png_get_cHRM_fixed(png, info, &chrm[0], &chrm[1], &chrm[2], &chrm[3],
                          &chrm[4], &chrm[5], &chrm[6], &chrm[7])) {
    if (got_gama_chunk) {
      // `kPngGammaThreshold` mimics `PNG_GAMMA_THRESHOLD_FIXED` from `libpng`
      // without using internal/private `png_muldiv` and/or
      // `png_gamma_significant`.
      constexpr float kPngGammaThreshold = 0.05f;
      constexpr float kMinNeutralValue = 1.0f - kPngGammaThreshold;
      constexpr float kMaxNeutralValue = 1.0f + kPngGammaThreshold;
      float floating_inverse_gamma = pngFixedToFloat(inverse_gamma);
      float tmp = floating_inverse_gamma * 2.2f;
      bool is_neutral = kMinNeutralValue < tmp && tmp < kMaxNeutralValue;
      if (!is_neutral) {
        skcms_ICCProfile profile;
        skcms_Init(&profile);
        skcms_SetXYZD50(&profile, &SkNamedGamut::kSRGB);
        skcms_TransferFunction fn = SkNamedTransferFn::k2Dot2;
        fn.g = 1.0f / floating_inverse_gamma;
        skcms_SetTransferFunction(&profile, &fn);
        return std::make_unique<ColorProfile>(profile);
      }
    }
    return nullptr;
  }
  // cHRM and gAMA tags are both present. The PNG spec states that cHRM is
  // valid even without gAMA but we cannot apply the cHRM without guessing
  // a gAMA. Color correction is not a guessing game: match the behavior
  // of Safari and Firefox instead (compat).
  float rx = pngFixedToFloat(chrm[2]);
  float ry = pngFixedToFloat(chrm[3]);
  float gx = pngFixedToFloat(chrm[4]);
  float gy = pngFixedToFloat(chrm[5]);
  float bx = pngFixedToFloat(chrm[6]);
  float by = pngFixedToFloat(chrm[7]);
  float wx = pngFixedToFloat(chrm[0]);
  float wy = pngFixedToFloat(chrm[1]);
  skcms_Matrix3x3 to_xyzd50;
  if (!skcms_PrimariesToXYZD50(rx, ry, gx, gy, bx, by, wx, wy, &to_xyzd50)) {
    return nullptr;
  }
  skcms_TransferFunction fn;
  fn.g = 1.0f / pngFixedToFloat(inverse_gamma);
  fn.a = 1.0f;
  fn.b = fn.c = fn.d = fn.e = fn.f = 0.0f;
  skcms_ICCProfile profile;
  skcms_Init(&profile);
  skcms_SetTransferFunction(&profile, &fn);
  skcms_SetXYZD50(&profile, &to_xyzd50);
  return std::make_unique<ColorProfile>(profile);
}
static inline void ReadHDRMetadata(
    png_structp png,
    png_infop info,
    std::optional<gfx::HDRMetadata>* hdr_metadata) {
  std::optional<gfx::HdrMetadataCta861_3> clli;
  std::optional<gfx::HdrMetadataSmpteSt2086> mdcv;
  std::optional<gfx::HdrMetadataAgtm> agtm;
  png_unknown_chunkp unknown_chunks;
  size_t num_unknown_chunks =
      png_get_unknown_chunks(png, info, &unknown_chunks);
  for (size_t chunk_index = 0; chunk_index < num_unknown_chunks;
       chunk_index++) {
    const auto& chunk = unknown_chunks[chunk_index];
    if (strcmp(reinterpret_cast<const char*>(chunk.name), "cLLi") == 0 ||
        strcmp(reinterpret_cast<const char*>(chunk.name), "cLLI") == 0) {
      if (chunk.size != 8) {
        continue;
      }
      const uint32_t max_cll_times_10000 = (chunk.data[0] << 24) |
                                           (chunk.data[1] << 16) |
                                           (chunk.data[2] << 8) | chunk.data[3];
      const uint32_t max_fall_times_10000 =
          (chunk.data[4] << 24) | (chunk.data[5] << 16) | (chunk.data[6] << 8) |
          chunk.data[7];
      clli.emplace(max_cll_times_10000 / 10000, max_fall_times_10000 / 10000);
      continue;
    }
    if (strcmp(reinterpret_cast<const char*>(chunk.name), "mDCv") == 0 ||
        strcmp(reinterpret_cast<const char*>(chunk.name), "mDCV") == 0) {
      if (chunk.size != 24) {
        continue;
      }
      // Red, green, blue, white, each with x and y.
      uint16_t chromaticities_times_50000[8];
      for (int i = 0; i < 8; ++i) {
        chromaticities_times_50000[i] =
            (chunk.data[2 * i] << 8) | chunk.data[2 * i + 1];
      }
      const uint32_t max_luminance_times_10000 =
          (chunk.data[16] << 24) | (chunk.data[17] << 16) |
          (chunk.data[18] << 8) | chunk.data[19];
      const uint32_t min_luminance_times_10000 =
          (chunk.data[20] << 24) | (chunk.data[21] << 16) |
          (chunk.data[22] << 8) | chunk.data[23];
      SkColorSpacePrimaries primaries = {
          chromaticities_times_50000[0] / 50000.f,
          chromaticities_times_50000[1] / 50000.f,
          chromaticities_times_50000[2] / 50000.f,
          chromaticities_times_50000[3] / 50000.f,
          chromaticities_times_50000[4] / 50000.f,
          chromaticities_times_50000[5] / 50000.f,
          chromaticities_times_50000[6] / 50000.f,
          chromaticities_times_50000[7] / 50000.f,
      };
      mdcv.emplace(primaries, max_luminance_times_10000 * 1e-4f,
                   min_luminance_times_10000 * 1e-4f);
      continue;
    }
    if (strcmp(reinterpret_cast<const char*>(chunk.name), "agTm") == 0) {
      agtm.emplace(SkData::MakeWithCopy(chunk.data, chunk.size));
      continue;
    }
  }
  if (clli || mdcv || agtm) {
    if (!hdr_metadata->has_value()) {
      hdr_metadata->emplace();
    }
    if (clli) {
      (*hdr_metadata)->cta_861_3 = clli;
    }
    if (mdcv) {
      (*hdr_metadata)->smpte_st_2086 = mdcv;
    }
    if (agtm) {
      (*hdr_metadata)->agtm = agtm;
    }
  }
}
void PngImageDecoder::SetColorSpace() {
  if (IgnoresColorSpace()) {
    return;
  }
  png_structp png = reader_->PngPtr();
  png_infop info = reader_->InfoPtr();
  if (auto profile = ReadColorProfile(png, info)) {
    SetEmbeddedColorProfile(std::move(profile));
  }
  ReadHDRMetadata(png, info, &hdr_metadata_);
}
void PngImageDecoder::SetBitDepth() {
  if (bit_depth_) {
    return;
  }
  png_structp png = reader_->PngPtr();
  png_infop info = reader_->InfoPtr();
  bit_depth_ = png_get_bit_depth(png, info);
  decode_to_half_float_ =
      bit_depth_ == 16 &&
      high_bit_depth_decoding_option_ == kHighBitDepthToHalfFloat &&
      // TODO(crbug.com/874057): Implement support for 16-bit PNGs w/
      // ImageFrame::kBlendAtopPreviousFrame.
      repetition_count_ == kAnimationNone;
}
bool PngImageDecoder::ImageIsHighBitDepth() {
  SetBitDepth();
  return bit_depth_ == 16 &&
         // TODO(crbug.com/874057): Implement support for 16-bit PNGs w/
         // ImageFrame::kBlendAtopPreviousFrame.
         repetition_count_ == kAnimationNone;
}
std::optional<gfx::HDRMetadata> PngImageDecoder::GetHDRMetadata() const {
  return hdr_metadata_;
}
bool PngImageDecoder::SetSize(unsigned width, unsigned height) {
  DCHECK(!IsDecodedSizeAvailable());
  // Protect against large PNGs. See http://bugzil.la/251381 for more details.
  const uint32_t kMaxPNGSize = 1000000;
  return (width <= kMaxPNGSize) && (height <= kMaxPNGSize) &&
         ImageDecoder::SetSize(width, height);
}
void PngImageDecoder::HeaderAvailable() {
  DCHECK(IsDecodedSizeAvailable());
  png_structp png = reader_->PngPtr();
  png_infop info = reader_->InfoPtr();
  png_uint_32 width, height;
  int bit_depth, color_type, interlace_type, compression_type;
  png_get_IHDR(png, info, &width, &height, &bit_depth, &color_type,
               &interlace_type, &compression_type, nullptr);
  // The options we set here match what Mozilla does.
  // Expand to ensure we use 24-bit for RGB and 32-bit for RGBA.
  if (color_type == PNG_COLOR_TYPE_PALETTE ||
      (color_type == PNG_COLOR_TYPE_GRAY && bit_depth < 8)) {
    png_set_expand(png);
  }
  if (png_get_valid(png, info, PNG_INFO_tRNS)) {
    png_set_expand(png);
  }
  if (!decode_to_half_float_) {
    png_set_strip_16(png);
  }
  if (color_type == PNG_COLOR_TYPE_GRAY ||
      color_type == PNG_COLOR_TYPE_GRAY_ALPHA) {
    png_set_gray_to_rgb(png);
  }
  // process eXIf chunk
  png_uint_32 exif_size = 0;
  png_bytep exif_buffer = nullptr;
  if (png_get_eXIf_1(png, info, &exif_size, &exif_buffer) != 0) {
    // exif data exists
    if (exif_size != 0 && exif_buffer) {
      ApplyExifMetadata(SkData::MakeWithoutCopy(exif_buffer, exif_size).get(),
                        gfx::Size(width, height));
    }
  }
  // Tell libpng to send us rows for interlaced pngs.
  if (interlace_type == PNG_INTERLACE_ADAM7) {
    png_set_interlace_handling(png);
  }
  // Update our info now (so we can get color channel info).
  png_read_update_info(png, info);
  int channels = png_get_channels(png, info);
  DCHECK(channels == 3 || channels == 4);
  has_alpha_channel_ = (channels == 4);
}
#if (defined(__ARM_NEON__) || defined(__ARM_NEON))
// Premultiply RGB color channels by alpha, swizzle RGBA to SkPMColor
// order, and return the AND of all alpha channels.
static inline void SetRGBAPremultiplyRowNeon(png_bytep src_ptr,
                                             const int pixel_count,
                                             ImageFrame::PixelData* dst_pixel,
                                             unsigned* const alpha_mask) {
  assert(dst_pixel);
  assert(alpha_mask);
  constexpr int kPixelsPerLoad = 8;
  // Input registers.
  uint8x8x4_t rgba;
  // Alpha mask.
  uint8x8_t alpha_mask_vector = vdup_n_u8(255);
  // Scale the color channel by alpha - the opacity coefficient.
  auto premultiply = [](uint8x8_t c, uint8x8_t a) {
    // First multiply the color by alpha, expanding to 16-bit (max 255*255).
    uint16x8_t ca = vmull_u8(c, a);
    // Now we need to round back down to 8-bit, returning (x+127)/255.
    // (x+127)/255 == (x + ((x+128)>>8) + 128)>>8.  This form is well suited
    // to NEON: vrshrq_n_u16(...,8) gives the inner (x+128)>>8, and
    // vraddhn_u16() both the outer add-shift and our conversion back to 8-bit.
    return vraddhn_u16(ca, vrshrq_n_u16(ca, 8));
  };
  int i = pixel_count;
  for (; i >= kPixelsPerLoad; i -= kPixelsPerLoad) {
    // Reads 8 pixels at once, each color channel in a different
    // 64-bit register.
    rgba = vld4_u8(src_ptr);
    // AND pixel alpha values into the alpha detection mask.
    alpha_mask_vector = vand_u8(alpha_mask_vector, rgba.val[3]);
    uint64_t alphas_u64 = vget_lane_u64(vreinterpret_u64_u8(rgba.val[3]), 0);
    // If all of the pixels are opaque, no need to premultiply.
    if (~alphas_u64 == 0) {
#if SK_PMCOLOR_BYTE_ORDER(R, G, B, A)
      // Already in right order, write back (interleaved) results to memory.
      vst4_u8(reinterpret_cast<uint8_t*>(dst_pixel), rgba);
#elif SK_PMCOLOR_BYTE_ORDER(B, G, R, A)
      // Re-order color channels for BGRA.
      uint8x8x4_t bgra = {rgba.val[2], rgba.val[1], rgba.val[0], rgba.val[3]};
      // Write back (interleaved) results to memory.
      vst4_u8(reinterpret_cast<uint8_t*>(dst_pixel), bgra);
#endif
    } else {
#if SK_PMCOLOR_BYTE_ORDER(R, G, B, A)
      // Premultiply color channels, already in right order.
      rgba.val[0] = premultiply(rgba.val[0], rgba.val[3]);
      rgba.val[1] = premultiply(rgba.val[1], rgba.val[3]);
      rgba.val[2] = premultiply(rgba.val[2], rgba.val[3]);
      // Write back (interleaved) results to memory.
      vst4_u8(reinterpret_cast<uint8_t*>(dst_pixel), rgba);
#elif SK_PMCOLOR_BYTE_ORDER(B, G, R, A)
      uint8x8x4_t bgra;
      // Premultiply and re-order color channels for BGRA.
      bgra.val[0] = premultiply(rgba.val[2], rgba.val[3]);
      bgra.val[1] = premultiply(rgba.val[1], rgba.val[3]);
      bgra.val[2] = premultiply(rgba.val[0], rgba.val[3]);
      bgra.val[3] = rgba.val[3];
      // Write back (interleaved) results to memory.
      vst4_u8(reinterpret_cast<uint8_t*>(dst_pixel), bgra);
#endif
    }
    // Advance to next elements.
    src_ptr += kPixelsPerLoad * 4;
    dst_pixel += kPixelsPerLoad;
  }
  // AND together the 8 alpha values in the alpha_mask_vector.
  uint64_t alpha_mask_u64 =
      vget_lane_u64(vreinterpret_u64_u8(alpha_mask_vector), 0);
  alpha_mask_u64 &= (alpha_mask_u64 >> 32);
  alpha_mask_u64 &= (alpha_mask_u64 >> 16);
  alpha_mask_u64 &= (alpha_mask_u64 >> 8);
  *alpha_mask &= alpha_mask_u64;
  // Handle the tail elements.
  for (; i > 0; i--, dst_pixel++, src_ptr += 4) {
    ImageFrame::SetRGBAPremultiply(dst_pixel, src_ptr[0], src_ptr[1],
                                   src_ptr[2], src_ptr[3]);
    *alpha_mask &= src_ptr[3];
  }
}
// Swizzle RGBA to SkPMColor order, and return the AND of all alpha channels.
static inline void SetRGBARawRowNeon(png_bytep src_ptr,
                                     const int pixel_count,
                                     ImageFrame::PixelData* dst_pixel,
                                     unsigned* const alpha_mask) {
  assert(dst_pixel);
  assert(alpha_mask);
  constexpr int kPixelsPerLoad = 16;
  // Input registers.
  uint8x16x4_t rgba;
  // Alpha mask.
  uint8x16_t alpha_mask_vector = vdupq_n_u8(255);
  int i = pixel_count;
  for (; i >= kPixelsPerLoad; i -= kPixelsPerLoad) {
    // Reads 16 pixels at once, each color channel in a different
    // 128-bit register.
    rgba = vld4q_u8(src_ptr);
    // AND pixel alpha values into the alpha detection mask.
    alpha_mask_vector = vandq_u8(alpha_mask_vector, rgba.val[3]);
#if SK_PMCOLOR_BYTE_ORDER(R, G, B, A)
    // Already in right order, write back (interleaved) results to memory.
    vst4q_u8(reinterpret_cast<uint8_t*>(dst_pixel), rgba);
#elif SK_PMCOLOR_BYTE_ORDER(B, G, R, A)
    // Re-order color channels for BGRA.
    uint8x16x4_t bgra = {rgba.val[2], rgba.val[1], rgba.val[0], rgba.val[3]};
    // Write back (interleaved) results to memory.
    vst4q_u8(reinterpret_cast<uint8_t*>(dst_pixel), bgra);
#endif
    // Advance to next elements.
    src_ptr += kPixelsPerLoad * 4;
    dst_pixel += kPixelsPerLoad;
  }
  // AND together the 16 alpha values in the alpha_mask_vector.
  uint64_t alpha_mask_u64 =
      vget_lane_u64(vreinterpret_u64_u8(vget_low_u8(alpha_mask_vector)), 0);
  alpha_mask_u64 &=
      vget_lane_u64(vreinterpret_u64_u8(vget_high_u8(alpha_mask_vector)), 0);
  alpha_mask_u64 &= (alpha_mask_u64 >> 32);
  alpha_mask_u64 &= (alpha_mask_u64 >> 16);
  alpha_mask_u64 &= (alpha_mask_u64 >> 8);
  *alpha_mask &= alpha_mask_u64;
  // Handle the tail elements.
  for (; i > 0; i--, dst_pixel++, src_ptr += 4) {
    ImageFrame::SetRGBARaw(dst_pixel, src_ptr[0], src_ptr[1], src_ptr[2],
                           src_ptr[3]);
    *alpha_mask &= src_ptr[3];
  }
}
// Swizzle RGB to opaque SkPMColor order, and return the AND
// of all alpha channels.
static inline void SetRGBARawRowNoAlphaNeon(png_bytep src_ptr,
                                            const int pixel_count,
                                            ImageFrame::PixelData* dst_pixel) {
  assert(dst_pixel);
  constexpr int kPixelsPerLoad = 16;
  // Input registers.
  uint8x16x3_t rgb;
  int i = pixel_count;
  for (; i >= kPixelsPerLoad; i -= kPixelsPerLoad) {
    // Reads 16 pixels at once, each color channel in a different
    // 128-bit register.
    rgb = vld3q_u8(src_ptr);
#if SK_PMCOLOR_BYTE_ORDER(R, G, B, A)
    // RGB already in right order, add opaque alpha channel.
    uint8x16x4_t rgba = {rgb.val[0], rgb.val[1], rgb.val[2], vdupq_n_u8(255)};
    // Write back (interleaved) results to memory.
    vst4q_u8(reinterpret_cast<uint8_t*>(dst_pixel), rgba);
#elif SK_PMCOLOR_BYTE_ORDER(B, G, R, A)
    // Re-order color channels for BGR, add opaque alpha channel.
    uint8x16x4_t bgra = {rgb.val[2], rgb.val[1], rgb.val[0], vdupq_n_u8(255)};
    // Write back (interleaved) results to memory.
    vst4q_u8(reinterpret_cast<uint8_t*>(dst_pixel), bgra);
#endif
    // Advance to next elements.
    src_ptr += kPixelsPerLoad * 3;
    dst_pixel += kPixelsPerLoad;
  }
  // Handle the tail elements.
  for (; i > 0; i--, dst_pixel++, src_ptr += 3) {
    ImageFrame::SetRGBARaw(dst_pixel, src_ptr[0], src_ptr[1], src_ptr[2], 255);
  }
}
#endif
void PngImageDecoder::RowAvailable(unsigned char* row_buffer,
                                   unsigned row_index,
                                   int) {
  if (current_frame_ >= frame_buffer_cache_.size()) {
    return;
  }
  ImageFrame& buffer = frame_buffer_cache_[current_frame_];
  if (buffer.GetStatus() == ImageFrame::kFrameEmpty) {
    png_structp png = reader_->PngPtr();
    if (!InitFrameBuffer(current_frame_)) {
      longjmp(JMPBUF(png), 1);
    }
    DCHECK_EQ(ImageFrame::kFramePartial, buffer.GetStatus());
    if (PNG_INTERLACE_ADAM7 ==
        png_get_interlace_type(png, reader_->InfoPtr())) {
      unsigned color_channels = has_alpha_channel_ ? 4 : 3;
      base::CheckedNumeric<int> interlace_buffer_size = color_channels;
      interlace_buffer_size *= Size().GetCheckedArea();
      if (decode_to_half_float_) {
        interlace_buffer_size *= 2;
      }
      if (!interlace_buffer_size.IsValid()) {
        longjmp(JMPBUF(png), 1);
      }
      reader_->CreateInterlaceBuffer(interlace_buffer_size.ValueOrDie());
      if (!reader_->InterlaceBuffer()) {
        longjmp(JMPBUF(png), 1);
      }
    }
    current_buffer_saw_alpha_ = false;
  }
  const gfx::Rect& frame_rect = buffer.OriginalFrameRect();
  DCHECK(gfx::Rect(Size()).Contains(frame_rect));
  /* libpng comments (here to explain what follows).
   *
   * this function is called for every row in the image. If the
   * image is interlacing, and you turned on the interlace handler,
   * this function will be called for every row in every pass.
   * Some of these rows will not be changed from the previous pass.
   * When the row is not changed, the new_row variable will be NULL.
   * The rows and passes are called in order, so you don't really
   * need the row_num and pass, but I'm supplying them because it
   * may make your life easier.
   */
  // Nothing to do if the row is unchanged, or the row is outside the image
  // bounds. In the case that a frame presents more data than the indicated
  // frame size, ignore the extra rows and use the frame size as the source
  // of truth. libpng can send extra rows: ignore them too, this to prevent
  // memory writes outside of the image bounds (security).
  if (!row_buffer) {
    return;
  }
  DCHECK_GT(frame_rect.height(), 0);
  if (row_index >= static_cast<unsigned>(frame_rect.height())) {
    return;
  }
  int y = row_index + frame_rect.y();
  if (y < 0) {
    return;
  }
  DCHECK_LT(y, Size().height());
  /* libpng comments (continued).
   *
   * For the non-NULL rows of interlaced images, you must call
   * png_progressive_combine_row() passing in the row and the
   * old row.  You can call this function for NULL rows (it will
   * just return) and for non-interlaced images (it just does the
   * memcpy for you) if it will make the code easier. Thus, you
   * can just do this for all cases:
   *
   *    png_progressive_combine_row(png_ptr, old_row, new_row);
   *
   * where old_row is what was displayed for previous rows. Note
   * that the first pass (pass == 0 really) will completely cover
   * the old row, so the rows do not have to be initialized. After
   * the first pass (and only for interlaced images), you will have
   * to pass the current row, and the function will combine the
   * old row and the new row.
   */
  bool has_alpha = has_alpha_channel_;
  png_bytep row = row_buffer;
  if (png_bytep interlace_buffer = reader_->InterlaceBuffer()) {
    unsigned bytes_per_pixel = has_alpha ? 4 : 3;
    if (decode_to_half_float_) {
      bytes_per_pixel *= 2;
    }
    row = interlace_buffer + (row_index * bytes_per_pixel * Size().width());
    png_progressive_combine_row(reader_->PngPtr(), row, row_buffer);
  }
  // Write the decoded row pixels to the frame buffer. The repetitive
  // form of the row write loops is for speed.
  const int width = frame_rect.width();
  png_bytep src_ptr = row;
  if (!decode_to_half_float_) {
    ImageFrame::PixelData* const dst_row = buffer.GetAddr(frame_rect.x(), y);
    if (has_alpha) {
      if (ColorProfileTransform* xform = ColorTransform()) {
        ImageFrame::PixelData* xform_dst = dst_row;
        // If we're blending over the previous frame, we can't overwrite that
        // when we do the color transform. So we allocate another row of pixels
        // to hold the temporary result before blending. In all other cases,
        // we can safely transform directly to the destination buffer, then do
        // any operations in-place (premul, swizzle).
        if (frame_buffer_cache_[current_frame_].GetAlphaBlendSource() ==
            ImageFrame::kBlendAtopPreviousFrame) {
          if (!color_transform_scanline_) {
            // This buffer may be wider than necessary for this frame, but by
            // allocating the full width of the PNG, we know it will be able to
            // hold temporary data for any subsequent frame.
            color_transform_scanline_.reset(
                new ImageFrame::PixelData[Size().width()]);
          }
          xform_dst = color_transform_scanline_.get();
        }
        skcms_PixelFormat color_format = skcms_PixelFormat_RGBA_8888;
        skcms_AlphaFormat alpha_format = skcms_AlphaFormat_Unpremul;
        bool color_conversion_successful = skcms_Transform(
            src_ptr, color_format, alpha_format, xform->SrcProfile(), xform_dst,
            color_format, alpha_format, xform->DstProfile(), width);
        DCHECK(color_conversion_successful);
        src_ptr = png_bytep(xform_dst);
      }
      unsigned alpha_mask = 255;
      if (frame_buffer_cache_[current_frame_].GetAlphaBlendSource() ==
          ImageFrame::kBlendAtopBgcolor) {
        if (buffer.PremultiplyAlpha()) {
#if (defined(__ARM_NEON__) || defined(__ARM_NEON))
          SetRGBAPremultiplyRowNeon(src_ptr, width, dst_row, &alpha_mask);
#else
          for (auto* dst_pixel = dst_row; dst_pixel < dst_row + width;
               dst_pixel++, src_ptr += 4) {
            ImageFrame::SetRGBAPremultiply(dst_pixel, src_ptr[0], src_ptr[1],
                                           src_ptr[2], src_ptr[3]);
            alpha_mask &= src_ptr[3];
          }
#endif
        } else {
#if (defined(__ARM_NEON__) || defined(__ARM_NEON))
          SetRGBARawRowNeon(src_ptr, width, dst_row, &alpha_mask);
#else
          for (auto* dst_pixel = dst_row; dst_pixel < dst_row + width;
               dst_pixel++, src_ptr += 4) {
            ImageFrame::SetRGBARaw(dst_pixel, src_ptr[0], src_ptr[1],
                                   src_ptr[2], src_ptr[3]);
            alpha_mask &= src_ptr[3];
          }
#endif
        }
      } else {
        // Now, the blend method is ImageFrame::BlendAtopPreviousFrame. Since
        // the frame data of the previous frame is copied at InitFrameBuffer, we
        // can blend the pixel of this frame, stored in |src_ptr|, over the
        // previous pixel stored in |dst_pixel|.
        if (buffer.PremultiplyAlpha()) {
          for (auto* dst_pixel = dst_row; dst_pixel < dst_row + width;
               dst_pixel++, src_ptr += 4) {
            ImageFrame::BlendRGBAPremultiplied(
                dst_pixel, src_ptr[0], src_ptr[1], src_ptr[2], src_ptr[3]);
            alpha_mask &= src_ptr[3];
          }
        } else {
          for (auto* dst_pixel = dst_row; dst_pixel < dst_row + width;
               dst_pixel++, src_ptr += 4) {
            ImageFrame::BlendRGBARaw(dst_pixel, src_ptr[0], src_ptr[1],
                                     src_ptr[2], src_ptr[3]);
            alpha_mask &= src_ptr[3];
          }
        }
      }
      if (alpha_mask != 255) {
        current_buffer_saw_alpha_ = true;
      }
    } else {
#if (defined(__ARM_NEON__) || defined(__ARM_NEON))
      SetRGBARawRowNoAlphaNeon(src_ptr, width, dst_row);
#else
      for (auto* dst_pixel = dst_row; dst_pixel < dst_row + width;
           src_ptr += 3, ++dst_pixel) {
        ImageFrame::SetRGBARaw(dst_pixel, src_ptr[0], src_ptr[1], src_ptr[2],
                               255);
      }
#endif
      // We'll apply the color space xform to opaque pixels after they have been
      // written to the ImageFrame.
      // TODO: Apply the xform to the RGB pixels, skipping second pass over
      // data.
      if (ColorProfileTransform* xform = ColorTransform()) {
        skcms_AlphaFormat alpha_format = skcms_AlphaFormat_Unpremul;
        bool color_conversion_successful =
            skcms_Transform(dst_row, XformColorFormat(), alpha_format,
                            xform->SrcProfile(), dst_row, XformColorFormat(),
                            alpha_format, xform->DstProfile(), width);
        DCHECK(color_conversion_successful);
      }
    }
  } else {  // for if (!decode_to_half_float_)
    ImageFrame::PixelDataF16* const dst_row_f16 =
        buffer.GetAddrF16(frame_rect.x(), y);
    // TODO(zakerinasab): https://crbug.com/874057
    // Due to a lack of 16 bit APNG encoders, multi-frame 16 bit APNGs are not
    // supported. Hence, we expect the blending mode always be
    // kBlendAtopBgcolor.
    DCHECK(frame_buffer_cache_[current_frame_].GetAlphaBlendSource() ==
           ImageFrame::kBlendAtopBgcolor);
    // Color space transformation to the dst space and converting the decoded
    // color componenets from uint16 to float16.
    auto* xform = ColorTransform();
    auto* src_profile = xform ? xform->SrcProfile() : nullptr;
    auto* dst_profile = xform ? xform->DstProfile() : nullptr;
    auto src_format = has_alpha ? skcms_PixelFormat_RGBA_16161616BE
                                : skcms_PixelFormat_RGB_161616BE;
    auto src_alpha_format = skcms_AlphaFormat_Unpremul;
    auto dst_alpha_format = (has_alpha && buffer.PremultiplyAlpha())
                                ? skcms_AlphaFormat_PremulAsEncoded
                                : skcms_AlphaFormat_Unpremul;
    bool success = skcms_Transform(
        src_ptr, src_format, src_alpha_format, src_profile, dst_row_f16,
        skcms_PixelFormat_RGBA_hhhh, dst_alpha_format, dst_profile, width);
    DCHECK(success);
    current_buffer_saw_alpha_ = has_alpha;
  }
  buffer.SetPixelsChanged(true);
}
void PngImageDecoder::FrameComplete() {
  if (current_frame_ >= frame_buffer_cache_.size()) {
    return;
  }
  if (reader_->InterlaceBuffer()) {
    reader_->ClearInterlaceBuffer();
  }
  ImageFrame& buffer = frame_buffer_cache_[current_frame_];
  if (buffer.GetStatus() == ImageFrame::kFrameEmpty) {
    longjmp(JMPBUF(reader_->PngPtr()), 1);
  }
  if (!current_buffer_saw_alpha_) {
    CorrectAlphaWhenFrameBufferSawNoAlpha(current_frame_);
  }
  buffer.SetStatus(ImageFrame::kFrameComplete);
}
bool PngImageDecoder::FrameIsReceivedAtIndex(wtf_size_t index) const {
  if (!IsDecodedSizeAvailable()) {
    return false;
  }
  DCHECK(!Failed() && reader_);
  // For non-animated images, return ImageDecoder::FrameIsReceivedAtIndex.
  // This matches the behavior of WEBPImageDecoder.
  if (reader_->ParseCompleted() && reader_->FrameCount() == 1) {
    return ImageDecoder::FrameIsReceivedAtIndex(index);
  }
  return reader_->FrameIsReceivedAtIndex(index);
}
base::TimeDelta PngImageDecoder::FrameDurationAtIndex(wtf_size_t index) const {
  if (index < frame_buffer_cache_.size()) {
    return frame_buffer_cache_[index].Duration();
  }
  return base::TimeDelta();
}
}  // namespace blink

