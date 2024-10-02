# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
EMESON_BUILDTYPE=release

inherit gnome2 meson vala

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/FontManager/font-manager.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/FontManager/font-manager/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A simple font management application for Gtk+ Desktop Environments"
HOMEPAGE="https://fontmanager.github.io"

VALA_MIN_API_VERSION=0.56
VALA_USE_DEPEND="vapigen"

LICENSE="GPL-3"
SLOT="0"
IUSE="adwaita doc gnome-search-provider google-fonts +manager nautilus nemo reproducible thunar +viewer +nls"

RDEPEND="gnome-base/gnome-common
	>=dev-db/sqlite-3.35
	>=dev-libs/json-glib-0.15
	>=dev-libs/libxml2-2.9
	>=media-libs/fontconfig-2.12
	>=media-libs/freetype-2.10
	>=gui-libs/gtk-4.12
	>=x11-libs/pango-1.4
	adwaita? ( gui-libs/libadwaita )
	google-fonts? (
		>=net-libs/libsoup-3.2
		net-libs/webkit-gtk:6
	)
	nautilus? ( gnome-base/nautilus )
	nemo? ( gnome-extra/nemo )
	thunar? ( xfce-base/thunar )
"

DEPEND="${RDEPEND}
	$(vala_depend)
	doc? (
		app-text/yelp-tools
		dev-util/gtk-doc
	)
"

src_prepare() {
	default
	vala_setup
	gnome2_src_prepare
}

src_configure() {
	meson_src_configure \
		$(meson_use adwaita) \
		$(meson_use manager) \
		$(meson_use viewer) \
		$(meson_use reproducible) \
		$(meson_use nautilus) \
		$(meson_use nemo) \
		$(meson_use thunar) \
		$(meson_use gnome-search-provider search-provider) \
		$(meson_use google-fonts webkit) \
		$(meson_use nls enable-nls) \
		$(meson_use doc yelp-doc) \
		$(meson_use doc gtk-doc)
}
