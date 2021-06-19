# Copyright 2009-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit desktop flag-o-matic multilib ninja-utils pax-utils portability python-any-r1 toolchain-funcs xdg-utils

DESCRIPTION="Visual Studio Code - Open Source"
HOMEPAGE="https://github.com/microsoft/vscode"
LICENSE="MIT"
SLOT="0"
VS_RIPGREP_V="1.11.3"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.12.1.tgz
	https://registry.npmjs.org/esbuild-linux-64/-/esbuild-linux-64-0.12.1.tgz
	https://registry.npmjs.org/esbuild-linux-32/-/esbuild-linux-32-0.12.1.tgz
	)
	https://registry.yarnpkg.com/vscode-ripgrep/-/vscode-ripgrep-${VS_RIPGREP_V}.tgz
"

REPO="https://github.com/microsoft/vscode"
ELECTRON_SLOT="12"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE="badge-providers +build-online ignore-gpu-blacklist insiders liveshare openvsx substitute-urls"
else
	IUSE="badge-providers build-online ignore-gpu-blacklist insiders liveshare openvsx substitute-urls"
	KEYWORDS="~amd64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$CODE_COMMIT_ID" ]
	then
		DOWNLOAD+="${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${CODE_COMMIT_ID}.tar.gz -> ${PN}-${CODE_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${CODE_COMMIT_ID}"
	fi
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

COMMON_DEPEND="
	>=app-crypt/libsecret-0.18.8:=
	>=x11-libs/libX11-1.6.9:=
	>=x11-libs/libxkbfile-1.1.0:=
	sys-apps/ripgrep
	dev-util/electron:${ELECTRON_SLOT}
"
#TODO: oniguruma?

RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	sys-apps/yarn
	net-libs/nodejs
"

