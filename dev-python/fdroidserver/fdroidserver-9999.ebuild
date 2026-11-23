# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/fdroid/fdroidserver.git"
	SRC_URI=""
else
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="Tools for maintaining an F-Droid repository"
HOMEPAGE="https://f-droid.org/ https://gitlab.com/fdroid/fdroidserver"
LICENSE="AGPL-3+"
SLOT="0"

RESTRICT="test"

PATCHES=(
	"${FILESDIR}/use-importlib-metadata.patch"
)

BDEPEND="
	dev-python/babel
"
DEPEND="
	>=dev-python/androguard-3.3.5
	>=dev-python/apache-libcloud-0.14.1
	dev-python/asn1crypto
	dev-python/clint
	dev-python/defusedxml
	dev-python/gitpython
	dev-python/oscrypto
	dev-python/paramiko
	dev-python/pillow
	dev-python/platformdirs
	dev-python/puremagic
	dev-python/python-vagrant
	dev-python/pyyaml
	dev-python/qrcode
	dev-python/ruamel-yaml
	dev-python/requests
	>=dev-python/sdkmanager-0.6.4
	dev-util/yamllint
"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md README.md )
