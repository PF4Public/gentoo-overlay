# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Utility to select the default Electron slot"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64 ppc64 x86"

RDEPEND="app-admin/eselect"

S=${FILESDIR}

src_install() {
	insinto /usr/share/eselect/modules
	doins "${FILESDIR}"/electron.eselect

	dosym eselect /usr/bin/electron-config
}

pkg_postinst() {
	electron-config update
}