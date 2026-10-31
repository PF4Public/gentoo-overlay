# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.1
	aho-corasick@1.1.4
	arrayvec@0.7.8
	bitflags@2.13.0
	block-buffer@0.12.1
	bumpalo@3.20.3
	cfg-if@1.0.4
	const-oid@0.10.2
	cpp_demangle@0.5.1
	cpufeatures@0.3.1
	crc32fast@1.5.0
	crypto-common@0.2.2
	digest@0.11.3
	equivalent@1.0.2
	errno@0.3.14
	fallible-iterator@0.2.0
	fastrand@2.5.0
	flate2@1.1.9
	foldhash@0.2.0
	futures-core@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	getrandom@0.4.3
	gimli@0.33.0
	hashbrown@0.17.1
	hybrid-array@0.4.15
	indexmap@2.14.0
	itoa@1.0.18
	js-sys@0.3.103
	libc@0.2.189
	linux-raw-sys@0.12.1
	memchr@2.8.2
	miniz_oxide@0.8.9
	msvc-demangler@0.11.0
	nonmax@0.5.5
	object@0.39.1
	once_cell@1.21.4
	pdb@0.8.0
	pin-project-lite@0.2.17
	proc-macro2@1.0.106
	quote@1.0.45
	r-efi@6.0.0
	regex@1.12.4
	regex-automata@0.4.14
	regex-syntax@0.8.11
	rustc-demangle@0.1.27
	rustix@1.1.5
	rustversion@1.0.22
	scroll@0.11.0
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	serde_spanned@1.1.1
	sha2@0.11.0
	simd-adler32@0.3.9
	slab@0.4.12
	slotmap@1.1.1
	smallvec@1.15.1
	stable_deref_trait@1.2.1
	syn@2.0.117
	syn@3.0.6
	tempfile@3.27.0
	thiserror@1.0.69
	thiserror@2.0.18
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	toml@1.1.6+spec-1.1.0
	toml_datetime@1.1.1+spec-1.1.0
	toml_parser@1.1.3+spec-1.1.0
	toml_writer@1.1.2+spec-1.1.0
	typenum@1.20.1
	undname@2.1.2
	unicode-ident@1.0.24
	uuid@1.23.4
	version_check@0.9.5
	wasm-bindgen@0.2.126
	wasm-bindgen-macro@0.2.126
	wasm-bindgen-macro-support@0.2.126
	wasm-bindgen-shared@0.2.126
	windows-link@0.2.1
	windows-sys@0.61.2
	winnow@1.0.4
	zmij@1.0.23
"

RUST_MIN_VER="1.90"

inherit cargo

DESCRIPTION="Agent-first decompiler, a Rust port of Ghidra"
HOMEPAGE="https://kuna.noelo.org/ https://github.com/Noelo-Lab/kuna"
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/Noelo-Lab/kuna/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions BSD-2 LGPL-2.1+ MIT Unlicense"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="test"

DOCS=(
	NOTICE
	README.md
	docs/
)

src_configure() {
	# Bake the compiled SLEIGH tree into the binary, like upstream releases do
	myfeatures=( embed-specs )
	cargo_src_configure
}

src_compile() {
	# option_env!() at compile time, so --version reports the release version
	local -x KUNA_VERSION="${PV}"

	cd "${S}/decompiler" || die

	# The SLEIGH compiler compiles the vendored .slaspec tree that the
	# embed-specs feature of the CLI then bakes in.
	cargo_env "${CARGO}" build $(usex debug "" --release) -p kuna-slacomp || die
	"$(cargo_target_dir)/slacomp" -a "${S}/specs" || die

	cargo_src_compile -p kuna-cli
}

src_install() {
	local -x KUNA_VERSION="${PV}"

	(
		cd "${S}/decompiler/crates/kuna-cli" || die
		cargo_src_install
	)

	dodoc -r "${DOCS[@]}"
}
