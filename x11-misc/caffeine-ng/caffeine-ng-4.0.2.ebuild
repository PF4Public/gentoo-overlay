# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=8

PYTHON_COMPAT=( python3_10 )

inherit distutils-r1 gnome2-utils

DESCRIPTION="Stop the desktop from becoming idle in full-screen mode. (Fork of Caffeine)"
HOMEPAGE="https://codeberg.org/WhyNotHugo/caffeine-ng"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	SRC_URI=""
	KEYWORDS="amd64 x86"
	EGIT_REPO_URI="${HOMEPAGE}.git"
else
	SRC_URI="https://files.pythonhosted.org/packages/source/c/caffeine-ng/caffeine-ng-4.0.2.tar.gz"
	KEYWORDS="amd64 x86"
	# S="${WORKDIR}/${PN}"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="
	${PYTHON_DEPS}
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	>=dev-python/pyxdg-0.25[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	>=dev-python/docopt-0.6.2[${PYTHON_USEDEP}]
	>=dev-python/ewmh-0.1.4[${PYTHON_USEDEP}]
	>=dev-python/setproctitle-1.1.10[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.29.0[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	dev-libs/libappindicator:3[introspection]
	x11-libs/gtk+:3
	x11-libs/libnotify[introspection]
	dev-python/pulsectl[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
	!x11-misc/caffeine"

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
