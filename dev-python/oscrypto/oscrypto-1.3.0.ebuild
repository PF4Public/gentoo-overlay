# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools
inherit edo distutils-r1 optfeature

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wbond/oscrypto.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	# no PATCHES on master: the OpenSSL 3.0.10 regex fix is upstream (PR #76)
	# and py3.12.patch only touches dev/ and tests/ tooling
else
	SRC_URI="https://github.com/wbond/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	KEYWORDS="amd64 ~arm64"
	PATCHES=(
		"${FILESDIR}/openssl-3.0.10-fix.patch"
		"${FILESDIR}/py3.12.patch"
	)
fi

DESCRIPTION="TLS sockets, key generation, encryption, decryption, signing, verification"
HOMEPAGE="
	https://pypi.org/project/oscrypto/
	https://github.com/wbond/oscrypto
"
LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/openssl
	>=dev-python/asn1crypto-1.5.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep 'dev-python/cffi[${PYTHON_USEDEP}]' 'python*')
	)
"

DOCS=( docs {changelog,readme}.md )

distutils_enable_tests unittest

python_test() {
	local -x OSCRYPTO_SKIP_INTERNET_TESTS="true"
	edo ${EPYTHON} -m tests
}

pkg_postinst() {
	optfeature "faster FFI" dev-python/cffi
}
