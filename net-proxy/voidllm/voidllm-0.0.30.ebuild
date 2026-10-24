# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/voidmind-io/voidllm.git"
else
	SRC_URI="https://github.com/voidmind-io/voidllm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Privacy-first LLM proxy and AI gateway"
HOMEPAGE="https://voidllm.ai https://github.com/voidmind-io/voidllm"

LICENSE="BUSL-1.1"
# Dependent licenses
LICENSE+=" Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
RESTRICT="test"

BDEPEND="
	acct-group/voidllm
	acct-user/voidllm
	>=dev-lang/go-1.26.4
	>=dev-util/node-20.19
"

RDEPEND="
	acct-group/voidllm
	acct-user/voidllm
"

DOCS=( CHANGELOG.md README.md )

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		# vendor must exist before go-module_src_unpack, or it runs `go mod verify` (network)
		tar -xJf "${FILESDIR}/${P}-vendor.tar.xz" -C "${WORKDIR}"
		go-module_src_unpack
	fi
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

	# installed directly (no openrc eclass in the synced portage tree)
	insinto /etc/init.d
	doins "${FILESDIR}"/voidllm.initd
	fperms 0755 /etc/init.d/${PN}

	insinto /etc/conf.d
	newins "${FILESDIR}"/voidllm.confd ${PN}

	insinto /etc/${PN}
	doins voidllm.yaml.example
	newins "${FILESDIR}"/voidllm.env.example env.example

	dodir /var/log/${PN}
	fowners voidllm:voidllm /var/log/${PN}
}
