# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=8

inherit cmake desktop

DESCRIPTION="Barcode encoding library supporting over 50 symbologies"
HOMEPAGE="http://zint.org.uk"
LICENSE="GPL-2"
SLOT="0"

IUSE="debug doc +png qt5 qt6 static-libs"

DOCS=( README )

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.code.sf.net/p/zint/code"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://downloads.sourceforge.net/${PN}/${P}-src.tar.gz"
	S="${WORKDIR}/${P}-src"
fi

COMMON_DEPEND="
	qt5? (
		x11-themes/hicolor-icon-theme
		dev-qt/qthelp:5
		dev-qt/linguist
		dev-qt/qdbusviewer
		dev-qt/designer:5
		dev-qt/assistant
		dev-qt/qtgui:5
		dev-qt/qtsvg:5
	)
	qt6? (
		x11-themes/hicolor-icon-theme
		dev-qt/qtbase:6[gui]
	)
	png? ( media-libs/libpng:0= )
"

DEPEND="
	${COMMON_DEPEND}
	sys-libs/zlib:0=
"
RDEPEND="${COMMON_DEPEND}
"

src_configure() {
	local mycmakeargs=(
		-DZINT_DEBUG=$(usex debug)
		-DZINT_STATIC=$(usex static-libs)
		-DZINT_USE_PNG=$(usex png)
	)
	if use qt5 || use qt6; then
		mycmakeargs+=(
			-DZINT_USE_QT=true
			-DZINT_QT6=$(usex qt6)
		)
	else
		mycmakeargs+=(
			-DZINT_USE_QT=false
		)
	fi
	cmake_src_configure
}

src_install() {

	#TODO: docs generation maybe?
	if use doc; then
		DOCS+=( ChangeLog )
	fi

	cmake_src_install

	if use qt5 || use qt6; then
		insinto /usr/share/applications/
		doins *.desktop
		insinto /usr/share/pixmaps/
		doins *.png
	fi
}

pkg_postrm() {
	if use qt5 || use qt6; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
}

pkg_postinst() {
	if use qt5 || use qt6; then
		xdg_icon_cache_update
		xdg_desktop_database_update
	fi
}
