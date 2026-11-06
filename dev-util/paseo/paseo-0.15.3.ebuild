# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Must be set BEFORE inherit (electron-r1 reads them at inherit time):
ELECTRON_COMPAT=( {43,44,45} )
ELECTRON_SLOT_DEFAULT="44"

inherit desktop electron-r1 xdg-utils

DESCRIPTION="Paseo: voice-controlled development environment for local AI coding agents"
HOMEPAGE="https://github.com/getpaseo/paseo"
LICENSE="Apache-2.0"
SLOT="0"

REPO="https://github.com/getpaseo/paseo"

# build-online: the build downloads the npm registry over the network.
# Default on, like element-desktop, because an offline install is not
# implemented.
IUSE="+build-online"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
else
	KEYWORDS="amd64 ~arm64"
	SRC_URI="${REPO}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

BDEPEND="
	$(electron_gen_dep)
	>=net-libs/nodejs-22[npm]
"

RDEPEND="
	$(electron_gen_dep)
"

RESTRICT="mirror build-online? ( network-sandbox )"

src_prepare() {
	default

	# The root prepare script installs lefthook git hooks; it needs a .git
	# checkout (the release tarball has none) and is irrelevant to the build.
	node -e '
		const fs = require("node:fs");
		const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"));
		delete pkg.scripts.prepare;
		fs.writeFileSync("package.json", JSON.stringify(pkg, null, 2) + "\n");
	' || die

	# The bundled CLI shim (bin/paseo) is resolved from the executable's
	# resources dir, which is the electron dist under the system-electron
	# layout; resolve it from process.resourcesPath instead, which
	# resources-path-override.cjs pins to the install dir.
	patch -p1 -i "${FILESDIR}/0001-cli-shim-path.patch" || die
}

src_compile() {
	# Metro's workers OOM on the generated ws-outbound.aot.js validator with
	# the default heap (upstream CI pins the same limit).
	export NODE_OPTIONS="--max-old-space-size=4096"
	export CI=1
	export EXPO_NO_TELEMETRY=1
	# onnxruntime-node's install script would download a CUDA build from
	# NuGet; the CPU runtime ships in the npm packages (upstream CI sets
	# the same).
	export ONNXRUNTIME_NODE_INSTALL=skip

	einfo "Installing node_modules"
	# Installs every workspace (devDependencies included); the root postinstall
	# applies the patch-package patches. ELECTRON_SKIP_BINARY_DOWNLOAD and
	# PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD are already set by electron-r1. The
	# native modules are N-API prebuilds (node-pty) or pure platform packages
	# (sherpa-onnx), so nothing is compiled against the runtime here.
	npm ci --no-progress || die

	# = upstream build:desktop, split out so electron-builder can run with the
	# system node below.
	# 1. app workspace deps (highlight, client, plugin, expo-two-way-audio)
	npm run build:app-deps || die

	# 2. the Expo web export that the desktop app loads via the paseo://
	#    protocol
	pushd packages/app > /dev/null || die
		PASEO_WEB_PLATFORM=electron npx expo export --platform web || die
	popd > /dev/null || die

	# 3. the server stack (protocol, client, highlight, plugin, relay,
	#    server, cli)
	npm run build:server:clean || die

	# 4. the desktop main process (tsc)
	npm run build:main --workspace=@getpaseo/desktop || die

	local myarch=x64
	[[ ${CHOST} == *aarch64* ]] && myarch=arm64

	# electron-builder must run with the SYSTEM node: the electron runtime's
	# node wrapper breaks its yargs ("Unknown argument"). npm's .bin entry is
	# a symlink to the CLI entry, so it can be run with /usr/bin/node.
	# --dir: build the unpacked app only (src_install consumes
	# release/linux-unpacked/resources), so no AppImage/deb/rpm targets and
	# no appimagetool/fpm downloads either.
	# --publish=never: suppress implicit publishing triggered by CI detection.
	# --config.electronDist: package against the system electron runtime
	# (see electron-r1) instead of downloading the Electron dist zip.
	# electron-builder is a devDependency of the desktop workspace, hoisted
	# to the root node_modules.
	pushd packages/desktop > /dev/null || die
		/usr/bin/node ../../node_modules/.bin/electron-builder \
			--config electron-builder.yml \
			--linux --${myarch} --dir --publish=never \
			--config.electronDist="${ELECTRON_DIST}" || die
	popd > /dev/null || die
}

src_install() {
	# electron-builder --dir produced
	# packages/desktop/release/linux-unpacked/. Its resources/ holds app.asar,
	# app.asar.unpacked (daemon node entrypoint runner + shell-integration
	# hooks), app-dist (the Expo web export), the builtin plugins, the
	# editor-target icons and the bin/paseo CLI shim. The bundled Electron
	# runtime (Paseo.bin, *.pak, lib*.so, locales/) is not shipped — the
	# launcher below runs the system electron from electron-r1.
	local mydir="/usr/$(get_libdir)/paseo"

	insinto "${mydir}"
	doins -r packages/desktop/release/linux-unpacked/resources/* || die

	# Pin process.resourcesPath to the install dir at runtime; see the file.
	doins "${FILESDIR}/resources-path-override.cjs" || die

	# The CLI shim must stay executable.
	fperms 0755 "${mydir}/bin/paseo" || die

	# Launcher: run the app.asar with the selected system electron slot,
	# forwarding user flags from ~/.config/paseo-flags.conf. Node-mode
	# invocations (ELECTRON_RUN_AS_NODE=1, used by the bin/paseo CLI shim)
	# pass through to the runtime verbatim.
	local launcher="${mydir}/paseo"
	cp "${FILESDIR}/read_flags_file" "${ED}${launcher}" || die
	sed -i "s|@ELECTRON@|paseo|" "${ED}${launcher}" || die
	cat >> "${ED}${launcher}" <<EOF
if [ "\${ELECTRON_RUN_AS_NODE:-}" = 1 ]; then
	exec "/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/electron" "\$@"
fi
ELECTRON_FORCE_IS_PACKAGED=1 "/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/electron" \
--require "${mydir}/resources-path-override.cjs" ${mydir}/app.asar "\${flags[@]}" "\$@"
EOF
	fperms 0755 "${launcher}" || die

	# GUI launcher (also the target of `paseo open`, which probes /usr/bin/Paseo).
	dosym "../$(get_libdir)/paseo/paseo" /usr/bin/Paseo
	# The bin/paseo CLI shim resolves its runtime from the 'Paseo' executable
	# sibling of the resources dir (the upstream launcher layout).
	dosym "paseo/paseo" "/usr/$(get_libdir)/Paseo"
	# The bundled CLI.
	dosym "../$(get_libdir)/paseo/bin/paseo" /usr/bin/paseo

	newicon packages/desktop/assets/icon.png paseo.png

	make_desktop_entry "/usr/bin/Paseo %U" Paseo "paseo" "Development" \
		"StartupWMClass=Paseo"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
