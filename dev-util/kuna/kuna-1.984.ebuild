# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.90"

inherit cargo git-r3

DESCRIPTION="Agent-first decompiler, a Rust port of Ghidra"
HOMEPAGE="https://kuna.noelo.org/ https://github.com/Noelo-Lab/kuna"

EGIT_REPO_URI="https://github.com/Noelo-Lab/kuna.git"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions BSD-2 LGPL-2.1+ MIT Unlicense"
SLOT="0"
RESTRICT="test"

DOCS=(
	NOTICE
	README.md
	docs/
)

src_unpack() {
	git-r3_src_unpack

	# The cargo workspace lives in decompiler/; cargo_live_src_unpack runs
	# cargo fetch/vendor in ${S}, so point it there for the fetch.
	local _S="${S}"
	S="${S}/decompiler"
	cargo_live_src_unpack
	S="${_S}"
}

src_configure() {
	# Bake the compiled SLEIGH tree into the binary, like upstream releases do
	myfeatures=( embed-specs )
	cargo_src_configure
}

src_compile() {
	# Upstream release CI bakes the version via KUNA_VERSION (option_env!);
	# dev/live builds intentionally report the workspace Cargo version.
	cd "${S}/decompiler" || die

	# The SLEIGH compiler compiles the vendored .slaspec tree that the
	# embed-specs feature of the CLI then bakes in.
	cargo_env "${CARGO}" build $(usex debug "" --release) -p kuna-slacomp || die
	"$(cargo_target_dir)/slacomp" -a "${S}/specs" || die

	cargo_src_compile -p kuna-cli
}

src_install() {
	(
		cd "${S}/decompiler/crates/kuna-cli" || die
		cargo_src_install
	)

	dodoc -r "${DOCS[@]}"
}
