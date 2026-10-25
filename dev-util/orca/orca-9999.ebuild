# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Must be set BEFORE inherit (electron-r1 reads them at inherit time):
ELECTRON_COMPAT=( {43,44,45} )
ELECTRON_SLOT_DEFAULT="43"

inherit desktop electron-r1 xdg-utils

DESCRIPTION="Next-gen IDE for parallel agentic development"
HOMEPAGE="https://github.com/stablyai/orca"
LICENSE="MIT"
SLOT="0"

REPO="https://github.com/stablyai/orca"

# build-online: the build downloads the pnpm store over the network. Default
# on, like element-desktop, because an offline install is not implemented.
# wayland: build + bundle the native Wayland clipboard helper
# (orca-wayland-clipboard), a temporary workaround for Electron #54645 that
# only runs on native Wayland (never on X11/mac/Windows). Default off, matching
# dev-util/electron; enable it on Wayland sessions to ship the helper.
IUSE="+build-online wayland"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
else
	KEYWORDS="~amd64 ~arm64"
	SRC_URI="${REPO}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

BDEPEND="
	$(electron_gen_dep)
	>=net-libs/nodejs-24[npm]
	wayland? ( dev-libs/wayland )
"

DEPEND="
	wayland? ( dev-libs/wayland )
"

# Runtime deps for the bundled "orca serve" / computer-use features, beyond
# what the electron runtime already provides.
RDEPEND="
	$(electron_gen_dep)
	app-crypt/libsecret
	sys-apps/ripgrep
	dev-python/pygobject:3
	sys-apps/util-linux
	wayland? ( dev-libs/wayland x11-libs/gtk+ )
	x11-base/xorg-server[xvfb]
	x11-misc/xdotool
	x11-misc/xclip
"

RESTRICT="mirror build-online? ( network-sandbox )"

src_prepare() {
	default

	# Upstream's electron-builder config (config/electron-builder.config.cjs)
	# runs CI-only verification hooks even for a `--dir` (unpack) build:
	#   beforePack: dark-build / native-variant / bundled-ripgrep / process-host
	#               / orcad-template / mobile-web assertions, and the Docker-
	#               built Wayland clipboard helper.
	#   afterPack:  verifyLinuxGlibcFloor (hard-fails if any bundled native
	#               binary, e.g. node-pty's pty.node, needs glibc > 2.31), the
	#               Wayland helper finalize, and main-runtime-deps / skills-CLI
	#               / daemon-boot / plugin / web-client checks.
	# A native Gentoo build links the host glibc, so a locally-compiled
	# pty.node requires GLIBC_2.34+ and the 2.31 floor check fails. Upstream
	# builds the native pieces inside Docker against Ubuntu 20.04 to hit that
	# floor. Those hooks are CI guards for the AppImage, not Gentoo runtime
	# requirements, so relax them (0001).
	patch -p1 -i "${FILESDIR}/0001-relax-ci-verification-hooks.patch" || die

	# The Wayland clipboard helper is only used on native Wayland. Without the
	# flag, strip its extraResources entry so electron-builder does not fail on
	# the missing file (0002). With the flag the helper is built natively below.
	if ! use wayland; then
		patch -p1 -i "${FILESDIR}/0002-strip-wayland-clipboard.patch" || die
	fi

	# Honor an explicit ORCA_BUILD_COMMIT env in resolveBuildSourceCommit() (0003);
	# src_compile pins the source commit (git HEAD for this live build, tracking
	# each update) so the app's skill installs resolve to this build.
	patch -p1 -i "${FILESDIR}/0003-honor-build-commit-env.patch" || die

	# Electron 44 removed the legacy clipboard surface (availableFormats,
	# readBuffer, readImage, writeImage, writeBuffer, the 'selection' argument
	# to readText/writeText) in favor of the async W3C ClipboardItem API, which
	# breaks paste on the 44/45 slots (upstream pins electron 43). 0004 routes
	# the main-process clipboard callers through a compat module that speaks
	# whichever surface the runtime exposes; the macOS file-copy writeBuffer
	# path degrades to a reported failure on 44+.
	patch -p1 -i "${FILESDIR}/0004-electron-clipboard-api.patch" || die
}

