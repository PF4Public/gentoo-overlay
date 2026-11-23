# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/TkTech/mutf8.git"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Fast MUTF-8 encoder & decoder"
HOMEPAGE="https://github.com/TkTech/mutf8"
LICENSE="MIT"
SLOT="0"

RESTRICT="test"

DOCS=( README.md )
