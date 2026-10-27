# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop edo git-r3 java-pkg-2 multiprocessing xdg

DESCRIPTION="DEX to Java decompiler"
HOMEPAGE="https://github.com/skylot/jadx"
EGIT_REPO_URI="https://github.com/skylot/jadx.git"
EGIT_BRANCH="master"
SRC_URI=""

LICENSE="Apache-2.0"
LICENSE+=" BSD EPL-1.0 LGPL-3+ MIT OFL-1.1"
SLOT="0"
IUSE="+build-online"
RESTRICT="test build-online? ( network-sandbox )"

# Gradle 9 needs a JDK 17+ to run; cap at 21, newer JDKs break
# the build scripts of some gradle-bin versions.
DEPEND="|| ( virtual/jdk:21 virtual/jdk:17 )"
RDEPEND=">=virtual/jre-11"
BDEPEND="
	>=dev-java/gradle-bin-9.6
	dev-java/java-config
"

DOCS=( README.md SECURITY.md )

src_compile() {
	local -x JADX_VERSION="${PV}"
	local -x JAVA_HOME="$(java-config --jdk-home || die)"
	local -x HOME="${T}/home"
	# some JVMs take user.home from the passwd database instead of $HOME:
	# pin it for the gradle client, the kotlin daemon and friends
	local -x JAVA_TOOL_OPTIONS="-Duser.home=${HOME}"
	mkdir -p "${HOME}" || die
	einfo "Using JAVA_HOME: ${JAVA_HOME}"

	edo gradle \
		--no-daemon \
		--no-watch-fs \
		--gradle-user-home="${T}/gradle" \
		--parallel --max-workers="$(get_makeopts_jobs)" \
		:jadx-gui:shadowJar
}

src_install() {
	local jar="jadx-gui/build/libs/jadx-gui-${PV}-all.jar"

	java-pkg_newjar "${jar}" "jadx-${PV}-all.jar"
	java-pkg_dolauncher "jadx" --main "jadx.cli.JadxCLI"
	java-pkg_dolauncher "jadx-gui" --main "jadx.gui.JadxGUI"

	local logo="jadx-gui/src/main/resources/logos/jadx-logo"
	newicon -s 16 "${logo}-16px.png" "${PN}.png"
	newicon -s 32 "${logo}-32px.png" "${PN}.png"
	newicon -s 48 "${logo}-48px.png" "${PN}.png"
	# the logo is 252px, too big for a 256x256 hicolor entry: install it
	# as a scalable icon instead
	newicon "${logo}.png" "${PN}.png"
	domenu "contrib/jadx-gui.desktop"

	einstalldocs
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
