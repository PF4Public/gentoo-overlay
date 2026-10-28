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

# the RDNA part of the LLVM 23 fix is upstream now, master only needs the CDNA part
PATCHES=( "${FILESDIR}/${PN}-llvm-23-cdna.patch" )

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp

	if use cuda && [[ -z ${CUDA_ARCHITECTURES} ]]; then
		einfo "CUDA_ARCHITECTURES wasn't set, so ggml builds its full default set of"
		einfo "CUDA compute capabilities (75/80/86/89/90/120a/121a)."
		einfo "Set it to your GPU's compute capability to skip unused targets, e.g."
		einfo 'CUDA_ARCHITECTURES="75-real" (several are separated with ";": "75-real;80-real")'
		einfo "  find: nvidia-smi --query-gpu=compute_cap --format=csv,noheader"
		einfo "  suffixes: 75 (PTX+SASS), 75-real (SASS only), 75-virtual (PTX only)"
	fi
}

pkg_setup() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	cmake_src_prepare

	# GGML_MAX_NAME is an ABI constant (ggml_tensor has name[GGML_MAX_NAME]
	# before further fields). Build the whole package at 160, the value
	# downstream consumers (stable-diffusion-cpp, strata) require, so the
	# library and the installed header stay consistent.
	sed -i -E 's/^(\#[[:space:]]+define[[:space:]]+GGML_MAX_NAME[[:space:]]+)[0-9]+/\1160/' "${S}/include/ggml.h"

	if use cuda; then
		# filter-lto must precede cuda_src_prepare: cuda_sanitize bakes CXXFLAGS
		# into NVCCFLAGS via --compiler-options, so -flto must be gone by then.
		# bug 983121
		filter-lto
		cuda_src_prepare
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

		# CUDA_ARCHITECTURES: restrict CUDA compute capabilities (see pkg_pretend)
		if [[ -n ${CUDA_ARCHITECTURES} ]]; then
			mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES="${CUDA_ARCHITECTURES}" )
		fi
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
