# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit optfeature

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/morluto/rea.git"
else
	SRC_URI="https://github.com/morluto/rea/archive/refs/tags/rea-agents-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm64"
	# codeload names the top-level directory after the tag
	S="${WORKDIR}/rea-rea-agents-${PV}"
fi

DESCRIPTION="CLI and MCP server to reverse engineer anything"
HOMEPAGE="https://github.com/morluto/rea https://rea.tools"

LICENSE="MIT"
# Dependent licenses
LICENSE+=" Apache-2.0 BSD BSD-2 BlueOak-1.0.0 ISC LGPL-2.0-with-wxWindows-exception-3.1 LGPL-3+ WTFPL-2 ZLIB"
SLOT="0"

# build-online: npm ci (and the frida prebuild download) needs network at
# build time; an offline build is not implemented.
IUSE="+build-online"
RESTRICT="mirror test build-online? ( network-sandbox )"

BDEPEND="
	dev-vcs/git
	>=net-libs/nodejs-24.22.1[npm]
"
RDEPEND="
	>=net-libs/nodejs-24.22.1[npm]
	sys-process/procps
"

DOCS=(
	CHANGELOG.md
	CONTRIBUTING.md
	DISCLAIMER.md
	README.md
	SECURITY.md
	THIRD_PARTY_NOTICES.md
)

src_compile() {
	# the prepare script installs husky git hooks; ${S} is not a repository
	local -x HUSKY=0
	# upstream pins exact node versions with engine-strict; use the system node
	local -x npm_config_engine_strict=false
	npm ci --no-progress --no-audit --no-fund || die
	# npm >= 11.16 gates package lifecycle scripts, so fetch frida's
	# prebuild explicitly; the frida integration is optional upstream
	if [[ -d node_modules/frida ]]; then
		PATH="${S}/node_modules/.bin:${PATH}" \
			node node_modules/frida/scripts/install.js || \
			ewarn "frida prebuild download failed; the frida integration will be unavailable"
	fi
	# node 26 dropped stripTypeScriptTypes' transform mode, so the source
	# loader cannot import the .ts files the metadata scripts need; compile
	# those files to .js next to the sources and point the scripts at the
	# .js, leaving the .ts files intact for the build (which ignores .js)
	if ! node -e 'require("node:module").stripTypeScriptTypes("let x: number = 1", { mode: "transform" });' \
		2>/dev/null; then
		./node_modules/.bin/tsc --ignoreConfig src/domain/skillManifest.ts \
			--module esnext --target esnext --outDir src/domain || die
		sed -i 's/skillManifest\.ts/skillManifest.js/' \
			scripts/generate-package-metadata.mjs scripts/generate-skill-metadata.mjs
	fi
	npm run build:cached || die
}

src_install() {
	# upstream pins exact node versions with engine-strict; use the system node
	local -x npm_config_engine_strict=false
	# only ship the runtime dependencies, not the development toolchain
	npm prune --omit=dev --no-audit --no-fund

	# the npm files list may reference npm-shrinkwrap.json without the source
	# shipping it; regenerate it from the package lock, as the release does
	[[ -e npm-shrinkwrap.json ]] || npm shrinkwrap --no-audit --no-fund || die

	# doins installs files by basename only, so stage the npm package
	# layout (the files list in package.json) to keep subdirectories
	local staging="${T}/rea-pkg" files file
	mkdir "${staging}"
	files=$(node -p "JSON.parse(require('node:fs').readFileSync('package.json','utf8')).files.join('\n')") || die
	while IFS= read -r file; do
		# the Windows-only native artifact is built at release time
		case ${file} in
			native/windows/*) continue ;;
		esac
		[[ -e ${file} ]] || die "missing npm package file: ${file}"
		cp -r --parents "${file}" "${staging}" || die
	done <<< "${files}"

	# standard npm global prefix layout, like npm install --global
	insinto "/usr/$(get_libdir)/node_modules/rea-agents"
	doins -r node_modules
	doins package.json
	doins -r "${staging}"/*
	fperms 0755 "/usr/$(get_libdir)/node_modules/rea-agents/install.sh"
	fperms 0755 "/usr/$(get_libdir)/node_modules/rea-agents/scripts/rea.mjs"

	dosym "../$(get_libdir)/node_modules/rea-agents/scripts/rea.mjs" /usr/bin/rea
	dosym "../$(get_libdir)/node_modules/rea-agents/scripts/rea.mjs" /usr/bin/rea-agents
}

pkg_postinst() {
	optfeature "Android APK decompilation" dev-util/jadx
	optfeature "decompiler support" dev-util/kuna
	optfeature "native binary analysis" dev-util/ghidra
}
