# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REPO="https://github.com/Niko1221/Strata"
# the llama.cpp pin third_party/ggml/VERSION.txt points at: its ggml is built
# statically into the engine, and CMake would FetchContent the same commit
# from the network at configure time, so the ebuild fetches it in src_unpack
LLAMA_REPO="https://github.com/ggml-org/llama.cpp"
# system-ggml: the sci-ml/ggml package to link (bump with its bumps)
GGML_PV="0.27.0"

ROCM_VERSION="7.2"

inherit cmake cuda git-r3 linux-info rocm

DESCRIPTION="Local LLM inference engine with an OpenAI/Anthropic-compatible API"
HOMEPAGE="https://github.com/Niko1221/Strata"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

EGIT_REPO_URI="${REPO}.git"

# the engine is built for one GPU backend; the terminal (the strata command,
# the monitor and the API server) installs in every case. system-ggml links
# the installed sci-ml/ggml instead of building the pinned commit's ggml
# (files/strata-system-ggml.patch adds the STRATA_SYSTEM_GGML option)
IUSE="cuda hip system-ggml"
REQUIRED_USE="!cuda? ( !hip )"

# the terminal runs on the system python3 (the bin/strata launcher); these
# are the packages its requirements.txt pins; with system-ggml the engine
# links sci-ml/ggml, whose install also carries the source tree (src/ +
# include/) with the internal headers and the ggml-cuda MMQ sources strata
# compiles itself
COMMON_DEPEND="
	dev-python/jinja2
	dev-python/numpy
	dev-python/pillow
	dev-python/psutil
	dev-python/pyyaml
	dev-python/regex
	dev-python/requests
	dev-python/tqdm
	dev-python/textual
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	hip? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
		>=sci-libs/rocBLAS-${ROCM_VERSION}:=
	)
	system-ggml? ( sci-ml/ggml:0/${GGML_PV} )
"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"
BDEPEND="
	dev-util/wget
"

# the live tree's CMakeLists drifts from the released one, so the patch is
# separate from strata-0.2.7's (both add STRATA_SYSTEM_GGML)
PATCHES=( "${FILESDIR}/strata-9999-system-ggml.patch" )

pkg_pretend() {
	if use cuda && [[ -z ${CUDA_ARCHITECTURES} ]]; then
		einfo "CUDA_ARCHITECTURES is unset, so strata builds its default set of"
		einfo "CUDA compute capabilities (75/86/89/120 SASS, 120 PTX), which is slow."
		einfo "Set it to your GPU's compute capability to skip unused targets, e.g."
		einfo 'CUDA_ARCHITECTURES="75-real" (several are ; separated: "75-real;80-real").'
		einfo "  find: nvidia-smi --query-gpu=compute_cap --format=csv,noheader"
		einfo "  suffixes: 75 (PTX+SASS), 75-real (SASS only), 75-virtual (PTX only)"
	fi
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
}

src_unpack() {
	git-r3_src_unpack

	if ! use system-ggml; then
		# the pinned llama.cpp, fetched so the build needs no network at configure
		local commit
		commit=$(awk 'NR==1 { print $1 }' "${S}/third_party/ggml/VERSION.txt")
		[[ ${commit} =~ ^[0-9a-f]{40}$ ]] || die "cannot read the llama.cpp pin from third_party/ggml/VERSION.txt"
		wget -O "${WORKDIR}/llama.cpp-${commit}.tar.gz" \
			"${LLAMA_REPO}/archive/${commit}.tar.gz" || die
		tar xf "${WORKDIR}/llama.cpp-${commit}.tar.gz" -C "${WORKDIR}" || die
		LLAMA_COMMIT="${commit}"
	fi
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare

	# the engine version for the component folder name and the manifest
	ENGINE_PV=$(sed -n 's/^[[:space:]]*project([^)]*VERSION[[:space:]]*\([0-9][0-9.]*\).*/\1/p' \
		"${S}/CMakeLists.txt" | head -n 1)
	if use cuda || use hip; then
		[[ -n ${ENGINE_PV} ]] || die "cannot find the engine version in CMakeLists.txt"
	fi
}

