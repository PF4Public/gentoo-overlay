# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit desktop flag-o-matic multilib ninja-utils pax-utils portability python-any-r1 toolchain-funcs xdg-utils

DESCRIPTION="Visual Studio Code - Open Source"
HOMEPAGE="https://github.com/microsoft/vscode"
LICENSE="MIT"
SLOT="0"
VS_RIPGREP_V="1.15.9"
SRC_URI="
	https://registry.yarnpkg.com/@vscode/ripgrep/-/ripgrep-${VS_RIPGREP_V}.tgz -> @vscode-ripgrep-${VS_RIPGREP_V}.tgz
"

REPO="https://github.com/microsoft/vscode"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="api-proposals badge-providers electron-27 electron-28 electron-29 electron-31 electron-32 electron-33 electron-30 electron-35 electron-36 electron-37 openvsx reh reh-web substitute-urls temp-fix"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE+=" +build-online"
	ELECTRON_SLOT_DEFAULT="34"
else
	IUSE+=" +build-online"
	ELECTRON_SLOT_DEFAULT="34"
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
	electron-31? ( dev-util/electron:31 )
	electron-32? ( dev-util/electron:32 )
	electron-33? ( dev-util/electron:33 )
	electron-30? ( dev-util/electron:30 )
	electron-35? ( dev-util/electron:35 )
	electron-36? ( dev-util/electron:36 )
	electron-37? ( dev-util/electron:37 )
	!electron-27? (
	!electron-28? (
	!electron-29? (
	!electron-31? (
	!electron-32? (
	!electron-33? (
	!electron-30? (
	!electron-35? (
	!electron-36? (
	!electron-37? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) ) ) ) )
"

#TODO: oniguruma?

RDEPEND="${COMMON_DEPEND}
"

DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	!temp-fix? ( net-libs/nodejs )
"

python_check_deps() {
        python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

pkg_pretend() {
	if ! use build-online; then
		ewarn
		ewarn "Offline build is not implemented yet"
		ewarn "Subscribe to #377 to stay informed"
		ewarn
		[[ -z "${NODIE}" ]] && die "The build will fail!"
	fi
}

src_unpack() {
	if use electron-27; then
		export ELECTRON_SLOT=27
	elif use electron-28; then
		export ELECTRON_SLOT=28
	elif use electron-29; then
		export ELECTRON_SLOT=29
	elif use electron-31; then
		export ELECTRON_SLOT=31
	elif use electron-32; then
		export ELECTRON_SLOT=32
	elif use electron-33; then
		export ELECTRON_SLOT=33
	elif use electron-30; then
		export ELECTRON_SLOT=30
	elif use electron-35; then
		export ELECTRON_SLOT=35
	elif use electron-36; then
		export ELECTRON_SLOT=36
	elif use electron-37; then
		export ELECTRON_SLOT=37
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

	# einfo "Restoring electron 12 support"
	# patch -Rup1 -i "${DISTDIR}/${PN}-f95b7e935f0edf1b41a2195fbe380078b29ab8f8.patch" || die

	einfo "Add PPC target to package build scripts"
	patch -p1 -i "${FILESDIR}/ppc64le/add-ppc-target.patch" || die

	einfo "Removing vscode-ripgrep and other dependencies"
	sed -i '/ripgrep"/d' package.json || die
	sed -i '/telemetry-extractor"/d' package.json || die
	sed -i '/git-blame-ignore/d' build/npm/postinstall.js || die

	einfo "Allowing any nodejs version"
	sed -i 's/if (majorNodeVersion < 16.*/if (false){/' build/npm/preinstall.js || die

	# ewarn "Removing extensions/npm, see #203"
	# ewarn "Please poke Microsoft here: https://github.com/microsoft/vscode/issues/181598"
	# rm -r extensions/npm
	# sed -i '/extensions\/npm/d' build/npm/dirs.js || die

	#TODO: applicationinsights
	# sed -i '/applicationinsights/d' package.json || die
	# sed -i '/buildWebNodePaths/d' build/gulpfile.compile.js || die

	# sed -i '/"electron"/d' package.json || die
	# sed -i '/vscode-ripgrep/d' remote/package.json || die
	# sed -i '/"playwright"/d' package.json || die
	sed -i '/test-web"/d' package.json || die

	sed -i '/"typescript-web-server"/d' extensions/typescript-language-features/package.json || die

	einfo "Editing postinstall.js"
	#sed -i "s/ || arg === '--frozen-lockfile'/ || arg === '--frozen-lockfile' || arg === '--offline' || arg === '--no-progress'/" build/npm/postinstall.js || die
	sed -i '/git config pull/d' build/npm/postinstall.js || die

	einfo "Editing dirs.js"
	if ! ( use reh || use reh-web ); then
		sed -i '/remote/d' build/npm/dirs.js || die
	fi
	sed -i '/test\/automation/d' build/npm/dirs.js || die
	sed -i '/test\/integration\/browser/d' build/npm/dirs.js || die
	sed -i '/test\/smoke/d' build/npm/dirs.js || die
	sed -i '/test\/monaco/d' build/npm/dirs.js || die
	sed -i '/vscode-selfhost-test-provider/d' build/npm/dirs.js || die

	# einfo "Editing build/gulpfile.extensions.js"
	# sed -i '/bundle-marketplace-extensions-build/d' build/gulpfile.extensions.js || die

	einfo "Editing build/gulpfile.vscode.js"
	#sed -i 's/ffmpegChromium: true/ffmpegChromium: false/' build/gulpfile.vscode.js || die
	sed -i '/ffmpegChromium/d' build/gulpfile.vscode.js || die
	sed -i 's$// Build$process.noAsar = true;$' build/gulpfile.vscode.js || die

	einfo "Editing build/gulpfile.vscode.linux.js"
	sed -i 's/gulp.task(buildDebTask);$/gulp.task(prepareDebTask);gulp.task(buildDebTask);/' build/gulpfile.vscode.linux.js || die
	sed -i 's/const sysroot =.*$/const sysroot = false;/' build/gulpfile.vscode.linux.js || die
	sed -i 's/const dependencies =.*$/const dependencies = [];/' build/gulpfile.vscode.linux.js || die

	einfo "Editing product.json"

	mv product.json product.json.bak || die
	sed -i '1d' product.json.bak || die

	cat "${FILESDIR}/heading.json" > product.json

	if use openvsx; then
		cat "${FILESDIR}/openvsx.json" >> product.json
	else
		cat "${FILESDIR}/marketplace.json" >> product.json
	fi

	if use badge-providers; then
		cat "${FILESDIR}/badge_prov.json" >> product.json
	fi

	if use api-proposals; then
		cat "${FILESDIR}/api-proposals.json" >> product.json
	fi

	cat product.json.bak >> product.json

	einfo "Disabling telemetry by default"
	perl -0777 -pi -e "s/'default': true,\n\s*'restricted': true,/'default': false,'restricted': true,/m or die" src/vs/platform/telemetry/common/telemetryService.ts || die
	perl -0777 -pi -e "s/'default': TelemetryConfiguration.ON,/'default': TelemetryConfiguration.OFF,/m or die" src/vs/platform/telemetry/common/telemetryService.ts || die
	perl -0777 -pi -e "s/'default': true,\n\s*'tags': \['usesOnlineServices', 'telemetry'\]/'default': false,'tags': ['usesOnlineServices', 'telemetry']/m or die" src/vs/workbench/electron-sandbox/desktop.contribution.ts || die

	einfo "Disabling automatic updates by default"
	perl -0777 -pi -e "s/enum: \['none', 'manual', 'start', 'default'\],\n\s*default: 'default',/enum: ['none', 'manual', 'start', 'default'], default: 'none',/m or die" src/vs/platform/update/common/update.config.contribution.ts || die

	if use substitute-urls; then
	ebegin "Substituting urls"
		#Taken from VSCodium
		TELEMETRY_URLS="[^/]+\.data\.microsoft\.com"
		REPLACEMENT="s/$TELEMETRY_URLS/0\.0\.0\.0/g"
		grep -rl --exclude-dir=.git -E $TELEMETRY_URLS . | xargs sed -i -E $REPLACEMENT
	eend $? || die
	fi

	einfo "Disabling signature verification for extensions"
	einfo "as it depends on a package from a hidden repository"
	patch -p1 -i "${FILESDIR}/disable-signature-verification.patch" || die
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

	#TODO: temp fix
	if use electron-32 || use electron-33 || use electron-35 || use electron-36 || use electron-37; then
		# CPPFLAGS="${CPPFLAGS} -std=c++20";
		use build-online || eerror "build-online should be enabled for node-addon-api substitution to work" || die;
		sed -i 's$"resolutions": {$"resolutions": {"node-addon-api": "^7.1.0",$' package.json || die;
	fi

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
	#! vvvvvv mongodb-js/kerberos fixed in main (> 2.1.0)
	export CXXFLAGS="${CXXFLAGS} -DNODE_API_EXPERIMENTAL_NOGC_ENV_OPT_OUT"
	#! ^^^^^^ mongodb-js/kerberos fixed in main (> 2.1.0)
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
	npm config set update-notifier false || die
	# echo "$PATH"
	# yarn config set disable-self-update-check true || die
	# yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	# if ! use build-online; then
	# 	ONLINE_OFFLINE="--offline"
	# 	yarn config set yarn-offline-mirror "${DISTDIR}" || die
	# fi
	npm install --frozen-lockfile ${ONLINE_OFFLINE} \
		--arch=${VSCODE_ARCH} --no-progress || die
	# --ignore-optional
	# --ignore-engines
	# --production=true
	# --no-progress
	# --skip-integrity-check
	# --verbose

	# Workaround md4 see https://github.com/webpack/webpack/issues/14560
	find node_modules/webpack/lib -type f -exec sed -i 's|md4|sha512|g' {} \; || die
	# For webpack >= 5.61.0
	sed -i 's/case "sha512"/case "md4"/' node_modules/webpack/lib/util/createHash.js || die

	export PATH=${OLD_PATH}

	einfo "Restoring vscode-ripgrep"
	pushd "node_modules/@vscode" > /dev/null || die
		tar -xf "${DISTDIR}/@vscode-ripgrep-${VS_RIPGREP_V}.tgz"
		mv package ripgrep
		sed -i 's$module.exports.rgPath.*$module.exports.rgPath = "/usr/bin/rg";\n$' ripgrep/lib/index.js || die
		sed -i '/"postinstall"/d' ripgrep/package.json || die
	popd > /dev/null || die
	eend $? || die
	sed -i "s/\"dependencies\": {/\"dependencies\": {\"@vscode\/ripgrep\": \"^${VS_RIPGREP_V}\",/" package.json || die

	#rm extensions/css-language-features/server/test/pathCompletionFixtures/src/data/foo.asar
	#rm -rf extensions/css-language-features/server/test > /dev/null || die

	einfo "Editing build/lib/getVersion.js"
	sed -i '/.*\!version.*/{s++if \(false\)\{+;h};${x;/./{x;q0};x;q1}' \
		build/lib/getVersion.js || die

	#TODO Although this allows the build to continue, it renders vscode unusable
	#TODO Does it really? Investigate later
	# einfo "Fixing l10n-dev"
	# sed -i 's/return await import_web_tree_sitter/return null; await import_web_tree_sitter/' node_modules/@vscode/l10n-dev/dist/main.js || die
}

src_compile() {
	ulimit -n 8192

	if [ -d ".git" ]; then
	    COMMIT_ID="$(git rev-parse HEAD)"
	else
		if [ -z "$CODE_COMMIT_ID" ]; then
			COMMIT_ID="${PV}"
		else
			COMMIT_ID="${CODE_COMMIT_ID}"
		fi
	fi
	export BUILD_SOURCEVERSION="${COMMIT_ID}"

	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH
	export NODE_OPTIONS="--max-old-space-size=12192 --heapsnapshot-near-heap-limit=5"

	if use temp-fix; then
	node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-min || die
	else
	# Real nodejs needed (/usr/bin/node). See https://github.com/microsoft/vscode-l10n/issues/104
	/usr/bin/node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-min || die
	fi

	#TODO: make reh use the same node at runtime as main vscode
	if use reh; then
		if use temp-fix; then
		node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-reh-linux-${VSCODE_ARCH}-min || die
		else
		# Real nodejs needed (/usr/bin/node). See https://github.com/microsoft/vscode-l10n/issues/104
		/usr/bin/node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-reh-linux-${VSCODE_ARCH}-min || die
		fi
	fi
	if use reh-web; then
		if use temp-fix; then
		node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-reh-web-linux-${VSCODE_ARCH}-min || die
		else
		# Real nodejs needed (/usr/bin/node). See https://github.com/microsoft/vscode-l10n/issues/104
		/usr/bin/node --optimize_for_size node_modules/gulp/bin/gulp.js vscode-reh-web-linux-${VSCODE_ARCH}-min || die
		fi
	fi

	export PATH=${OLD_PATH}
}

src_install() {
	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH

	if use temp-fix; then
	YARN_CACHE_FOLDER="${T}/.yarn-cache" node node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-prepare-deb || die
	else
	# Real nodejs needed (/usr/bin/node). See https://github.com/microsoft/vscode-l10n/issues/104
	YARN_CACHE_FOLDER="${T}/.yarn-cache" /usr/bin/node node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-prepare-deb || die
	fi
	local VSCODE_HOME="/usr/$(get_libdir)/vscode"

	exeinto "${VSCODE_HOME}"
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
	dosym "${VSCODE_HOME}/code-oss" /usr/bin/code-oss

	insinto "${VSCODE_HOME}"
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/extensions
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/out
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/resources
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/*.json
	#TODO why no asar?
	# doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar
	# doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar.unpacked
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules
	fperms +x ${VSCODE_HOME}/out/vs/base/node/cpuUsage.sh
	# fperms +x ${VSCODE_HOME}/node_modules.asar.unpacked/node-pty/build/Release/spawn-helper

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
	if use api-proposals; then
		ewarn
		ewarn "You have enabled insiders API, be warned:"
		ewarn "this might be against Microsoft licensing terms."
		ewarn
	fi

	# elog
	# elog "Normally vscode ships some builtin extensions, but they are omitted here"
	# elog "Consult product.json for a list if you want to install them manually"
	# elog "ms-vscode.references-view is one of them, for example"
	# elog

	xdg_icon_cache_update
	xdg_desktop_database_update
}
