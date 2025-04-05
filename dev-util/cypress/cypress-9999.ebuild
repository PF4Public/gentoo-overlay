# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit desktop flag-o-matic multilib ninja-utils pax-utils portability python-any-r1 toolchain-funcs xdg-utils

DESCRIPTION="Fast, easy and reliable testing for anything that runs in a browser."
HOMEPAGE="https://github.com/cypress-io/cypress"
LICENSE="MIT"
SLOT="0"
SRC_URI=""

REPO="https://github.com/cypress-io/cypress"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="electron-27 electron-28 electron-29 electron-30 electron-31 electron-32 electron-34 electron-35"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE+=" +build-online"
	ELECTRON_SLOT_DEFAULT="33"
else
	IUSE+=" build-online"
	ELECTRON_SLOT_DEFAULT="33"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$CODE_COMMIT_ID" ]; then
		DOWNLOAD+="${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${CODE_COMMIT_ID}.tar.gz -> ${PN}-${CODE_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${CODE_COMMIT_ID}"
	fi
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

REQUIRED_USE=""

COMMON_DEPEND="
	>=app-crypt/libsecret-0.18.8:=
	>=x11-libs/libX11-1.6.9:=
	>=x11-libs/libxkbfile-1.1.0:=
	virtual/krb5
	sys-apps/ripgrep
	electron-27? ( dev-util/electron:27 )
	electron-28? ( dev-util/electron:28 )
	electron-29? ( dev-util/electron:29 )
	electron-30? ( dev-util/electron:30 )
	electron-31? ( dev-util/electron:31 )
	electron-32? ( dev-util/electron:32 )
	electron-34? ( dev-util/electron:34 )
	electron-35? ( dev-util/electron:35 )
	!electron-27? (
	!electron-28? (
	!electron-29? (
	!electron-30? (
	!electron-31? (
	!electron-32? (
	!electron-34? (
	!electron-35? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) ) )
"


RDEPEND="${COMMON_DEPEND}
"

DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	sys-apps/yarn
"

python_check_deps() {
        python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

src_unpack() {
	if use electron-27; then
		export ELECTRON_SLOT=27
	elif use electron-28; then
		export ELECTRON_SLOT=28
	elif use electron-29; then
		export ELECTRON_SLOT=29
	elif use electron-30; then
		export ELECTRON_SLOT=30
	elif use electron-31; then
		export ELECTRON_SLOT=31
	elif use electron-32; then
		export ELECTRON_SLOT=32
	elif use electron-34; then
		export ELECTRON_SLOT=34
	elif use electron-35; then
		export ELECTRON_SLOT=35
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
	if [ -z "$CODE_COMMIT_ID" ]; then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
			# if use electron-29 || use electron-30; then
			# 	EGIT_BRANCH="electron-29.x.y"
			# fi
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${CODE_COMMIT_ID}.tar.gz" || die
	fi
}

src_prepare() {
	default
}

src_configure() {

	local myarch="$(tc-arch)"

	if [[ $myarch = amd64 ]]; then
		VSCODE_ARCH="x64"
	elif [[ $myarch = x86 ]]; then
		VSCODE_ARCH="ia32"
	elif [[ $myarch = arm64 ]]; then
		VSCODE_ARCH="arm64"
	elif [[ $myarch = arm ]]; then
		VSCODE_ARCH="armhf"
	elif [[ $myarch = ppc64 ]]; then
		VSCODE_ARCH="ppc64"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi
	#TODO: exported but unavailable if emerge/ebuild restarted
	export VSCODE_ARCH

	# #TODO: should work starting with electron-22
	# if use electron-20 || use electron-21 || use electron-23 || use electron-24; then
	# 	CPPFLAGS="${CPPFLAGS} -std=c++17";
	# 	use build-online || eerror "build-online should be enabled for nan substitution to work" || die;
	# 	sed -i 's$"resolutions": {$"resolutions": {"nan": "^2.17.0",$' package.json || die;
	# fi

	# #TODO: temp fix
	# if use electron-32 || use electron-33 || use electron-34 || use electron-35; then
	# 	# CPPFLAGS="${CPPFLAGS} -std=c++20";
	# 	use build-online || eerror "build-online should be enabled for node-addon-api substitution to work" || die;
	# 	sed -i 's$"resolutions": {$"resolutions": {"node-addon-api": "^7.1.0",$' package.json || die;
	# fi

	# if use build-online; then
	# 	sed -i 's$"dependencies":$"resolutions": {"nan": "^2.18.0"},"dependencies":$' package.json || die;
	# else
	# 	ewarn "If have enabled electron-28/29 and the build fails, try enabling build-online"
	# fi

	ebegin "Installing node_modules"
	# yarn config set yarn-offline-mirror ${T}/yarn_cache || die
	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
	# echo "$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	if ! use build-online; then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	yarn install --frozen-lockfile ${ONLINE_OFFLINE} \
		--arch=${VSCODE_ARCH} --no-progress || die
	# --ignore-optional
	# --ignore-engines
	# --production=true
	# --no-progress
	# --skip-integrity-check
	# --verbose

	export PATH=${OLD_PATH}
}

# src_compile() {
# }

src_install() {
	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH

	local CYPRESS_HOME="/usr/$(get_libdir)/cypress"

	exeinto "${CYPRESS_HOME}"
	sed -i '/^ELECTRON/,+3d' "${WORKDIR}"/V*/bin/code-oss || die

	awk -i inplace -v text="$(cat ${FILESDIR}/read_flags_file)" '!/^#/ && !p {print text; p=1} 1' "${WORKDIR}"/V*/bin/code-oss
	sed -i "s|@ELECTRON@|code-oss|" "${WORKDIR}"/V*/bin/code-oss

	echo "VSCODE_PATH=\"/usr/$(get_libdir)/vscode\"
	ELECTRON_PATH=\"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}\"
	CLI=\"\${VSCODE_PATH}/out/cli.js\"
	exec /usr/bin/env ELECTRON_RUN_AS_NODE=1 \
	NPM_CONFIG_NODEDIR=\"\${ELECTRON_PATH}/node/\" \
	\"\${ELECTRON_PATH}/electron\" \"\${CLI}\" --app=\"\${VSCODE_PATH}\" \"\${flags[@]}\" \"\$@\"" >> "${WORKDIR}"/V*/bin/code-oss
	doexe "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/bin/code-oss
	dosym "${CYPRESS_HOME}/code-oss" /usr/bin/code-oss

	insinto "${CYPRESS_HOME}"
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/extensions
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/out
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/resources
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/*.json
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar.unpacked
	fperms +x ${CYPRESS_HOME}/out/vs/base/node/cpuUsage.sh
	# fperms +x ${CYPRESS_HOME}/node_modules.asar.unpacked/node-pty/build/Release/spawn-helper

	if use reh; then
		tar cf vscode-server-linux-x64.tar.gz -C "${WORKDIR}/vscode-reh-linux-x64/" .
		doins vscode-server-linux-x64.tar.gz
	fi
	if use reh-web; then
		tar cf vscode-server-linux-x64-web.tar.gz -C "${WORKDIR}/vscode-reh-web-linux-x64/" .
		doins vscode-server-linux-x64-web.tar.gz
	fi

	pushd .build/linux/deb/*/code-oss-*/usr/share/ > /dev/null || die

	insinto /usr/share/
	sed -i 's$x-scheme-handler/code-oss$x-scheme-handler/code-oss;x-scheme-handler/vscode$' \
		applications/*handler.desktop || die
	sed -i 's$/usr/share/code-oss/code-oss$/usr/bin/code-oss$' applications/*.desktop || die
	doins -r applications bash-completion pixmaps zsh

	insinto /usr/share/metainfo/
	doins appdata/*

	popd > /dev/null || die
	export PATH=${OLD_PATH}
}


pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