src_configure() {
	local ggml_dir
	if use system-ggml; then
		# the sci-ml/ggml install: the libraries to link + the source tree
		ggml_dir="/usr/$(get_libdir)/ggml-${GGML_PV}"
	else
		ggml_dir="${WORKDIR}/llama.cpp-${LLAMA_COMMIT}"
	fi

	local mycmakeargs=(
		# portable: the AVX2-baseline ggml-cpu instead of the build host's
		# -march=native; strata's own kernels are per-file and CPU-dispatched
		# at run time either way
		-DSTRATA_PORTABLE=ON
		-DSTRATA_NATIVE_EXPERTS=ON
		-DSTRATA_Q6K_EXPERTS=ON
		-DSTRATA_MMQ_KQUANTS=ON
		-DSTRATA_BUILD_TESTS=OFF
		# the ggml source (the pinned llama.cpp, or sci-ml/ggml's install);
		# without it CMake would fetch the pinned commit from the network
		-DSTRATA_GGML_DIR="${ggml_dir}"
		-DSTRATA_SYSTEM_GGML=$(usex system-ggml)
	)

	if use cuda; then
		mycmakeargs+=(
			-DSTRATA_ENABLE_CUDA=ON
			# CUDA_ARCHITECTURES (make.conf) restricts the compute capabilities,
			# see pkg_pretend; the default is the upstream recipe: RTX 20 / 30
			# / 40 / 50, the latest one with its PTX for forward compatibility
			-DCMAKE_CUDA_ARCHITECTURES="${CUDA_ARCHITECTURES:-75-real;86-real;89-real;120-real;120-virtual}"
		)
		local -x CUDAHOSTCXX="$(cuda_gccdir)"
		cuda_add_sandbox
		addpredict "/dev/char/"
	fi

	if use hip; then
		rocm_use_clang
		mycmakeargs+=(
			-DSTRATA_ENABLE_HIP=ON
			-DSTRATA_PREFILL_MMQ=ON
			# the validated wave32 targets; RDNA2 (gfx103x) is upstream-
			# experimental and left out
			-DCMAKE_HIP_ARCHITECTURES="gfx1100;gfx1201"
			-DCMAKE_HIP_FLAGS="${CXXFLAGS}"
			# cmake.eclass clears per-build-type flags for C/CXX only;
			# drop CMake's "-O2 -g -DNDEBUG" for HIP
			"-DCMAKE_HIP_FLAGS_${CMAKE_BUILD_TYPE^^}="
		)
	fi

	cmake_src_configure
}

src_compile() {
	if use cuda; then
		# strata_kq: the K-quant MMQ library the engine dlopens for the
		# Unsloth UD-Q4/Q5/Q6_K_XL experts
		cmake_src_compile strata strata_kq
	elif use hip; then
		cmake_src_compile strata
	fi
}

