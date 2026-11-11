# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REPO="https://github.com/Niko1221/Strata"
# the llama.cpp pin third_party/ggml/VERSION.txt points at: its ggml is built
# statically into the engine, and CMake would FetchContent the same commit
# from the network at configure time, so the ebuild fetches it in src_unpack
LLAMA_REPO="https://github.com/ggml-org/llama.cpp"

ROCM_VERSION="7.2"

RUST_MIN_VER="1.77"

PYTHON_COMPAT=( python3_{11..15} )

inherit cargo cmake cuda desktop git-r3 linux-info python-any-r1 rocm xdg-utils

DESCRIPTION="Local LLM inference engine with an OpenAI/Anthropic-compatible API"
HOMEPAGE="https://github.com/Niko1221/Strata"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

EGIT_REPO_URI="${REPO}.git"

# the engine is built for one GPU backend; the terminal (the strata command,
# the monitor and the API server) installs in every case.
# desktop is the tauri app (apps/desktop): the Rust shell plus the host web
# shell, the system node runtime and the control component (its python parts
# run on the system python, one of PYTHON_COMPAT); the tauri shell locates
# the resources beside its own binary or in <bindir>/../lib/strata-desktop,
# so the layout below is fixed.
# build-online permits the npm fetch for the host UI (implied by desktop)
#
# Where Strata writes (upstream's layout, kept as it is): one per-user folder,
# $XDG_DATA_HOME/strata, with components/ (engines), install/ (run configs,
# logs, third_party/), app-settings.json and shell-prefs.json, plus ~/.strata
# (the desktop's state and chats), $XDG_CONFIG_HOME/strata and
# $XDG_STATE_HOME/strata. Strata derives ALL of the first folder from
# STRATA_COMPONENTS_DIR (<components>/../install, ...), so that variable must
# never name the read-only /usr/$(get_libdir)/strata/components: that sent
# every write to /usr/lib64/strata (#533, Niko1221/Strata#5591, the
# "Permission denied: /usr/lib64/strata/install/third_party" of setup.py).
# The packaged engine is a read-only store instead, linked into the user's own
# component store by the /usr/bin launchers (files/strata-launcher.in).
IUSE="build-online cuda desktop hip old-cpu tui"
REQUIRED_USE="?? ( cuda hip ) desktop? ( build-online )"
# the host UI build (desktop) fetches npm packages at build time
RESTRICT="mirror build-online? ( network-sandbox )"

