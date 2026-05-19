# Copyright 2009-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Use following environment variables to customise the build
# EXTRA_GN — pass extra options to gn
# NINJAOPTS="-k0 -j8" useful to populate ccache even if ebuild is still failing
# UGC_SKIP_PATCHES — space-separated list of patches to skip
# UGC_KEEP_BINARIES — space-separated list of binaries to keep
# UGC_SKIP_SUBSTITUTION — space-separated list of files to skip domain substitution

GN_MIN_VER=0.2354
# chromium-tools/get-chromium-toolchain-strings.py (or just use Chromicler)
# Node for M145+ should be 24.12.0 but that's not packaged in Gentoo yet. See #969145
TEST_FONT="a28b222b79851716f8358d2800157d9ffe117b3545031ae51f69b7e1e1b9a969"
BUNDLED_CLANG_VER="llvmorg-23-init-5669-g8a0be0bc-4"
BUNDLED_RUST_VER="6f54d591c3116ee7f8ce9321ddeca286810cc142-7"
RUST_SHORT_HASH=${BUNDLED_RUST_VER:0:10}-${BUNDLED_RUST_VER##*-}
NODE_VER="24.12.0"
ESBUILD_VER="0.25.1"
ROLLUP_VER="4.57.1" # currently manual.
VIRTUALX_REQUIRED="pgo"

CHROMIUM_LANGS="af am ar as az be bg bn bs ca cs cy da de el en-GB es es-419 et eu fa fi fil
	fr fr-CA gl gu he hi hr hu hy id is it ja ka kk km kn ko ky lo lt lv mk ml mn mr ms my
	nb ne nl or pa pl pt-BR pt-PT ro ru si sk sl sq sr sr-Latn sv sw ta te th tr uk ur uz
	vi zh-CN zh-HK zh-TW zu"

LLVM_COMPAT=( 21 22 23 )
PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="xml(+)"
RUST_MIN_VER=1.91.0
RUST_NEEDS_LLVM="yes please"
RUST_OPTIONAL="yes" # Not actually optional, but we don't need system Rust (or LLVM) with USE=bundled-toolchain
RUST_REQ_USE="rustfmt" # Upstream run rustfmt on bindgen output, so we need it to be available.

CHROMIUM_VERSION_WARNING="false"
CHROMIUM_VERSION="148.0.7778.97"
CHROMIUM_P="chromium-${CHROMIUM_VERSION}"
NODE_VERSION="24.15.0"
NODE_P="node-v${NODE_VERSION}"
UGC_PVR="148.0.7778.96-1"
UGC_PF="ungoogled-chromium-${UGC_PVR}"
UGC_WD="${WORKDIR}/${UGC_PF}"

inherit check-reqs chromium-2 desktop flag-o-matic llvm-r1 multiprocessing ninja-utils pax-utils
inherit python-any-r1 readme.gentoo-r1 rust systemd toolchain-funcs xdg-utils

DESCRIPTION="Cross platform application development framework based on web technologies"
HOMEPAGE="https://electronjs.org/"
PPC64_HASH="a85b64f07b489b8c6fdb13ecf79c16c56c560fc6"
PATCH_V="${CHROMIUM_VERSION%%\.*}-3"
COPIUM_COMMIT="fe1caafa06f27542c18a881348f78e984e2d9fe2"
SRC_URI="https://commondatastorage.googleapis.com/chromium-browser-official/${CHROMIUM_P}-lite.tar.xz
	https://deps.gentoo.zip/www-client/chromium/rollup-wasm-node-${ROLLUP_VER}.tgz
	https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/${PATCH_V}/chromium-patches-${PATCH_V}.tar.bz2
	!bundled-toolchain? (
		https://codeberg.org/selfisekai/copium/archive/${COPIUM_COMMIT}.tar.gz
			-> chromium-patches-copium-${COPIUM_COMMIT:0:10}.tar.gz
	)
	bundled-toolchain? (
		https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/clang-${BUNDLED_CLANG_VER}.tar.xz
			-> chromium-clang-${BUNDLED_CLANG_VER}.tar.xz
		https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/rust-toolchain-${BUNDLED_RUST_VER}-${BUNDLED_CLANG_VER%-*}.tar.xz
			-> chromium-rust-toolchain-${RUST_SHORT_HASH}-${BUNDLED_CLANG_VER%-*}.tar.xz
	)
	ppc64? (
		https://gitlab.raptorengineering.com/raptor-engineering-public/chromium/openpower-patches/-/archive/${PPC64_HASH}/openpower-patches-${PPC64_HASH}.tar.bz2 -> chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	)
	https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.xz
	https://github.com/electron/electron/archive/v${PV}.tar.gz -> ${P}.tar.gz
"
	# https://github.com/chromium-linux-tarballs/chromium-tarballs/releases/download/${CHROMIUM_P}/${CHROMIUM_P}-linux.tar.xz
	# https://github.com/electron/electron/archive/v42.0.0-beta.8.tar.gz -> ${P}.tar.gz

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Base64 Boost-1.0 CC-BY-3.0 CC-BY-4.0 Clear-BSD FFT2D FTL"
LICENSE+=" IJG ISC LGPL-2 LGPL-2.1 MIT MPL-1.1 MPL-2.0 Ms-PL PSF-2 SGI-B-2.0 SSLeay SunSoft Unicode-3.0"
LICENSE+=" Unicode-DFS-2015 Unlicense UoI-NCSA ZLIB libtiff openssl"

SLOT="$(ver_cut 1)/$(ver_cut 2-)"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE_SYSTEM_LIBS="abseil-cpp av1 brotli crc32c double-conversion ffmpeg +harfbuzz icu jsoncpp +libusb libvpx +openh264 openjpeg re2 snappy woff2 +zstd"
IUSE="+X bindist bluetooth bundled-toolchain cups custom-cflags debug dev-dependencies ffmpeg-chromium gtk4 hangouts kerberos +libcxx nvidia optimize-thinlto optimize-webui pax-kernel pgo"
IUSE+=" +proprietary-codecs pulseaudio screencast selinux thinlto ungoogled vaapi wayland cpu_flags_ppc_vsx3"
RESTRICT="
	!bindist? ( bindist )
	!system-ffmpeg? ( proprietary-codecs? ( bindist ) )
	!system-openh264? ( bindist )
	network-sandbox
"

REQUIRED_USE="
	ffmpeg-chromium? ( bindist proprietary-codecs )
	optimize-thinlto? ( thinlto )
	x86? ( !thinlto )
	vaapi? ( !system-av1 !system-libvpx )
"

# UGC_COMMIT_ID="eb8121bdae2469f4e0a3634437e99ff687c0e55f"

#declare -A CHROMIUM_COMMITS=(
#	["fcfb1a42813f1e9d8babedc7bb2e0f06101a3151"]="." #148+
#	["-acb47d9a6b56c4889a2ed4216e9968cfc740086c"]="."
#	# ["-37c28a19804e47a68eabf3cf882a310689fc325b"]="." #disable style check for cromite
#	# ["cd5a0df905a28faa89ff2a4ab44f893f84dc4487"]="net/third_party/quiche/src"
#)

UGC_URL="https://github.com/ungoogled-software/ungoogled-chromium/archive/"

if [ -z "$UGC_COMMIT_ID" ]; then
	UGC_URL="${UGC_URL}${UGC_PVR}.tar.gz -> ${UGC_PF}.tar.gz"
	UGC_WD="${WORKDIR}/${UGC_PF}"
else
	UGC_URL="${UGC_URL}${UGC_COMMIT_ID}.tar.gz -> ungoogled-chromium-${UGC_COMMIT_ID}.tar.gz"
	UGC_WD="${WORKDIR}/ungoogled-chromium-${UGC_COMMIT_ID}"
fi

SRC_URI+="ungoogled? ( ${UGC_URL} )
"

if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
	# for i in "${CHROMIUM_COMMITS[@]}"; do
	for i in "${!CHROMIUM_COMMITS[@]}"; do
		if [[ ${CHROMIUM_COMMITS[$i]} =~ webrtc ]]; then
		#TODO: is it safe to use this mirror?
		SRC_URI+="https://github.com/webrtc-mirror/webrtc/commit/${i/-}.patch?full_index=true -> webrtc-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ angle ]]; then
		SRC_URI+="https://github.com/google/angle/commit/${i/-}.patch?full_index=true -> angle-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ quiche ]]; then
		SRC_URI+="https://github.com/google/quiche/commit/${i/-}.patch?full_index=true -> quiche-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ dawn ]]; then
		SRC_URI+="https://github.com/google/dawn/commit/${i/-}.patch?full_index=true -> dawn-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ perfetto ]]; then
		SRC_URI+="https://github.com/google/perfetto/commit/${i/-}.patch?full_index=true -> perfetto-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ ink ]]; then
		SRC_URI+="https://github.com/google/ink/commit/${i/-}.patch?full_index=true -> ink-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ vulkan-utility-libraries ]]; then
		SRC_URI+="https://github.com/KhronosGroup/Vulkan-Utility-Libraries/commit/${i/-}.patch?full_index=true -> vulkan-utility-libraries-${i/-}.patch
		"
		elif [[ ${CHROMIUM_COMMITS[$i]} =~ ruy ]]; then
		SRC_URI+="https://github.com/google/ruy/commit/${i/-}.patch?full_index=true -> ruy-${i/-}.patch
		"
		else
		SRC_URI+="https://github.com/chromium/chromium/commit/${i/-}.patch?full_index=true -> chromium-${i/-}.patch
		"
		fi
	done
fi

for i in ${IUSE_SYSTEM_LIBS}; do
	[[ $i =~ ^(\+)?(.*)$ ]]
	IUSE+=" ${BASH_REMATCH[1]}system-${BASH_REMATCH[2]}"
done

COMMON_X_DEPEND="
	x11-libs/libXcomposite:=
	x11-libs/libXcursor:=
	x11-libs/libXdamage:=
	x11-libs/libXfixes:=
	>=x11-libs/libXi-1.6.0:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/libXtst:=
	x11-libs/libxshmfence:=
"

# sys-libs/zlib: https://bugs.gentoo.org/930365; -ng is not compatible.
# We _could_ use the bundled minizip, but that's against policy.
COMMON_SNAPSHOT_DEPEND="
	system-icu? ( >=dev-libs/icu-78:= )
	system-abseil-cpp? ( >=dev-cpp/abseil-cpp-20260107.0 )
	system-brotli? ( >=app-arch/brotli-9999 )
	system-crc32c? ( dev-libs/crc32c )
	system-double-conversion? ( dev-libs/double-conversion )
	system-woff2? ( media-libs/woff2 )
	system-snappy? ( app-arch/snappy )
	system-jsoncpp? ( dev-libs/jsoncpp )
	system-openjpeg? ( media-libs/openjpeg:2= )
	system-re2? ( >=dev-libs/re2-0.2019.08.01:= )
	system-libvpx? ( >=media-libs/libvpx-1.13.0:=[postproc] )
	system-libusb? ( virtual/libusb:1 )
	x11-libs/libnotify
	>=dev-libs/libxml2-2.12.4:=[icu]
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	dev-libs/libxslt:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	system-harfbuzz? ( >=media-libs/harfbuzz-3:0=[icu(-)] )
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	system-zstd? ( >=app-arch/zstd-1.5.5:= )
	>=media-libs/libwebp-0.4.0:=
	media-libs/mesa:=[gbm(+)]
	>=media-libs/openh264-1.6.0:=
	system-av1? (
		>=media-libs/dav1d-1.0.0:=
		>=media-libs/libaom-3.7.0:=
	)
	sys-libs/zlib:=
	dev-libs/glib:2
	>=media-libs/alsa-lib-1.0.19:=
	pulseaudio? (
		|| (
			media-libs/libpulse
			>=media-sound/apulse-0.1.9
		)
	)
	sys-apps/pciutils:=
	kerberos? ( virtual/krb5 )
	vaapi? ( >=media-libs/libva-2.7:=[X?,wayland?] )
	X? (
	x11-base/xorg-proto:=
	x11-libs/libX11:=
	x11-libs/libxcb:=
	x11-libs/libXext:=
	)
	x11-libs/libxkbcommon:=
	wayland? (
		dev-libs/libffi:=
		dev-libs/wayland:=
		screencast? (
			media-video/pipewire:=
			|| (
				sys-apps/xdg-desktop-portal-gnome
				sys-apps/xdg-desktop-portal-gtk
				kde-plasma/xdg-desktop-portal-kde
				gui-libs/xdg-desktop-portal-lxqt
				gui-libs/xdg-desktop-portal-wlr
			)
		)
	)
"

COMMON_DEPEND="
	app-eselect/eselect-electron
	${COMMON_SNAPSHOT_DEPEND}
	app-arch/bzip2:=
	dev-libs/expat:=
	system-ffmpeg? (
		>=media-video/ffmpeg-6.1:=
		>=media-libs/opus-1.3.1:=
	)
	net-misc/curl[ssl]
	sys-apps/dbus:=
	media-libs/flac:=
	sys-libs/zlib:=[minizip]
	>=app-accessibility/at-spi2-core-2.46.0:2
	media-libs/mesa:=[X?,wayland?]
	cups? ( >=net-print/cups-1.3.11:= )
	virtual/udev
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:2
	x11-libs/pango:=
	X? ( ${COMMON_X_DEPEND} )
"

RDEPEND="${COMMON_DEPEND}
	|| (
		x11-libs/gtk+:3[X?,wayland?]
		gui-libs/gtk:4[X?,wayland?]
	)
	virtual/ttf-fonts
	selinux? ( sec-policy/selinux-chromium )
	bindist? (
		ffmpeg-chromium? ( media-video/ffmpeg-chromium:${PV%%\.*} )
	)
"

DEPEND="${COMMON_DEPEND}
	gtk4? ( gui-libs/gtk:4[X?,wayland?] )
	!gtk4? ( x11-libs/gtk+:3[X?,wayland?] )
"

	# pgo? ( >=llvm-core/clang-22.0.0_pre20260106 >=llvm-core/lld-22.0.0_pre20260106	)
BDEPEND="
	${COMMON_SNAPSHOT_DEPEND}
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	>=app-arch/gzip-1.7
	!bundled-toolchain? ( $(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}
		llvm-core/llvm:${LLVM_SLOT}
		llvm-core/lld:${LLVM_SLOT}
		')
		${RUST_DEPEND}
	)
	>=dev-util/bindgen-0.72.1
	>=dev-build/gn-${GN_MIN_VER}
	app-alternatives/ninja
	dev-lang/perl
	>=dev-util/gperf-3.2
	dev-util/esbuild:${ESBUILD_VER}
	dev-vcs/git
	>=net-libs/nodejs-${NODE_VER}[inspector]
	sys-apps/hwdata
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	x11-misc/xdg-utils
"

S="${WORKDIR}/${CHROMIUM_P}"

python_check_deps() {
	python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

pre_build_checks() {
	# Check build requirements: bugs #471810, #541816, #914220
	# We're going to start doing maths here on the size of an unpacked source tarball,
	# this should make updates easier as chromium continues to balloon in size.
	# xz -l /var/cache/distfiles/chromium-${PV}*.tar.xz
	local base_disk=9 # Round up
	# use test && base_disk=$((base_disk + 5))
	local extra_disk=1 # Always include a little extra space
	local memory=4
	tc-is-cross-compiler && extra_disk=$((extra_disk * 2))
	if tc-is-lto || use pgo; then
		memory=$((memory * 2 + 1))
		tc-is-cross-compiler && extra_disk=$((extra_disk * 2)) # Double the requirements
		use pgo && extra_disk=$((extra_disk + 4))
	fi
	if is-flagq '-g?(gdb)?([1-9])'; then
		if use custom-cflags; then
			extra_disk=$((extra_disk + 5))
		fi
		memory=$((memory * 2))
	fi
	local CHECKREQS_MEMORY="${memory}G"
	local CHECKREQS_DISK_BUILD="$((base_disk + extra_disk))G"
	check-reqs_${EBUILD_PHASE_FUNC}
}

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		# The pre_build_checks are all about compilation resources, no need to run it for a binpkg
		pre_build_checks
	fi

	if ! use bindist && use ffmpeg-chromium; then
		ewarn "Ignoring USE=ffmpeg-chromium, USE=bindist is not set."
	fi
	if use libcxx; then
		ewarn
		ewarn "Building with libcxx, please be aware that system-*"
		ewarn "and some other c++ dependencies need to be compiled"
		ewarn "with the same c++ library as ungoogled-chromium itself"
		ewarn "dev-libs/jsoncpp is most problematic, see #58 #49 #119 for details"
		ewarn "Simplest solution would be to disable corresponding system-* flags"
		ewarn
	fi
	if [ "$CHROMIUM_VERSION_WARNING" = "true" ]; then
		ewarn
		ewarn "Chromium ${CHROMIUM_VERSION} will be used instead of the required one"
		ewarn
	fi

	ewarn
	ewarn "network-sandbox is disabled because of yarn"
	ewarn "Please do not file a bug unless you have a better solution"
	ewarn
}

pkg_setup() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		# The pre_build_checks are all about compilation resources, no need to run it for a binpkg
		pre_build_checks

		# We haven't massaged any CFLAGS yet, so we want to do this before we force CC/CXX to prevent warnings.
		local want_lto="false"
		tc-is-lto && want_lto="true"

		# The linux:unbundle toolchain in GN grabs CC, CXX, CPP (etc) from the environment
		# We'll set these to clang here then use llvm-utils functions to very explicitly set these
		# to a sane value.
		# This is effectively the 'force-clang' path if GCC support is re-added.
		if use !bundled-toolchain; then
			llvm-r1_pkg_setup
			rust_pkg_setup

			# Forcing clang; respect llvm_slot_x to enable selection of impl via LLVM_COMPAT
			AR=llvm-ar
			CPP="${CHOST}-clang++-${LLVM_SLOT} -E"
			NM=llvm-nm
			CC="${CHOST}-clang-${LLVM_SLOT}"
			CXX="${CHOST}-clang++-${LLVM_SLOT}"
		fi

		use_lto="false"
		local lto_usable="true"
		if [[ "$want_lto" == "true" ]]; then
			if use arm64 && [[ "${LLVM_SLOT}" -lt 22 ]]; then
				einfo "LTO is broken with LLVM 21 on arm64, ignoring CFLAGS."
				lto_usable="false"
			else
				use_lto="true"
			fi
			# We can rely on GN to do this for us; without this builds
			# take significantly longer with LTO enabled.
			filter-lto
		fi

		if [[ "$use_lto" == "false" ]] && [[ "$lto_usable" == "true" ]]; then
			einfo "USE=official selected and LTO not detected."
			einfo "It is _highly_ recommended that LTO be enabled for performance reasons"
			einfo "and to be consistent with the upstream \"official\" build optimisations."
		fi

		export use_lto

		# 936858
		if tc-ld-is-mold; then
			eerror "Your toolchain is using the mold linker."
			eerror "This is not supported by Chromium."
			die "Please switch to a different linker."
		fi

		if tc-is-cross-compiler; then
			use pgo && die "The pgo USE flag cannot be used when cross-compiling"
			CPP="${CBUILD}-clang++-${LLVM_SLOT} -E"
		fi

		# Sanity checks for development convenience
		if ver_test $(gn --version || die) -lt ${GN_MIN_VER}; then
			die "dev-build/gn >= ${GN_MIN_VER} is required to build this Chromium"
		fi

		# Sometimes, when adding a new LLVM slot, devs (me) forget to install an appropriate lld.
		local lld_ver=$(ld.lld --version | awk '{split($2,a,"."); print a[1]}' || die "Failed to check lld version")
		if [[ ${lld_ver} -lt ${LLVM_SLOT} ]]; then
			die "Your lld version (${lld_ver}) is too old for the selected LLVM slot (${LLVM_SLOT}). Please install a newer lld or select an older LLVM slot."
		fi
	fi

	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
#	# Here be dragons!
#	local XCLD="--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/instrumented_libs  \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/llvm \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/llvm-build \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/node/linux \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/rust-src \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/rust-toolchain \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/build/linux/debian_bullseye_i386-sysroot \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/build/linux/debian_bullseye_amd64-sysroot \
#		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/angle/third_party/VK-GL-CTS \
#	"
#
#	if ! use libcxx ; then
#		XCLD+=" --exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/libc++"
#	fi
#
#	if ! use pgo ; then
#		XCLD+=" --exclude=chromium-${CHROMIUM_VERSION/_*}/chrome/build/pgo_profiles"
#	fi
#
#	einfo "Unpacking chromium-${CHROMIUM_VERSION/_*}.tar.xz to ${WORKDIR}"
#	tar ${XCLD} -xf "${DISTDIR}/chromium-${CHROMIUM_VERSION/_*}-lite.tar.xz" -C "${WORKDIR}" || die
#
#	unpack "${P}.tar.gz"
#	unpack "node-v${NODE_VERSION}.tar.xz"
#
#	#unpack chromium-patches-${PATCH_V}.tar.bz2
#	# Warned you!

	unpack ${CHROMIUM_P}-lite.tar.xz
	# unpack chromium-${CHROMIUM_VERSION/_*}-linux.tar.xz
	unpack chromium-patches-${PATCH_V}.tar.bz2
	# These should only be required when we're not using the official toolchain
	if use !bundled-toolchain; then
		unpack chromium-patches-copium-${COPIUM_COMMIT:0:10}.tar.gz
	fi

	# We need to manually unpack this since M126 else we'd unpack one toolchain over the other.
	# Since we're doing that anyway let's unpack to sensible locations to make symlink creation easier.
	if use bundled-toolchain; then
		einfo "Unpacking bundled Clang ..."
		mkdir -p "${WORKDIR}"/clang || die "Failed to create clang directory"
		tar xf "${DISTDIR}/chromium-clang-${BUNDLED_CLANG_VER}.tar.xz" -C "${WORKDIR}/clang" || die "Failed to unpack Clang"
		einfo "Unpacking bundled Rust ..."
		local rust_dir="${WORKDIR}/rust-toolchain"
		mkdir -p "${rust_dir}" || die "Failed to create rust toolchain directory"
		tar xf "${DISTDIR}/chromium-rust-toolchain-${RUST_SHORT_HASH}-${BUNDLED_CLANG_VER%-*}.tar.xz" -C "${rust_dir}" ||
			die "Failed to unpack Rust"
	fi

	unpack "${P}.tar.gz"
	# mv "${WORKDIR}/electron-42.0.0-beta.8" "${WORKDIR}/${P}"
	unpack "node-v${NODE_VERSION}.tar.xz"

	if use ppc64; then
		unpack chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	fi

	# This is a dirty hack, but we need rollup to build successfully and it's proving to be challenging
	# to build locally due to deps
	unpack rollup-wasm-node-${ROLLUP_VER}.tgz

	use ungoogled && unpack ${UGC_URL#*->}
}

remove_compiler_builtins() {
	# We can't use the bundled compiler builtins with the system toolchain
	# We used to `grep` then `sed`, but it was indirect. Combining the two into a single
	# `awk` command is more efficient and lets us document the logic more clearly.

	local pattern='    configs += [ "//build/config/clang:compiler_builtins" ]'
	local target='build/config/compiler/BUILD.gn'

	local tmpfile
	tmpfile=$(mktemp) || die "Failed to create temporary file."

	if awk -v pat="${pattern}" '
	BEGIN {
		match_found = 0
	}

	# If the delete countdown is active, decrement it and skip to the next line.
	d > 0 { d--; next }

	# If the current line matches the pattern...
	$0 == pat {
		match_found = 1   # ...set our flag to true.
		d = 2             # Set delete counter for this line and the next two.
		prev = ""         # Clear the buffered previous line so it is not printed.
		next
	}

	# For any other line, print the buffered previous line.
	NR > 1 { print prev }

	# Buffer the current line to be printed on the next cycle.
	{ prev = $0 }

	END {
		# Print the last line if it was not part of a deleted block.
		if (d == 0) { print prev }

		# If the pattern was never found, exit with a failure code.
		if (match_found == 0) {
		exit 1
		}
	}
	' "${target}" > "${tmpfile}"; then
		# AWK SUCCEEDED (exit code 0): The pattern was found and edited.
		# This is to avoid gawk's `-i inplace` option which users complain about.
		mv "${tmpfile}" "${target}"
	else
		# AWK FAILED (exit code 1): The pattern was not found.
		rm -f "${tmpfile}"
		die "Awk patch failed: Pattern not found in ${target}."
	fi
}

src_prepare() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	# We'll fill this in as we go. Patches go in chromium-patches.
	local PATCHES=()

	rm "${WORKDIR}/chromium-patches-${PATCH_V}/common/cr131-unbundle-icu-target.patch"
	if use pgo; then
		rm "${WORKDIR}/chromium-patches-${PATCH_V}/rust/cr146-fix-botched-bytemuck-roll.patch"
		sed -i '/SupportedLaneCount/d' third_party/rust/chromium_crates_io/vendor/bytemuck-v1/src/zeroable.rs || die
		sed -i '/SupportedLaneCount/d' third_party/rust/chromium_crates_io/vendor/bytemuck-v1/src/pod.rs || die
	fi

	#cp -f ${WORKDIR}/chromium-patches-${PATCH_V}/*-compiler.patch "${T}/compiler.patch"
	##cp -f ${FILESDIR}/chromium-147-compiler.patch "${T}/compiler.patch"
	#if ! use custom-cflags; then #See #25 #92
	#	sed -i '/default_stack_frames/Q' "${T}/compiler.patch" || die
	#fi

	PATCHES+=( "${WORKDIR}/chromium-patches-${PATCH_V}/common/" )
	PATCHES+=( "${FILESDIR}/restore-x86-r3.patch" )

	# https://issues.chromium.org/issues/442698344
	# Unreleased fontconfig changed magic numbers and google have rolled to this version
	if has_version "<=media-libs/fontconfig-2.17.1"; then
		PATCHES+=( "${FILESDIR}/chromium-142-work-with-old-fontconfig.patch" )
	fi

	if use bundled-toolchain; then
		# We need to symlink the toolchain into the expected location
		einfo "Symlinking Clang toolchain to expected location ..."
		mkdir -p third_party/llvm-build/ || die "Failed to create llvm-build directory"
		# the 'Chromium Linux Tarballs' seem to already have 'Release+Asserts/{lib,bin}'; not sure if this is an
		# upstream change - we're using the same scripts to build, theoretically. We'll still attempt to create
		# llvm-build, but we'll rm Release+Asserts and symlink directly.
		if [[ -d third_party/llvm-build/Release+Asserts ]]; then
			rm -r third_party/llvm-build/Release+Asserts || die "Failed to remove third_party/llvm-build/Release+Asserts"
		fi
		ln -s "${WORKDIR}"/clang third_party/llvm-build/Release+Asserts || die "Failed to bundle Clang"
		einfo "Symlinking Rust toolchain to expected location ..."
		# As above, so below
		if [[ -d third_party/rust-toolchain ]]; then
			rm -r third_party/rust-toolchain || die "Failed to remove third_party/rust-toolchain"
		fi
		ln -s "${WORKDIR}"/rust-toolchain third_party/rust-toolchain || die "Failed to bundle rust"
		cp "${WORKDIR}"/rust-toolchain/VERSION \
			"${WORKDIR}"/rust-toolchain/INSTALLED_VERSION || die "Failed to set rust version"
	else
		# We don't need our toolchain patches if we're using the official toolchain

		# Copium patches go here.
		PATCHES+=(
			"${WORKDIR}/copium/cr143-libsync-__BEGIN_DECLS.patch"
		)

		# Automate conditional application of chromium-patches
		# The directory structure is expected to be something like:
		# chromium-patches-145/
		# ├── toolchain/
		# │   ├── cr123-foo.patch
		# │   └── cr135-bar.patch
		# ├── llvm/
		# │   ├── cr144-baz.patch
		# │   └── lt-23/
		# │       └── cr145-bleeding-edge-llvm-feature.patch
		# Where `lt-23` means "apply this patch if the LLVM version is less than 23".
		# Only categories in `slot_map` will be checked for version constraints.
		shopt -s nullglob
		local -A slot_map=( [llvm]="${LLVM_SLOT}" [rust]="${RUST_SLOT}" )

		for category in "${WORKDIR}/chromium-patches-${PATCH_V}"/*/; do
			local category_name="${category%/}"
			category_name="${category_name##*/}"

			# Skip arch-specific categories
			if [[ "${category_name}" == "ppc64le" ]]; then
				use ppc64 || continue
			fi

			# We applied common patches above, no need to apply them again here
			[[ "${category_name}" == "common" ]] && continue

			# Unconditional patches for this category
			PATCHES+=( "${category}"*.patch )

			# Version-constrained subdirectories (e.g., llvm/lt-23/)
			for constraint_dir in "${category}"*/; do
				local dir_name="${constraint_dir%/}"
				dir_name="${dir_name##*/}"
				if [[ "${dir_name}" =~ ^lt-(.*)$ && -v slot_map[${category_name}] ]]; then
					ver_test "${slot_map[${category_name}]}" -lt "${BASH_REMATCH[1]}" &&
						PATCHES+=( "${constraint_dir}"*.patch )
				fi
			done
		done

		shopt -u nullglob

		# Strictly speaking this doesn't need to be gated (no bundled toolchain for ppc64); it keeps the logic together
		if use ppc64; then
			local patchset_dir="${WORKDIR}/openpower-patches-${PPC64_HASH}/patches"
			# patch causes build errors on 4K page systems (https://bugs.gentoo.org/show_bug.cgi?id=940304)
			local page_size_patch="ppc64le/third_party/use-sysconf-page-size-on-ppc64.patch"
			local isa_3_patch="ppc64le/core/baseline-isa-3-0.patch"
			# Apply the OpenPOWER patches (check for page size and isa 3.0)
			openpower_patches=( $(grep -E "^ppc64le|^upstream" "${patchset_dir}/series" | grep -v "${page_size_patch}" |
				grep -v "${isa_3_patch}" || die) )
			for patch in "${openpower_patches[@]}"; do
				PATCHES+=( "${patchset_dir}/${patch}" )
			done
			if [[ $(getconf PAGESIZE) == 65536 ]]; then
				PATCHES+=( "${patchset_dir}/${page_size_patch}" )
			fi
			# We use vsx3 as a proxy for 'want isa3.0' (POWER9)
			if use cpu_flags_ppc_vsx3 ; then
				PATCHES+=( "${patchset_dir}/${isa_3_patch}" )
			fi
		fi

		remove_compiler_builtins

		# We can't rely on the eselect'd Rust to actually include rustfmt, so we'll point to the selected slot specifically.
		local suffix=""
		if [[ "${RUST_TYPE}" == "binary" ]]; then
			suffix="-bin-${RUST_SLOT}"
		else
			suffix="-${RUST_SLOT}"
		fi
		sed -i "s|/bin/rustfmt|/bin/rustfmt${suffix}|g" build/rust/rust_bindgen_generator.gni ||
			die "Failed to update rustfmt path"

	fi

	# Do this before we apply patches since (e.g.) ppc64 needs to patch rollup and it's easier in ${S}
	einfo "Moving rollup wasm-node package into place ..."
	mkdir -p third_party/devtools-frontend/src/node_modules/@rollup/wasm-node ||
		die "Failed to create node_modules/@rollup/wasm-node"
	mv "${WORKDIR}"/package/* third_party/devtools-frontend/src/node_modules/@rollup/wasm-node ||
		die "Failed to move rollup package"

	pushd "${WORKDIR}/${P}" > /dev/null || die
#		# sed -i '/web_tests/Q' "patches/chromium/cherry-pick-1eb1e18ad41d.patch" || die
#
#		sed -i 's/std::vector<const/std::vector</' patches/chromium/feat_add_data_parameter_to_processsingleton.patch || die
#		sed -i 's/std::vector<const/std::vector</' shell/browser/api/electron_api_app.cc || die
#		sed -i 's/std::vector<const/std::vector</' shell/browser/api/electron_api_app.h || die
#		# sed -i 's/std::variant/absl::variant/' shell/browser/electron_browser_context.h || die
#		# sed -i 's/std::get_if/absl::get_if/' shell/browser/electron_browser_context.cc || die
#		sed -i 's/constexpr CodeAndShiftedChar/CodeAndShiftedChar/' shell/common/keyboard_util.cc || die
#
#		# sed -i 's/NODE_DIR = os.path.join/NODE_DIR = os.path.abspath(os.path.join/' script/generate-config-gypi.py || die
#		# sed -i "s/'electron_node')/'electron_node'))/" script/generate-config-gypi.py || die
#
#		# sed -i 's/Path(__file__).resolve()/Path(__file__).absolute()/' script/node/generate_node_headers.py || die
#		# sed -i 's/os.path.join(node_root_dir, file)/os.path.abspath(os.path.join(node_root_dir, file))/' script/node/generate_node_headers.py || die
#
#		# #? Funny, huh?
#		# sed -i "s/module.exports.getElectronVersion = () => {/module.exports.getElectronVersion = () => {return '${PV}';/" \
#		# 	script/lib/get-version.js || die
#		# mkdir -p .git/packed-refs .git/HEAD;
#		# sed -i '/git\/packed-refs/d' BUILD.gn || die
#		# sed -i '/git\/HEAD/d' BUILD.gn || die
#
		grep "'--openssl-no-asm'" script/generate-config-gypi.py > /dev/null || die
		NODE_CONFIG_ARGS="'--without-bundled-v8', '--shared-openssl', '--shared-zlib', '--without-npm', '--shared-cares', '--shared-http-parser', '--shared-nghttp2'"
		use system-icu && NODE_CONFIG_ARGS+=", '--with-intl=system-icu'"
		sed -i "s/'--openssl-no-asm'/$NODE_CONFIG_ARGS/" script/generate-config-gypi.py || die

		# See #166
		sed -i '/proprietary_codecs/d' build/args/all.gn || die
		sed -i '/ffmpeg_branding/d' build/args/all.gn || die
		sed -i '/rtc_use_h264/d' build/args/release.gn || die

		use bluetooth || eapply "${FILESDIR}/disable-bluez-electron-r5.patch"

		#if use ungoogled; then
		#	# sed -i '/SecurityStateTabHelper::GetMaliciousContentStatus/Q' "patches/chromium/ssl_security_state_tab_helper.patch" || die
		#	sed -i "s/https/trk:173:https/" "patches/chromium/feat_add_support_for_overriding_the_base_spellchecker_download_url.patch" || die
		#	sed -i "s/AfterWriteCheckResult)> callback) override;/AfterWriteCheckResult)> callback);/" \
		#		"shell/browser/file_system_access/file_system_access_permission_context.h" || die
		#	sed -i '/@@ -38/,+7d' "patches/chromium/refactor_expose_file_system_access_blocklist.patch" || die
		#	sed -i '/test\/BUILD.gn/Q' "patches/chromium/build_do_not_depend_on_packed_resource_integrity.patch" || die
		#fi
		eapply "${FILESDIR}/misc-fixes.patch" || die
		eapply "${FILESDIR}/ozone-detection-fix.patch" || die
	popd > /dev/null || die

	if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
		# for i in "${CHROMIUM_COMMITS[@]}"; do
		for i in "${!CHROMIUM_COMMITS[@]}"; do
			if [[ ${CHROMIUM_COMMITS[$i]} =~ webrtc ]]; then
				patch_prefix="webrtc"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ angle ]]; then
				patch_prefix="angle"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ quiche ]]; then
				patch_prefix="quiche"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ dawn ]]; then
				patch_prefix="dawn"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ perfetto ]]; then
				patch_prefix="perfetto"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ ink ]]; then
				patch_prefix="ink"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ vulkan-utility-libraries ]]; then
				patch_prefix="vulkan-utility-libraries"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ ruy ]]; then
				patch_prefix="ruy"
			else
				patch_prefix="chromium"
			fi
			pushd "${CHROMIUM_COMMITS[$i]}" > /dev/null || die
			if [[ $i = -*  ]]; then
				einfo "Reverting ${patch_prefix}-${i/-}.patch"
				git apply -R --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch" || die
			else
				einfo "Applying ${patch_prefix}-${i/-}.patch"
				git apply --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch" || die
			fi
			popd > /dev/null || die
		done
	fi

	if ! use bluetooth ; then
		PATCHES+=(
			"${FILESDIR}/disable-bluez-r7.patch"
		)
	fi

	if ! use libcxx ; then
		PATCHES+=(
			"${FILESDIR}/fix-wayland-oncecallback-copy.patch"
		)
	fi

	if use system-ffmpeg; then
		PATCHES+=(
			"${FILESDIR}/chromium-141-opus-mp3.patch"
			"${FILESDIR}/chromium-135-hevc.patch"
		)
		sed -i "\!AVFMT_FLAG_NOH264PARSE!d" media/filters/ffmpeg_glue.cc || die
		ewarn "You need to expose \"av_stream_get_first_dts\" in ffmpeg via user patch"
	fi

	if use system-av1; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-av1.patch"
		)
	fi

	if use system-libvpx; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-libvpx.patch"
		)
	fi

	if use system-openjpeg ; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-openjpeg-r4.patch"
		)
	fi

	default

	mv "${WORKDIR}/${P}" electron || die
	mv "${WORKDIR}/${NODE_P}" third_party/electron_node || die

	# if [[ ${LLVM_SLOT} == "19" ]]; then
	# 	# Upstream now hard depend on a feature that was added in LLVM 20.1, but we don't want to stabilise that yet.
	# 	# Do the temp file shuffle in case someone is using something other than `gawk`
	# 	{
	# 		awk '/config\("clang_warning_suppression"\) \{/	{ print $0 " }"; sub(/clang/, "xclang"); print; next }
	# 			{ print }' build/config/compiler/BUILD.gn > "${T}/build.gn" && \
	# 			mv "${T}/build.gn" build/config/compiler/BUILD.gn
	# 	} || die "Unable to disable warning suppression"
	# fi

	# Not included in -lite tarballs, but we should check for it anyway.
	#if [[ -f third_party/node/linux/node-linux-x64/bin/node ]]; then
	#	rm third_party/node/linux/node-linux-x64/bin/node || die
	#else
	#	mkdir -p third_party/node/linux/node-linux-x64/bin || die
	#fi
	#ln -s "${EPREFIX}"/usr/bin/node third_party/node/linux/node-linux-x64/bin/node || die

	cp "${FILESDIR}/libusb.gn" build/linux/unbundle || die
	sed -i '/^REPLACEMENTS.*$/{s++REPLACEMENTS = {"libusb":"third_party/libusb/BUILD.gn",+;h};${x;/./{x;q0};x;q1}' \
		build/linux/unbundle/replace_gn_files.py || die
	sed -i '/^.*deps.*third_party\/jsoncpp.*$/{s++public_deps \+= [ "//third_party/jsoncpp" ]+;h};${x;/./{x;q0};x;q1}' \
		third_party/webrtc/rtc_base/BUILD.gn || die

	if use system-abseil-cpp; then
		eapply "${FILESDIR}/chromium-146-system-abseil.patch"

		#! SFINAE mangling incompatibility between clang and gcc:
		#! https://github.com/llvm/llvm-project/issues/85656
		#! gcc: 	_ZN4absl12lts_202601074CordC1INSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEELi0EEEOT_
		#! clang:	_ZN4absl12lts_202601074CordC1INSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEETnNSt9enable_ifIXsr3std7is_sameIT_S8_EE5valueEiE4typeELi0EEEOSA_
		#! So, either this:
		eapply "${FILESDIR}/chromium-141-system-abseil-cord.patch"
		#! or build with -fclang-abi-compat=17

		# cp -f /usr/include/absl/base/options.h third_party/abseil-cpp/absl/base/options.h
		# sed -i '/^#define ABSL_OPTION_USE_STD_ORDERING.*$/{s++#define ABSL_OPTION_USE_STD_ORDERING 1+;h};${x;/./{x;q0};x;q1}' \
		# 	third_party/abseil-cpp/absl/base/options.h || die
	fi


	if use ungoogled; then
		# From here we adapt ungoogled-chromium's patches to our needs
		local ugc_pruning_list="${UGC_WD}/pruning.list"
		local ugc_patch_series="${UGC_WD}/patches/series"
		local ugc_substitution_list="${UGC_WD}/domain_substitution.list"

		#! conflicting patches
		sed -i '/print_view_manager_base.cc/,+37d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die
		sed -i '/print_view_manager_base.h/,+10d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die
		sed -i '/chrome_file_system_access_permission_context.cc/,+166d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die

		UGC_SKIP_SUBSTITUTION="${UGC_SKIP_SUBSTITUTION} flag-metadata.json histograms.xml \
			chrome_file_system_access_permission_context.cc layer_tree_view.cc http_response_headers.cc \
			graph_builder_tflite.cc password_manual_fallback_flow_unittest.cc"

		local ugc_unneeded=(
			# GN bootstrap
			extra/debian/gn/parallel
			# following Gentoo's Chromium
			core/ungoogled-chromium/build-with-wasm-rollup
			core/ungoogled-chromium/disable-ai
		)

		##* Temporary fix
		#sed -i "\!ios/!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/icu/!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/libjpeg_turbo/!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/snappy/!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/closure_compiler/!d" "${ugc_pruning_list}" || die

		##* Didn't unpack them at the first place
		#sed -i "\!build/linux/debian_bullseye_i386-sysroot!d" "${ugc_pruning_list}" || die
		#sed -i "\!build/linux/debian_bullseye_amd64-sysroot!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/llvm-build!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/node/linux!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/rust-src!d" "${ugc_pruning_list}" || die
		#sed -i "\!third_party/rust-toolchain!d" "${ugc_pruning_list}" || die
		#if ! use libcxx ; then
		#	sed -i "\!third_party/libc!d" "${ugc_pruning_list}" || die
		#fi
		sed -i "s|debug('files|error('files|" \
			"${UGC_WD}/utils/prune_binaries.py" || die
		sed -i "\!third_party/node/linux!d" \
			"${UGC_WD}/utils/prune_binaries.py" || die

		local ugc_p ugc_dir
		for p in "${ugc_unneeded[@]}"; do
			einfo "Removing ${p}.patch"
			sed -i "\!${p}.patch!d" "${ugc_patch_series}" || die
		done

		if [ ! -z "${UGC_SKIP_PATCHES}" ]; then
		for p in ${UGC_SKIP_PATCHES}; do
			ewarn "Removing ${p}"
			sed -i "\!${p}!d" "${ugc_patch_series}" || die
		done
		fi

		if [ ! -z "${UGC_KEEP_BINARIES}" ]; then
		for p in ${UGC_KEEP_BINARIES}; do
			ewarn "Keeping binary ${p}"
			sed -i "\!${p}!d" "${ugc_pruning_list}" || die
		done
		fi

		if [ ! -z "${UGC_SKIP_SUBSTITUTION}" ]; then
		for p in ${UGC_SKIP_SUBSTITUTION}; do
			ewarn "No substitutions in ${p}"
			sed -i "\!${p}!d" "${ugc_substitution_list}" || die
		done
		fi

		ebegin "Pruning binaries"
		"${UGC_WD}/utils/prune_binaries.py" -q . "${UGC_WD}/pruning.list"
		eend $? || die

		ebegin "Applying ungoogled-chromium patches"
		"${UGC_WD}/utils/patches.py" -q apply . "${UGC_WD}/patches"
		eend $? || die

		ebegin "Applying domain substitution"
		"${UGC_WD}/utils/domain_substitution.py" -q apply -r "${UGC_WD}/domain_regex.list" -f "${UGC_WD}/domain_substitution.list" .
		eend $? || die

		sed -i '/packed_resources_integrity_header/d' chrome/test/BUILD.gn || die
	else
		eapply "${FILESDIR}/more-locales.patch"
		eapply "${FILESDIR}/misc-fixes-ung-r3.patch"
	fi

	if use system-zstd; then
		sed -i '/zstd:headers/{s++zstd:zstd_headers+;h};${x;/./{x;q0};x;q1}' \
			electron/patches/node/build_add_gn_build_files.patch || die
	fi

	declare -A patches=(
		["electron/patches/chromium"]="."
		["electron/patches/boringssl"]="third_party/boringssl/src"
		["electron/patches/devtools_frontend"]="third_party/devtools-frontend/src"
		["electron/patches/ffmpeg"]="third_party/ffmpeg"
		["electron/patches/v8"]="v8"
		["electron/patches/node"]="third_party/electron_node"
		["electron/patches/perfetto"]="third_party/perfetto"
		["electron/patches/webrtc"]="third_party/webrtc"
		["electron/patches/sqlite"]="third_party/sqlite/src"
		# ["electron/patches/dawn"]="third_party/dawn"
		# ["electron/patches/pdfium"]="third_party/pdfium"
	)
	for patch_folder in "${!patches[@]}";
	do
		readarray -t topatch < "${patch_folder}/.patches"
		einfo "- ${patch_folder}"
		for i in "${topatch[@]}"; do
			# if	[ "$i" = "feat_add_uv_loop_interrupt_on_io_change_option_to_uv_loop_configure.patch" ]; then
			# 	einfo "Partially applying ${i}"
			# 	pushd "${patches[$patch_folder]}" > /dev/null || die
			# 	git apply -p1 --exclude="test" --exclude="loop.rst" < "${FILESDIR}/$i" || die
			# 	popd > /dev/null || die
			# 	continue;
			# fi
			# if [ "$i" = "cherry-pick-5902d1aa722a.patch" ] ||
			# if	[ "$i" = "regexp_add_a_currently_failing_cctest_for_irregexp_reentrancy.patch" ]; then
			# 	einfo "Skipping ${i}: No files to patch."
			# 	continue;
			# fi
			# if [ "$i" = "cherry-pick-b173791bf402.patch" ] ||
			# 	[ "$i" = "cherry-pick-be87466afecb.patch" ] ||
			# 	[ "$i" = "cherry-pick-c0390bcd64ba.patch" ] ||
			# 	[ "$i" = "cherry-pick-1b69067db7d2.patch" ] ||
			# 	[ "$i" = "cherry-pick-d513cd2fe668.patch" ] ||
			# 	[ "$i" = "cherry-pick-dc5e20c4c055.patch" ] ||
			# 	[ "$i" = "cherry-pick-847b11ad2fa3.patch" ] ||
			# 	[ "$i" = "cherry-pick-fc79e8cc2dfc.patch" ]; then
			# 		ewarn "Skipping ${i}: already applied"
			# 		continue;
			# fi
			if [ "$i" = "cherry-pick-dd8e2822e507.patch" ] ||
				[ "$i" = "revert_enable_crel_for_arm32_targets.patch" ]; then
				ewarn "Skipping ${i} due to... reasons..."
				continue;
			fi
			if [ "$i" = "sysroot.patch" ] ||
				[ "$i" = "build_disable_print_content_analysis.patch" ]; then
				if use ungoogled; then
					ewarn "Skipping ${i} due to ungoogled."
					continue;
				fi
			fi
			# if [ "$i" = "fix_preserve_proper_method_names_as-is_in_error_stack.patch" ]; then
			# 	einfo "Git binary patch: ${i}"
			# 	pushd "${patches[$patch_folder]}" > /dev/null || die
			# 	git apply -p1 < "${S}/${patch_folder}/$i" || die
			# 	popd > /dev/null || die
			# 	continue;
			# fi
			# pushd "${patches[$patch_folder]}" > /dev/null || die
			# eapply "${S}/${patch_folder}/$i" || die
			# popd > /dev/null || die
			pushd "${patches[$patch_folder]}" > /dev/null || die
			einfo "$i"
			# ebegin "$i"
			git apply --exclude="*/web_tests/*" --exclude="*/test-list/*" \
				--exclude="*/uv/test/*" --exclude="*.rst" \
				--exclude="*/cctest/*" --exclude="*/unittests/*" \
				--exclude="*/test/data/*" --exclude="*/.eslintrc*" \
				--exclude="*/__config_site" \
				-p1 < "${S}/${patch_folder}/$i" || die
			# eend $? || die
			popd > /dev/null || die
		done
	done

	elog "Removing bundled binaries from source tree ..."
	# Purge bundled ELF files: These are non-portable and will cause issues if used instead of system versions.
	# Use `--wasm` to also remove WebAssembly binaries, if desired - they're portable so shouldn't break builds.
	${EPYTHON} "${FILESDIR}/bin-finder.py" --elf "${S}" | awk '{print $1}' | xargs rm -f ||
		die "Failed to remove bundled binaries"

	# And now we restore any that we actually need, from the host system
	local esbuild_path="${S}/third_party/devtools-frontend/src/third_party/esbuild"
	local -A restore_list=(
		["/usr/bin/esbuild-${ESBUILD_VER}"]="${esbuild_path}/esbuild"
		["/usr/bin/gperf"]="${S}/third_party/gperf/cipd/bin/gperf"
		["/usr/bin/node"]="${S}/third_party/node/linux/node-linux-x64/bin/node"
	)

	for src in "${!restore_list[@]}"; do
		dst="${restore_list[${src}]}"
		if [[ -f "${src}" ]]; then
			einfo "Symlinking ${src} ..."
			# Make sure the parent dir exists; some tarballs don't include (e.g.) node's bindir
			mkdir -p "$(dirname "${dst}")" || die "Failed to create directory for ${dst}"
			ln -s "${src}" "${dst}" || die "Failed to symlink ${dst} from ${src}"
			if [[ ! -L "${dst}" || "$(readlink -f "${dst}")" != "${src}" ]]; then
				die "Symlink verification failed for ${dst} -> ${src}"
			fi
		else
			die "Expected to find ${src} to restore ${dst}, but it does not exist."
		fi
	done

	# adjust python interpreter version
	sed -i -e "s|\(^script_executable = \).*|\1\"${EPYTHON}\"|g" .gn || die

	# Use the system copy of hwdata's usb.ids; upstream is woefully out of date (2015!)
	sed 's|//third_party/usb_ids/usb.ids|/usr/share/hwdata/usb.ids|g' \
		-i services/device/public/cpp/usb/BUILD.gn || die "Failed to set system usb.ids path"

	# remove_bundled_libraries.py walks the source tree and looks for paths containing the substring 'third_party'
	# whitelist matches use the right-most matching path component, so we need to whitelist from that point down.
	local keeplibs=(
		base/third_party/cityhash
	)
	use system-double-conversion || keeplibs+=(
		base/third_party/double_conversion
	)
	keeplibs+=(
		base/third_party/icu
		base/third_party/nspr
		base/third_party/superfasthash
		base/third_party/symbolize
		base/third_party/xdg_user_dirs
		buildtools/third_party/libc++
		buildtools/third_party/libc++abi
		net/third_party/mozilla_security_manager
		net/third_party/quic
		net/third_party/uri_template
	)
	use system-abseil-cpp || keeplibs+=(
		third_party/abseil-cpp
	)
	keeplibs+=(
		third_party/angle
		third_party/angle/src/common/third_party/xxhash
		third_party/angle/src/third_party/ceval
	)
	use nvidia || keeplibs+=(
		third_party/angle/src/third_party/libXNVCtrl
	)
	keeplibs+=(
		third_party/angle/src/third_party/volk
		third_party/anonymous_tokens
		third_party/apple_apsl
		third_party/axe-core
		third_party/bidimapper
		third_party/blink
		third_party/boringssl
		third_party/boringssl/src/third_party/fiat
		third_party/breakpad
		third_party/breakpad/breakpad/src/third_party/curl
	)
	use system-brotli || keeplibs+=(
		third_party/brotli
	)
	keeplibs+=(
		third_party/catapult
		third_party/catapult/common/py_vulcanize/third_party/rcssmin
		third_party/catapult/common/py_vulcanize/third_party/rjsmin
		third_party/catapult/third_party/beautifulsoup4-4.9.3
		third_party/catapult/third_party/html5lib-1.1
		third_party/catapult/third_party/polymer
		third_party/catapult/third_party/six
		third_party/catapult/third_party/typ
		third_party/catapult/tracing/third_party/d3
		third_party/catapult/tracing/third_party/gl-matrix
		third_party/catapult/tracing/third_party/jpeg-js
		third_party/catapult/tracing/third_party/jszip
		third_party/catapult/tracing/third_party/mannwhitneyu
		third_party/catapult/tracing/third_party/oboe
		third_party/catapult/tracing/third_party/pako
		third_party/ced
		third_party/cld_3
		third_party/closure_compiler
	)
	use libcxx && keeplibs+=(
		third_party/compiler-rt
	)
	keeplibs+=(
		third_party/content_analysis_sdk
		third_party/cpuinfo
		third_party/crabbyavif
		third_party/crashpad
		third_party/crashpad/crashpad/third_party/lss
		third_party/crashpad/crashpad/third_party/zlib
	)
	use system-crc32c || keeplibs+=(
		third_party/crc32c
	)
	keeplibs+=(
		third_party/cros_system_api
		third_party/d3
		third_party/dawn
		third_party/dawn/third_party/gn/webgpu-cts
		third_party/dawn/third_party/OpenGL-Registry
		third_party/dawn/third_party/renderdoc
		third_party/dawn/third_party/webgpu-headers
		third_party/depot_tools
		third_party/devscripts
		third_party/devtools-frontend
		third_party/devtools-frontend/src/front_end/third_party/acorn
		third_party/devtools-frontend/src/front_end/third_party/additional_readme_paths.json
		third_party/devtools-frontend/src/front_end/third_party/axe-core
		third_party/devtools-frontend/src/front_end/third_party/chromium
		third_party/devtools-frontend/src/front_end/third_party/codemirror
		third_party/devtools-frontend/src/front_end/third_party/csp_evaluator
		third_party/devtools-frontend/src/front_end/third_party/diff
		third_party/devtools-frontend/src/front_end/third_party/i18n
		third_party/devtools-frontend/src/front_end/third_party/intl-messageformat
		third_party/devtools-frontend/src/front_end/third_party/json5
		third_party/devtools-frontend/src/front_end/third_party/legacy-javascript
		third_party/devtools-frontend/src/front_end/third_party/lighthouse
		third_party/devtools-frontend/src/front_end/third_party/lit
		third_party/devtools-frontend/src/front_end/third_party/marked
		third_party/devtools-frontend/src/front_end/third_party/puppeteer
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/parsel-js
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/rxjs
		third_party/devtools-frontend/src/front_end/third_party/source-map-scopes-codec
		third_party/devtools-frontend/src/front_end/third_party/third-party-web
		third_party/devtools-frontend/src/front_end/third_party/vscode.web-custom-data
		third_party/devtools-frontend/src/front_end/third_party/wasmparser
		third_party/devtools-frontend/src/front_end/third_party/web-vitals
		third_party/devtools-frontend/src/third_party
		third_party/dom_distiller_js
		third_party/dragonbox
		third_party/eigen3
		third_party/electron_node
		third_party/emoji-segmenter
		third_party/farmhash
		third_party/fast_float
		third_party/fdlibm
		third_party/federated_compute/chromium/fcp/confidentialcompute
		third_party/federated_compute/src/fcp/base
		third_party/federated_compute/src/fcp/confidentialcompute
		third_party/federated_compute/src/fcp/protos/confidentialcompute
		third_party/federated_compute/src/fcp/protos/federatedcompute
		third_party/fft2d
		third_party/flatbuffers
		third_party/fp16
		third_party/freetype
		third_party/fusejs
		third_party/fxdiv
		third_party/gemmlowp
		third_party/google_input_tools
		third_party/google_input_tools/third_party/closure_library
		third_party/google_input_tools/third_party/closure_library/third_party/closure
		third_party/googletest
		third_party/gperf # We symlink system gperf, but this will purge the symlink since we tidy up afterwards.
		third_party/highway
		third_party/hunspell
		third_party/ink_stroke_modeler/src/ink_stroke_modeler
		third_party/ink_stroke_modeler/src/ink_stroke_modeler/internal
		third_party/ink/src/ink/brush
		third_party/ink/src/ink/color
		third_party/ink/src/ink/geometry
		third_party/ink/src/ink/rendering
		third_party/ink/src/ink/rendering/skia/common_internal
		third_party/ink/src/ink/rendering/skia/native
		third_party/ink/src/ink/rendering/skia/native/internal
		third_party/ink/src/ink/strokes
		third_party/ink/src/ink/types
		third_party/inspector_protocol
		third_party/ipcz
		third_party/jinja2
	)
	use system-jsoncpp || keeplibs+=(
		third_party/jsoncpp
	)
	keeplibs+=(
		third_party/khronos
		third_party/lens_server_proto
		third_party/leveldatabase
		third_party/libaddressinput
	)
	use libcxx && keeplibs+=(
		third_party/libc++
	)
	keeplibs+=(
		third_party/libdrm
		third_party/libgav1
		third_party/libjingle
		third_party/libpfm4
		third_party/libphonenumber
		third_party/libpng
		third_party/libsecret
		third_party/libsrtp
		third_party/libsync
		third_party/libtess2/libtess2
		third_party/libtess2/src/Include
		third_party/libtess2/src/Source
		third_party/liburlpattern
	)
	use system-libusb || keeplibs+=(
		third_party/libusb
	)
	keeplibs+=(
		third_party/libva_protected_content
	)
	use system-libvpx || keeplibs+=(
		third_party/libvpx
		third_party/libvpx/source/libvpx/third_party/x86inc
	)
	keeplibs+=(
		third_party/libwebm
		third_party/libx11
		third_party/libxcb-keysyms
		third_party/libxml/chromium
		third_party/libyuv
		third_party/libzip
		third_party/lit
	)
	use libcxx && keeplibs+=(
		third_party/llvm-libc
		third_party/llvm-libc/src/shared/
	)
	keeplibs+=(
		third_party/lottie
		third_party/lss
		third_party/lzma_sdk
		third_party/mako
		third_party/markupsafe
		third_party/material_color_utilities
		third_party/metrics_proto
		third_party/minigbm
		third_party/ml_dtypes
		third_party/modp_b64
		third_party/nasm
		third_party/nearby
		third_party/neon_2_sse
		third_party/node
		third_party/oak/chromium/proto
		third_party/oak/chromium/proto/attestation
		third_party/omnibox_proto
		third_party/one_euro_filter
		third_party/openscreen
		third_party/openscreen/src/third_party/
		third_party/openscreen/src/third_party/tinycbor/src/src
		third_party/ots
		third_party/pdfium
		third_party/pdfium/third_party/agg23
		third_party/pdfium/third_party/bigint
		third_party/pdfium/third_party/freetype
		third_party/pdfium/third_party/lcms
	)
	use system-openjpeg || keeplibs+=(
		third_party/pdfium/third_party/libopenjpeg
	)
	keeplibs+=(
		third_party/pdfium/third_party/libtiff
		third_party/perfetto
		third_party/perfetto/protos/third_party/chromium
		third_party/perfetto/protos/third_party/pprof
		third_party/perfetto/protos/third_party/primes
		third_party/perfetto/protos/third_party/simpleperf
		third_party/pffft
		third_party/ply
		third_party/polymer
		third_party/private_membership
		third_party/private-join-and-compute
		third_party/protobuf
		third_party/protobuf/third_party/utf8_range
		third_party/pthreadpool
		third_party/puffin
		third_party/pyjson5
		third_party/pyyaml
		third_party/rapidhash
		third_party/readability
		third_party/rnnoise
		third_party/rust
		third_party/ruy
		third_party/s2cellid
		third_party/search_engines_data
		third_party/securemessage
		third_party/selenium-atoms
		third_party/sentencepiece
		third_party/sentencepiece/src/third_party/darts_clone
		third_party/shell-encryption
		third_party/simdutf
		third_party/simplejson
		third_party/six
		third_party/skia
		third_party/skia/include/third_party/vulkan
		third_party/smhasher
	)
	use system-snappy || keeplibs+=(
		third_party/snappy
	)
	keeplibs+=(
		third_party/spirv-headers
		third_party/spirv-tools
		third_party/sqlite
		third_party/swiftshader
		third_party/swiftshader/third_party/astc-encoder
		third_party/swiftshader/third_party/llvm-subzero
		third_party/swiftshader/third_party/marl
		third_party/swiftshader/third_party/SPIRV-Headers/include/spirv
		third_party/swiftshader/third_party/SPIRV-Tools
		third_party/swiftshader/third_party/subzero
		third_party/tensorflow_models
		third_party/tensorflow-text
		third_party/tflite
		third_party/tflite/src/third_party/fft2d
		third_party/tflite/src/third_party/xla/third_party/tsl
		third_party/tflite/src/third_party/xla/xla/tsl/framework
		third_party/tflite/src/third_party/xla/xla/tsl/lib/random
		third_party/tflite/src/third_party/xla/xla/tsl/platform
		third_party/tflite/src/third_party/xla/xla/tsl/protobuf
		third_party/tflite/src/third_party/xla/xla/tsl/util
		third_party/ukey2
		third_party/utf
		third_party/vulkan
		third_party/wayland
		third_party/webdriver
		third_party/webgpu-cts
		third_party/webrtc
		third_party/webrtc/common_audio/third_party/ooura
		third_party/webrtc/common_audio/third_party/spl_sqrt_floor
		third_party/webrtc/modules/third_party/fft
		third_party/webrtc/modules/third_party/g711
		third_party/webrtc/modules/third_party/g722
		third_party/widevine
	)
	use system-woff2 || keeplibs+=(
		third_party/woff2
	)
	keeplibs+=(
		third_party/wuffs
		third_party/x11proto
		third_party/xcbproto
		third_party/xnnpack
		third_party/zlib/google
		third_party/zxcvbn-cpp
		url/third_party/mozilla
		v8/third_party/glibc
		v8/third_party/inspector_protocol
		v8/third_party/rapidhash-v8
		v8/third_party/siphash
		v8/third_party/utf8-decoder
		v8/third_party/v8
		v8/third_party/valgrind

		# gyp -> gn leftovers
		third_party/speech-dispatcher
		third_party/usb_ids
	)
	if ! use system-harfbuzz; then
		keeplibs+=( third_party/harfbuzz )
	fi

	if ! use system-ffmpeg; then
		keeplibs+=( third_party/ffmpeg third_party/opus )
	fi

	if ! use system-icu; then
		keeplibs+=( third_party/icu )
	fi

	if ! use system-zstd; then
		keeplibs+=( third_party/zstd )
	fi

	if ! use system-av1; then
		keeplibs+=(
			third_party/dav1d
			third_party/libaom
			third_party/libaom/source/libaom/third_party/fastfeat
			third_party/libaom/source/libaom/third_party/vector
			third_party/libaom/source/libaom/third_party/x86inc
		)
	fi

	if use libcxx; then
		keeplibs+=(
				third_party/libc++
				third_party/llvm-libc
		)
	fi

	if ! use system-openh264; then
		keeplibs+=( third_party/openh264 )
	fi

	if ! use system-re2; then
		keeplibs+=( third_party/re2 )
	fi

	# Arch-specific
	if use arm64 || use ppc64 ; then
		keeplibs+=( third_party/swiftshader/third_party/llvm-10.0 )
	fi
	# we need to generate ppc64 stuff because upstream does not ship it yet
	# it has to be done before unbundling.
	if use ppc64; then
		pushd third_party/libvpx >/dev/null || die
		mkdir -p source/config/linux/ppc64 || die
		# requires git and clang, bug #832803
		# Revert https://chromium.googlesource.com/chromium/src/+/b463d0f40b08b4e896e7f458d89ae58ce2a27165%5E%21/third_party/libvpx/generate_gni.sh
		# and https://chromium.googlesource.com/chromium/src/+/71ebcbce867dd31da5f8b405a28fcb0de0657d91%5E%21/third_party/libvpx/generate_gni.sh
		# since we're not in a git repo
		sed -i -e "s|^update_readme||g; s|clang-format|${EPREFIX}/bin/true|g; /^git -C/d; /git cl/d; /cd \$BASE_DIR\/\$LIBVPX_SRC_DIR/ign format --in-place \$BASE_DIR\/BUILD.gn\ngn format --in-place \$BASE_DIR\/libvpx_srcs.gni" \
			generate_gni.sh || die
		./generate_gni.sh || die
		popd >/dev/null || die

		pushd third_party/ffmpeg >/dev/null || die
		cp libavcodec/ppc/h264dsp.c libavcodec/ppc/h264dsp_ppc.c || die
		cp libavcodec/ppc/h264qpel.c libavcodec/ppc/h264qpel_ppc.c || die
		popd >/dev/null || die
	fi

	# Sanity check keeplibs, on major version bumps it is often necessary to update this list
	# and this enables us to hit them all at once.
	# There are some entries that need to be whitelisted (TODO: Why? The file is understandable, the rest seem odd)
	whitelist_libs=(
		net/third_party/quic
		third_party/devtools-frontend/src/front_end/third_party/additional_readme_paths.json
		third_party/libjingle
		third_party/mesa
		third_party/skia/third_party/vulkan
		third_party/vulkan
	)
	local not_found_libs=()
	for lib in "${keeplibs[@]}"; do
		if [[ ! -d "${lib}" ]] && ! has "${lib}" "${whitelist_libs[@]}"; then
			not_found_libs+=( "${lib}" )
		fi
	done

	if [[ ${#not_found_libs[@]} -gt 0 ]]; then
		ewarn "The following \`keeplibs\` directories were not found in the source tree:"
		for lib in "${not_found_libs[@]}"; do
			ewarn "  ${lib}"
		done
	fi

	if use ungoogled; then
		keeplibs+=(
			third_party/ungoogled
		)
	fi

	# Remove most bundled libraries. Some are still needed.
	einfo "Unbundling third-party libraries ..."
	build/linux/unbundle/remove_bundled_libraries.py "${keeplibs[@]}" --do-remove || die

	# Interferes with our bundled clang path; we don't want stripped binaries anyway.
	sed -i -e 's|${clang_base_path}/bin/llvm-strip|/bin/true|g' \
		-e 's|${clang_base_path}/bin/llvm-objcopy|/bin/true|g' \
		build/linux/strip_binary.gni || die

	cp "${FILESDIR}/electron-launcher.sh" "${WORKDIR}"
	sed -i "s|@ELECTRON@|electron-${PV%%.*}|" "${WORKDIR}/electron-launcher.sh"
	sed -i "s|@LIBDIR@|$(get_libdir)|" "${WORKDIR}/electron-launcher.sh"
}

src_configure() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	# Bug 491582.
	export TMPDIR="${WORKDIR}/temp"
	mkdir -p -m 755 "${TMPDIR}" || die

	# https://bugs.gentoo.org/654216
	addpredict /dev/dri/ #nowarn

	pushd electron > /dev/null || die
	#!v No control over what happens here
	einfo "Installing node_modules"
	# yarn config set disable-self-update-check true || die
	# yarn config set yarn-offline-mirror "${DISTDIR}" || die
	# yarn config set cacheFolder "${DISTDIR}" || die
	# yarn install --frozen-lockfile --offline --no-progress --ignore-scripts || die
	# export YARN_CACHE_FOLDER=${DISTDIR}
	# export YARN_ENABLE_OFFLINE_MODE=1
	yarn config set --home enableTelemetry 0 || die
	# yarn config set --home cacheFolder ${DISTDIR}
	yarn install || die
	#!^ No control over what happens here
	popd > /dev/null || die

	# libevent: https://bugs.gentoo.org/593458
	local gn_system_libraries=(
		flac
		fontconfig
		freetype
		libjpeg
		libwebp
		libxml
		libxslt
		zlib
	)
	if use system-abseil-cpp; then
	gn_system_libraries+=(
		absl_algorithm
		absl_base
		absl_cleanup
		absl_container
		absl_crc
		absl_debugging
		absl_flags
		absl_functional
		absl_hash
		absl_log
		absl_log_internal
		absl_memory
		absl_meta
		absl_numeric
		absl_random
		absl_status
		absl_strings
		absl_synchronization
		absl_time
		absl_types
		absl_utility
	)
	fi
	if use system-brotli; then
		gn_system_libraries+=( brotli )
	fi
	if use system-crc32c; then
		gn_system_libraries+=( crc32c )
	fi
	if use system-double-conversion; then
		gn_system_libraries+=( double-conversion )
	fi
	if use system-woff2; then
		gn_system_libraries+=( woff2 )
	fi
	if use nvidia; then
		gn_system_libraries+=( libXNVCtrl )
	fi
	if use system-ffmpeg; then
		gn_system_libraries+=( ffmpeg opus )
	fi
	if use system-jsoncpp; then
		gn_system_libraries+=( jsoncpp )
	fi
	if use system-icu; then
		gn_system_libraries+=( icu )
	fi
	if use system-zstd; then
		gn_system_libraries+=( zstd )
	fi
	if use system-av1; then
		gn_system_libraries+=( dav1d libaom )
	fi
	if use system-libusb; then
		gn_system_libraries+=( libusb )
	fi
	if use system-libvpx; then
		gn_system_libraries+=( libvpx )
	fi
	use system-openh264 && gn_system_libraries+=(
		openh264
	)
	use system-re2 && gn_system_libraries+=(
		re2
	)
	use system-snappy && gn_system_libraries+=(
		snappy
	)

	build/linux/unbundle/replace_gn_files.py --system-libraries "${gn_system_libraries[@]}" ||
		die "Failed to replace GN files for system libraries"

	# TODO 131: The above call clobbers `enable_freetype = true` in the freetype gni file
	# drop the last line, then append the freetype line and a new curly brace to end the block
	local freetype_gni="build/config/freetype/freetype.gni"
	sed -i -e '$d' ${freetype_gni} || die
	echo "  enable_freetype = true" >> ${freetype_gni} || die
	echo "}" >> ${freetype_gni} || die

	if use !custom-cflags; then
		replace-flags "-Os" "-O2"
		strip-flags
		# Debug info section overflows without component build
		# Prevent linker from running out of address space, bug #471810 .
		filter-flags "-g*"
		# 949123: Several multimedia components explicitly build with specific CFLAGS and
		# use runtime detection to enable optimisations; unfortunately any of our CFLAGS are suffixed
		# to the end of the command line, which causes build failures.
		use arm64 && filter-flags "-march*" "-mtune*" "-mcpu*"
	fi

	# We don't use the same clang version as upstream, and with -Werror
	# we need to make sure that we don't get superfluous warnings.
	append-flags -Wno-unknown-warning-option
	if tc-is-cross-compiler; then # can you cross-compile with the bundled toolchain?
			export BUILD_CXXFLAGS+=" -Wno-unknown-warning-option"
			export BUILD_CFLAGS+=" -Wno-unknown-warning-option"
	fi

	# Start building our GN options
	local myconf_gn=() # Tip: strings must be quoted, bools or numbers are fine

	if use !bundled-toolchain; then
		# We already forced the "correct" clang via pkg_setup

		if tc-is-cross-compiler; then
			CC="${CC} -target ${CHOST} --sysroot ${ESYSROOT}"
			CXX="${CXX} -target ${CHOST} --sysroot ${ESYSROOT}"
			BUILD_AR=${AR}
			BUILD_CC=${CC}
			BUILD_CXX=${CXX}
			BUILD_NM=${NM}
		fi

		# Make sure the build system will use the right tools, bug #340795.
		tc-export AR CC CXX NM

		strip-unsupported-flags
		append-ldflags -Wl,--undefined-version # https://bugs.gentoo.org/918897#c32

		myconf_gn+=(
			"is_clang=true"
			"clang_use_chrome_plugins=false"
			"use_clang_modules=false" # M141 enables this for the linux platform by default.
			"use_lld=true"
			'custom_toolchain="//build/toolchain/linux/unbundle:default"'
			# From M127 we need to provide a location for libclang.
			# We patch this in for gentoo - see chromium-*-bindgen-custom-toolchain.patch
			# rust_bindgen_root = directory with `bin/bindgen` beneath it.
			# We don't need to set 'clang_base_path' for anything in our build
			# and it defaults to the google toolchain location. Instead provide a location
			# to where system clang lives so that bindgen can find system headers (e.g. stddef.h)
			"bindgen_libclang_path=\"$(get_llvm_prefix)/$(get_libdir)\""
			"clang_base_path=\"${EPREFIX}/usr/lib/clang/${LLVM_SLOT}/\""
			"rust_bindgen_root=\"${EPREFIX}/usr/\""
			"rust_sysroot_absolute=\"$(get_rust_prefix)\""
			"rustc_version=\"${RUST_SLOT}\""
		)

		if ! tc-is-cross-compiler; then
			myconf_gn+=( 'host_toolchain="//build/toolchain/linux/unbundle:default"' )
		else
			tc-export BUILD_{AR,CC,CXX,NM}
			myconf_gn+=(
				'host_toolchain="//build/toolchain/linux/unbundle:host"'
				'v8_snapshot_toolchain="//build/toolchain/linux/unbundle:host"'
				"host_pkg_config=\"$(tc-getBUILD_PKG_CONFIG)\""
				"pkg_config=\"$(tc-getPKG_CONFIG)\""
			)

			# setup cups-config, build system only uses --libs option
			if use cups; then
				mkdir "${T}/cups-config" || die
				cp "${ESYSROOT}/usr/bin/${CHOST}-cups-config" "${T}/cups-config/cups-config" || die
				export PATH="${PATH}:${T}/cups-config"
			fi

			# Don't inherit PKG_CONFIG_PATH from environment
			local -x PKG_CONFIG_PATH=
		fi

	fi # !bundled-toolchain

	local myarch
	myarch="$(tc-arch)"
	case ${myarch} in
		amd64)
			# Bug 530248, 544702, 546984, 853646.
			use !custom-cflags && filter-flags -mno-mmx -mno-sse2 -mno-ssse3 -mno-sse4.1 \
										-mno-avx -mno-avx2 -mno-fma -mno-fma4 -mno-xop -mno-sse4a
			myconf_gn+=( 'target_cpu="x64"' )
			;;
		x86)
			# Bug 530248, 544702, 546984, 853646.
			use !custom-cflags && filter-flags -mno-mmx -mno-sse2 -mno-ssse3 -mno-sse4.1 \
										-mno-avx -mno-avx2 -mno-fma -mno-fma4 -mno-xop -mno-sse4a
			myconf_gn+=( 'target_cpu="x86"' )
			;;
		arm64)
			myconf_gn+=( 'target_cpu="arm64"' )
			;;
		ppc64)
			myconf_gn+=( 'target_cpu="ppc64"' )
			;;
		*)
			die "Failed to determine target arch, got '${myarch}'."
			;;
	esac

	# Common options

	myconf_gn+=(
		# Disable code formating of generated files
		"blink_enable_generated_code_formatting=false"
		# enable DCHECK with USE=debug only, increases chrome binary size by 30%, bug #811138.
		# DCHECK is fatal by default, make it configurable at runtime, #bug 807881.
		"dcheck_always_on=$(usex debug true false)"
		"dcheck_is_configurable=$(usex debug true false)"
		# Chromium builds provided by Linux distros should disable the testing config
		"disable_fieldtrial_testing_config=true"
		# Custom patch: Enable building Chromium as individual channels (e.g. stable, beta, dev) that
		# use different profile directories, desktop entries, etc. This enables slotting the ebuild.
		"enable_channel_branding=true"
		# 131 began laying the groundwork for replacing freetype with
		# "Rust-based Fontations set of libraries plus Skia path rendering"
		# We now need to opt-in
		"enable_freetype=true"
		"enable_hangout_services_extension=$(usex hangouts true false)"
		# Don't need nocompile checks and GN crashes with our config (verify with modern GN)
		"enable_nocompile_tests=false"
		# pseudolocales are only used for testing
		"enable_pseudolocales=false"
		# Disable fatal linker warnings, bug 506268.
		"fatal_linker_warnings=false"
		# Component build isn't generally intended for use by end users. It's mostly useful
		# for development and debugging.
		"is_component_build=false"
		# GN needs explicit config for Debug/Release as opposed to inferring it from build directory.
		"is_debug=false"
		"is_official_build=true"
		# Enable ozone wayland and/or headless support
		"ozone_auto_platforms=false"
		"ozone_platform_headless=true"
		# Enables building without non-free unRAR licence
		"safe_browsing_use_unrar=false"
		# "thin_lto_enable_optimizations=${use_lto}"
		"treat_warnings_as_errors=false"
		# Use in-tree libc++ (buildtools/third_party/libc++ and buildtools/third_party/libc++abi)
		# instead of the system C++ library for C++ standard library support.
		# default: true, but let's be explicit (forced since 120 ; USE removed 127).
		"use_custom_libcxx=true"
		# Enable ozone wayland and/or headless support
		"use_ozone=true"
		# The sysroot is the oldest debian image that chromium supports, we don't need it
		"use_sysroot=false"
		# See dependency logic in third_party/BUILD.gn
		"use_system_harfbuzz=$(usex system-harfbuzz true false)"
		# "use_thin_lto=${use_lto}"
		# Only enabled for clang, but gcc has endian macros too
		"v8_use_libm_trig_functions=true"
	)

	myconf_gn+=( "enable_iterator_debugging=$(usex debug true false)" )

	if use debug; then
		myconf_gn+=(
			"symbol_level=2"
			"blink_symbol_level=2"
			"v8_symbol_level=2"
		)
	else
		myconf_gn+=(
			"symbol_level=0"
			"blink_symbol_level=0"
			"v8_symbol_level=0"
		)
	fi

	if use bindist ; then
		myconf_gn+=(
			# If this is set to false Chromium won't be able to load any proprietary codecs
			# even if provided with an ffmpeg capable of h264/aac decoding
			"proprietary_codecs=true"
			'ffmpeg_branding="Chrome"'
			# build ffmpeg as an external component (libffmpeg.so) that we can remove / substitute
			"is_component_ffmpeg=true"
		)
	else
		myconf_gn+=(
			"proprietary_codecs=$(usex proprietary-codecs true false)"
			"ffmpeg_branding=\"$(usex proprietary-codecs Chrome Chromium)\""
		)
	fi

	myconf_gn+=(
		"gtk_version=$(usex gtk4 4 3)"
		# link pulseaudio directly (DT_NEEDED) instead of using dlopen.
		# helps with automated detection of ABI mismatches and prevents silent errors.
		"link_pulseaudio=$(usex pulseaudio true false)"
		"ozone_platform_wayland=$(usex wayland true false)"
		"ozone_platform_x11=$(usex X true false)"
		"ozone_platform=\"$(usex wayland wayland x11)\""
		"rtc_use_pipewire=$(usex screencast true false)"
		"use_cups=$(usex cups true false)"
		"use_kerberos=$(usex kerberos true false)"
		"use_pulseaudio=$(usex pulseaudio true false)"
		"use_qt5=false"
		"use_system_libffi=$(usex wayland true false)"
		"use_system_minigbm=true"
		"use_vaapi=$(usex vaapi true false)"
		"use_xkbcommon=true"
	)

	# Explicitly disable ICU data file support for system-icu/headless builds.
	if use system-icu; then
		myconf_gn+=( "icu_use_data_file=false" )
	fi

	# Allow building against system libraries in official builds
	sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
		tools/generate_shim_headers/generate_shim_headers.py || die
	# Don't add symbols to build
	myconf_gn+=( "symbol_level=0" )

	if use pgo; then
		myconf_gn+=(
				"chrome_pgo_phase=2"
				"v8_enable_builtins_optimization=true"
			)
	else
		myconf_gn+=( "chrome_pgo_phase=0" )
	fi

	# Odds and ends

	# skipping typecheck is only supported on amd64, bug #876157
	if ! use amd64; then
		myconf_gn+=( "devtools_skip_typecheck=false" )
	fi

	# Disable external code space for V8 for ppc64. It is disabled for ppc64
	# by default, but cross-compiling on amd64 enables it again.
	if tc-is-cross-compiler && use ppc64; then
		myconf_gn+=( "v8_enable_external_code_space=false" )
	fi

	# This determines whether or not GN uses the bundled libcxx
	if use libcxx; then
		myconf_gn+=( "use_custom_libcxx=true" )
	else
		myconf_gn+=(
			"use_custom_libcxx=false"
			"use_llvm_libatomic=false"
		)
		append-cppflags -U_GLIBCXX_ASSERTIONS #See #318
	fi

	myconf_gn+=( "use_bluez=$(usex bluetooth true false)" )

	myconf_gn+=(
		"optimize_webui=$(usex optimize-webui true false)"
		"use_system_freetype=$(usex system-harfbuzz true false)"
		"use_system_libopenjpeg2=$(usex system-openjpeg true false)"
		"enable_pdf=true"
		"use_system_lcms2=true"
		"enable_print_preview=true"
		"use_thin_lto=$(usex thinlto true false)"
		"thin_lto_enable_optimizations=$(usex optimize-thinlto true false)"

		# Ungoogled flags
		"build_with_tflite_lib=false"
		"enable_mdns=false"
		"enable_mse_mpeg2ts_stream_parser=$(usex proprietary-codecs true false)"
		"enable_remoting=false"
		"enable_reporting=false"
		"enable_service_discovery=false"
		"exclude_unwind_tables=true"
		"google_api_key=\"\""
		"google_default_client_id=\"\""
		"google_default_client_secret=\"\""
		"safe_browsing_mode=0"
		"use_official_google_api_keys=false"
		"use_unofficial_version_number=false"

		# "enable_swiftshader=false"

		# Additional flags
		# "perfetto_use_system_zlib=true"
		# "use_system_zlib=true"
		# "use_system_libjpeg=true"
		# "rtc_build_examples=false"
		# "enable_chromium_prelude=false"
		# "enable_updater=false"
		# "enable_update_notifications=false"
		# "enable_constraints=false"
		# "rtc_rusty_base64=false"
		# "v8_enable_temporal_support=false"
		# "media_use_symphonia=false"
		# "pdf_enable_rust_png=false"
		# "skia_use_libpng_encode=true"
		# "skia_use_libpng_decode=true"
		# "skia_use_rust_png_decode=false"
		# "skia_use_rust_png_encode=false"
		# "enable_jxl_decoder=false"
		"override_electron_version=\"${PV}\""
	)


	if use thinlto; then
		# We need to change the default value of import-instr-limit in
		# LLVM to limit the text size increase. The default value is
		# 100, and we change it to 30 to reduce the text size increase
		# from 25% to 10%. The performance number of page_cycler is the
		# same on two of the thinLTO configurations, we got 1% slowdown
		# on speedometer when changing import-instr-limit from 100 to 30.
		# append-ldflags "-Wl,-plugin-opt,-import-instr-limit=30"
		sed -i '/import_instr_limit = 5/{s++import_instr_limit = 30+;h};${x;/./{x;q0};x;q1}' \
			build/config/compiler/BUILD.gn || die

		append-ldflags "-Wl,--thinlto-jobs=$(makeopts_jobs)"
	fi

	# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
	append-cflags -Wno-builtin-macro-redefined
	append-cxxflags -Wno-builtin-macro-redefined
	append-cppflags "-D__DATE__= -D__TIME__= -D__TIMESTAMP__="

	myconf_gn+=" import(\"//electron/build/args/release.gn\")"

	local flags
	einfo "Building with the following compiler settings:"
	for flags in C{C,XX} AR NM RANLIB {C,CXX,CPP,LD}FLAGS \
		EXTRA_GN UGC_{SKIP_{PATCHES,SUBSTITUTION},KEEP_BINARIES} ; do
		einfo "  ${flags} = \"${!flags}\""
	done

	einfo "Configuring Electron ..."
	set -- gn gen --args="${myconf_gn[*]}${EXTRA_GN:+ ${EXTRA_GN}}" out/Release
	echo "$@"
	"$@" || die "Failed to configure Electron"

	# The "if" below should not be executed unless testing
	if [ ! -z "${NODIE}" ]; then
		# List all args
		# gn args --list out/Release

		# Quick compiler check
		eninja -C out/Release protoc torque
	fi
}

