# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2 meson vala

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/FontManager/font-manager.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/FontManager/font-manager/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

DESCRIPTION="A simple font management application for Gtk+ Desktop Environments"
HOMEPAGE="https://fontmanager.github.io"

VALA_MIN_API_VERSION=0.44
VALA_USE_DEPEND="vapigen"

LICENSE="GPL-3"
SLOT="0"
IUSE="nautilus nemo"

RDEPEND="gnome-base/gnome-common
	>=dev-libs/libxml2-2.9
	>=media-libs/freetype-2.5
	>=x11-libs/gtk+-3.22
	>=dev-db/sqlite-3.8
	nautilus? ( gnome-base/nautilus )
	nemo? ( gnome-extra/nemo )
"

DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/ninja
	dev-util/meson
"

src_prepare() {
	default
	vala_src_prepare
	gnome2_src_prepare
}

src_configure() {
	meson_src_configure \
		$(meson_use nautilus) \
		$(meson_use nemo) \
		--buildtype=release
}
