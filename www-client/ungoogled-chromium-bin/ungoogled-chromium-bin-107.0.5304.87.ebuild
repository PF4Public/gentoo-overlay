# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CHROMIUM_LANGS="am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk vi zh-CN zh-TW"

inherit chromium-2 desktop readme.gentoo-r1 xdg-utils

DESCRIPTION="Modifications to Chromium for removing Google integration and enhancing privacy"
HOMEPAGE="https://www.chromium.org/Home https://github.com/Eloston/ungoogled-chromium"
DL_URL="https://github.com/PF4Public/${PN}/releases/download/${PV}"
SRC_URI="
	core2? (
		${DL_URL}/core2.tar.bz2 -> ${PF}-core2.tar.bz2
	)
	haswell? (
		${DL_URL}/haswell.tar.bz2 -> ${PF}-haswell.tar.bz2
	)
	generic? (
		amd64? (
		${DL_URL}/x86-64.tar.bz2 -> ${PF}-x86-64.tar.bz2
		)
		x86? (
		${DL_URL}/i686.tar.bz2 -> ${PF}-i686.tar.bz2
		)
	)
"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="convert-dict core2 +generic haswell"

REQUIRED_USE="
	^^ ( core2 generic haswell )
	x86? ( !core2 !haswell )
"

CDEPEND="
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	>=x11-libs/libXi-1.6.0
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/libxcb
	media-libs/libva
	>=net-print/cups-1.3.11
	dev-libs/expat
	dev-libs/glib:2
	>=dev-libs/libxml2-2.9.4-r3[icu]
	dev-libs/nspr
	>=dev-libs/nss-3.26
	>=media-libs/alsa-lib-1.0.19
	media-libs/fontconfig
	media-libs/freetype
	>=media-libs/harfbuzz-3.1.1:0[icu(-)]
	media-libs/libjpeg-turbo
	media-libs/libpng
	|| (
		media-sound/pulseaudio
		>=media-sound/apulse-0.1.9
	)
	>=media-video/ffmpeg-3.4.5
	|| (
		media-video/ffmpeg[-samba]
		>=net-fs/samba-4.5.16[-debug(-)]
	)
	media-libs/opus
	sys-apps/dbus
	sys-apps/pciutils
	virtual/udev
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/pango
	media-libs/flac
	>=media-libs/libwebp-0.4.0
	sys-libs/zlib[minizip]
	app-accessibility/at-spi2-core
	x11-libs/gtk+:3[X]
	media-libs/lcms
	dev-libs/jsoncpp:0/25
	dev-libs/libevent
	media-libs/openjpeg:2/7
	app-arch/snappy
	dev-libs/libxslt
	dev-libs/re2
	media-libs/openh264
	=dev-libs/icu-71*:0
"
RDEPEND="${CDEPEND}
	x11-misc/xdg-utils
	virtual/opengl
	virtual/ttf-fonts
	!www-client/chromium
	!www-client/chromium-bin
	!www-client/ungoogled-chromium
"

DISABLE_AUTOFORMATTING="yes"
DOC_CONTENTS="
Some web pages may require additional fonts to display properly.
Try installing some of the following packages if some characters
are not displayed properly:
- media-fonts/arphicfonts
- media-fonts/droid
- media-fonts/ipamonafont
- media-fonts/noto
- media-fonts/noto-emoji
- media-fonts/ja-ipafonts
- media-fonts/takao-fonts
- media-fonts/wqy-microhei
- media-fonts/wqy-zenhei

To fix broken icons on the Downloads page, you should install an icon
theme that covers the appropriate MIME types, and configure this as your
GTK+ icon theme.

For native file dialogs in KDE, install kde-apps/kdialog.
"

QA_PREBUILT="*"
S="${WORKDIR}"

src_install() {
	local CHROMIUM_HOME="/opt/chromium-browser"
	exeinto "${CHROMIUM_HOME}"
	doexe ./usr/$(get_libdir)/chromium-browser/chrome

	if use convert-dict; then
		newexe "./usr/$(get_libdir)/chromium-browser/update-dicts.sh" update-dicts.sh
		doexe ./usr/$(get_libdir)/chromium-browser/convert_dict
	fi

	if  has_version ">=media-sound/apulse-0.1.9" ; then
	   sed -i 's/exec -a "chromium-browser"/exec -a "chromium-browser" apulse/' ./usr/$(get_libdir)/chromium-browser/chromium-launcher.sh
	fi

	doexe ./usr/$(get_libdir)/chromium-browser/chromium-launcher.sh

	# It is important that we name the target "chromium-browser",
	# xdg-utils expect it; bug #355517.
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium-browser
	# keep the old symlink around for consistency
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium

	# Allow users to override command-line options, bug #357629.
	insinto /etc/chromium
	doins ./etc/chromium/default

	pushd ./usr/$(get_libdir)/chromium-browser/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins ./usr/$(get_libdir)/chromium-browser/*.bin
	doins ./usr/$(get_libdir)/chromium-browser/*.pak
	doins ./usr/$(get_libdir)/chromium-browser/*.so

	doins -r ./usr/$(get_libdir)/chromium-browser/locales

	# Install icons and desktop entry
	newicon -s 48 ./usr/share/icons/hicolor/256x256/apps/chromium-browser.png chromium-browser.png

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393
	make_desktop_entry \
		chromium-browser \
		"Chromium" \
		chromium-browser \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=chromium-browser"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die

	# Install GNOME default application entry (bug #303100).
	insinto /usr/share/gnome-control-center/default-apps
	doins ./usr/share/gnome-control-center/default-apps/chromium-browser.xml

	readme.gentoo_create_doc
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	elog "VA-API is disabled by default at runtime. You have to enable it"
	elog "by adding --enable-features=VaapiVideoDecoder and "
	elog "--disable-features=UseChromeOSDirectVideoDecoder to CHROMIUM_FLAGS"
	elog "in /etc/chromium/default."

	xdg_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog
}
