# Copyright 2009-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="af am ar as az be bg bn bs ca cs cy da de el en-GB es es-419 et eu fa fi fil
	fr fr-CA gl gu he hi hr hu hy id is it ja ka kk km kn ko ky lo lt lv mk ml mn mr ms my
	nb ne nl or pa pl pt-BR pt-PT ro ru si sk sl sq sr sr-Latn sv sw ta te th tr uk ur uz
	vi zh-CN zh-HK zh-TW zu"

inherit chromium-2 desktop readme.gentoo-r1 xdg-utils

DESCRIPTION="Cromite a Bromite fork with ad blocking and privacy enhancements; take back your browser!"
HOMEPAGE="https://github.com/uazo/cromite"
CROMITE_COMMIT_ID="4b8cc71d7b35b86cf1789961d727dc4c19d9b28d"
SRC_URI="https://github.com/uazo/cromite/releases/download/v${PV}-${CROMITE_COMMIT_ID}/chrome-lin64.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
CDEPEND="
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libxcb
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/cairo
	x11-libs/pango
	x11-libs/pixman
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	media-libs/harfbuzz
	media-libs/mesa
	dev-libs/fribidi
	dev-libs/glib:2
	sys-apps/dbus
	virtual/udev
	media-libs/alsa-lib
	dev-libs/nspr
	dev-libs/nss
	net-print/cups
	net-libs/gnutls
	app-accessibility/at-spi2-core
	dev-libs/atk
	dev-libs/expat
	sys-libs/zlib
	app-arch/bzip2
	app-arch/brotli
	dev-libs/libffi
	dev-libs/libpcre2
	dev-libs/nettle
	dev-libs/gmp
	sys-libs/libcap
	net-dns/libidn2
	dev-libs/libunistring
	dev-libs/libtasn1
	media-gfx/graphite2
	x11-libs/gtk+:3[X]"

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
S="${WORKDIR}/chrome-lin"

pkg_pretend() {
	ewarn
	ewarn "Fontations Rust font stack is disabled"
	ewarn "Using media-libs/libavif instead of CrabbyAvif"
	ewarn
}

src_install() {
	local CHROMIUM_HOME="/usr/${get_libdir}/cromite"
	exeinto "${CHROMIUM_HOME}"
	doexe ./chrome
	doexe ./chrome_crashpad_handler

	# It is important that we name the target "chromium-browser",
	# xdg-utils expect it; bug #355517.
	dosym "${CHROMIUM_HOME}/chrome" /usr/bin/chromium-browser-bin
	# keep the old symlink around for consistency
	dosym "${CHROMIUM_HOME}/chrome" /usr/bin/cromite-bin

	pushd ./locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins ./*.bin
	doins ./*.pak
	doins ./*.so
	doins ./icudtl.dat

	doins -r ./locales

	# Install icons
	newicon -s 48 "./product_logo_48.png" chromium-browser-bin.png

#	local desktop_entry_name="Chromium"
#	if has_version "www-client/ungoogled-chromium" || has_version "www-client/chromium"; then
#		# Differentiate if others installed
#		desktop_entry_name="Cromite"
#	fi

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393
	make_desktop_entry \
		chromium-browser-bin \
		"Cromite" \
		chromium-browser-bin \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=chromium-browser-bin"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die

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