src_compile() {
	# Pin the source ref (0003 makes the build honor this) so the app's skill
	# installs clone a ref that exists on the remote: the live (9999) build uses
	# the main branch, releases the version tag (v${PV}), which points at the exact
	# commit the build was made from. A bare commit SHA cannot be git-cloned.
	if [[ ${PV} = *9999* ]]; then
		export ORCA_BUILD_COMMIT=main
	else
		export ORCA_BUILD_COMMIT="v${PV}"
	fi

	# The overlay has no dev-util/pnpm; install it from npm into the build
	# sandbox, mirroring the opencode/element approach.
	einfo "Installing node_modules"
	OLD_PATH=$PATH
	PATH="$T/pnpm/node_modules/.bin:$PATH"
	export PATH
	mkdir "$T/pnpm" || die
	pushd "$T/pnpm" > /dev/null || die
		npm init -y || die
		npm install pnpm yarn || die
	popd > /dev/null || die
	einfo "Using node $(node --version) and pnpm $(pnpm --version) ($(command -v pnpm))"
	pnpm install --no-frozen-lockfile || die

	# The mobile web app is a separate pnpm workspace (mobile/ carries its own
	# lockfile) that the desktop serves; install it so build:mobile-web can
	# resolve react-native-web / expo-router.
	pushd mobile > /dev/null || die
		pnpm install --no-frozen-lockfile || die
	popd > /dev/null || die

	# Build the JS targets: CLI, electron-vite bundles (main/preload/renderer),
	# web + mobile web. (= upstream build:desktop:assets minus the WSL-only
	# build:wsl-guest, which is irrelevant on native Linux.)
	pnpm run build:release:javascript || die

	# node-pty is rebuilt against Electron by the install postinstall hook and
	# again by electron-builder's beforeBuild hook (@electron/rebuild, using
	# ELECTRON_DIST from electron-r1). The upstream build:native step only builds
	# the Wayland helper on Linux (via Docker), so it is not run here.

	# Build the native Wayland clipboard helper natively (upstream compiles it in
	# Docker only to force an old glibc floor, which is irrelevant on Gentoo). It
	# is placed where the config's extraResources entry expects it.
	if use wayland; then
		local arch
		[[ ${CHOST} == *aarch64* ]] && arch=arm64 || arch=x64
		local helperdir="native/wayland-clipboard/.build/${arch}"
		mkdir -p "${helperdir}" || die
		einfo "Building the Wayland clipboard helper natively"
		gcc -O2 -fPIE -pie -Wl,-z,relro,-z,now \
			native/wayland-clipboard/wayland-clipboard.c \
			native/wayland-clipboard/x11-clipboard-publisher.c \
			-ldl -o "${helperdir}/orca-wayland-clipboard" || die
		chmod 0755 "${helperdir}/orca-wayland-clipboard" || die
	fi

	# electron-builder must run with the SYSTEM node: the electron runtime's
	# node wrapper breaks its yargs ("Unknown argument"). With pnpm,
	# node_modules/.bin/electron-builder is a shell shim, so run the real CLI
	# entry (node_modules/electron-builder/cli.js) directly.
	# --dir: build the unpacked app only (src_install consumes
	# dist/linux-unpacked/resources), so no AppImage/deb/rpm targets and no
	# 7zip/fpm downloads either.
	# --publish=never: suppress implicit publishing triggered by CI detection.
	# --config.electronDist: package against the system electron runtime
	# (see electron-r1) instead of downloading the Electron dist zip.
	/usr/bin/node node_modules/electron-builder/cli.js \
		--config config/electron-builder.config.cjs \
		--dir --publish=never \
		--config.electronDist="${ELECTRON_DIST}" || die
}

