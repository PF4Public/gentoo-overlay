# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit cmake cuda python-any-r1 toolchain-funcs

REPO="https://github.com/leejet/stable-diffusion.cpp"
GGML_REPO="https://github.com/leejet/ggml"
MY_PN="stable-diffusion.cpp"
# upstream publishes master-NNN-sha snapshot tags (no semver); PV is snapshot N
MY_TAG="master-${PV}-0a06712"
# ggml is a git submodule pin (leejet's patched ggml fork), not a release tag
GGML_REV="6a89493756a18bd9cd8875bc4db17e329818b13f"

DESCRIPTION="Diffusion model (SD, Flux, Wan, ...) inference in pure C/C++"
HOMEPAGE="https://github.com/leejet/stable-diffusion.cpp"

# MIT: stable-diffusion.cpp, ggml, utf8proc, stb_image, miniz, cpp-httplib, nlohmann/json
# BSD-2: darts-clone, oniguruma (both vendored under thirdparty/)
# BSD: cutlass (bundled ggml CUDA INT8 GEMM / attention, via dev-libs/cutlass)
LICENSE="MIT BSD BSD-2"
SLOT="0"

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

IUSE="cuda openblas opencl +openmp rpc system-ggml vulkan +webp webm ${CPU_FLAGS[*]}"

unset X86_CPU_FLAGS CPU_FLAGS

REQUIRED_USE="webm? ( webp )"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_SUBMODULES=( ggml )
else
	S="${WORKDIR}/${MY_PN}-${MY_TAG}"
	KEYWORDS="amd64 ~arm64"
	SRC_URI="
		${REPO}/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.tar.gz
		${GGML_REPO}/archive/${GGML_REV}.tar.gz -> ${P}-ggml.tar.gz
	"
fi

# with system-ggml the backend flags are mapped onto sci-ml/ggml's own
# USE flags, and the bundled-build dependencies are dropped
COMMON_DEPEND="
	system-ggml? ( >=sci-ml/ggml-0.27:=[cuda?,openblas?,opencl?,openmp?,rpc?,vulkan?] )
	!system-ggml? (
		cuda? ( dev-util/nvidia-cuda-toolkit:= )
		openblas? ( sci-libs/openblas:= )
		opencl? ( dev-libs/opencl-icd-loader )
		openmp? ( llvm-runtimes/openmp:= )
		vulkan? ( media-libs/vulkan-loader )
	)
	webm? ( media-libs/libwebm )
	webp? ( media-libs/libwebp )
"
DEPEND="${COMMON_DEPEND}
	!system-ggml? (
		opencl? ( dev-util/opencl-headers )
		vulkan? (
			dev-util/spirv-headers
			dev-util/vulkan-headers
		)
	)
"
RDEPEND="${COMMON_DEPEND}"
BDEPEND="
	!system-ggml? (
		cuda? ( =dev-libs/cutlass-3.9.2-r0:= )
		opencl? ( ${PYTHON_DEPS} )
		vulkan? ( media-libs/shaderc )
	)
"

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	if use system-ggml; then
		ewarn "system-ggml links against the unpatched upstream ggml: the leejet"
		ewarn "fork extensions (sage-attention, sol-attention, FP8 fast path) are"
		ewarn "not available and some operators may be slower or unsupported."
	fi

	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		return
	fi

	default_src_unpack

	# ggml is a git submodule (leejet's patched fork) not shipped in the release
	# tarball; the archive only carries an empty ggml/ placeholder, so replace it
	# with the submodule sources where CMake expects them (SD_GGML_SOURCE_DIR).
	# With system-ggml the sources are still needed for the private headers.
	rm -rf "${S}/ggml"
	mv "${WORKDIR}/ggml-${GGML_REV}" "${S}/ggml" || die
}

src_prepare() {
	use cuda && ! use system-ggml && cuda_src_prepare
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSD_BUILD_EXAMPLES=ON
		# No embedded server web UI here (needs pnpm + network); sd-server still
		# builds as an API-only server.
		-DSD_SERVER_BUILD_FRONTEND=OFF
		# with system-ggml the library comes from sci-ml/ggml, which is
		# upstream ggml (the SD_USE_UPSTREAM_GGML compile definitions select
		# the unpatched code paths); the ggml sources stay in the tree for
		# the private headers
		-DSD_USE_SYSTEM_GGML=$(usex system-ggml)
		-DSD_USE_UPSTREAM_GGML=$(usex system-ggml)
		-DSD_CUDA=$(usex cuda)
		-DSD_OPENCL=$(usex opencl)
		-DSD_RPC=$(usex rpc)
		-DSD_VULKAN=$(usex vulkan)
	)

	if ! use system-ggml; then
		# build the bundled (patched) ggml; with system-ggml the CPU ISA
		# set and the backends are selected by sci-ml/ggml's own USE flags.
		# Never -march=native: the CPU ISA set is driven by CPU_FLAGS_X86,
		# which replaces the old portage sci-misc/stable-diffusion-cpp/
		# disable-fma-avx2-bmi2.patch (drop those flags to match it).
		mycmakeargs+=(
			-DGGML_NATIVE=OFF
			-DGGML_LTO="$(tc-is-lto && echo ON || echo OFF)"
			-DGGML_OPENMP=$(usex openmp)

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
			# the bundled ggml vendors CUTLASS (fused INT8 GEMM / attention) as a
			# nested git submodule; use the system copy from dev-libs/cutlass
			# (installs to /usr/include/{cutlass,cute}) instead of the submodule
			mycmakeargs+=( -DGGML_CUDA_CUTLASS_PATH="/usr" )
			# CUDA_ARCHITECTURES: restrict the compute capabilities; the bundled
			# ggml otherwise falls back to its own (broad) default arch list
			if [[ -n ${CUDA_ARCHITECTURES} ]]; then
				mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES="${CUDA_ARCHITECTURES}" )
			fi
		fi
	fi

	# Image/video I/O uses system libraries rather than the git submodules.
	if use webp || use webm; then
		mycmakeargs+=( -DSD_WEBP=ON -DSD_USE_SYSTEM_WEBP=ON )
	fi
	use webm && mycmakeargs+=( -DSD_WEBM=ON -DSD_USE_SYSTEM_WEBM=ON )

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# the bundled ggml is linked statically into the executables, but its CMake
	# still installs the public interface (headers/lib/cmake-config), colliding
	# with sci-ml/ggml; strip it from the image.
	if ! use system-ggml; then
		rm -f "${ED}"/usr/include/ggml*.h "${ED}"/usr/include/gguf.h
		rm -f "${ED}"/usr/$(get_libdir)/libggml*.a
		rm -rf "${ED}"/usr/$(get_libdir)/cmake/ggml
		rm -f "${ED}"/usr/$(get_libdir)/pkgconfig/ggml.pc
	fi

	dodoc -r "${S}"/docs
	dodoc "${S}"/README.md
}
