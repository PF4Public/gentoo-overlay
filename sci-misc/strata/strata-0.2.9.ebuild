# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REPO="https://github.com/Niko1221/Strata"
# the llama.cpp pin third_party/ggml/VERSION.txt points at: its ggml is built
# statically into the engine, and CMake would FetchContent the same commit
# from the network at configure time, so the ebuild pins it as a distfile
LLAMA_REPO="https://github.com/ggml-org/llama.cpp"
LLAMA_COMMIT="3cf03257f219afbe7334045ff7c6a06ac68c627d"
# system-ggml: the sci-ml/ggml package to link (bump with its bumps)
GGML_PV="0.28.0"
# the commit the v${PV} tag points at; the desktop control staging needs it
# (the tarball has no .git, so STRATA_COMMIT supplies it)
STRATA_TAG_COMMIT="878ef09cc9092a41a37dac32fd6fe461e47fa326"

ROCM_VERSION="7.2"

# the desktop (apps/desktop) tauri shell, from apps/desktop/src-tauri/
# Cargo.lock; the crate registry distfiles are public
CRATES="
	adler2@2.0.1
	aho-corasick@1.1.5
	alloc-no-stdlib@3.0.0
	alloc-stdlib@0.3.0
	android_system_properties@0.1.6
	anyhow@1.0.104
	arbitrary@1.5.0
	async-broadcast@0.7.2
	async-channel@2.5.0
	async-executor@1.14.0
	async-io@2.6.0
	async-lock@3.4.2
	async-process@2.5.0
	async-recursion@1.2.0
	async-signal@0.2.14
	async-task@4.7.1
	async-trait@0.1.92
	atk-sys@0.18.2
	atk@0.18.2
	atomic-waker@1.1.2
	autocfg@1.5.1
	base64@0.21.7
	base64@0.22.1
	base64@0.23.1
	bit-set@0.8.0
	bit-vec@0.8.0
	bitflags@1.3.2
	bitflags@2.13.2
	block-buffer@0.10.4
	block2@0.6.2
	blocking@1.7.0
	brotli-decompressor@6.0.1
	brotli@9.0.0
	bs58@0.5.1
	bumpalo@3.20.3
	bytemuck@1.25.2
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.12.1
	cairo-rs@0.18.5
	cairo-sys-rs@0.18.2
	camino@1.2.6
	cargo-platform@0.1.9
	cargo_metadata@0.19.2
	cargo_toml@1.0.1
	cc@1.8.0
	cesu8@1.1.0
	cfb@0.14.0
	cfg-expr@0.15.8
	cfg-if@1.0.5
	chrono@0.4.45
	combine@4.6.8
	concurrent-queue@2.5.0
	cookie@0.18.2
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-foundation@0.9.4
	core-graphics-types@0.2.0
	core-graphics@0.25.0
	core_detect@1.0.0
	cpufeatures@0.2.17
	crc32fast@1.5.2
	crossbeam-channel@0.5.17
	crossbeam-utils@0.8.23
	crypto-common@0.1.7
	cssparser-macros@0.7.1
	cssparser@0.37.0
	ctor@1.0.13
	darling@0.24.1
	darling_core@0.24.1
	darling_macro@0.24.1
	dbus@0.9.12
	defmt-macros@1.1.1
	defmt-parser@1.0.0
	defmt@1.1.1
	deranged@0.5.9
	derive_arbitrary@1.5.0
	derive_more-impl@2.1.1
	derive_more@2.1.1
	digest@0.10.7
	dirs-sys@0.5.0
	dirs@7.0.0
	dispatch2@0.3.1
	displaydoc@0.2.7
	dlopen2@0.8.2
	dlopen2_derive@0.4.3
	dom_query@0.28.0
	dpi@0.1.2
	dtoa-short@0.3.5
	dtoa@1.0.11
	dunce@1.0.5
	dyn-clone@1.0.20
	embed-resource@3.0.12
	embed_plist@1.2.2
	encoding_rs@0.8.42
	endi@1.1.1
	enumflags2@0.7.12
	enumflags2_derive@0.7.12
	equivalent@1.0.3
	erased-serde@0.4.10
	errno@0.3.14
	event-listener-strategy@0.5.4
	event-listener@5.4.2
	fastrand@2.5.0
	fdeflate@0.3.7
	field-offset@0.3.6
	filetime@0.2.29
	find-msvc-tools@0.1.14
	flate2@1.1.10
	fnv@1.0.7
	foldhash@0.2.0
	foreign-types-macros@0.2.4
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	form_urlencoded@1.2.2
	futures-channel@0.3.34
	futures-core@0.3.34
	futures-executor@0.3.34
	futures-io@0.3.34
	futures-lite@2.6.1
	futures-macro@0.3.34
	futures-sink@0.3.34
	futures-task@0.3.34
	futures-util@0.3.34
	gdk-pixbuf-sys@0.18.0
	gdk-pixbuf@0.18.5
	gdk-sys@0.18.2
	gdk@0.18.2
	gdkwayland-sys@0.18.2
	gdkx11-sys@0.18.2
	gdkx11@0.18.2
	generic-array@0.14.7
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.3
	gio-sys@0.18.1
	gio@0.18.4
	glib-macros@0.18.5
	glib-sys@0.18.1
	glib@0.18.5
	glob@0.3.4
	gobject-sys@0.18.0
	gtk-sys@0.18.2
	gtk3-macros@0.18.2
	gtk@0.18.2
	hashbrown@0.12.3
	hashbrown@0.17.1
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.5.3
	hex@0.4.3
	html5ever@0.39.0
	http-body-util@0.1.5
	http-body@1.1.0
	http@1.5.0
	httparse@1.10.1
	hyper-rustls@0.27.10
	hyper-util@0.1.21
	hyper@1.12.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	ico@0.5.0
	icu_collections@2.3.0
	icu_locale_core@2.3.0
	icu_normalizer@2.3.0
	icu_normalizer_data@2.3.0
	icu_properties@2.3.0
	icu_properties_data@2.3.0
	icu_provider@2.3.1
	ident_case@1.0.1
	idna@1.1.0
	idna_adapter@1.2.2
	image@0.25.10
	indexmap@1.9.3
	indexmap@2.14.2
	infer@0.22.0
	ipnet@2.12.2
	is-docker@0.2.0
	is-wsl@0.4.0
	itoa@1.0.18
	javascriptcore-rs-sys@1.1.1
	javascriptcore-rs@1.1.2
	jiff-core@0.1.1
	jiff-static@0.2.38
	jiff-tzdb-platform@0.1.3
	jiff-tzdb@0.1.9
	jiff@0.2.38
	jni-macros@0.22.4
	jni-sys-macros@0.4.1
	jni-sys@0.3.1
	jni-sys@0.4.1
	jni@0.21.1
	jni@0.22.4
	js-sys@0.3.106
	json-patch@4.2.0
	jsonptr@0.7.1
	keyboard-types@0.8.3
	libappindicator-sys@0.9.0
	libappindicator@0.9.0
	libc@0.2.190
	libdbus-sys@0.2.7
	libloading@0.7.4
	libredox@0.1.25
	linux-raw-sys@0.12.1
	litemap@0.8.3
	lock_api@0.4.14
	log@0.4.34
	mac-notification-sys@0.6.15
	markup5ever@0.39.0
	memchr@2.8.3
	memoffset@0.9.1
	mime@0.3.17
	minisign-verify@0.3.0
	miniz_oxide@0.8.9
	miniz_oxide@0.9.1
	mio@1.2.4
	moxcms@0.8.1
	muda@0.20.0
	multiversion_no_op@1.0.0
	ndk-context@0.1.1
	ndk-sys@0.6.0+11769913
	ndk@0.9.0
	new_debug_unreachable@1.0.6
	notify-rust@4.18.2
	num-conv@0.2.2
	num-traits@0.2.19
	num_enum@0.7.6
	num_enum_derive@0.7.6
	objc2-app-kit@0.3.2
	objc2-cloud-kit@0.3.2
	objc2-core-data@0.3.2
	objc2-core-foundation@0.3.2
	objc2-core-graphics@0.3.2
	objc2-core-image@0.3.2
	objc2-core-location@0.3.2
	objc2-core-text@0.3.2
	objc2-encode@4.1.0
	objc2-exception-helper@0.1.1
	objc2-foundation@0.3.2
	objc2-io-surface@0.3.2
	objc2-osa-kit@0.3.2
	objc2-quartz-core@0.3.2
	objc2-ui-kit@0.3.2
	objc2-user-notifications@0.3.2
	objc2-web-kit@0.3.2
	objc2@0.6.5
	once_cell@1.21.4
	open@5.4.4
	openssl-probe@0.2.1
	option-ext@0.2.0
	ordered-stream@0.2.0
	os_pipe@1.2.3
	osakit@0.3.1
	pango-sys@0.18.0
	pango@0.18.3
	parking@2.2.1
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	percent-encoding@2.3.2
	phf@0.13.1
	phf_codegen@0.13.1
	phf_generator@0.13.1
	phf_macros@0.13.1
	phf_shared@0.13.1
	pin-project-lite@0.2.17
	piper@0.2.5
	pkg-config@0.3.34
	plist@1.10.1
	png@0.17.16
	png@0.18.1
	polling@3.11.0
	portable-atomic-util@0.2.8
	portable-atomic@1.15.0
	potential_utf@0.1.6
	powerfmt@0.2.1
	ppv-lite86@0.2.21
	precomputed-hash@0.1.1
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.2
	proc-macro-crate@3.5.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.107
	pxfm@0.1.30
	quick-xml@0.42.0
	quote@1.0.47
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.9.5
	rand_chacha@0.9.0
	rand_core@0.9.5
	raw-window-handle@0.6.2
	redox_syscall@0.5.18
	redox_users@0.5.3
	ref-cast-impl@1.0.27
	ref-cast@1.0.27
	regex-automata@0.4.18
	regex-syntax@0.8.11
	regex@1.13.1
	reqwest@0.13.5
	ring@0.17.14
	rustc-hash@2.1.3
	rustc_version@0.4.1
	rustix@1.1.5
	rustls-native-certs@0.8.5
	rustls-pki-types@1.15.1
	rustls-platform-verifier-android@0.2.0
	rustls-platform-verifier@0.7.1
	rustls-webpki@0.103.15
	rustls@0.23.46
	rustversion@1.0.23
	same-file@1.0.6
	schannel@0.1.29
	schemars@0.8.22
	schemars@0.9.0
	schemars@1.2.3
	schemars_derive@0.8.22
	scopeguard@1.2.0
	security-framework-sys@2.17.0
	security-framework@3.7.0
	selectors@0.38.0
	semver@1.0.28
	serde-untagged@0.1.9
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_derive_internals@0.29.1
	serde_json@1.0.154
	serde_repr@0.1.21
	serde_spanned@0.6.9
	serde_spanned@1.1.2
	serde_with@3.24.0
	serde_with_macros@3.24.0
	serialize-to-javascript-impl@0.1.2
	serialize-to-javascript@0.1.2
	servo_arc@0.4.3
	sha2@0.10.9
	shared_child@1.1.2
	shlex@2.0.1
	signal-hook-registry@1.4.8
	simd-adler32@0.3.10
	simd_cesu8@1.2.0
	simdutf8@0.1.5
	siphasher@1.0.4
	slab@0.4.12
	smallvec@1.16.3
	socket2@0.6.5
	softbuffer@0.4.8
	soup3-sys@0.5.0
	soup3@0.5.0
	stable_deref_trait@1.2.1
	static_vcruntime@3.0.0
	string_cache@0.9.0
	string_cache_codegen@0.6.1
	strsim@0.11.1
	subtle@2.6.1
	swift-rs@1.0.9
	syn@1.0.109
	syn@2.0.119
	syn@3.0.9
	sync_wrapper@1.0.2
	synstructure@0.14.0
	system-configuration-sys@0.6.0
	system-configuration@0.7.0
	system-deps@6.2.2
	tao-macros@0.1.4
	tao@0.37.1
	tar@0.4.46
	target-lexicon@0.12.16
	tauri-build@2.7.3
	tauri-codegen@2.7.3
	tauri-macros@2.7.3
	tauri-plugin-notification@2.7.0
	tauri-plugin-shell@2.5.0
	tauri-plugin-single-instance@2.5.4
	tauri-plugin-updater@2.14.0
	tauri-plugin@2.7.2
	tauri-runtime-wry@2.12.2
	tauri-runtime@2.12.2
	tauri-utils@2.10.2
	tauri-winres@0.3.6
	tauri-winrt-notification@0.8.1
	tauri@2.12.4
	tempfile@3.27.0
	tendril@0.5.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.21
	thiserror@1.0.69
	thiserror@2.0.21
	time-core@0.1.9
	time-macros@0.2.32
	time@0.3.55
	tinystr@0.8.4
	tinyvec@1.13.3
	tokio-rustls@0.26.6
	tokio-util@0.7.20
	tokio@1.53.3
	toml@0.8.2
	toml@1.1.8+spec-1.1.0
	toml_datetime@0.6.3
	toml_datetime@1.1.2+spec-1.1.0
	toml_edit@0.19.15
	toml_edit@0.20.2
	toml_edit@0.25.17+spec-1.1.0
	toml_parser@1.1.5+spec-1.1.0
	toml_writer@1.1.3+spec-1.1.0
	tower-http@0.6.11
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.3
	tracing-attributes@0.1.31
	tracing-core@0.1.36
	tracing@0.1.44
	tray-icon@0.25.1
	try-lock@0.2.5
	typeid@1.0.3
	typenum@1.20.1
	uds_windows@1.2.1
	unicode-ident@1.0.27
	unicode-segmentation@1.13.3
	untrusted@0.9.0
	url@2.5.8
	urlpattern@0.6.0
	utf8_iter@1.0.4
	uuid@1.28.0
	version-compare@0.2.1
	version_check@0.9.5
	vswhom-sys@0.1.3
	vswhom@0.1.0
	walkdir@2.5.0
	want@0.3.2
	wasi@0.11.1+wasi-snapshot-preview1
	wasip2@1.0.4+wasi-0.2.12
	wasm-bindgen-futures@0.4.79
	wasm-bindgen-macro-support@0.2.129
	wasm-bindgen-macro@0.2.129
	wasm-bindgen-shared@0.2.129
	wasm-bindgen@0.2.129
	wasm-streams@0.5.0
	web-sys@0.3.106
	web-time@1.1.0
	web_atoms@0.2.6
	webkit2gtk-sys@2.0.2
	webkit2gtk@2.0.2
	webpki-root-certs@1.0.9
	webview2-com-macros@0.8.1
	webview2-com-sys@0.39.1
	webview2-com@0.39.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	window-vibrancy@0.8.1
	windows-collections@0.3.2
	windows-core@0.62.2
	windows-future@0.3.2
	windows-implement@0.60.2
	windows-interface@0.59.3
	windows-link@0.2.1
	windows-numerics@0.3.1
	windows-registry@0.6.1
	windows-result@0.4.1
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.52.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows-threading@0.2.1
	windows-version@0.1.7
	windows@0.62.2
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	winnow@0.5.40
	winnow@1.0.4
	winreg@0.56.0
	wit-bindgen@0.57.1
	writeable@0.6.4
	wry@0.57.0
	x11-dl@2.21.0
	x11@2.21.0
	xattr@1.6.1
	yoke-derive@0.8.4
	yoke@0.8.3
	zbus@5.19.0
	zbus_macros@5.19.0
	zbus_names@4.3.4
	zcheapstr@1.1.0
	zerocopy-derive@0.8.63
	zerocopy@0.8.63
	zerofrom-derive@0.1.8
	zerofrom@0.1.8
	zeroize@1.9.1
	zerotrie@0.2.5
	zerovec-derive@0.11.6
	zerovec@0.11.8
	zip@4.6.1
	zlib-rs@0.6.8
	zmij@1.0.23
	zvariant@5.15.0
	zvariant_derive@5.15.0
	zvariant_utils@4.2.0