# the terminal runs on the system python3 (the bin/strata launcher finds it
# as <libdir>/strata/python/bin/python3, a shim written in src_install; the
# same layout as upstream's terminal archive, which is also what makes
# `strata install` run setup.py in its download-only Control mode); these
# are the packages its requirements.txt pins, the any-dep group is what
# python_setup checks at pkg_setup.
COMMON_DEPEND="
	$(python_gen_any_dep '
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		')
	tui? ( dev-python/textual )
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	desktop? (
		>=net-libs/nodejs-24
		dev-libs/glib
		net-libs/webkit-gtk:4.1
		$(python_gen_any_dep '
			dev-python/certifi[${PYTHON_USEDEP}]
			dev-python/charset-normalizer[${PYTHON_USEDEP}]
			dev-python/idna[${PYTHON_USEDEP}]
			dev-python/jinja2[${PYTHON_USEDEP}]
			dev-python/linkify-it-py[${PYTHON_USEDEP}]
			dev-python/markdown-it-py[${PYTHON_USEDEP}]
			dev-python/markupsafe[${PYTHON_USEDEP}]
			dev-python/mdit-py-plugins[${PYTHON_USEDEP}]
			dev-python/mdurl[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/pillow[${PYTHON_USEDEP}]
			dev-python/platformdirs[${PYTHON_USEDEP}]
			dev-python/psutil[${PYTHON_USEDEP}]
			dev-python/pygments[${PYTHON_USEDEP}]
			dev-python/pyyaml[${PYTHON_USEDEP}]
			dev-python/regex[${PYTHON_USEDEP}]
			dev-python/requests[${PYTHON_USEDEP}]
			dev-python/rich[${PYTHON_USEDEP}]
			dev-python/setuptools[${PYTHON_USEDEP}]
			dev-python/textual[${PYTHON_USEDEP}]
			dev-python/tqdm[${PYTHON_USEDEP}]
			dev-python/truststore[${PYTHON_USEDEP}]
			dev-python/typing-extensions[${PYTHON_USEDEP}]
			dev-python/urllib3[${PYTHON_USEDEP}]
			')
		x11-libs/gtk+:3
	)
	hip? (
		>=dev-util/hip-${ROCM_VERSION}:=
		>=sci-libs/hipBLAS-${ROCM_VERSION}:=
		>=sci-libs/hipBLASLt-${ROCM_VERSION}:=
		>=sci-libs/rocBLAS-${ROCM_VERSION}:=
	)
"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"
BDEPEND="
	desktop? (
		>=net-libs/nodejs-24[npm]
		$(python_gen_any_dep '
			dev-python/certifi[${PYTHON_USEDEP}]
			dev-python/charset-normalizer[${PYTHON_USEDEP}]
			dev-python/idna[${PYTHON_USEDEP}]
			dev-python/jinja2[${PYTHON_USEDEP}]
			dev-python/linkify-it-py[${PYTHON_USEDEP}]
			dev-python/markdown-it-py[${PYTHON_USEDEP}]
			dev-python/markupsafe[${PYTHON_USEDEP}]
			dev-python/mdit-py-plugins[${PYTHON_USEDEP}]
			dev-python/mdurl[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/pillow[${PYTHON_USEDEP}]
			dev-python/platformdirs[${PYTHON_USEDEP}]
			dev-python/psutil[${PYTHON_USEDEP}]
			dev-python/pygments[${PYTHON_USEDEP}]
			dev-python/pyyaml[${PYTHON_USEDEP}]
			dev-python/regex[${PYTHON_USEDEP}]
			dev-python/requests[${PYTHON_USEDEP}]
			dev-python/rich[${PYTHON_USEDEP}]
			dev-python/setuptools[${PYTHON_USEDEP}]
			dev-python/textual[${PYTHON_USEDEP}]
			dev-python/tqdm[${PYTHON_USEDEP}]
			dev-python/truststore[${PYTHON_USEDEP}]
			dev-python/typing-extensions[${PYTHON_USEDEP}]
			dev-python/urllib3[${PYTHON_USEDEP}]
			')
	)
	dev-util/wget
"

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

python_check_deps() {
	# the terminal runs on the checked implementation: all of its packages
	# must be built for it
	python_has_version \
		"dev-python/jinja2[${PYTHON_USEDEP}]" \
		"dev-python/numpy[${PYTHON_USEDEP}]" \
		"dev-python/pillow[${PYTHON_USEDEP}]" \
		"dev-python/psutil[${PYTHON_USEDEP}]" \
		"dev-python/pyyaml[${PYTHON_USEDEP}]" \
		"dev-python/regex[${PYTHON_USEDEP}]" \
		"dev-python/requests[${PYTHON_USEDEP}]" \
		"dev-python/tqdm[${PYTHON_USEDEP}]"
	if use desktop; then
		# the control has to run on the checked implementation: all of its
		# packages must be built for it
		python_has_version \
			"dev-python/certifi[${PYTHON_USEDEP}]" \
			"dev-python/charset-normalizer[${PYTHON_USEDEP}]" \
			"dev-python/idna[${PYTHON_USEDEP}]" \
			"dev-python/jinja2[${PYTHON_USEDEP}]" \
			"dev-python/linkify-it-py[${PYTHON_USEDEP}]" \
			"dev-python/markdown-it-py[${PYTHON_USEDEP}]" \
			"dev-python/markupsafe[${PYTHON_USEDEP}]" \
			"dev-python/mdit-py-plugins[${PYTHON_USEDEP}]" \
			"dev-python/mdurl[${PYTHON_USEDEP}]" \
			"dev-python/numpy[${PYTHON_USEDEP}]" \
			"dev-python/pillow[${PYTHON_USEDEP}]" \
			"dev-python/platformdirs[${PYTHON_USEDEP}]" \
			"dev-python/psutil[${PYTHON_USEDEP}]" \
			"dev-python/pygments[${PYTHON_USEDEP}]" \
			"dev-python/pyyaml[${PYTHON_USEDEP}]" \
			"dev-python/regex[${PYTHON_USEDEP}]" \
			"dev-python/requests[${PYTHON_USEDEP}]" \
			"dev-python/rich[${PYTHON_USEDEP}]" \
			"dev-python/setuptools[${PYTHON_USEDEP}]" \
			"dev-python/textual[${PYTHON_USEDEP}]" \
			"dev-python/tqdm[${PYTHON_USEDEP}]" \
			"dev-python/truststore[${PYTHON_USEDEP}]" \
			"dev-python/typing-extensions[${PYTHON_USEDEP}]" \
			"dev-python/urllib3[${PYTHON_USEDEP}]"
	fi
}

pkg_setup() {
	# pick the PYTHON_COMPAT implementation the terminal and the control
	# run on
	python_setup
	if use desktop; then
		rust_pkg_setup
	fi
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

	# the pinned llama.cpp, fetched so the build needs no network at configure
	local commit
	commit=$(awk 'NR==1 { print $1 }' "${S}/third_party/ggml/VERSION.txt")
	[[ ${commit} =~ ^[0-9a-f]{40}$ ]] || die "cannot read the llama.cpp pin from third_party/ggml/VERSION.txt"
	wget -O "${WORKDIR}/llama.cpp-${commit}.tar.gz" \
		"${LLAMA_REPO}/archive/${commit}.tar.gz" || die
	tar xf "${WORKDIR}/llama.cpp-${commit}.tar.gz" -C "${WORKDIR}" || die
	# a pin predating upstream llama.cpp 9145ddb9556c has bf16 wmma
	# fragments the amdgcn builtins take as short vectors, not __bf16:
	# the hip build cannot compile its mma.cuh (bit-identical, the bytes
	# reach the builtin only through a reinterpret_cast)
	if grep -q "bf16x16_t = __attribute__((ext_vector_type(16))) __bf16" \
		"${WORKDIR}/llama.cpp-${commit}/ggml/src/ggml-cuda/mma.cuh"; then
		patch -d "${WORKDIR}/llama.cpp-${commit}" -p1 \
			< "${FILESDIR}/strata-llama-wmma-bf16.patch" || die
	fi
	LLAMA_COMMIT="${commit}"

	if use desktop; then
		# the tauri shell's crates, fetched at build time (the live tree's
		# Cargo.lock drifts, so there is no offline CRATES list)
		local _S="${S}"
		S="${S}/apps/desktop/src-tauri"
		cargo_live_src_unpack
		S="${_S}"
	fi
}

src_prepare() {
	use cuda && cuda_src_prepare
	cmake_src_prepare

	# strata's own RDNA3 wmma gemms (hip-only files) declare their bf16
	# fragments as __bf16 vectors, which the amdgcn builtins reject the
	# same way as the pinned mma.cuh: the vector typedefs must be short
	# (bit-identical, the bytes reach the builtin only through a memcpy
	# or bit-cast); upstream main still carries the bug
	if use hip && grep -q "typedef __bf16 hb16 __attribute__((ext_vector_type(16)));" \
		"${S}/src/prefill/wmma_gemm.cu"; then
		eapply "${FILESDIR}/strata-wmma-bf16.patch"
	fi

	# the engine version for the component folder name and the manifest
	ENGINE_PV=$(sed -n 's/^[[:space:]]*project([^)]*VERSION[[:space:]]*\([0-9][0-9.]*\).*/\1/p' \
		"${S}/CMakeLists.txt" | head -n 1)
	if use cuda || use hip; then
		[[ -n ${ENGINE_PV} ]] || die "cannot find the engine version in CMakeLists.txt"
	fi
}

src_configure() {
	if use desktop; then
		cargo_src_configure --manifest-path "${S}/apps/desktop/src-tauri/Cargo.toml"
	fi

	# TODO(system-ggml): dropped — upstream rewrote the ggml build (0.2.13+,
	# cmake/strata_ggml.cmake: vendored third_party/strata-ggml + STRATA_GGML_DIR),
	# so the find_package(ggml)+ALIAS strata-9999-system-ggml.patch no longer
	# applies. Re-add the flag, the sci-ml/ggml dep, and -DSTRATA_SYSTEM_GGML
	# once reimplemented against the new structure.
	local ggml_dir="${WORKDIR}/llama.cpp-${LLAMA_COMMIT}"

	local mycmakeargs=(
		-DSTRATA_NATIVE_EXPERTS=ON
		-DSTRATA_Q6K_EXPERTS=ON
		-DSTRATA_MMQ_KQUANTS=ON
		-DSTRATA_BUILD_TESTS=OFF
		# the pinned llama.cpp ggml source; without it CMake would fetch
		# the pinned commit from the network
		-DSTRATA_GGML_DIR="${ggml_dir}"
	)
	# portable: the AVX2-baseline ggml-cpu instead of the build host's
	# -march=native; strata's own kernels are per-file and CPU-dispatched
	# at run time either way. old-cpu is the experimental older-CPU build:
	# the SSE4.2 + AVX ggml floor instead of the AVX2 baseline (CMake
	# excludes STRATA_PORTABLE and STRATA_ISA_FLOOR from each other)
	if use old-cpu; then
		mycmakeargs+=( -DSTRATA_PORTABLE=OFF -DSTRATA_ISA_FLOOR=avx )
	else
		mycmakeargs+=( -DSTRATA_PORTABLE=ON )
	fi

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
	if use desktop && ! use build-online; then
		die "desktop needs build-online: the host UI build fetches npm packages (no offline mode is implemented)"
	fi
	if use desktop; then
		# the host web shell (vite); the tauri shell embeds apps/host/dist at
		# compile time, so this runs before cargo
		einfo "building the host UI"
		local -x NPM_CONFIG_CACHE="${WORKDIR}/.npm"
		(
			cd "${S}/apps/host" || die
			npm install --no-audit --no-fund || die
			npm run build || die
		)

		# tauri embeds every bundle.resources path into the binary (the
		# embedded copy is unused on linux: at runtime the app reads
		# <bindir>/../lib/strata-desktop), so every listed folder must exist
		# at compile time; harness is never staged (the app runs without it)
		mkdir -p "${S}/apps/desktop/src-tauri/resources/harness" || die

		# the node runtime is the system node (src_install symlinks it into the
		# bundled path); resources/node already exists in the tree, so tauri's
		# bundle.resources is satisfied without fetching a binary
		cargo_src_compile
	fi

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
	# chat.py/highlight.py: by-path tools package_terminal.py does not bundle
	# (the terminal paths never import them); they moved to tools/ in 0.2.13
	cp --parents tools/chat.py tools/highlight.py "${stage}/"
	doins -r "${stage}/tools"

	# the git checkout ships it 0755, but keep the mode explicit
	fperms 0755 "${libdir}/bin/strata"

	# the terminal's own version label
	echo "${PV}" > "${D}/${libdir}/VERSION"

	# the interpreter the terminal runs on: upstream's launcher (bin/strata)
	# looks for <root>/python/bin/python3, the terminal archive's private
	# runtime, before any python on the PATH; a shim there starts the
	# implementation python_setup picked, with the user's site-packages kept
	# out (the launcher does that for this path). With python/ and VERSION
	# in place the terminal is upstream's archive layout, so `strata install`
	# hands setup.py its STRATA_CONTROL_INSTALL=1 mode (downloads and prepares
	# the model, writes a run config naming the engine component; no pip, no
	# compiler) instead of the source-checkout mode, which would try to build
	# an engine into /usr/$(get_libdir)/strata
	python_shims "${D}/${libdir}/python/bin" "/${libdir}/python/bin"

	# /usr/bin/strata is not a symlink to bin/strata: it first links the
	# packaged engine into the user's own component store (see the header)
	strata_launcher strata "the Strata terminal" "/${libdir}/bin/strata"

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
				"portable": $(usex old-cpu false true)
			}
			EOF
		else
			# the hipBLASLt version and the matching tuning tables for the
			# package; the ROCm install's include tree is /usr
			python3 "${S}/packaging/stage_tuning.py" --stage "${stage}" \
				--archs "gfx1100 gfx1201" --rocm /usr || die
			arch_args=( --arch gfx1100 --arch gfx1201 )
		fi

		# the engine imports the CUDA toolkit's libraries (cublas, cublasLt,
		# cudart); the packager refuses a component whose imports are neither
		# bundled nor OS or driver libraries. The toolkit's are allowed:
		# RDEPEND (nvidia-cuda-toolkit) provides them and its lib dir is in
		# the ldconfig cache
		local allow_args=()
		use cuda && allow_args=( --allow-lib libcublas.so.13 --allow-lib libcublasLt.so.13
			--allow-lib libcudart.so.13 )
		# the engine imports the ROCm HIP runtime and BLAS libraries; RDEPEND
		# (hip, hipBLAS, hipBLASLt, rocBLAS) provides them and their lib dir is
		# in the ldconfig cache
		use hip && allow_args=( --allow-lib libamdhip64.so.7 --allow-lib libhipblas.so.3
			--allow-lib libhipblaslt.so.1 --allow-lib librocblas.so.5 )

		# the manifest (engine-component.json): strata hashes and verifies the
		# whole component before a start. The picture reader is not shipped,
		# so the image input stays off (the engine reports it as missing)
		python3 "${S}/packaging/package_engine.py" \
			--src "${stage}" \
			--backend "${backend}" \
			--version "${ENGINE_PV}" \
			--platform linux-x86_64 \
			--out "${D}/${libdir}/components/engine" \
			"${arch_args[@]}" \
			"${allow_args[@]}" \
			--build-id "gentoo-${PV}" \
			--no-picture-reader || die

		# estrip (after src_install) would break the component's integrity:
		# engine-component.json records the binaries' hashes, so the engine
		# must survive the install unstripped
		dostrip -x "/${libdir}/components/engine"
	fi

	# No env.d: the terminal finds its interpreter through the python/ shim
	# above, and STRATA_COMPONENTS_DIR must stay unset (header). A system-wide
	# export of it is what broke every install and the desktop app (#533).

	# ---- the desktop: the tauri shell + the resources it locates beside it ----
	if use desktop; then
		# the shell looks for its resources (host/server/index.mjs) in its own
		# folder first, then in <bindir>/../lib/strata-desktop (a literal lib,
		# not $(get_libdir)); nothing else is tried before the compile-time
		# source tree, so this location is not optional
		local desktopdir="usr/lib/strata-desktop"

		# the binary lives with its resources; /usr/bin/strata-desktop (the
		# menu entry's command) is the launcher that links the packaged engine
		# into the user's component store first
		exeinto "/${desktopdir}"
		doexe "${S}/apps/desktop/src-tauri/target/release/strata-desktop"
		strata_launcher strata-desktop "the Strata desktop app" "/${desktopdir}/strata-desktop"

		# the web shell + engine host: node starts host/server/index.mjs
		insinto "/${desktopdir}/host"
		doins -r "${S}/apps/host/dist" "${S}/apps/host/server"
		doins "${S}/apps/host/package.json"

		# the host runs on the system node: the app only ever looks at the
		# bundled <resources>/node/node, so point it at the system binary with
		# a launcher (same pattern as the control python launcher below)
		local nbin="${D}/${desktopdir}/node"
		mkdir -p "${nbin}" || die
		cat > "${nbin}/node" <<-EOF
		#!/bin/sh
		# Strata host: starts the system node
		exec /usr/bin/node "\$@"
		EOF
		fperms 0755 "/${desktopdir}/node/node"

		# control: the python parts of strata, no interpreter and no wheels:
		# they run on the system python (the one of PYTHON_COMPAT that
		# python_setup picked in pkg_setup) and the desktop's python set
		local -x STRATA_COMMIT="$(git -C "${S}" rev-parse HEAD)"
		python3 "${FILESDIR}/stage-control.py" \
			"${S}" "${D}/${desktopdir}/control" || die

		# the launcher the tauri shell expects (control/python/bin/python3),
		# pointing at the system interpreter picked in pkg_setup
		python_shims "${D}/${desktopdir}/control/python/bin" "/${desktopdir}/control/python/bin"

		# the system python has to run the control: fail the build, not the app
		( cd "${D}/${desktopdir}/control" || die
			PYTHONNOUSERSITE=1 ./python/bin/python3 strata.py --version ) \
			|| die "the control component does not run on the system python (${PYTHON})"

		# No engine-bundle/: the app's host copies a bundle into the user's
		# component store at every start that finds none there, and once the
		# store holds it, deletes the bundle from the install folder (apps/host/
		# server/bundled-engine.mjs removeVerifiedBundle). The launcher links
		# the packaged engine into the store instead, so the app has its engine
		# without a 2nd copy on disk and without a root run deleting package
		# files (a root run of 0.2.12-r0 did exactly that).

		# the application menu entry + the icon (hicolor, the size is
		# detected from the image)
		newicon "${S}/apps/desktop/src-tauri/icons/icon.png" strata-desktop.png
		make_desktop_entry --eapi9 "/usr/bin/strata-desktop" \
			-n "Strata" -i "strata-desktop" \
			-c "Development;Science;" -C "Local AI, tuned to one model."
	fi

	dodoc README.md
}

# python_shims <staging dir> <image path>: the python, python3 and ${EPYTHON}
# launchers that start the implementation python_setup picked, without the
# user's site-packages (the layout upstream's bundles have at python/bin/)
python_shims() {
	local stage="$1" image="$2" pname
	mkdir -p "${stage}" || die
	for pname in python python3 "${EPYTHON}"; do
		cat > "${stage}/${pname}" <<-EOF || die
		#!/bin/sh
		# Strata: starts the system python (${PYTHON})
		export PYTHONNOUSERSITE=1
		export PYTHONDONTWRITEBYTECODE=1
		exec ${PYTHON} "\$@"
		EOF
		fperms 0755 "${image}/${pname}"
	done
}

# strata_launcher <name> <what> <target>: /usr/bin/<name> from
# files/strata-launcher.in, running <target> after linking the packaged
# engine store into the user's component store
strata_launcher() {
	local name="$1" what="$2" target="$3"
	sed -e "s|@NAME@|${name}|g" -e "s|@WHAT@|${what}|g" -e "s|@TARGET@|${target}|g" \
		-e "s|@SYSCOMPS@|/usr/$(get_libdir)/strata/components|g" \
		"${FILESDIR}/strata-launcher.in" > "${T}/${name}" || die
	newbin "${T}/${name}" "${name}"
}

pkg_preinst() {
	# remembered for pkg_postinst: the old version's env.d is still here now
	[[ -f ${EROOT}/etc/env.d/90strata ]] && STRATA_OLD_ENVD=1
	return 0
}

pkg_postinst() {
	if use desktop; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
	if ! use cuda && ! use hip; then
		ewarn "No engine was built (enable the cuda or hip USE flag for an"
		ewarn "NVIDIA / AMD GPU). The strata terminal is installed, but"
		ewarn "'strata launch' needs an engine: re-emerge sci-misc/strata with"
		ewarn "[cuda] or [hip] to build one."
	fi

	elog "Strata writes only to per-user folders: \$XDG_DATA_HOME/strata (the"
	elog "component store, install/ with the run configs and logs, the desktop's"
	elog "settings), ~/.strata (the desktop's state and chats), \$XDG_CONFIG_HOME/"
	elog "strata and \$XDG_STATE_HOME/strata; models go where you point them"
	elog "(default: ~/Documents/Strata). Removing those folders resets Strata."
	elog "The packaged engine (/usr/$(get_libdir)/strata/components/engine) is"
	elog "linked into your component store by the strata and strata-desktop"
	elog "commands, so start Strata through them. Never start Strata as root."

	# the versions before this exported STRATA_COMPONENTS_DIR system-wide, which
	# sent every write of Strata into /usr/$(get_libdir)/strata; a root run then
	# created install/ there. Any session that is still open keeps the variable
	# (pkg_preinst saw the env.d file before the old version was unmerged).
	if [[ ${STRATA_OLD_ENVD} == 1 ]]; then
		ewarn "The version replaced exported STRATA_COMPONENTS_DIR and STRATA_PYTHON from"
		ewarn "/etc/env.d/90strata. Already-open sessions still carry them: log out and"
		ewarn "in again (or: unset STRATA_COMPONENTS_DIR STRATA_PYTHON). Until then the"
		ewarn "strata and strata-desktop launchers ignore the old STRATA_COMPONENTS_DIR."
	fi
	if [[ -d ${EROOT}/usr/$(get_libdir)/strata/install ]]; then
		ewarn "${EROOT}/usr/$(get_libdir)/strata/install exists: a Strata run as root under the"
		ewarn "old layout created it. It is not part of this package; remove it:"
		ewarn "  rm -r ${EROOT}/usr/$(get_libdir)/strata/install"
	fi
}

pkg_postrm() {
	if use desktop; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
}
