# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=7

inherit cmake

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
	KEYWORDS="~amd64 ~x86"
	SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"
fi

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
	use qt5 || sed "s/^else()$/elseif(false)/" CMakeLists.txt
	cmake_src_prepare
}
