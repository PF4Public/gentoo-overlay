# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit python-r1 meson gnome2-utils

DESCRIPTION="Stop the desktop from becoming idle in full-screen mode. (Fork of Caffeine)"
HOMEPAGE="https://codeberg.org/WhyNotHugo/caffeine-ng"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/WhyNotHugo/caffeine-ng.git"
else
	MY_PV="${PV}-0-g5027f55"
	SRC_URI="https://codeberg.org/WhyNotHugo/caffeine-ng/releases/download/v${PV}/caffeine-ng-v${MY_PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/caffeine-ng-v${MY_PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="|| ( GPL-3 LGPL-3 )"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/ewmh[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]
	dev-python/pulsectl[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-libs/libayatana-appindicator
	x11-libs/gtk+:3
	x11-libs/libnotify[introspection]
"
DEPEND="${RDEPEND}"
BDEPEND="app-text/scdoc"

src_prepare() {
	default

	echo "option('python', type : 'string', value : 'python3')" > meson_options.txt || die
	sed -i -e "s/pymod.find_installation('python3'/pymod.find_installation(get_option('python')/" meson.build || die
}

src_configure() {
	configuring() {
		meson_src_configure \
			-Dpython="${EPYTHON}"
	}
	python_foreach_impl configuring
}

src_compile() {
	python_foreach_impl meson_src_compile
}

src_install() {
	installing() {
		meson_src_install
		python_optimize
	}
	python_foreach_impl installing
}

pkg_preinst(){
	gnome2_schemas_savelist
}

pkg_postinst(){
	gnome2_gconf_install
	gnome2_schemas_update
}

pkg_postrm(){
	gnome2_gconf_uninstall
	gnome2_schemas_update
}
