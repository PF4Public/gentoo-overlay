# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=8

inherit cmake desktop

DESCRIPTION="Barcode encoding library supporting over 50 symbologies"
HOMEPAGE="http://zint.org.uk"
LICENSE="GPL-2"
SLOT="0"

IUSE="qt5"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.code.sf.net/p/zint/code"
	SRC_URI=""
else
	KEYWORDS="amd64 x86"
	SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"
	S="${WORKDIR}/${P}-src"
fi

COMMON_DEPEND="
	qt5? (
		dev-qt/qthelp
		dev-qt/linguist
		dev-qt/qdbusviewer
		dev-qt/designer
		dev-qt/assistant
		dev-qt/qtgui )"

DEPEND="
	${COMMON_DEPEND}
	media-libs/libpng:0=
	sys-libs/zlib:0=
"
RDEPEND="${COMMON_DEPEND}
	x11-themes/hicolor-icon-theme
"

src_prepare(){
	use qt5 || sed -i "s/^else()$/elseif(false)/" CMakeLists.txt
	cmake_src_prepare
}

src_install() {
	cmake_src_install

	if use qt5; then
		insinto /usr/share/applications/
		doins *.desktop
		insinto /usr/share/pixmaps/
		doins *.png
	fi
}

pkg_postrm() {
	if use qt5; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
}

pkg_postinst() {
	if use qt5; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
}