"

RUST_MIN_VER="1.77"

inherit cargo cmake cuda linux-info rocm

DESCRIPTION="Local LLM inference engine with an OpenAI/Anthropic-compatible API"
HOMEPAGE="https://github.com/Niko1221/Strata"

SRC_URI="
	${CARGO_CRATE_URIS}
	${REPO}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	!system-ggml? (
		${LLAMA_REPO}/archive/${LLAMA_COMMIT}.tar.gz -> ${P}-ggml-${LLAMA_COMMIT}.tar.gz
	)
	desktop? (
		https://nodejs.org/dist/v24.12.0/node-v24.12.0-linux-x64.tar.gz
		https://github.com/astral-sh/python-build-standalone/releases/download/20261009/cpython-3.12.15%2B20261009-x86_64-unknown-linux-gnu-install_only.tar.gz -> cpython-3.12.15_20261009-x86_64-unknown-linux-gnu-install_only.tar.gz
	)
"

S="${WORKDIR}/Strata-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

# the engine is built for one GPU backend; the terminal (the strata command,
# the monitor and the API server) installs in every case. system-ggml links
# the installed sci-ml/ggml instead of building the pinned commit's ggml
# (files/strata-system-ggml.patch adds the STRATA_SYSTEM_GGML option).
# desktop is the tauri app (apps/desktop): the Rust shell plus the host web
# shell, the pinned node runtime, the pinned CPython control component and
# (with cuda/hip) the engine bundle; the tauri shell locates the resources
# in <bindir>/../lib/strata-desktop, so the layout below is fixed
IUSE="cuda desktop hip system-ggml tui"
REQUIRED_USE="!cuda? ( !hip )"

