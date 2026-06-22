# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop flag-o-matic multilib xdg-utils

DESCRIPTION="A desktop debugging platform for mobile developers."
HOMEPAGE="https://fbflipper.com/"
LICENSE="MIT"
SLOT="0"
SRC_URI=""

REPO="https://github.com/facebook/flipper"
ELECTRON_SLOT_DEFAULT="19"
#FLIPPER_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

PATCHES=(
	# We don't need to ship zip archives, prefer uncompressed directory
	"${FILESDIR}/dir-target-not-zip.patch"
	# We won't bundle electron with the application so we don't need to download it
	"${FILESDIR}/dont-download-electron.patch"
	# watchman will break the build if you have dev-util/watchman installed
	"${FILESDIR}/metro-no-watchman.patch"
)

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="main"
	DOWNLOAD=""
	IUSE="+build-online electron-20 electron-21 electron-22 electron-23"
else
	IUSE="+build-online electron-20 electron-21 electron-22 electron-23"
	KEYWORDS="~ppc64"
	# https://github.com/facebook/flipper/pull/4586
	PATCHES+=( "${FILESDIR}/await-stripSourceMapComment.patch" )
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$FLIPPER_COMMIT_ID" ]
	then
		DOWNLOAD+="v${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${FLIPPER_COMMIT_ID}.tar.gz -> ${PN}-${FLIPPER_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${FLIPPER_COMMIT_ID}"
	fi
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

COMMON_DEPEND="
	electron-20? ( dev-util/electron:20 )
	electron-21? ( dev-util/electron:21 )
	electron-22? ( dev-util/electron:22 )
	electron-23? ( dev-util/electron:23 )
	!electron-20? (
	!electron-21? (
	!electron-22? (
	!electron-23? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) )
"

RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	ppc64? ( dev-util/app-builder )
	>=net-libs/nodejs-18.14.2
	sys-apps/yarn
"

src_unpack() {
	if use electron-20; then
		export ELECTRON_SLOT=20
	elif use electron-21; then
		export ELECTRON_SLOT=21
	elif use electron-22; then
		export ELECTRON_SLOT=22
	elif use electron-23; then
		export ELECTRON_SLOT=23
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
	if [ -z "$FLIPPER_COMMIT_ID" ]
	then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${FLIPPER_COMMIT_ID}.tar.gz" || die
	fi
}

src_prepare() {
	# Electron-Builder doesn't support ppc64 out of the box due to using precompiled binaries, so let's patch it
	use ppc64 && PATCHES+=( "${FILESDIR}/builder-util-ppc64.patch" )

	cp "${FILESDIR}/flipper" "${WORKDIR}" || die
	sed -i "s|@ELECTRON@|electron-${ELECTRON_SLOT}|" "${WORKDIR}/flipper" || die
	sed -i "s|@LIBDIR@|$(get_libdir)|" "${WORKDIR}/flipper" || die
	default
}

src_compile() {
	pushd desktop >/dev/null || die

	export ELECTRON_SKIP_BINARY_DOWNLOAD=1

	yarn config set disable-self-update-check true || die

	if ! use build-online; then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Installing node_modules"
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress || die

	# TypeScript compiler
	node node_modules/.bin/tsc || die

	node node_modules/.bin/cross-env NODE_ENV=production node_modules/.bin/ts-node scripts/build-release.tsx --linux --version ${PV} || die

	popd >/dev/null || die
}

src_install() {
	insinto "/usr/$(get_libdir)/${PN}"

	doins -r dist/linux-*-unpacked/resources/*
	doins desktop/static/icon.png

	dobin "${WORKDIR}/flipper"

	make_desktop_entry "/usr/bin/flipper" Flipper "/usr/$(get_libdir)/${PN}/icon.png" "Development;Debugger"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
