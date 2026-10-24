# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Privacy-first LLM proxy and AI gateway"
HOMEPAGE="https://voidllm.ai https://github.com/voidmind-io/voidllm"
SRC_URI="https://github.com/voidmind-io/voidllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BUSL-1.1"
# Dependent licenses
LICENSE+=" Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="test"

BDEPEND="
	>=dev-lang/go-1.26.4
	>=dev-util/node-20.19
"

DOCS=( CHANGELOG.md README.md )

src_unpack() {
	# vendor must exist before go-module_src_unpack, or it runs `go mod verify` (network)
	tar -xJf "${FILESDIR}/${P}-vendor.tar.xz" -C "${WORKDIR}"
	go-module_src_unpack
}

src_compile() {
	# Build the embedded web UI first (ui/embed.go uses go:embed dist)
	cd "${S}/ui" || die
	npm ci
	npm run build

	cd "${S}" || die
	mkdir -p bin || die
	local -x CGO_ENABLED=0
	ego build -mod=vendor \
		-ldflags="-s -w -X github.com/voidmind-io/voidllm/internal/api/health.Version=${PV}" \
		-o bin/${PN} ./cmd/voidllm
}

src_install() {
	dobin bin/${PN}
	einstalldocs
}
