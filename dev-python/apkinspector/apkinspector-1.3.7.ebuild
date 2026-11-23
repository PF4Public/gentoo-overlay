# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_PN="apkInspector"
PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=poetry-core

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/erev0s/apkInspector.git"
	SRC_URI=""
else
	KEYWORDS="amd64 ~arm64"
fi

DESCRIPTION="Tool to inspect the zip structure of APK files and decode AndroidManifest.xml"
HOMEPAGE="https://github.com/erev0s/apkInspector"
LICENSE="Apache-2.0"
SLOT="0"

RESTRICT="test"

DOCS=( README.md )
