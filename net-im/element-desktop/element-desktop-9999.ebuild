# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit desktop flag-o-matic multilib python-any-r1 xdg-utils

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI=""

REPO="https://github.com/vector-im/element-desktop"
ELECTRON_SLOT_DEFAULT="19"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE="+build-online native-modules"
else
	IUSE="build-online native-modules"
	KEYWORDS="~amd64 ~ppc64 ~x86"
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
REQUIRED_USE="
	native-modules? ( build-online )
"

COMMON_DEPEND="
	~net-im/element-web-${PV}
	native-modules? ( dev-db/sqlcipher )
	dev-util/electron:${ELECTRON_SLOT_DEFAULT}
"

RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	native-modules? ( virtual/rust )
	net-libs/nodejs
	sys-apps/yarn
"

#TODO: net-im/element-web -> runtime/buildtime dep

src_unpack() {
	# if use electron-18; then
	# 	export ELECTRON_SLOT=18
	# elif use electron-19; then
	# 	export ELECTRON_SLOT=19
	# else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	# fi
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

src_compile() {
	OLD_PATH=$PATH
	export PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/npm/bin/node-gyp-bin:$PATH"
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	#! Until electron-builder >=22.11.5
	yarn config set ignore-engines true || die

	if ! use build-online; then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Installing node_modules"
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress || die

	node node_modules/.bin/tsc || die
	node scripts/copy-res.js || die

	if use native-modules
	then
		node /usr/bin/yarn run build:native || die
	fi

	einfo "Editing ElectronFramework.js"
	sed -i 's/return unpack(options, createDownloadOpts.*$/return true;/' \
		node_modules/electron-builder/node_modules/app-builder-lib/out/electron/ElectronFramework.js || die
	sed -i 's/return beforeCopyExtraFiles(options);$/return true;/' \
		node_modules/electron-builder/node_modules/app-builder-lib/out/electron/ElectronFramework.js || die

	#!Error: With electron's node: "Unknown argument" electron/electron#25379
	#!Error: With electron's node: "Invalid package app.asar"
	/usr/bin/node node_modules/.bin/electron-builder --dir || die

	#cp -r /usr/share/element-web webapp
	#rm -f webapp/config.json
	#cp -f /etc/element-web/config.json webapp/config.json
	#node node_modules/.bin/asar p webapp webapp.asar
	#node node_modules/.bin/asar l webapp.asar

	export PATH=${OLD_PATH}
}

src_install() {
	insinto "/usr/$(get_libdir)/element-desktop"

	doins -r dist/linux-unpacked/resources/*
	dosym ../../share/element-web /usr/$(get_libdir)/element-desktop/webapp

	make_desktop_entry "electron-${ELECTRON_SLOT} /usr/$(get_libdir)/element-desktop/app.asar" \
		Element "/usr/$(get_libdir)/element-desktop/img/element.png" "Network;Chat"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