src_unpack() {
	if [ -z "$CODE_COMMIT_ID" ]
	then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
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

	einfo "Removing vscode-ripgrep and other dependencies"
	sed -i '/"vscode-ripgrep"/d' package.json || die
	sed -i '/"vscode-telemetry-extractor"/d' package.json || die
	use build-online || sed -i '/"esbuild"/d' build/package.json || die
	use build-online || sed -i '/"esbuild"/d' extensions/package.json || die

	#sed -i '/"electron"/d' package.json || die
	#sed -i '/vscode-ripgrep/d' remote/package.json || die
	sed -i '/"playwright"/d' package.json || die

	sed -i '/"typescript-web-server"/d' extensions/typescript-language-features/package.json || die

	einfo "Editing postinstall.js"
	#sed -i "s/ || arg === '--frozen-lockfile'/ || arg === '--frozen-lockfile' || arg === '--offline' || arg === '--no-progress'/" build/npm/postinstall.js || die
	sed -i '/git config pull/d' build/npm/postinstall.js || die

	einfo "Editing dirs.js"
	sed -i '/remote/d' build/npm/dirs.js || die
	sed -i '/test\/automation/d' build/npm/dirs.js || die
	sed -i '/test\/integration\/browser/d' build/npm/dirs.js || die
	sed -i '/test\/smoke/d' build/npm/dirs.js || die
	sed -i '/test\/monaco/d' build/npm/dirs.js || die

	einfo "Editing build/gulpfile.extensions.js"
	sed -i '/bundle-marketplace-extensions-build/d' build/gulpfile.extensions.js || die

	einfo "Editing build/gulpfile.vscode.js"
	#sed -i 's/ffmpegChromium: true/ffmpegChromium: false/' build/gulpfile.vscode.js || die
	sed -i '/ffmpegChromium/d' build/gulpfile.vscode.js || die

	einfo "Editing build/gulpfile.vscode.linux.js"
	sed -i 's/gulp.task(buildDebTask);$/gulp.task(prepareDebTask);gulp.task(buildDebTask);/' build/gulpfile.vscode.linux.js || die

	einfo "Editing product.json"

	mv product.json product.json.bak || die
	sed -i '1d' product.json.bak || die

	if use liveshare
	then
	sed -i 's/"ms-vscode.vscode-js-profile-flame",/"ms-vscode.vscode-js-profile-flame", "ms-vsliveshare.vsliveshare",/' product.json.bak || die
	fi

	if use insiders
	then
	sed -i 's/"ms-vscode.vscode-js-profile-flame",/"ms-vscode.references-view", "ms-vsliveshare.vsliveshare", "ms-vsliveshare.cloudenv", "ms-vsliveshare.cloudenv-explorer", "ms-vsonline.vsonline", "GitHub.vscode-pull-request-github", "GitHub.vscode-pull-request-github-insiders", "Microsoft.vscode-nmake-tools", "ms-vscode-remote.remote-containers", "ms-vscode-remote.remote-containers-nightly", "ms-vscode-remote.remote-ssh", "ms-vscode-remote.remote-ssh-nightly", "ms-vscode-remote.remote-ssh-edit", "ms-vscode-remote.remote-ssh-edit-nightly", "ms-vscode-remote.remote-wsl", "ms-vscode-remote.remote-wsl-nightly", "ms-vscode-remote.vscode-remote-extensionpack", "ms-vscode-remote.vscode-remote-extensionpack-nightly", "ms-azuretools.vscode-docker", "ms-vscode.azure-account", "ms-vscode.js-debug", "ms-vscode.js-debug-nightly", "ms-vscode.vscode-js-profile-table", "ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-github-issue-notebooks", "ms-vscode.vscode-markdown-notebook", "ms-azuretools.vscode-azurestaticwebapps", "ms-dotnettools.dotnet-interactive-vscode", "ms-python.python", "ms-ai-tools.notebook-renderers",/' product.json.bak || die
	fi

	cat "${FILESDIR}/heading.json" > product.json
	if use openvsx
	then
		cat "${FILESDIR}/openvsx.json" >> product.json
	else
		cat "${FILESDIR}/marketplace.json" >> product.json
	fi

	if use badge-providers
	then
		cat "${FILESDIR}/badge_prov.json" >> product.json
	fi

	cat product.json.bak >> product.json

	einfo "Disabling telemetry by default"
	perl -0777 -pi -e "s/'default': true,\n\s*'restricted': true,/'default': false,'restricted': true,/m or die" src/vs/platform/telemetry/common/telemetryService.ts || die
	perl -0777 -pi -e "s/'default': true,\n\s*'tags': \['usesOnlineServices'\]/'default': false,'tags': ['usesOnlineServices']/m or die" src/vs/workbench/electron-sandbox/desktop.contribution.ts || die

	einfo "Disabling automatic updates by default"
	perl -0777 -pi -e "s/enum: \['none', 'manual', 'start', 'default'\],\n\s*default: 'default',/enum: ['none', 'manual', 'start', 'default'], default: 'none',/m or die" src/vs/platform/update/common/update.config.contribution.ts || die

	if use substitute-urls
	then
		ebegin "Substituting urls"
			#Taken from VSCodium
			TELEMETRY_URLS="(dc\.services\.visualstudio\.com)|(vortex\.data\.microsoft\.com)"
			REPLACEMENT="s/$TELEMETRY_URLS/0\.0\.0\.0/g"
			grep -rl --exclude-dir=.git -E $TELEMETRY_URLS . | xargs sed -i -E $REPLACEMENT
		eend $? || die
	fi
}

