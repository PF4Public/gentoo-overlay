# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pudo/dataset.git"
	SRC_URI=""
else
	KEYWORDS="amd64 ~arm64"
fi

DESCRIPTION="Toolkit for Python-based database access"
HOMEPAGE="
	https://github.com/pudo/dataset
	https://pypi.org/project/dataset/
"

LICENSE="MIT"
SLOT="0"

RESTRICT="test"

DEPEND="
	>=dev-python/alembic-0.6.2
	>=dev-python/sqlalchemy-1.4.0
"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md README.md )
