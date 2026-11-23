# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/fdroid/sdkmanager.git"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Android SDK Manager"
HOMEPAGE="
	https://gitlab.com/fdroid/sdkmanager
	https://pypi.org/project/sdkmanager/
"

LICENSE="AGPL-3+"
SLOT="0"

RESTRICT="test"

DEPEND="
	dev-python/argcomplete
	dev-python/looseversion
	>dev-python/requests-2.12.2-r0
"
RDEPEND="${DEPEND}"

DOCS=( README.md )
