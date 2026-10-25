# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cross-platform application development framework"
HOMEPAGE="https://www.electronjs.org/ https://github.com/electron/electron"
DL_URL="https://github.com/PF4Public/gentoo-overlay/releases/download/${PV}"
SRC_URI="
	amd64? ( ${DL_URL}/x86-64.tar.bz2 -> ${PF}-x86-64.tar.bz2 )"

S="${WORKDIR}"
QA_PREBUILT="*"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Base64 Boost-1.0 CC-BY-3.0 CC-BY-4.0 Clear-BSD FFT2D FTL"
LICENSE+=" IJG ISC LGPL-2 LGPL-2.1 MIT MPL-1.1 MPL-2.0 Ms-PL PSF-2 SGI-B-2.0 SSLeay SunSoft Unicode-3.0"
LICENSE+=" Unicode-DFS-2015 Unlicense UoI-NCSA ZLIB libtiff openssl"
SLOT="$(ver_cut 1)/$(ver_cut 2-)"
KEYWORDS="amd64"
RESTRICT="mirror"

RDEPEND="
	app-eselect/eselect-electron
	app-arch/bzip2:=
	dev-libs/expat:=
	net-misc/curl[ssl]
	sys-apps/dbus:=
	media-libs/flac:=
	sys-libs/zlib:=[minizip]
	>=app-accessibility/at-spi2-core-2.46.0:2
	media-libs/mesa:=[X,gbm(+)]
	>=net-print/cups-1.3.11:=
	virtual/udev
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:2
	x11-libs/pango:=
	x11-libs/libnotify
	>=dev-libs/libxml2-2.12.4:=[icu]
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	dev-libs/libxslt:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	>=media-libs/libwebp-0.4.0:=
	>=media-libs/openh264-2.6.0:=
	>=media-libs/alsa-lib-1.0.19:=
	media-video/pipewire:=
	|| (
		media-libs/libpulse
		>=media-sound/apulse-0.1.9
	)
	sys-apps/pciutils:=
	>=media-libs/libva-2.7:=[X]
	|| (
		x11-libs/gtk+:3[X]
		gui-libs/gtk:4[X]
	)
	virtual/ttf-fonts
	x11-base/xorg-proto:=
	x11-libs/libX11:=
	x11-libs/libXcomposite:=
	x11-libs/libXcursor:=
	x11-libs/libXdamage:=
	x11-libs/libXext:=
	x11-libs/libXfixes:=
	>=x11-libs/libXi-1.6.0:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/libXtst:=
	x11-libs/libxcb:=
	x11-libs/libxshmfence:=
	x11-libs/libxkbcommon:=
	dev-libs/glib:2
"

src_install() {
	# The archive is the installed file tree of dev-util/electron:
	#   usr/$(get_libdir)/electron-<major>/   runtime
	#   usr/bin/electron-<major>              launcher (not installed: it is
	#                                          only meaningful on PATH under
	#                                          /usr/bin, which /opt is not)
	#   usr/include/electron-<major>/node/    node headers
	# Re-root the runtime and headers under /opt/electron-<major>/.
	local mymajor="${PV%%.*}"
	local myopt="/opt/electron-${mymajor}"

	mkdir -p "${ED}/${myopt}" || die
	cp -a "${WORKDIR}/usr/$(get_libdir)/electron-${mymajor}/." "${ED}/${myopt}/" || die

	# Node headers
	mkdir -p "${ED}/${myopt}/include" || die
	cp -a "${WORKDIR}/usr/include/electron-${mymajor}/node" \
		"${ED}/${myopt}/include/node" || die

	# Provide a /usr/bin entry point so electron-config can select this
	# prebuilt runtime. Mirrors dev-lang/rust-bin's /usr/bin/rustc-bin-<ver>
	# helper symlinks: the link points straight at the /opt runtime binary,
	# and electron-config symlinks /usr/bin/electron to it when selected.
	dosym "../../opt/electron-${mymajor}/electron" \
		"/usr/bin/electron-bin-${mymajor}"
}

pkg_postinst() {
	electron-config update
}

pkg_postrm() {
	electron-config update
}
