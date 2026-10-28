# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

ROCM_VERSION="7.2"

inherit cmake cuda python-any-r1 rocm toolchain-funcs flag-o-matic

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ggml-org/${PN}.git"
else
	SRC_URI="https://github.com/ggml-org/${PN}/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://ggml.ai/"
LICENSE="MIT"
SLOT="0/${PV}"

X86_CPU_FLAGS=(
	amx_bf16
	amx_int8
	amx_tile
	avx
	avx_vnni
	avx2
	avx512_bf16
	avx512bw
	avx512f
	avx512vbmi
	avx512_vnni
	bmi2
	fma3
	f16c
	sse4_2
)
CPU_FLAGS=( "${X86_CPU_FLAGS[@]/#/cpu_flags_x86_}" )

IUSE="${CPU_FLAGS[*]} cuda openblas opencl openmp rpc rocm test vulkan"

unset X86_CPU_FLAGS CPU_FLAGS

REQUIRED_USE="rocm? ( ${ROCM_REQUIRED_USE} )"
RESTRICT="!test? ( test )"

# the openblas, opencl and rpc backends are not available in
# sci-ml/ggml::gentoo; this overlay ebuild adds them
COMMON_DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	openblas? ( sci-libs/openblas:= )
	opencl? ( dev-libs/opencl-icd-loader )
	vulkan? ( media-libs/vulkan-loader )
	rocm? (
		>=dev-util/hip-${ROCM_VERSION}
		>=sci-libs/hipBLAS-${ROCM_VERSION}
	)
"
DEPEND="${COMMON_DEPEND}
	opencl? ( dev-util/opencl-headers )
	vulkan? (
		dev-util/spirv-headers
		dev-util/vulkan-headers
	)
"
RDEPEND="${COMMON_DEPEND}"
BDEPEND="
	openblas? ( dev-util/pkgconf )
	opencl? ( ${PYTHON_DEPS} )
	vulkan? ( media-libs/shaderc )
"

PATCHES=( "${FILESDIR}/${PN}-llvm-23.patch" )

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	cmake_src_prepare

	if use cuda; then
		cuda_src_prepare
		filter-lto #bug 983121
	fi
}

src_configure() {
	local mycmakeargs=(
		-DGGML_BACKEND_DL=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_NATIVE=OFF
		-DGGML_HIP_MMQ_MFMA=OFF
		-DGGML_LTO=$(tc-is-lto && echo ON || echo OFF)

		# CPU flags
		-DGGML_AMX_BF16=$(usex cpu_flags_x86_amx_bf16)
		-DGGML_AMX_INT8=$(usex cpu_flags_x86_amx_int8)
		-DGGML_AMX_TILE=$(usex cpu_flags_x86_amx_tile)
		-DGGML_AVX=$(usex cpu_flags_x86_avx)
		-DGGML_AVX_VNNI=$(usex cpu_flags_x86_avx_vnni)
		-DGGML_AVX2=$(usex cpu_flags_x86_avx2)
		-DGGML_AVX512_BF16=$(usex cpu_flags_x86_avx512_bf16)
		-DGGML_AVX512_VBMI=$(usex cpu_flags_x86_avx512vbmi)
		-DGGML_AVX512_VNNI=$(usex cpu_flags_x86_avx512_vnni)
		-DGGML_BMI2=$(usex cpu_flags_x86_bmi2)
		-DGGML_FMA=$(usex cpu_flags_x86_fma3)
		-DGGML_F16C=$(usex cpu_flags_x86_f16c)
		-DGGML_SSE42=$(usex cpu_flags_x86_sse4_2)

		-DGGML_CUDA=$(usex cuda)
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_HIP=$(usex rocm)
		-DGGML_OPENCL=$(usex opencl)
		-DGGML_RPC=$(usex rpc)
		-DGGML_VULKAN=$(usex vulkan)

		-DGGML_BUILD_TESTS=$(usex test)
	)

	if use openblas; then
		mycmakeargs+=( -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS )
	fi

	# Enable AVX512 if ANY of the avx512 flags are present
	if use cpu_flags_x86_avx512f || use cpu_flags_x86_avx512bw; then
		mycmakeargs+=( -DGGML_AVX512=ON )
	else
		mycmakeargs+=( -DGGML_AVX512=OFF )
	fi

	if use cuda; then
		cuda_add_sandbox -w
		addpredict "/dev/char/"
		cuda_sanitize
		mycmakeargs+=(
			-DCMAKE_CUDA_FLAGS="${NVCCFLAGS}"
		)
	fi

	if use rocm; then
		mycmakeargs+=(
			-DGPU_TARGETS="$(get_amdgpu_flags)"
		)
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install

	# the internal headers and sources, for packages that compile parts of
	# ggml themselves (sci-misc/strata with system-ggml)
	insinto "/usr/$(get_libdir)/ggml-${PV}/ggml"
	doins -r src include
}
