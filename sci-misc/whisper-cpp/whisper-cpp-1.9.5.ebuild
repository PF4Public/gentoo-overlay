# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit cmake cuda python-any-r1 toolchain-funcs

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ggml-org/whisper.cpp.git"
	WHISPER_BUILD_IS_DEV=ON
else
	SRC_URI="https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
	# the tarball extracts to whisper.cpp-${PV}, not ${P}
	S="${WORKDIR}/whisper.cpp-${PV}"
	WHISPER_BUILD_IS_DEV=OFF
fi

DESCRIPTION="Port of OpenAI's Whisper speech recognition to plain C/C++"
HOMEPAGE="https://github.com/ggml-org/whisper.cpp"
LICENSE="MIT"
SLOT="0"
LIBABU="1"

# GGML CPU flags
X86_CPU_FLAGS=(
	amx_bf16
	amx_int8
	amx_tile
	avx
	avx2
	avx512_bf16
	avx512_vnni
	avx512f
	avx512vbmi
	avx_vnni
	bmi2
	f16c
	fma3
	sse4_2
)
CPU_FLAGS=( "${X86_CPU_FLAGS[@]/#/cpu_flags_x86_}" )

# ffmpeg: link examples against FFmpeg to decode more audio formats (WHISPER_COMMON_FFMPEG)
# sdl:    build the SDL2-based examples whisper-stream, whisper-command, whisper-lsp, wchess (WHISPER_SDL2)
IUSE="cuda ffmpeg openblas opencl +openmp rpc sdl system-ggml vulkan ${CPU_FLAGS[*]}"

unset X86_CPU_FLAGS CPU_FLAGS

# with system-ggml the backend flags are mapped onto sci-ml/ggml's own
# USE flags, and the bundled-build dependencies are dropped
COMMON_DEPEND="
	ffmpeg? ( media-libs/ffmpeg )
	sdl? ( >=sys-libs/sdl2-2.0 )
	system-ggml? ( >=sci-ml/ggml-0.26:=[cuda?,openblas?,opencl?,openmp?,rpc?,vulkan?] )
	!system-ggml? (
		cuda? ( dev-util/nvidia-cuda-toolkit:= )
		openblas? ( sci-libs/openblas:= )
		opencl? ( dev-libs/opencl-icd-loader )
		openmp? ( llvm-runtimes/openmp:= )
		vulkan? ( media-libs/vulkan-loader )
	)
"
DEPEND="${COMMON_DEPEND}
	!system-ggml? (
		opencl? ( dev-libs/opencl-headers )
		vulkan? (
			dev-util/spirv-headers
			dev-util/vulkan-headers
		)
	)
"
RDEPEND="${COMMON_DEPEND}"
BDEPEND="
	!system-ggml? (
		openblas? ( dev-util/pkgconfig )
		opencl? ( ${PYTHON_DEPS} )
		vulkan? (
			dev-util/spirv-headers
			dev-util/vulkan-headers
			media-libs/shaderc
		)
	)
"
DOCS=( AUTHORS CONTRIBUTING.md README.md )

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	default
	cmake_src_prepare
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
		-DWHISPER_COMMON_FFMPEG=$(usex ffmpeg)
		-DWHISPER_SDL2=$(usex sdl)
		-DWHISPER_USE_SYSTEM_GGML=$(usex system-ggml)
	)

	if ! use system-ggml; then
		# build the bundled ggml for the declared ISA extensions, not
		# -march=native; with system-ggml the CPU ISA set and the backends
		# are selected by sci-ml/ggml's own USE flags
		mycmakeargs+=(
			-DGGML_NATIVE=OFF
			-DGGML_LTO="$(tc-is-lto && echo ON || echo OFF)"
			-DGGML_OPENMP=$(usex openmp)
			-DGGML_CUDA=$(usex cuda)
			-DGGML_OPENCL=$(usex opencl)
			-DGGML_RPC=$(usex rpc)
			-DGGML_VULKAN=$(usex vulkan)

			# CPU ISA flags
			-DGGML_SSE42=$(usex cpu_flags_x86_sse4_2)
			-DGGML_AVX=$(usex cpu_flags_x86_avx)
			-DGGML_AVX_VNNI=$(usex cpu_flags_x86_avx_vnni)
			-DGGML_AVX2=$(usex cpu_flags_x86_avx2)
			-DGGML_BMI2=$(usex cpu_flags_x86_bmi2)
			-DGGML_AVX512=$(usex cpu_flags_x86_avx512f)
			-DGGML_AVX512_VBMI=$(usex cpu_flags_x86_avx512vbmi)
			-DGGML_AVX512_VNNI=$(usex cpu_flags_x86_avx512_vnni)
			-DGGML_AVX512_BF16=$(usex cpu_flags_x86_avx512_bf16)
			-DGGML_FMA=$(usex cpu_flags_x86_fma3)
			-DGGML_F16C=$(usex cpu_flags_x86_f16c)
			-DGGML_AMX_TILE=$(usex cpu_flags_x86_amx_tile)
			-DGGML_AMX_INT8=$(usex cpu_flags_x86_amx_int8)
			-DGGML_AMX_BF16=$(usex cpu_flags_x86_amx_bf16)
		)

		if use openblas; then
			mycmakeargs+=( -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS )
		fi

		if use cuda; then
			local -x CUDAHOSTCXX="$(cuda_gccdir)"
			cuda_add_sandbox
			addpredict "/dev/char/"
		fi
	fi

	cmake_src_configure
}

src_test() {
	ctest -L gh --output-on-failure
}
