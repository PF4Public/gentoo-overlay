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
	npm ci --no-progress --no-audit --no-fund
	npm run build:cached
}

src_install() {
	# only ship the runtime dependencies, not the development toolchain
	npm prune --omit=dev --no-audit --no-fund

	# mirror the npm package layout (the files list in package.json)
	insinto "/usr/$(get_libdir)/rea-agents"
	doins -r bridge/android bridge/ghidra bridge/process bridge/pwntools
	doins -r dist licenses node_modules skills
	doins -r third_party/evmole third_party/pwndbg third_party/pwntools third_party/wabt
	doins DISCLAIMER.md README.md THIRD_PARTY_NOTICES.md LICENSE install.sh package.json
	doins bridge/cutter/rea_bridge.py bridge/hopper_bridge.py bridge/mitmproxy/capture.py
	doins bridge/native/NativeUIChildren.swift bridge/native/NativeUIValues.swift \
		bridge/native/ReaNativeUI.swift bridge/native/rea_lldb_tracer.py
	doins bridge/pwndbg/core_context.py bridge/pwndbg/launch.py bridge/pwndbg/launch_impl.py
	doins scripts/electron-active-hook-boundaries.cjs scripts/electron-active-hook.cjs \
		scripts/hopper-demo-x11.py scripts/prepack.mjs scripts/prepare.mjs \
		scripts/rea-android-workspace-guardian.mjs scripts/rea.mjs \
		scripts/verify-windows-native-artifact.mjs
	doins scripts/lib/cli-process-environment.mjs

	dosym "../$(get_libdir)/rea-agents/scripts/rea.mjs" /usr/bin/rea
	dosym "../$(get_libdir)/rea-agents/scripts/rea.mjs" /usr/bin/rea-agents
}
