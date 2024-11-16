# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A glossy Matrix collaboration client for the web"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI=""

REPO="https://github.com/vector-im/element-web"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE="+build-online"
else
	IUSE="build-online"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$ELEMENT_COMMIT_ID" ]
	then
		DOWNLOAD+="v${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${ELEMENT_COMMIT_ID}.tar.gz -> ${PN}-${ELEMENT_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${ELEMENT_COMMIT_ID}"
	fi
fi
SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

COMMON_DEPEND=""

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}"

BDEPEND="
	${PYTHON_DEPS}
	sys-apps/yarn
	net-libs/nodejs
"

#TODO: Jitsi
#TODO: inherit webapp?

src_unpack() {
	if [ -z "$ELEMENT_COMMIT_ID" ]
	then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${ELEMENT_COMMIT_ID}.tar.gz" || die
	fi
}

src_prepare() {
	default

	# Make SVGR not traverse the path up to / looking for a configuration file.
	# Fixes Error: "EACCES: permission denied, open '/.config/svgrrc'"
	# See https://github.com/PF4Public/gentoo-overlay/issues/276
	echo "runtimeConfig: false" > .svgrrc.yml || die
}

src_configure() {
	export PATH="/usr/$(get_libdir)/node_modules/npm/bin/node-gyp-bin:$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/node || die

	# Removing sentry dependency
	sed -i '/sentry\/webpack-plugin/d' "${WORKDIR}/${P}/package.json" || die
	sed -i '/sentry\/webpack-plugin/d' "${WORKDIR}/${P}/webpack.config.js" || die
	sed -i '/process.env.SENTRY_DSN \&\&/,/}),/s/^/\/\//' "${WORKDIR}/${P}/webpack.config.js" || die

	# Fixing pesky matrix-analytics-events
	sed -i 's/"matrix-analytics-events@github.*$/matrix-analytics-events@0.0.1:/' "${WORKDIR}/${P}/yarn.lock" || die
	sed -i 's/matrix-analytics-events "github:.*$/matrix-analytics-events "0.0.1"/' "${WORKDIR}/${P}/yarn.lock" || die

	#! 1. License of external_api.min.js in unclear
	#! 1.a License seems to be also Apache-2.0
	# einfo "Removing Jitsi"
	# sed -i '/"build:jitsi":.*$/{s++"build:jitsi": "echo",+;h};${x;/./{x;q0};x;q1}' \
	# 	package.json || die

	if ! use build-online
	then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Installing node_modules"
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress --ignore-scripts || die
}

src_compile() {
	node /usr/bin/yarn run build || die
}

src_install() {
	insinto /usr/share/element-web
	doins -r webapp/*
	dosym ../../../etc/element-web/config.json /usr/share/element-web/config.json

	insinto /etc/element-web
	newins config.sample.json config.json
}

pkg_postinst() {
	if ! has_version "net-im/element-desktop"
	then
		elog
		elog "element-web provides only a web application ready to be served"
		elog "If you need a desktop application, consider element-desktop"
		elog
	fi
}
