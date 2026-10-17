# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A modern, extremely fast, JavaScript and CSS bundler and minifier"
HOMEPAGE="https://esbuild.github.io/"
SRC_URI="https://github.com/evanw/esbuild/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD MIT"
SLOT="${PV}"
KEYWORDS="~amd64 ~arm64"

RESTRICT="test" # tests require more work, but chromium needs esbuild already.

src_unpack() {
	# vendor must exist before go-module_src_unpack, or it runs `ego mod verify` (network)
	tar -xJf "${FILESDIR}/${P}-vendor.tar.xz" -C "${WORKDIR}"
	go-module_src_unpack
}

src_compile() {
	# Build using vendored dependencies instead of Makefile
	ego build -mod=vendor -v -ldflags="-s -w" ./cmd/esbuild
}

src_install() {
	newbin esbuild esbuild-${PV}
}

src_test() {
	ego test -mod=vendor -v -ldflags="-s -w" ./cmd/esbuild
}
