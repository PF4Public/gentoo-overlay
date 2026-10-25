# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake cuda

REPO="https://github.com/leejet/stable-diffusion.cpp"
GGML_REPO="https://github.com/leejet/ggml"
MY_PN="stable-diffusion.cpp"
# upstream publishes master-NNN-sha snapshot tags (no semver); PV is snapshot N
MY_TAG="master-${PV}-ea209db"
# ggml is a git submodule pin (leejet's patched ggml fork), not a release tag
GGML_REV="a5915eb0e47adef21c3f25b889a008925ea838c2"

DESCRIPTION="Diffusion model (SD, Flux, Wan, ...) inference in pure C/C++"
HOMEPAGE="https://github.com/leejet/stable-diffusion.cpp"

# MIT: stable-diffusion.cpp, ggml, utf8proc, stb_image, miniz, cpp-httplib, nlohmann/json
# BSD-2: darts-clone, oniguruma (both vendored under thirdparty/)
LICENSE="MIT BSD-2"
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

IUSE="cuda openblas opencl vulkan webm +webp ${CPU_FLAGS[*]}"

unset X86_CPU_FLAGS CPU_FLAGS

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_SUBMODULES=( ggml )
else
	S="${WORKDIR}/${MY_PN}-${MY_TAG}"
	KEYWORDS="~amd64 ~arm64"
	SRC_URI="
		${REPO}/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.tar.gz
		${GGML_REPO}/archive/${GGML_REV}.tar.gz -> ${P}-ggml.tar.gz
	"
fi

COMMON_DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	openblas? ( sci-libs/openblas:= )
	opencl? ( dev-libs/opencl-icd-loader )
	vulkan? ( media-libs/vulkan-loader )
	webm? ( media-libs/libwebm )
	webp? ( media-libs/libwebp )
	webm? ( media-libs/libwebp )
"
DEPEND="${COMMON_DEPEND}
	opencl? ( dev-libs/opencl-headers )
	vulkan? (
		dev-util/spirv-headers
		dev-util/vulkan-headers
	)
"
RDEPEND="${COMMON_DEPEND}"
BDEPEND="
	dev-build/cmake
	opencl? ( virtual/python )
	vulkan? ( media-libs/shaderc )
"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		return
	fi

	default_src_unpack

	# ggml is a git submodule (leejet's patched fork) not shipped in the release
	# tarball; the archive only carries an empty ggml/ placeholder, so replace it
	# with the submodule sources where CMake expects them (SD_GGML_SOURCE_DIR).
	rm -rf "${S}/ggml"
	mv "${WORKDIR}/ggml-${GGML_REV}" "${S}/ggml" || die
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSD_BUILD_EXAMPLES=ON
		# No embedded server web UI here (needs pnpm + network); sd-server still
		# builds as an API-only server.
		-DSD_SERVER_BUILD_FRONTEND=OFF
		# Build the bundled (patched) ggml submodule, not a system ggml.
		-DSD_USE_SYSTEM_GGML=OFF
		-DSD_USE_UPSTREAM_GGML=OFF
		# Never -march=native: the CPU ISA set is driven by CPU_FLAGS_X86, which
		# replaces the old portage sci-misc/stable-diffusion-cpp/
		# disable-fma-avx2-bmi2.patch (drop those flags to match it).
		-DGGML_NATIVE=OFF
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
		-DSD_CUDA=$(usex cuda)
		-DSD_VULKAN=$(usex vulkan)
		-DSD_OPENCL=$(usex opencl)
	)

	if use openblas; then
		mycmakeargs+=( -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS )
	fi

	# Image/video I/O uses system libraries rather than the git submodules.
	if use webp || use webm; then
		mycmakeargs+=( -DSD_WEBP=ON -DSD_USE_SYSTEM_WEBP=ON )
	fi
	use webm && mycmakeargs+=( -DSD_WEBM=ON -DSD_USE_SYSTEM_WEBM=ON )

	if use cuda; then
		local -x CUDAHOSTCXX="$(cuda_gccdir)"
		cuda_add_sandbox
		addpredict "/dev/char/"
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install

	dodoc -r "${S}"/docs
	dodoc "${S}"/README.md
}
