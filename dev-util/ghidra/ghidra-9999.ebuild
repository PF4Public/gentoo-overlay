# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# application.python.supported
PYTHON_COMPAT=( python3_{9..15} )

inherit desktop edo git-r3 java-pkg-2 multiprocessing python-any-r1 xdg

DESCRIPTION="Ghidra is a software reverse engineering (SRE) framework"
HOMEPAGE="https://github.com/NationalSecurityAgency/ghidra"
EGIT_REPO_URI="https://github.com/NationalSecurityAgency/ghidra.git"
EGIT_BRANCH="master"
SRC_URI=""

LICENSE="Apache-2.0"
LICENSE+=" Apache-2.0-with-LLVM-exceptions BSD CC-BY-2.5 EPL-2.0"
LICENSE+=" GPL-2-with-classpath-exception LGPL-2.1 LGPL-3+ MIT MPL-2.0"
LICENSE+=" POSTGRESQL PSF-2 public-domain ZLIB"
SLOT="0"
IUSE="+build-online"
RESTRICT="test build-online? ( network-sandbox )"

# Requires JDK 25 (application.java.min), Gradle 9.1+, and a Python with pip
# for the PyGhidra type-stub wheel (the build shells out to `python3 -m pip`).
DEPEND="virtual/jdk:25"
RDEPEND=">=virtual/jre-25"
BDEPEND="
	${PYTHON_DEPS}
	dev-python/pip
	>=dev-java/gradle-bin-9.1
	dev-java/java-config
"

DOCS=( CONTRIBUTING.md DevGuide.md DISCLAIMER.md NOTICE README.md SECURITY.md )

src_compile() {
	local -x HOME="${T}/home"
	# some JVMs take user.home from the passwd database instead of $HOME:
	# pin it for the gradle client and the forked JVMs
	local -x JAVA_TOOL_OPTIONS="-Duser.home=${HOME}"
	mkdir -p "${HOME}" || die

	# Fetch the non-maven dependencies into ${S}/dependencies and create
	# dependencies/flatRepo, which the build requires to resolve them.
	edo gradle \
		--no-daemon \
		--no-watch-fs \
		--gradle-user-home="${T}/gradle" \
		-I gradle/support/fetchDependencies.gradle \
		-DhideDownloadProgress \
		-DnoEclipse

	# Assemble the full distribution for the current platform in build/dist.
	edo gradle \
		--no-daemon \
		--no-watch-fs \
		--gradle-user-home="${T}/gradle" \
		--parallel --max-workers="$(get_makeopts_jobs)" \
		assembleAll
}

src_install() {
	local ver rel
	ver=$(sed -n 's/^application\.version=//p' Ghidra/application.properties)
	rel=$(sed -n 's/^application\.release\.name=//p' Ghidra/application.properties)
	local distdir="build/dist/ghidra_${ver}_${rel}"
	[[ -d ${distdir} ]] || die "distribution directory ${distdir} not found"

	insinto "/opt/${P}"
	doins -r "${distdir}/."

	dosym "../opt/${P}/ghidraRun" "/usr/bin/${PN}"
	dosym "../opt/${P}/support/analyzeHeadless" \
		"/usr/bin/${PN}-analyze-headless"

	# the logo is 1497x1015, too big for a 256x256 hicolor entry: install it
	# as a scalable icon instead
	newicon "${S}/Ghidra/Features/Base/src/main/resources/images/GHIDRA_1.png" "${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

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
