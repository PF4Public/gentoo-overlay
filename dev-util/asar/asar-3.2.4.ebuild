# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Creating Electron app packages"
HOMEPAGE="https://github.com/electron/asar"

SRC_URI="https://github.com/electron/asar/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~ppc64"

DEPEND="net-libs/nodejs"
BDEPEND="net-libs/nodejs[npm]"

src_unpack() {
	npm install -g --prefix "${P}/usr" "${DISTDIR}/${P}.tar.gz" || die
}

src_install() {
	insinto "/usr/lib64/node_modules/@electron"
	doins -r "${WORKDIR}/${P}/usr/lib64/node_modules/@electron/asar"
	fperms ugo+rx "/usr/lib64/node_modules/@electron/asar/bin/asar.js"
	dosym "/usr/lib64/node_modules/@electron/asar/bin/asar.js" "/usr/bin/asar"
}