# the terminal runs on the system python3 (the bin/strata launcher); these
# are the packages its requirements.txt pins; with system-ggml the engine
# links sci-ml/ggml, whose install also carries the source tree (src/ +
# include/) with the internal headers and the ggml-cuda MMQ sources strata
# compiles itself. The desktop's gui stack is the set the tauri shell links
# (best effort: the tauri build is not testable in CI)
COMMON_DEPEND="
	dev-python/jinja2
	dev-python/numpy
	dev-python/pillow
	dev-python/psutil
	dev-python/pyyaml
	dev-python/regex
	dev-python/requests
	dev-python/tqdm
	tui? ( dev-python/textual )
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	desktop? (
		dev-libs/glib
		net-libs/webkit-gtk:4.1
		x11-libs/gtk+:3
	)
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
	desktop? (
		>=net-libs/nodejs-24.12[npm]
	)
"

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
	cargo_src_unpack

	# the llama.cpp pin for the built-in ggml (not a distfile with
	# system-ggml; CMake would fetch the commit from the network)
	if ! use system-ggml; then
		mkdir -p "${WORKDIR}/llama.cpp-${LLAMA_COMMIT}" || die
		tar xzf "${DISTDIR}/${P}-ggml-${LLAMA_COMMIT}.tar.gz" \
			-C "${WORKDIR}/llama.cpp-${LLAMA_COMMIT}" --strip-components=1 || die
	fi

	# the locked runtime wheels for the desktop control component
	# (self-generated; not on a mirror, so it is kept in files/ and expanded
	# here)
	if use desktop; then
		mkdir -p "${WORKDIR}/wheels" || die
		tar xzf "${FILESDIR}/strata-runtime-wheels-linux-x86_64.tar.gz" \
			-C "${WORKDIR}/wheels" || die
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
	if use desktop; then
		cargo_src_configure --manifest-path "${S}/apps/desktop/src-tauri/Cargo.toml"
	fi

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
	doins strata.py setup.py chat.py highlight.py requirements.txt requirements-monitor.txt
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

	# the tarball ships it 0775
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

		# the engine imports the CUDA toolkit's libraries (cublas, cublasLt,
		# cudart); the packager refuses a component whose imports are neither
		# bundled nor OS or driver libraries. The toolkit's are allowed:
		# RDEPEND (nvidia-cuda-toolkit) provides them and its lib dir is in
		# the ldconfig cache
		local allow_args=()
		use cuda && allow_args=( --allow-lib libcublas.so.13 --allow-lib libcublasLt.so.13
			--allow-lib libcudart.so.13 )

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

		local envd="${T}/90strata"
		cat > "${envd}" <<-EOF
		STRATA_COMPONENTS_DIR="/usr/$(get_libdir)/strata/components"
		export STRATA_COMPONENTS_DIR
		EOF
		doenvd "${envd}"
	fi

	# ---- the desktop: the tauri shell + the resources it locates beside it ----
	if use desktop; then
		local desktopdir="usr/$(get_libdir)/strata-desktop"

		cp "${S}/apps/desktop/src-tauri/target/release/strata-desktop" "${T}/strata-desktop" || die
		insinto /usr/bin
		doins "${T}/strata-desktop"
		fperms 0755 /usr/bin/strata-desktop

		# the web shell + engine host: node starts host/server/index.mjs
		insinto "/${desktopdir}/host"
		doins -r "${S}/apps/host/dist" "${S}/apps/host/server"
		doins "${S}/apps/host/package.json"

		# the pinned node runtime (the single binary the host uses)
		insinto "/${desktopdir}/node"
		doins "${WORKDIR}/node-v24.12.0-linux-x64/bin/node"
		fperms 0755 "/${desktopdir}/node/node"

		# control: the pinned CPython + the locked wheels + the python parts
		# of strata, staged and self-verified by the upstream script. The
		# interpreter distfile is pre-placed in its cache, the wheels come
		# from files/, so this fetches nothing
		local -x STRATA_COMMIT="${STRATA_TAG_COMMIT}"
		local -x TMPDIR="${T}"
		mkdir -p "${T}/strata-packaging-cache" || die
		cp "${DISTDIR}/cpython-3.12.15_20261009-x86_64-unknown-linux-gnu-install_only.tar.gz" \
			"${T}/strata-packaging-cache/" || die
		python3 "${S}/apps/desktop/scripts/stage-control.py" \
			--out "${D}/${desktopdir}/control" \
			--wheelhouse "${WORKDIR}/wheels" || die

		# the pinned CPython is fragile: strip corrupts its dynamic section
		# (its .dynstr is not in a segment) and the interpreter stops running
		dostrip -x "/usr/$(get_libdir)/strata-desktop/control"

		# the engine bundle: the same component the terminal installs, so
		# the app ships with its engine
		if use cuda || use hip; then
			local comp
			mkdir -p "${D}/${desktopdir}/engine-bundle" || die
			for comp in "${D}/${libdir}/components/engine"/*; do
				[[ -e ${comp} ]] || continue
				cp -a "${comp}" "${D}/${desktopdir}/engine-bundle/" || die
			done
		fi
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