src_compile() {
	# Final link uses lots of file descriptors.
	ulimit -n 2048

	# Calling this here supports resumption via FEATURES=keepwork
	python_setup
	# I hate doing this but upstream Rust have yet to come up with a better solution for
	# us poor packagers. Required for Split LTO units, which are required for CFI.
	export RUSTC_BOOTSTRAP=1

	# Don't inherit PYTHONPATH from environment, bug #789021, #812689
	local -x PYTHONPATH=

	#! Fixing things
	export ELECTRON_OUT_DIR=Release
	eninja -C out/Release electron:node_headers

	# Build mksnapshot and pax-mark it.
	if use pax-kernel; then
		local x
		for x in mksnapshot v8_context_snapshot_generator code_cache_generator; do
			if tc-is-cross-compiler; then
				eninja -C out/Release "host/${x}"
				pax-mark m "out/Release/host/${x}"
			else
				eninja -C out/Release "${x}"
				pax-mark m "out/Release/${x}"
			fi
		done
	fi

	# Even though ninja autodetects number of CPUs, we respect
	# user's options, for debugging with -j 1 or any other reason.
	eninja -C out/Release electron

	pax-mark m out/Release/electron

	# This codepath does minimal patching, so we're at the mercy of upstream
	# CFLAGS. This is fine - we're not intending to force this on users
	# and we do a lot of flag 'management' anyway.
	if use bundled-toolchain; then
		QA_FLAGS_IGNORED="
			usr/lib64/chromium-browser/chrome
			usr/lib64/chromium-browser/chrome-sandbox
			usr/lib64/chromium-browser/chromedriver
			usr/lib64/chromium-browser/chrome_crashpad_handler
			usr/lib64/chromium-browser/libEGL.so
			usr/lib64/chromium-browser/libGLESv2.so
			usr/lib64/chromium-browser/libVkICD_mock_icd.so
			usr/lib64/chromium-browser/libVkLayer_khronos_validation.so
			usr/lib64/chromium-browser/libqt6_shim.so
			usr/lib64/chromium-browser/libvk_swiftshader.so
			usr/lib64/chromium-browser/libvulkan.so.1
		"
	fi
}

