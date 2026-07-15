# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop flag-o-matic multilib xdg-utils

DESCRIPTION="All-in-one voice and text chat for gamers"
HOMEPAGE="https://discord.com"

SRC_URI="https://dl-canary.discordapp.net/apps/linux/${PV}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~ppc64"

ELECTRON_SLOT_DEFAULT="22"
_pkgname=DiscordCanary

IUSE="electron-19 electron-20 electron-21 electron-23 electron-24"

COMMON_DEPEND="
	electron-19? ( dev-util/electron:19 )
	electron-20? ( dev-util/electron:20 )
	electron-21? ( dev-util/electron:21 )
	electron-23? ( dev-util/electron:23 )
	electron-24? ( dev-util/electron:24 )
	!electron-19? (
	!electron-20? (
	!electron-21? (
	!electron-23? (
	!electron-24? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) )
"

RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"
BDEPEND="
	net-libs/nodejs
	dev-util/asar
"

src_unpack() {
	if use electron-19; then
		export ELECTRON_SLOT=19
	elif use electron-20; then
		export ELECTRON_SLOT=20
	elif use electron-21; then
		export ELECTRON_SLOT=21
	elif use electron-23; then
		export ELECTRON_SLOT=23
	elif use electron-24; then
		export ELECTRON_SLOT=24
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
	mkdir "${P}" || die
	cd "${P}" || die
	unpack "${P}.tar.gz" || die
}

src_prepare() {
	cp "${FILESDIR}/${PN}" "${WORKDIR}" || die
	sed -i "s|@ELECTRON@|electron-${ELECTRON_SLOT}|" "${WORKDIR}/${PN}" || die
	sed -i "s|@LIBDIR@|$(get_libdir)|" "${WORKDIR}/${PN}" || die
	sed -i "s|Exec=.*|Exec=/usr/bin/${PN}|" "${WORKDIR}/${P}/${_pkgname}/${PN}.desktop" || die
	asar e "${WORKDIR}/${P}/${_pkgname}/resources/app.asar" "${WORKDIR}/${P}/${_pkgname}/resources/app" || die
	rm "${WORKDIR}/${P}/${_pkgname}/resources/app.asar" || die
	sed -i "s|process.resourcesPath|'/usr/$(get_libdir)/${PN}'|" "${WORKDIR}/${P}/${_pkgname}/resources/app/app_bootstrap/buildInfo.js" || die
	sed -i "s|exeDir,|'/usr/share/pixmaps',|" "${WORKDIR}/${P}/${_pkgname}/resources/app/app_bootstrap/autoStart/linux.js" || die
	asar p "${WORKDIR}/${P}/${_pkgname}/resources/app" "${WORKDIR}/${P}/${_pkgname}/resources/app.asar" --unpack-dir '**' || die
	rm -rf "${WORKDIR}/${P}/${_pkgname}/resources/app" || die
	default
}

src_install() {
	insinto "/usr/$(get_libdir)/${PN}"
	doins -r ${_pkgname}/resources/*
	newicon "${_pkgname}/discord.png" "${PN}.png"
	domenu "${_pkgname}/${PN}.desktop"
	dobin "${WORKDIR}/${PN}"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