src_install() {
	local libdir="usr/$(get_libdir)/strata"

	# ---- the terminal: the strata command, the API server, the model installer ----
	insinto "/${libdir}"
	doins strata.py setup.py requirements.txt requirements-monitor.txt
	doins -r strata_cli strata_control serve
	doins -r data

	insinto "/${libdir}/bench"
	doins -r bench/prompts

	insinto "/${libdir}/bin"
	doins bin/strata

	insinto "/${libdir}/ref"
	doins ref/load.py

	insinto "/${libdir}/docs"
	doins docs/MANAGEMENT_PROTOCOL.md docs/TERMINAL_LAUNCH.md

	insinto "/${libdir}"

	# the tools modules the terminal paths import: the same closure
	# packaging/package_terminal.py stages into its archive (under tools/,
	# subdirectories included), computed from the sources
	local stage t
	stage="${T}/tools-stage"
	mkdir -p "${stage}"
	while IFS= read -r t; do
		cp --parents "tools/${t}.py" "${stage}/"
	done < <(
		python3 - "${S}" <<'EOF'
import importlib.util, sys
spec = importlib.util.spec_from_file_location("pt", sys.argv[1] + "/packaging/package_terminal.py")
pt = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pt)
names = set(pt.INSTALLER_TOOLS) | set(pt.INSTALLER_SCRIPTS) | set(pt.setup_tool_imports(pt.ROOT))
tools = pt.local_imports(pt.ROOT, tuple(sorted(names)))
[print(name[:-3] if name.endswith(".py") else name) for name in sorted(set(tools) | set(pt.TOOLS_SUBSET))]
EOF
	)
	doins -r "${stage}/tools"

	# the git checkout ships it 0755, but keep the mode explicit
	fperms 0755 "${libdir}/bin/strata"

	# the terminal's own version label
	echo "${PV}" > "${D}/${libdir}/VERSION"

	# the launcher finds the python3 (3.10+) on the PATH
	dosym "../$(get_libdir)/strata/bin/strata" /usr/bin/strata

	# ---- the engine: an engine component the terminal verifies before a start ----
	if use cuda || use hip; then
		local backend stage arch_args
		use cuda && backend=cuda || backend=hip

		stage="${T}/engine-stage"
		mkdir -p "${stage}"
		cp "${BUILD_DIR}/strata" "${stage}/"
		if use cuda; then
			cp "${BUILD_DIR}/libstrata_kq.so" "${stage}/"
			# the component's archs are what the build actually targeted
			# (CUDA_ARCHITECTURES, see pkg_pretend)
			local cuda_archs arch num tokens token
			local -A arch_seen
			cuda_archs="${CUDA_ARCHITECTURES:-75-real;86-real;89-real;120-real;120-virtual}"
			arch_args=()
			for arch in ${cuda_archs//;/ }; do
				num=${arch%%-*}
				if [[ ${arch} == *-virtual ]]; then
					tokens="compute_${num}"
				elif [[ ${arch} == *-* ]]; then
					tokens="sm_${num}"
				else
					tokens="sm_${num} compute_${num}"
				fi
				for token in ${tokens}; do
					if [[ -z ${arch_seen[${token}]+x} ]]; then
						arch_seen[${token}]=1
						arch_args+=( --arch "${token}" )
					fi
				done
			done
			local cuda_pv arch_nums
			cuda_pv=$(nvcc --version 2>/dev/null | sed -n 's/.*release \([0-9][0-9]*\.[0-9][0-9]*\).*/\1/p')
			arch_nums=$(for arch in ${cuda_archs//;/ }; do
				echo "${arch%%-*}"
			done | sort -nu | paste -sd ';' -)
			cat > "${stage}/BUILD.json" <<-EOF
			{
				"version": "${ENGINE_PV}",
				"source": "gentoo ebuild",
				"archs": "${arch_nums}",
				"cuda": "${cuda_pv}",
				"portable": true
			}
			EOF
		else
			# the hipBLASLt version and the matching tuning tables for the
			# package; the ROCm install's include tree is /usr
			python3 "${S}/packaging/stage_tuning.py" --stage "${stage}" \
				--archs "gfx1100 gfx1201" --rocm /usr || die
			arch_args=( --arch gfx1100 --arch gfx1201 )
		fi

		# the manifest (engine-component.json): strata hashes and verifies the
		# whole component before a start. The picture reader is not shipped,
		# so the image input stays off (the engine reports it as missing)
		python3 "${S}/packaging/package_engine.py" \
			--src "${stage}" \
			--backend "${backend}" \
			--version "${ENGINE_PV}" \
			--platform linux-x86_64 \
			--out "${D}/usr/${libdir}/components/engine" \
			"${arch_args[@]}" \
			--build-id "gentoo-${PV}" \
			--no-picture-reader || die

		local envd="${T}/90strata"
		cat > "${envd}" <<-EOF
		STRATA_COMPONENTS_DIR="/usr/$(get_libdir)/strata/components"
		export STRATA_COMPONENTS_DIR
		EOF
		doenvd "${envd}"
	fi

	dodoc README.md
}

pkg_postinst() {
	if ! use cuda && ! use hip; then
		ewarn "No engine was built (enable the cuda or hip USE flag for an"
		ewarn "NVIDIA / AMD GPU). The strata terminal is installed, but"
		ewarn "'strata launch' needs an engine: re-emerge sci-misc/strata with"
		ewarn "[cuda] or [hip] to build one."
	fi
}
