# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/morluto/rea.git"
else
	SRC_URI="https://github.com/morluto/rea/archive/refs/tags/rea-agents-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64"
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
	npm ci --no-progress --no-audit --no-fund
	# npm >= 11.16 gates package lifecycle scripts, so fetch frida's
	# prebuild explicitly; the frida integration is optional upstream
	if [[ -d node_modules/frida ]]; then
		PATH="${S}/node_modules/.bin:${PATH}" \
			node node_modules/frida/scripts/install.js || \
			ewarn "frida prebuild download failed; the frida integration will be unavailable"
	fi
	npm run build:cached
}

src_install() {
	# only ship the runtime dependencies, not the development toolchain
	npm prune --omit=dev --no-audit --no-fund

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

	insinto "/usr/$(get_libdir)/rea-agents"
	doins -r node_modules
	doins package.json
	doins -r "${staging}"/*

	dosym "../$(get_libdir)/rea-agents/scripts/rea.mjs" /usr/bin/rea
	dosym "../$(get_libdir)/rea-agents/scripts/rea.mjs" /usr/bin/rea-agents
}
