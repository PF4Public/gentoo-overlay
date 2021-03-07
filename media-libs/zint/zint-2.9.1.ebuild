# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=7

inherit cmake

DESCRIPTION="Barcode encoding library supporting over 50 symbologies"
HOMEPAGE="http://zint.org.uk"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5"

COMMON_DEPEND="
	qt5? (
		dev-qt/qthelp:5
		dev-qt/linguist:5
		dev-qt/qdbusviewer:5
		dev-qt/designer:5
		dev-qt/assistant:5
		dev-qt/qtgui:5 )"

DEPEND="
	${COMMON_DEPEND}
	media-libs/libpng:0=
	sys-libs/zlib:0=
"
RDEPEND="${COMMON_DEPEND}
	x11-themes/hicolor-icon-theme
"

S="${WORKDIR}/${P}-src"

src_prepare(){
	use qt5 || sed -i "s/Qt5Widgets_FOUND/false/" CMakeLists.txt
	cmake_src_prepare
}

src_install() {
	default

	if use qt5; then
		insinto /usr/share/
		doins *.desktop
	fi
}