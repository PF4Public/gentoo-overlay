# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools
# the sdist predates PEP 625: it is named with the raw hyphenated project name
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pycontribs/python-vagrant.git"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Python bindings for interacting with Vagrant virtual machines"
HOMEPAGE="https://github.com/pycontribs/python-vagrant"
LICENSE="MIT"
SLOT="0"

BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

RESTRICT="test"

DOCS=( CHANGELOG.md README.md )
