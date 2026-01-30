# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="af am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil
	fr gu he hi hr hu id it ja kn ko lt lv ml mr ms
	nb nl pl pt-BR pt-PT ro ru sk sl sr sv sw ta te th tr uk ur
	vi zh-CN zh-TW"

inherit chromium-2 desktop xdg

DESCRIPTION="Cromite a Bromite fork with ad blocking and privacy enhancements"
HOMEPAGE="https://github.com/uazo/cromite
https://www.cromite.org/"

CROMITE_COMMIT_ID="2ba21150282e277cdab0f534cb57978d9a9ac398"

SRC_URI="
https://github.com/uazo/cromite/releases/download/v${PV}-${CROMITE_COMMIT_ID}/chrome-lin64.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/chrome-lin"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

IUSE="qt6"

RESTRICT="bindist mirror strip"

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2
	app-misc/ca-certificates
	sys-apps/dbus
	sys-libs/libcap
	virtual/udev
	dev-libs/nspr
	>=dev-libs/nss-3.26
	media-libs/mesa[gbm(+)]
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	|| (
		x11-libs/gtk+:3[X]
		gui-libs/gtk:4[X]
	)
	x11-libs/pango
	>=x11-libs/libX11-1.5.0
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libxcb
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	media-libs/alsa-lib
	media-fonts/liberation-fonts
	net-misc/curl
	net-print/cups
	dev-libs/expat
	dev-libs/glib:2
	x11-misc/xdg-utils
	virtual/opengl
	virtual/ttf-fonts
	qt6? ( dev-qt/qtbase:6[gui,widgets] )
"

QA_PREBUILT="*"
CHROMIUM_HOME="/opt/cromite"

src_install() {
	exeinto "${CHROMIUM_HOME}"

	doexe ./chrome
	doexe ./chrome_crashpad_handler
	doexe "${FILESDIR}/chromium-launcher.sh"

	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/cromite-browser-bin
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/cromite-bin

	pushd ./locales > /dev/null || die
	chromium_remove_language_paks
	popd

	# Allow users to override command-line options, bug #357629.
	insinto /etc/cromite
	newins "${FILESDIR}/chromium.default" "default"

	insinto "${CHROMIUM_HOME}"
	doins ./*.bin
	doins ./*.pak
	doins ./*.so
	doins ./icudtl.dat

	doins -r ./locales

	# Install icon
	newicon -s 48 "./product_logo_48.png" cromite-browser-bin.png

	local mime_types="text/html;text/xml;application/xhtml+xml;"
	mime_types+="x-scheme-handler/http;x-scheme-handler/https;" # bug #360797
	mime_types+="x-scheme-handler/ftp;" # bug #412185
	mime_types+="x-scheme-handler/mailto;x-scheme-handler/webcal;" # bug #416393

	make_desktop_entry \
		cromite-browser-bin \
		"Cromite" \
		cromite-browser-bin \
		"Network;WebBrowser" \
		"MimeType=${mime_types}\nStartupWMClass=cromite-browser-bin"
	sed -e "/^Exec/s/$/ %U/" -i "${ED}"/usr/share/applications/*.desktop || die
}