src_install() {
	local CHROMIUM_HOME="/usr/$(get_libdir)/electron-${PV%%.*}"
	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/electron
	doexe "${FILESDIR}/node"

	exeinto "/usr/bin"
	newexe "${WORKDIR}/electron-launcher.sh" "electron-${PV%%.*}"

	pushd out/Release/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins out/Release/*.bin
	doins out/Release/*.pak

	if use bindist; then
		# We built libffmpeg as a component library, but we can't distribute it
		# with proprietary codec support. Remove it and make a symlink to the requested
		# system library.
		rm -f out/Release/libffmpeg.so \
			|| die "Failed to remove bundled libffmpeg.so (with proprietary codecs)"
		# symlink the libffmpeg.so from either ffmpeg-chromium or ffmpeg[chromium].
		einfo "Creating symlink to libffmpeg.so from $(usex ffmpeg-chromium ffmpeg-chromium ffmpeg[chromium])..."
		dosym ../chromium/libffmpeg.so$(usex ffmpeg-chromium .${PV%%\.*} "") \
			/usr/$(get_libdir)/ungoogled-chromium-browser/libffmpeg.so
	fi

	(
		shopt -s nullglob
		local files=(out/Release/*.so out/Release/*.so.[0-9])
		[[ ${#files[@]} -gt 0 ]] && doins "${files[@]}"
	)

	# # Install bundled xdg-utils, avoids installing X11 libraries with USE="-X wayland"
	# doins out/Release/xdg-{settings,mime}

	if ! use system-icu; then
		doins out/Release/icudtl.dat
	fi

	doins -r out/Release/locales
	doins -r out/Release/resources
	#doins -r out/Release/MEIPreload

	# Install vk_swiftshader_icd.json; bug #827861
	doins out/Release/vk_swiftshader_icd.json

	if [[ -d out/Release/swiftshader ]]; then
		insinto "${CHROMIUM_HOME}/swiftshader"
		doins out/Release/swiftshader/*.so
	fi

	if use dev-dependencies; then
		doins -r electron/node_modules
		fperms -R 755 "${CHROMIUM_HOME}/node_modules/.bin/"
	fi

	insinto "${CHROMIUM_HOME}/node_modules"
	doins -r "third_party/electron_node/deps/npm"
	fperms -R 755 "${CHROMIUM_HOME}/node_modules/npm/bin/"

	exeinto "${CHROMIUM_HOME}/node_modules/npm/bin/"
	doexe "${FILESDIR}/node-gyp"

	insinto "/usr/include/electron-${PV%%.*}/node/"
	doins -r out/Release/gen/node_headers/include

}

pkg_postinst() {
	#? How to supply these flags to Electron?
	if use vaapi; then
		elog "VA-API is disabled by default at runtime. You have to enable it"
		elog "by adding --enable-features=VaapiVideoDecoder and "
		elog "--disable-features=UseChromeOSDirectVideoDecoder to CHROMIUM_FLAGS"
		elog "in /etc/chromium/default."
	fi
	if use screencast; then
		elog "Screencast is disabled by default at runtime. Either enable it"
		elog "by navigating to chrome://flags/#enable-webrtc-pipewire-capturer"
		elog "inside Chromium or add --enable-features=WebRTCPipeWireCapturer"
		elog "to CHROMIUM_FLAGS in /etc/chromium/default."
	fi
	if use gtk4; then
		elog "Chromium prefers GTK3 over GTK4 at runtime. To override this"
		elog "behavior you need to pass --gtk-version=4, e.g. by adding it"
		elog "to CHROMIUM_FLAGS in /etc/chromium/default."
	fi

	electron-config update
}

pkg_postrm() {
	electron-config update
}
