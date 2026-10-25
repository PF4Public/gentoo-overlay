# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..15} )

inherit cmake python-any-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ggml-org/whisper.cpp.git"
	WHISPER_BUILD_IS_DEV=ON
else
	SRC_URI="https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
	WHISPER_BUILD_IS_DEV=OFF
fi

DESCRIPTION="Port of OpenAI's Whisper speech recognition to plain C/C++"
HOMEPAGE="https://github.com/ggml-org/whisper.cpp"
LICENSE="MIT"
SLOT="0"
LIBABU="1"

# blas:   OpenBLAS backend (GGML_BLAS)
# cuda:   NVIDIA CUDA backend (GGML_CUDA)
# ffmpeg: link examples against FFmpeg to decode more audio formats (WHISPER_COMMON_FFMPEG)
# opencl: OpenCL backend (GGML_OPENCL)
# openmp: use OpenMP for threading (GGML_OPENMP)
# rpc:    RPC backend to distribute layers across machines (GGML_RPC)
# sdl:    build the SDL2-based examples whisper-stream, whisper-command, whisper-lsp, wchess (WHISPER_SDL2)
# vulkan: Vulkan backend (GGML_VULKAN)
# cpu_flags_x86_*: compile the CPU backend for the given ISA extensions
IUSE="blas cuda ffmpeg opencl +openmp rpc sdl vulkan
	cpu_flags_x86_amx_bf16 cpu_flags_x86_amx_int8 cpu_flags_x86_amx_tile
	cpu_flags_x86_avx cpu_flags_x86_avx2 cpu_flags_x86_avx512_bf16
	cpu_flags_x86_avx512vbmi cpu_flags_x86_avx512_vnni cpu_flags_x86_avx512f
	cpu_flags_x86_avx_vnni cpu_flags_x86_bmi2 cpu_flags_x86_f16c
	cpu_flags_x86_fma3 cpu_flags_x86_sse4_2"

DEPEND="
	blas? ( sci-libs/openblas )
	cuda? ( >=dev-util/nvidia-cuda-toolkit-11.8 )
	ffmpeg? ( media-libs/ffmpeg )
	sdl? ( >=sys-libs/sdl2-2.0 )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}
	opencl? ( virtual/opencl )
"
BDEPEND="
	blas? ( dev-util/pkgconfig )
	opencl? ( ${PYTHON_DEPS} dev-util/opencl-headers )
	vulkan? (
		dev-util/glslang
		dev-util/spirv-headers
		dev-util/vulkan-headers
	)
"
DOCS=( AUTHORS CONTRIBUTING.md README.md )

src_prepare() {
	default
	# examples/talk-llama FetchContents llama.cpp v0.6.0 from github at
	# build time, which we do not want in a portage build
	eapply "${FILESDIR}"/0001-examples-drop-talk-llama.patch
}

src_configure() {
	local mycmakeargs=(
		# do not report the version as "-dev" when building a release
		-DWHISPER_BUILD_IS_DEV=${WHISPER_BUILD_IS_DEV}
		-DWHISPER_BUILD_EXAMPLES=ON
		-DWHISPER_BUILD_TESTS=ON
		# build the CPU backend for the declared ISA extensions, not -march=native
		-DGGML_NATIVE=OFF
		-DGGML_SSE42=$(usex cpu_flags_x86_sse4_2 ON OFF)
		-DGGML_AVX=$(usex cpu_flags_x86_avx ON OFF)
		-DGGML_AVX_VNNI=$(usex cpu_flags_x86_avx_vnni ON OFF)
		-DGGML_AVX2=$(usex cpu_flags_x86_avx2 ON OFF)
		-DGGML_BMI2=$(usex cpu_flags_x86_bmi2 ON OFF)
		-DGGML_AVX512=$(usex cpu_flags_x86_avx512f ON OFF)
		-DGGML_AVX512_VBMI=$(usex cpu_flags_x86_avx512vbmi ON OFF)
		-DGGML_AVX512_VNNI=$(usex cpu_flags_x86_avx512_vnni ON OFF)
		-DGGML_AVX512_BF16=$(usex cpu_flags_x86_avx512_bf16 ON OFF)
		-DGGML_FMA=$(usex cpu_flags_x86_fma3 ON OFF)
		-DGGML_F16C=$(usex cpu_flags_x86_f16c ON OFF)
		-DGGML_AMX_TILE=$(usex cpu_flags_x86_amx_tile ON OFF)
		-DGGML_AMX_INT8=$(usex cpu_flags_x86_amx_int8 ON OFF)
		-DGGML_AMX_BF16=$(usex cpu_flags_x86_amx_bf16 ON OFF)
		-DGGML_OPENMP=$(usex openmp ON OFF)
		-DGGML_BLAS=$(usex blas ON OFF)
		-DGGML_BLAS_VENDOR=OpenBLAS
		-DGGML_CUDA=$(usex cuda ON OFF)
		-DGGML_OPENCL=$(usex opencl ON OFF)
		-DGGML_RPC=$(usex rpc ON OFF)
		-DGGML_VULKAN=$(usex vulkan ON OFF)
		-DWHISPER_COMMON_FFMPEG=$(usex ffmpeg ON OFF)
		-DWHISPER_SDL2=$(usex sdl ON OFF)
	)
	cmake_src_configure
}

src_test() {
	ctest -L gh --output-on-failure
}
