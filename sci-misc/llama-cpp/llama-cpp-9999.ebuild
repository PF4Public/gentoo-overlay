# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
ROCM_VERSION="7.2"

inherit cmake cuda linux-info python-any-r1 rocm toolchain-funcs

REPO="https://github.com/ggml-org/llama.cpp"
MY_PN="${PN/-/.}"

DESCRIPTION="LLM inference in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"
LICENSE="MIT"
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

IUSE="cuda examples hip openblas opencl +openmp +openssl rpc vulkan webui ${CPU_FLAGS[*]}"

unset X86_CPU_FLAGS CPU_FLAGS

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	# build-online: the webui build downloads the npm registry over the
	# network. Default off: without webui the build is fully offline.
	IUSE+=" build-online"
	REQUIRED_USE="webui? ( build-online )"
	RESTRICT="mirror build-online? ( network-sandbox )"
	BDEPEND_EXTRA="webui? ( >=net-libs/nodejs-22[npm] )"
	LLAMA_IS_DEV=ON
else
	S="${WORKDIR}/${MY_PN}-${PV}"
	# prebuilt webui matching the v${PV} release; the nightly build tag is
	# listed on the release page (v0.7.0 -> b11669)
	LLAMA_UI_VERSION="b11669"
	KEYWORDS="~amd64 ~arm64"
	SRC_URI="
		${REPO}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		webui? (
			${REPO}/releases/download/${LLAMA_UI_VERSION}/llama-${LLAMA_UI_VERSION}-ui.tar.gz
		)
	"
	BDEPEND_EXTRA=""
	LLAMA_IS_DEV=OFF
fi

COMMON_DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	hip? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
		>=sci-libs/rocBLAS-${ROCM_VERSION}:=
	)
	openblas? ( sci-libs/openblas:= )
	opencl? ( dev-libs/opencl-icd-loader )
	openmp? ( llvm-runtimes/openmp:= )
	openssl? ( dev-libs/openssl:= )
	vulkan? ( media-libs/vulkan-loader )
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
	${BDEPEND_EXTRA}
	opencl? ( ${PYTHON_DEPS} )
	vulkan? ( media-libs/shaderc )
"

unset BDEPEND_EXTRA

PATCHES=(
	"${FILESDIR}"/${PN}-llvm-23.patch
)

python_check_deps() {
	if use opencl; then
		python_is_python3
	fi
}

pkg_pretend() {
	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

pkg_setup() {
	if use hip; then
		linux-info_pkg_setup
		if linux-info_get_any_version && linux_config_exists; then
			if ! linux_chkconfig_present HSA_AMD_SVM; then
				ewarn "To use ROCm/HIP, you need to have HSA_AMD_SVM option enabled in your kernel."
			fi
		fi
	fi

	if use opencl; then
		python-any-r1_pkg_setup
	fi

	[[ ${MERGE_TYPE} != binary ]] && use openmp && tc-check-openmp
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare

	# the release webui ships as a prebuilt distfile; place it in the source
	# tree so CMake embeds it without building it with nodejs
	if use webui && [[ ${PV} != *9999* ]]; then
		mkdir -p "${S}"/tools/ui || die
		cp -a "${WORKDIR}"/llama-${LLAMA_UI_VERSION} "${S}"/tools/ui/dist || die
	fi
}

src_configure() {
	local mycmakeargs=(
		-DLLAMA_BUILD_IS_DEV=${LLAMA_IS_DEV}
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_BUILD_EXAMPLES=$(usex examples)
		-DLLAMA_BUILD_SERVER=ON
		-DLLAMA_BUILD_UI=$(usex webui)
		# provision the UI from the distfile (release) or npm (live); never
		# fall back to the Hugging Face bucket, which would hit the network
		# on every build
		-DLLAMA_USE_PREBUILT_UI=OFF
		-DLLAMA_TESTS_INSTALL=OFF
		-DLLAMA_OPENSSL=$(usex openssl)

		# avoid clashing with sci-ml/ggml
		-DCMAKE_INSTALL_INCLUDEDIR="include/${MY_PN}"
		-DCMAKE_INSTALL_LIBDIR="$(get_libdir)/${MY_PN}"
		-DCMAKE_INSTALL_RPATH="\$ORIGIN/../$(get_libdir)/${MY_PN};\$ORIGIN"

		-DGGML_NATIVE=OFF
		-DGGML_CCACHE=OFF
		-DGGML_LTO="$(tc-is-lto && echo ON || echo OFF)"
		-DGGML_OPENMP=$(usex openmp)
		-DGGML_RPC=$(usex rpc)
		-DGGML_CUDA=$(usex cuda)
		-DGGML_HIP=$(usex hip)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_OPENCL=$(usex opencl)

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

	if use hip; then
		rocm_use_clang
		mycmakeargs+=(
			-DGPU_TARGETS="$(get_amdgpu_flags)"
			-DCMAKE_HIP_FLAGS="${CXXFLAGS}"
			# cmake.eclass clears per-build-type flags for C/CXX only;
			# drop CMake's "-O2 -g -DNDEBUG" for HIP
			"-DCMAKE_HIP_FLAGS_${CMAKE_BUILD_TYPE^^}="
		)
	fi

	cmake_src_configure
}

src_install() {
	cmake_src_install

	dodoc -r "${S}"/docs
	dodoc "${S}"/README.md
	dodoc "${S}"/tools/*/README.md
}