src_install() {
	# electron-builder --dir produced dist/linux-unpacked/. Its resources/
	# holds app.asar, app.asar.unpacked (native addons), and the extraResources
	# (CLI shim, ripgrep, runtime node_modules, ...). We do NOT ship the
	# bundled Electron runtime (orca-ide, *.pak, lib*.so, locales/) — the
	# launcher below runs the system electron from electron-r1.
	local mydir="/usr/$(get_libdir)/orca"

	insinto "${mydir}"
	doins -r dist/linux-unpacked/resources/* || die

	# Pin process.resourcesPath to the install dir at runtime; see the file.
	doins "${FILESDIR}/resources-path-override.cjs" || die

	# doins strips exec bits, so restore the ones electron-builder's afterPack
	# hooks set in dist/ (chmodUnixCliLaunchers, the agent-browser chmod,
	# placeAppImageNodeRuntime). fperms is relative to the image root, so
	# include ${mydir}.
	local arch
	[[ ${CHOST} == *aarch64* ]] && arch=arm64 || arch=x64
	fperms 0755 "${mydir}/bin/orca-ide" || die
	fperms 0755 "${mydir}/agent-browser-linux-${arch}" || die
	fperms 0755 "${mydir}/node-runtime/bin/node" || die

	# The app resolves rg as <resourcesPath>/ripgrep/<os>-<arch>/rg and never
	# falls back to a PATH rg in a packaged install, so the bundled
	# multi-platform set becomes a shim to the system ripgrep.
	rm -rf "${ED}${mydir}/ripgrep" || die
	local rgshim="${ED}${mydir}/ripgrep/linux-${arch}/rg"
	mkdir -p "$(dirname "${rgshim}")" || die
	printf '#!/bin/sh\nexec /usr/bin/rg "$@"\n' > "${rgshim}" || die
	fperms 0755 "${mydir}/ripgrep/linux-${arch}/rg"

	# The Wayland helper is staged via extraResources into resources/bin; make
	# sure it is executable (upstream's finalize hook would have chmod'd it).
	if use wayland; then
		fperms 0755 "${mydir}/bin/orca-wayland-clipboard" || die
	fi

	# Launcher: run the app.asar with the selected system electron slot,
	# forwarding user flags from ~/.config/orca-flags.conf.
	local launcher="${mydir}/orca-ide"
	cp "${FILESDIR}/read_flags_file" "${ED}${launcher}" || die
	sed -i "s|@ELECTRON@|orca|" "${ED}${launcher}" || die
	echo "ELECTRON_FORCE_IS_PACKAGED=1 \"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/electron\" \
--require \"${mydir}/resources-path-override.cjs\" ${mydir}/app.asar \"\${flags[@]}\" \"\$@\"" >> "${ED}${launcher}"
	fperms 0755 "${launcher}"
	dosym "../$(get_libdir)/orca/orca-ide" /usr/bin/orca-ide

	# bin/orca-ide (the CLI the app's CliInstaller shim execs) resolves the
	# electron runtime by probing the parent of the install dir for an
	# executable named orca-ide/orca/Orca (upstream layout: the renamed
	# electron binary sits beside resources/). Bridge the system electron
	# slot to that probe name so the CLI finds the runtime.
	dosym "electron-${ELECTRON_SLOT}/electron" /usr/$(get_libdir)/orca-ide

	# Icons: keep the legacy pixmaps copy (tools that only search that dir),
	# plus hicolor copies for the icon-theme cache. GTK only looks in
	# directories declared in the theme's index.theme, and
	# x11-themes/hicolor-icon-theme (0.17) stops at 512x512, so the 256 copy
	# is what actually resolves for menus and notification daemons like
	# xfce4-notifyd; the 1024 one is for systems with a newer index.theme.
	# The desktop entry must reference the icon by absolute path: a themed
	# name "orca-ide" is looked up with context-shortening fallbacks
	# (orca-ide -> orca), and themes like Faenza ship an "orca" icon (the
	# screen reader), which wins over hicolor for menus and notifications.
	newicon resources/build/icon.png orca-ide.png
	newicon -s 256 resources/icon.png orca-ide.png
	newicon -s 1024 resources/build/icon.png orca-ide.png
	make_desktop_entry "/usr/bin/orca-ide %U" Orca \
		"/usr/share/pixmaps/orca-ide.png" "Development" \
		"StartupWMClass=orca"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
