# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.90"

inherit cargo multiprocessing

DESCRIPTION="Agent-first decompiler, a Rust port of Ghidra"
HOMEPAGE="https://kuna.noelo.org/ https://github.com/Noelo-Lab/kuna"
SRC_URI="https://github.com/Noelo-Lab/kuna/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions BSD-2 LGPL-2.1+ MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test network-sandbox"

src_unpack() {
	cargo_src_unpack

	# The eclass pins cargo offline against a local directory source, but
	# this package resolves the in-tree Cargo.lock against crates.io at
	# build time (RESTRICT network-sandbox), so replace the generated
	# config with a minimal online one.
	mkdir -p "${ECARGO_HOME}" || die
	cat > "${ECARGO_HOME}/config.toml" <<- _EOF_ || die
	[build]
	jobs = $(makeopts_jobs)
	incremental = false
	_EOF_
}

src_configure() {
	# Bake the compiled SLEIGH tree into the binary, like upstream releases do
	myfeatures=( embed-specs )
	cargo_src_configure
}

src_compile() {
	# option_env!() at compile time, so --version reports the release version
	local -x KUNA_VERSION="${PV}"

	cd "${S}/decompiler" || die

	# The SLEIGH compiler compiles the .slaspec tree that the embed-specs
	# feature of the CLI then bakes in.
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

	# The upstream docs tree ships .gz copies of some of its files, which
	# QA rejects as extraneous compressed variants, so stage it without.
	local docs="${T}/docs"
	cp -r "${S}/docs" "${docs}" || die
	find "${docs}" -name '*.gz' -delete || die

	dodoc -r NOTICE README.md "${docs}"
}
