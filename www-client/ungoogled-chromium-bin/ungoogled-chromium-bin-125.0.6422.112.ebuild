# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk vi zh-CN zh-TW"

inherit chromium-2 desktop readme.gentoo-r1 xdg-utils

DESCRIPTION="Modifications to Chromium for removing Google integration and enhancing privacy"
HOMEPAGE="https://www.chromium.org/Home https://github.com/ungoogled-software/ungoogled-chromium"
DL_URL="https://github.com/PF4Public/${PN}/releases/download/${PV}"
SRC_URI="
	amd64? ( ${DL_URL}/x86-64.tar.bz2 -> ${PF}-x86-64.tar.bz2 )
	x86? ( ${DL_URL}/i686.tar.bz2 -> ${PF}-i686.tar.bz2 )"

RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="convert-dict widevine"

REQUIRED_USE="
	x86? ( !widevine )"

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
	media-libs/libjpeg-turbo
	media-libs/libpng
	sys-apps/dbus
	sys-apps/pciutils
	virtual/udev
	x11-libs/cairo
	x11-libs/pango
	media-libs/flac
	>=media-libs/libwebp-0.4.0
	sys-libs/zlib[minizip]
	app-accessibility/at-spi2-core
	x11-libs/gtk+:3[X]
	media-libs/lcms
	dev-libs/libxslt"

RDEPEND="${CDEPEND}
	x11-misc/xdg-utils
	virtual/opengl
	virtual/ttf-fonts"

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

For native file dialogs in KDE, install kde-apps/kdialog."

QA_PREBUILT="*"
S="${WORKDIR}"

pkg_pretend() {
	if ! use widevine; then
		ewarn
		ewarn "widevine was enabled in this build"
		ewarn "If you think this is a mistake let me know in #193"
		ewarn
	fi
}

src_install() {
	local CHROMIUM_HOME="/opt/chromium-browser"
	exeinto "${CHROMIUM_HOME}"
	doexe ./usr/$(get_libdir)/chromium-browser/chrome

	if use convert-dict; then
		newexe "./usr/$(get_libdir)/chromium-browser/update-dicts.sh" update-dicts.sh
		doexe ./usr/$(get_libdir)/chromium-browser/convert_dict
	fi

	doexe ./usr/$(get_libdir)/chromium-browser/chromium-launcher.sh

	# It is important that we name the target "chromium-browser",
	# xdg-utils expect it; bug #355517.
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium-browser-bin
	# keep the old symlink around for consistency
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium-bin

	if ! has_version "www-client/ungoogled-chromium" && ! has_version "www-client/chromium"; then
		# Allow users to override command-line options, bug #357629.
		insinto /etc/chromium
		doins ./etc/chromium/default
	fi

	pushd ./usr/$(get_libdir)/chromium-browser/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins ./usr/$(get_libdir)/chromium-browser/*.bin
	doins ./usr/$(get_libdir)/chromium-browser/*.pak
	doins ./usr/$(get_libdir)/chromium-browser/*.so
	doins ./usr/$(get_libdir)/chromium-browser/icudtl.dat

	doins -r ./usr/$(get_libdir)/chromium-browser/locales

	# Install vk_swiftshader_icd.json; bug #827861
	doins ./usr/$(get_libdir)/chromium-browser/vk_swiftshader_icd.json

	if [[ -d out/Release/swiftshader ]]; then
		insinto "${CHROMIUM_HOME}/swiftshader"
		doins ./usr/$(get_libdir)/chromium-browser/swiftshader/*.so
	fi

	use widevine && dosym "../../usr/$(get_libdir)/chromium-browser/WidevineCdm" "${CHROMIUM_HOME}/WidevineCdm"

	# Install icons
	local branding size
	for size in 16 24 32 48 64 128 256 ; do
		newicon -s ${size} "./usr/share/icons/hicolor/${size}x${size}/apps/chromium-browser.png" \
			chromium-browser-bin.png
	done

	local desktop_entry_name="Chromium"
	if has_version "www-client/ungoogled-chromium" || has_version "www-client/chromium"; then
		# Differentiate if others installed
		desktop_entry_name="Ungoogled"
	fi

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393
	make_desktop_entry \
		chromium-browser-bin \
		"${desktop_entry_name}" \
		chromium-browser-bin \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=chromium-browser-bin"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die

	# Install GNOME default application entry (bug #303100).
	insinto /usr/share/gnome-control-center/default-apps
	sed -i '/chromium-browser/{s++chromium-browser-bin+;h};${x;/./{x;q0};x;q1}' \
			./usr/share/gnome-control-center/default-apps/chromium-browser.xml || die
	newins ./usr/share/gnome-control-center/default-apps/chromium-browser.xml chromium-browser-bin.xml

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

	if use widevine; then
		elog "widevine requires binary plugins, which are distributed separately"
		elog "Make sure you have www-plugins/chrome-binary-plugins installed"
	fi

	xdg_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog
}
