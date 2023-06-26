# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Taken from Jorgicio's Gentoo overlay and modified

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="An implementation of Extended Window Manager Hints, based on Xlib"
HOMEPAGE="https://github.com/parkouss/pyewmh https://pypi.python.org/pypi/ewmh"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
S=${WORKDIR}/${P^}

LICENSE="LGPL-3"
KEYWORDS="amd64 x86"
SLOT="0"

RDEPEND="dev-python/python-xlib[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
