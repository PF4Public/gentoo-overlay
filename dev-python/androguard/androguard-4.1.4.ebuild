# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/androguard/androguard.git"
	# master is the v5.0.0 rewrite with git-only Rust deps (apkparser-ag,
	# dexparser-ag not yet on PyPI); track the v4.1.4 tag for now
	EGIT_COMMIT="v4.1.4"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Full Python tool to play with Android files"
HOMEPAGE="https://github.com/androguard/androguard"
LICENSE="Apache-2.0"
SLOT="0"

RESTRICT="test"

DEPEND="
	>=dev-python/apkinspector-1.1.7
	>=dev-python/asn1crypto-0.24.0
	>=dev-python/click-7.0
	>=dev-python/colorama-0.4.1
	>=dev-python/cryptography-46.0.6
	dev-python/dataset
	>=dev-python/ipython-5.0.0
	dev-python/loguru
	>=dev-python/lxml-4.3.0
	dev-python/mutf8
	dev-python/networkx
	>=dev-python/pydot-1.4.1
	>=dev-python/pygments-2.3.1
	dev-python/pyyaml
"
RDEPEND="${DEPEND}"

DOCS=( README.md )