src_configure() {

	local myarch="$(tc-arch)"

	if [[ $myarch = amd64 ]] ; then
		VSCODE_ARCH="x64"
	elif [[ $myarch = x86 ]] ; then
		VSCODE_ARCH="ia32"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi

	ebegin "Installing node_modules"
#	yarn config set yarn-offline-mirror ${T}/yarn_cache || die
	OLD_PATH=$PATH
	export PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/npm/bin/node-gyp-bin:$PATH"
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
#	echo "$PATH"
	if ! use build-online
	then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	yarn install --frozen-lockfile ${ONLINE_OFFLINE} \
		--arch=${VSCODE_ARCH} --no-progress || die
#--ignore-optional
#--ignore-engines
#--production=true
#--no-progress
#--skip-integrity-check
#--verbose

	export PATH=${OLD_PATH}

	einfo "Restoring vscode-ripgrep"
	pushd node_modules > /dev/null || die
	tar -xf "${DISTDIR}/vscode-ripgrep-${VS_RIPGREP_V}.tgz"
	mv package vscode-ripgrep
	sed -i 's$module.exports.rgPath.*$module.exports.rgPath = "/usr/bin/rg";\n$' vscode-ripgrep/lib/index.js || die
	sed -i '/"postinstall"/d' vscode-ripgrep/package.json || die
	popd > /dev/null || die
	eend $? || die
	sed -i "s/\"dependencies\": {/\"dependencies\": {\"vscode-ripgrep\": \"^${VS_RIPGREP_V}\",/" package.json || die

	if ! use build-online; then
	einfo "Restoring esbuild"
	pushd build/node_modules > /dev/null || die
	tar -xf "${DISTDIR}/esbuild-0.12.1.tgz"
	mv package esbuild
	if [[ $myarch = amd64 ]] ; then
		tar -xf "${DISTDIR}/esbuild-linux-64-0.12.1.tgz"
	else
		tar -xf "${DISTDIR}/esbuild-linux-32-0.12.1.tgz"
	fi
	mv -f package/bin/esbuild esbuild/bin/
	popd > /dev/null || die
	eend $? || die
	fi

	if ! use build-online; then
	einfo "Restoring esbuild in extensions"
	mkdir -p extensions/node_modules
	pushd extensions/node_modules > /dev/null || die
	tar -xf "${DISTDIR}/esbuild-0.12.1.tgz"
	mv package esbuild
	if [[ $myarch = amd64 ]] ; then
		tar -xf "${DISTDIR}/esbuild-linux-64-0.12.1.tgz"
	else
		tar -xf "${DISTDIR}/esbuild-linux-32-0.12.1.tgz"
	fi
	mv -f package/bin/esbuild esbuild/bin/
	popd > /dev/null || die
	eend $? || die
	fi

	#rm extensions/css-language-features/server/test/pathCompletionFixtures/src/data/foo.asar
	#rm -rf extensions/css-language-features/server/test > /dev/null || die

	einfo "Editing build/lib/util.js"
	sed -i 's/.*\!version.*/if \(false\)\{/' build/lib/util.js || die
}

src_compile() {

	if [ -d ".git" ]
	then
	    COMMIT_ID="$(git rev-parse HEAD)"
	else
		if [ -z "$CODE_COMMIT_ID" ]
		then
			COMMIT_ID="${PV}"
		else
			COMMIT_ID="${CODE_COMMIT_ID}"
		fi
	fi
	export BUILD_SOURCEVERSION="${COMMIT_ID}"

	node --max_old_space_size=8192 node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-min || die
}

src_install() {
	YARN_CACHE_FOLDER="${T}/.yarn-cache" /usr/bin/node node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-prepare-deb || die
	local VSCODE_HOME="/usr/$(get_libdir)/vscode"

	if use ignore-gpu-blacklist
	then
		IGNORE_BLACKLIST="--ignore-gpu-blacklist"
	fi

	exeinto "${VSCODE_HOME}"
	sed -i '/^ELECTRON/,+3d' "${WORKDIR}"/V*/bin/code-oss || die
	echo "VSCODE_PATH=\"/usr/$(get_libdir)/vscode\"
	ELECTRON_PATH=\"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}\"
	CLI=\"\${VSCODE_PATH}/out/cli.js\"
	exec /usr/bin/env ELECTRON_RUN_AS_NODE=1 \
	NPM_CONFIG_NODEDIR=\"\${ELECTRON_PATH}/node/\" \
	\"\${ELECTRON_PATH}/electron\" \"\${CLI}\" --app=\"\${VSCODE_PATH}\" ${IGNORE_BLACKLIST} \"\$@\"" >> "${WORKDIR}"/V*/bin/code-oss
	doexe "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/bin/code-oss
	dosym "${VSCODE_HOME}/code-oss" /usr/bin/code-oss

	insinto "${VSCODE_HOME}"
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/extensions
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/out
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/resources
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/*.json
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar.unpacked

	pushd .build/linux/deb/*/code-oss-*/usr/share/ > /dev/null || die

	insinto /usr/share/
	sed -i 's$/usr/share/code-oss/code-oss$/usr/bin/code-oss$' applications/*.desktop || die
	doins -r applications bash-completion pixmaps zsh

	insinto /usr/share/metainfo/
	doins appdata/*

	popd > /dev/null || die
}

pkg_postinst() {
	if use insiders; then
		ewarn
		ewarn "You have enabled insiders API, be warned:"
		ewarn "this might be against Microsoft licensing terms."
		ewarn
	fi

	elog
	elog "normally vscode ships some builtin extensions"
	elog "You may install them manually if you need them"
	elog "ms-vscode.references-view is one of them"
	elog
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
