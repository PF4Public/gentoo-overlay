# Copyright 2009-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="xml(+)"

CHROMIUM_LANGS="af am ar as az be bg bn bs ca cs cy da de el en-GB es es-419 et eu fa fi fil
	fr fr-CA gl gu he hi hr hu hy id is it ja ka kk km kn ko ky lo lt lv mk ml mn mr ms my
	nb ne nl or pa pl pt-BR pt-PT ro ru si sk sl sq sr sr-Latn sv sw ta te th tr uk ur uz
	vi zh-CN zh-HK zh-TW zu"

inherit check-reqs chromium-2 desktop flag-o-matic llvm ninja-utils pax-utils
inherit python-any-r1 qmake-utils readme.gentoo-r1 toolchain-funcs xdg-utils

# Use following environment variables to customise the build
# EXTRA_GN — pass extra options to gn
# NINJAOPTS="-k0 -j8" useful to populate ccache even if ebuild is still failing
# UGC_SKIP_PATCHES — space-separated list of patches to skip
# UGC_KEEP_BINARIES — space-separated list of binaries to keep
# UGC_SKIP_SUBSTITUTION — space-separated list of files to skip domain substitution

DESCRIPTION="Modifications to Chromium for removing Google integration and enhancing privacy"
HOMEPAGE="https://github.com/ungoogled-software/ungoogled-chromium"
PPC64_HASH="a85b64f07b489b8c6fdb13ecf79c16c56c560fc6"
LITE_TARBALL=1
SRC_URI="https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${PV/_*}${LITE_TARBALL:+-lite}.tar.xz
	ppc64? (
		https://gitlab.raptorengineering.com/raptor-engineering-public/chromium/openpower-patches/-/archive/${PPC64_HASH}/openpower-patches-${PPC64_HASH}.tar.bz2 -> chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	)
"
# Gentoo tarball:
# https://chromium-tarballs.distfiles.gentoo.org/chromium-${PV/_*}.tar.xz -> chromium-${PV/_*}-gentoo.tar.xz

LICENSE="BSD cromite? ( GPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
IUSE_SYSTEM_LIBS="abseil-cpp av1 brotli crc32c double-conversion ffmpeg +harfbuzz +icu jsoncpp +libusb libvpx +openh264 openjpeg +png re2 snappy woff2 +zstd"
IUSE="+X bluetooth cfi +clang convert-dict cups cpu_flags_arm_neon custom-cflags debug enable-driver gtk4 hangouts headless kerberos libcxx nvidia +official optimize-thinlto optimize-webui override-data-dir pax-kernel pgo +proprietary-codecs pulseaudio qt5 qt6 screencast selinux thinlto cromite vaapi wayland widevine cpu_flags_ppc_vsx3"
RESTRICT="
	!system-ffmpeg? ( proprietary-codecs? ( bindist ) )
	!system-openh264? ( bindist )
	cromite? ( bindist )
"
REQUIRED_USE="
	thinlto? ( clang )
	optimize-thinlto? ( thinlto )
	cfi? ( thinlto )
	pgo? ( clang )
	x86? ( !thinlto !widevine )
	debug? ( !official )
	screencast? ( wayland )
	!headless? ( || ( X wayland ) )
	vaapi? ( !system-av1 !system-libvpx )
"

UGC_COMMIT_ID="c46cb88710103915c9fdcb26b968fb81dfda9ca4"
# UGC_PR_COMMITS=(
# 	c917e096342e5b90eeea91ab1f8516447c8756cf
# 	5794e9d12bf82620d5f24505798fecb45ca5a22d
# )

CROMITE_COMMIT_ID="9609b54606287728228780ccd390a28c1f3a8bf0"

declare -A CHROMIUM_COMMITS=(
	["-da443d7bd3777a5dd0587ecff1fbad1722b106b5"]="."
	["-7c6c78ad4e0ed6a0e1204264b02db8f85d34994e"]="."
	["-49b23faa16ad14e96601aea8772c7279fcbd6b44"]="."
	["-be0c460cbca7b0c927e44a529b8489c6d50ea463"]="."
)

UGC_PV="${PV/_p/-}"
UGC_PF="${PN}-${UGC_PV}"
UGC_URL="https://github.com/ungoogled-software/${PN}/archive/"

if [ -z "$UGC_COMMIT_ID" ]; then
	UGC_URL="${UGC_URL}${UGC_PV}.tar.gz -> ${UGC_PF}.tar.gz"
	UGC_WD="${WORKDIR}/${UGC_PF}"
else
	UGC_URL="${UGC_URL}${UGC_COMMIT_ID}.tar.gz -> ${PN}-${UGC_COMMIT_ID}.tar.gz"
	UGC_WD="${WORKDIR}/ungoogled-chromium-${UGC_COMMIT_ID}"
fi

SRC_URI+="${UGC_URL}
"

if [ ! -z "${UGC_PR_COMMITS[*]}" ]; then
	for i in "${UGC_PR_COMMITS[@]}"; do
		SRC_URI+="https://github.com/ungoogled-software/${PN}/commit/$i.patch?full_index=true -> ${PN}-$i.patch
		"
	done
fi

if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
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

SRC_URI+="cromite? ( https://github.com/uazo/cromite/archive/${CROMITE_COMMIT_ID}.tar.gz -> cromite-${CROMITE_COMMIT_ID}.tar.gz )
"

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

COMMON_SNAPSHOT_DEPEND="
	system-abseil-cpp? ( >=dev-cpp/abseil-cpp-20230125.2 )
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
	system-icu? ( >=dev-libs/icu-71.1:= )
	cromite? ( dev-util/patchutils )
	>=dev-libs/libxml2-2.12.4:=[icu]
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	dev-libs/libxslt:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	system-harfbuzz? ( >=media-libs/harfbuzz-3:0=[icu(-)] )
	media-libs/libjpeg-turbo:=
	system-png? ( media-libs/libpng:= )
	system-zstd? ( >=app-arch/zstd-1.5.5:= )
	>=media-libs/libwebp-0.4.0:=
	media-libs/mesa:=[gbm(+)]
	>=media-libs/openh264-1.6.0:=
	system-av1? (
		>=media-libs/dav1d-1.0.0:=
		>=media-libs/libaom-3.7.0:=
	)
	sys-libs/zlib:=
	>=media-libs/libavif-1.2.0:=
	!headless? (
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
	)
"

COMMON_DEPEND="
	${COMMON_SNAPSHOT_DEPEND}
	app-arch/bzip2:=
	dev-libs/expat:=
	system-ffmpeg? (
		>=media-video/ffmpeg-6.1:=
		|| (
			media-video/ffmpeg[-samba]
			>=net-fs/samba-4.5.10-r1[-debug(-)]
		)
		>=media-libs/opus-1.3.1:=
	)
	net-misc/curl[ssl]
	sys-apps/dbus:=
	media-libs/flac:=
	sys-libs/zlib:=[minizip]
	!headless? (
		>=app-accessibility/at-spi2-core-2.46.0:2
		media-libs/mesa:=[X?,wayland?]
		cups? ( >=net-print/cups-1.3.11:= )
		virtual/udev
		x11-libs/cairo:=
		x11-libs/gdk-pixbuf:2
		x11-libs/pango:=
		qt5? (
			dev-qt/qtcore:5
			dev-qt/qtwidgets:5
		)
		qt6? ( dev-qt/qtbase:6[gui,widgets] )
		X? ( ${COMMON_X_DEPEND} )
	)
"

RDEPEND="${COMMON_DEPEND}
	!headless? (
		|| (
			x11-libs/gtk+:3[X?,wayland?]
			gui-libs/gtk:4[X?,wayland?]
		)
		qt5? ( dev-qt/qtgui:5[X?,wayland?] )
		qt6? ( dev-qt/qtbase:6[X?,wayland?] )
	)
	virtual/ttf-fonts
	selinux? ( sec-policy/selinux-chromium )
	!override-data-dir? (
		!www-client/chromium
		!www-client/chromium-bin
		!www-client/cromite[-override-data-dir]
	)
"

DEPEND="${COMMON_DEPEND}
	!headless? (
		gtk4? ( gui-libs/gtk:4[X?,wayland?] )
		!gtk4? ( x11-libs/gtk+:3[X?,wayland?] )
	)
"

BDEPEND="
	${COMMON_SNAPSHOT_DEPEND}
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	>=app-arch/gzip-1.7
	!headless? (
		qt5? ( dev-qt/qtcore:5 )
		qt6? ( dev-qt/qtbase:6 )
	)
	>=dev-build/gn-0.2114
	app-alternatives/ninja
	dev-lang/perl
	>=dev-util/gperf-3.0.3
	dev-vcs/git
	>=net-libs/nodejs-7.6.0[inspector]
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	clang? (
		pgo? ( >llvm-core/clang-19.0.0_pre20240518 >llvm-core/lld-19.0.0_pre20240518	)
		!pgo? ( llvm-core/clang llvm-core/lld )
	)
	cfi? ( llvm-core/clang-runtime[sanitize] )
"

if ! has chromium_pkg_die ${EBUILD_DEATH_HOOKS}; then
	EBUILD_DEATH_HOOKS+=" chromium_pkg_die";
fi

DISABLE_AUTOFORMATTING="yes"
DOC_CONTENTS="
Some web pages may require additional fonts to display properly.
Try installing some of the following packages if some characters
are not displayed properly:
- media-fonts/arphicfonts
- media-fonts/droid
- media-fonts/ipamonafont
- media-fonts/noto
- media-fonts/ja-ipafonts
- media-fonts/takao-fonts
- media-fonts/wqy-microhei
- media-fonts/wqy-zenhei

To fix broken icons on the Downloads page, you should install an icon
theme that covers the appropriate MIME types, and configure this as your
GTK+ icon theme.

For native file dialogs in KDE, install kde-apps/kdialog.

To make password storage work with your desktop environment you may
have install one of the supported credentials management applications:
- app-crypt/libsecret (GNOME)
- kde-frameworks/kwallet (KDE)
If you have one of above packages installed, but don't want to use
them in Chromium, then add --password-store=basic to CHROMIUM_FLAGS
in /etc/chromium/default.
"

S="${WORKDIR}/chromium-${PV/_*}"

python_check_deps() {
	python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

pre_build_checks() {
	# Check build requirements: bugs #471810, #541816, #914220
	# We're going to start doing maths here on the size of an unpacked source tarball,
	# this should make updates easier as chromium continues to balloon in size.
	local BASE_DISK=18
	local EXTRA_DISK=1
	local CHECKREQS_MEMORY="4G"
	tc-is-cross-compiler && EXTRA_DISK=2
	if use thinlto || use pgo; then
		CHECKREQS_MEMORY="9G"
		tc-is-cross-compiler && EXTRA_DISK=4
		use pgo && EXTRA_DISK=8
	fi
	if is-flagq '-g?(gdb)?([1-9])'; then
		if use custom-cflags; then
			EXTRA_DISK=13
		fi
		CHECKREQS_MEMORY="16G"
	fi
	CHECKREQS_DISK_BUILD="$((BASE_DISK + EXTRA_DISK))G"
	check-reqs_${EBUILD_PHASE_FUNC}
}

pkg_pretend() {
	if use libcxx; then
		ewarn
		ewarn "Building with libcxx, please be aware that system-*"
		ewarn "and some other c++ dependencies need to be compiled"
		ewarn "with the same c++ library as ungoogled-chromium itself"
		ewarn "dev-libs/jsoncpp is most problematic, see #58 #49 #119 for details"
		ewarn "Simplest solution would be to disable corresponding system-* flags"
		ewarn
	fi
	if use cfi; then
		ewarn
		ewarn "Building with cfi is only possible if building with -stdlib=libc++"
		ewarn "Make sure all dependencies are also built this way, see #40"
		ewarn
	fi
	if use cromite; then
		ewarn
		ewarn "Cromite patches are very experimental and unstable"
		ewarn "Please consider testing them and giving feedback upstream:"
		ewarn "https://github.com/uazo/cromite/issues"
		ewarn "Not all patches are applied, let me know if others should be considered too"
		ewarn
	fi
	if use system-abseil-cpp; then
		ewarn
		ewarn "Chromium code is not very friendly to system abseil-cpp, see #218"
		ewarn "If you know how to fix this, feel free to submit a PR"
		ewarn
		[[ -z "${NODIE}" ]] && die "The build will fail!"
	fi
	pre_build_checks

	if use headless; then
		local headless_unused_flags=("cups" "kerberos" "pulseaudio" "qt5" "qt6" "vaapi" "wayland")
		for myiuse in ${headless_unused_flags[@]}; do
			use ${myiuse} && ewarn "Ignoring USE=${myiuse}, USE=headless is set."
		done
	fi
}

pkg_setup() {
	pre_build_checks

	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
	# Here be dragons!
	local XCLD="--exclude=chromium-${PV/_*}/third_party/instrumented_libs  \
		--exclude=chromium-${PV/_*}/third_party/llvm \
		--exclude=chromium-${PV/_*}/third_party/llvm-build \
		--exclude=chromium-${PV/_*}/third_party/node/linux \
		--exclude=chromium-${PV/_*}/third_party/rust-src \
		--exclude=chromium-${PV/_*}/third_party/rust-toolchain \
		--exclude=chromium-${PV/_*}/build/linux/debian_bullseye_i386-sysroot \
		--exclude=chromium-${PV/_*}/build/linux/debian_bullseye_amd64-sysroot \
		--exclude=chromium-${PV/_*}/third_party/angle/third_party/VK-GL-CTS \
	"

	if ! use libcxx ; then
		XCLD+=" --exclude=chromium-${PV/_*}/third_party/libc++"
	fi

	if ! use pgo ; then
		XCLD+=" --exclude=chromium-${PV/_*}/chrome/build/pgo_profiles"
	fi

	einfo "Unpacking chromium-${PV/_*}.tar.xz to ${WORKDIR}"
	# Gentoo tarball:
	# tar ${XCLD} -xf "${DISTDIR}/chromium-${PV/_*}-gentoo.tar.xz" -C "${WORKDIR}" || die
	tar ${XCLD} -xf "${DISTDIR}/chromium-${PV/_*}${LITE_TARBALL:+-lite}.tar.xz" -C "${WORKDIR}" || die

	unpack ${UGC_URL#*->}
	# Warned you!

	if use cromite; then
		unpack cromite-${CROMITE_COMMIT_ID}.tar.gz
	fi

	if use ppc64; then
		unpack chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	fi
}

src_prepare() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	cp -f "${FILESDIR}/compiler-132.patch" "${T}/compiler.patch"
	if ! use custom-cflags; then #See #25 #92
		sed -i '/default_stack_frames/Q' "${T}/compiler.patch" || die
	fi

	local PATCHES=(
		"${T}/compiler.patch"
		"${FILESDIR}/chromium-cross-compile.patch"
		"${FILESDIR}/chromium-109-system-openh264.patch"
		"${FILESDIR}/chromium-109-system-zlib.patch"
		"${FILESDIR}/chromium-111-InkDropHost-crash.patch"
		"${FILESDIR}/chromium-131-unbundle-icu-target.patch"
		"${FILESDIR}/chromium-135-oauth2-client-switches.patch"
		"${FILESDIR}/chromium-135-map_droppable-glibc.patch"
		"${FILESDIR}/chromium-135-webrtc-pipewire.patch"
		"${FILESDIR}/chromium-125-cloud_authenticator.patch"
		"${FILESDIR}/chromium-123-qrcode.patch"
		"${FILESDIR}/perfetto-system-zlib.patch"
		"${FILESDIR}/chromium-127-cargo_crate.patch"
		"${FILESDIR}/chromium-128-gtk-fix-prefers-color-scheme-query.patch"
		"${FILESDIR}/chromium-128-cfi-split-lto-unit.patch"
		"${FILESDIR}/chromium-132-no-link-builtins.patch"
		"${FILESDIR}/restore-x86-r2.patch"
		"${FILESDIR}/chromium-132-optional-lens.patch"
		"${FILESDIR}/chromium-133-webrtc-fixes.patch"
		"${FILESDIR}/chromium-135-no-rust.patch"
		"${FILESDIR}/chromium-135-fontations.patch"
		"${FILESDIR}/chromium-135-crabby.patch"
	)

	shopt -s globstar nullglob
	# 130: moved the PPC64 patches into the chromium-patches repo
	local patch
	for patch in "${WORKDIR}/chromium-patches-${PATCH_V}"/**/*.patch; do
			if [[ ${patch} == *"ppc64le"* ]]; then
					use ppc64 && PATCHES+=( "${patch}" )
			else
					PATCHES+=( "${patch}" )
			fi
	done
	shopt -u globstar nullglob

	# We can't use the bundled compiler builtins with the system toolchain
	# `grep` is a development convenience to ensure we fail early when google changes something.
	local builtins_match="if (is_clang && !is_nacl && !is_cronet_build) {"
	grep -q "${builtins_match}" build/config/compiler/BUILD.gn || die "Failed to disable bundled compiler builtins"
	sed -i -e "/${builtins_match}/,+2d" build/config/compiler/BUILD.gn

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

	ewarn
	ewarn "Fontations Rust font stack is disabled"
	ewarn "Using media-libs/libavif instead of CrabbyAvif"
	ewarn

	if ! use libcxx ; then
		PATCHES+=(
			"${FILESDIR}/chromium-135-libstdc++.patch"
			"${FILESDIR}/chromium-134-stdatomic.patch"
			"${FILESDIR}/font-gc-r4.patch"
		)
	fi

	if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
		for i in "${!CHROMIUM_COMMITS[@]}"; do
			if [[ ${CHROMIUM_COMMITS[$i]} =~ webrtc ]]; then
				patch_prefix="webrtc"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ angle ]]; then
				patch_prefix="angle"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ quiche ]]; then
				patch_prefix="quiche"
			elif [[ ${CHROMIUM_COMMITS[$i]} =~ dawn ]]; then
				patch_prefix="dawn"
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
				git_wrapper apply -R --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch"
			else
				einfo "Applying ${patch_prefix}-${i/-}.patch"
				git_wrapper apply --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch"
			fi
			popd > /dev/null || die
		done
	fi

	if ! use bluetooth ; then
		PATCHES+=(
			"${FILESDIR}/disable-bluez-r3.patch"
		)
	fi

	if use convert-dict ; then
		PATCHES+=(
			"${FILESDIR}/chromium-ucf-dict-utility-r1.patch"
		)
	fi

	if use system-ffmpeg; then
		PATCHES+=(
			"${FILESDIR}/chromium-135-opus.patch"
			"${FILESDIR}/chromium-135-hevc.patch"
		)
		sed -i "\!AVFMT_FLAG_NOH264PARSE!d" media/filters/ffmpeg_glue.cc || die
		ewarn "You need to expose \"av_stream_get_first_dts\" in ffmpeg via user patch"
	fi

	if use system-openjpeg ; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-openjpeg-r4.patch"
		)
	fi

	# Testing all patches when NODIE is defined
	if [ ! -z "${NODIE}" ]; then
		for i in "${PATCHES[@]}"; do
			eapply_wrapper "$i"
		done
		nonfatal eapply_user
	else
		default
	fi

	if use cromite ; then
		BR_PA_PATH="${WORKDIR}/cromite-${CROMITE_COMMIT_ID}/build/patches"

		sed -i '/b\/components\/components_strings\.grd/,+10d' "${BR_PA_PATH}/Add-cromite-flags-support.patch" || die
		sed -i '/b\/chrome\/android\/java\/res\/xml\/privacy_preferences\.xml/,+13d' "${BR_PA_PATH}/Add-cromite-flags-support.patch" || die
		sed -i '/webapps_strings.grdp" \/>/{s++webapps_strings.grdp" /><part file="cromite_components_strings_grd/placeholder.txt"/>+;h};${x;/./{x;q0};x;q1}' \
			components/components_strings.grd || die

		sed -i 's/absl::/std::/' "${BR_PA_PATH}/Add-a-proxy-configuration-page.patch" || die

		BROMITE_PATCHES=(
			"${BR_PA_PATH}/bromite-build-utils.patch"
			"${BR_PA_PATH}/Battery-API-return-nothing.patch"
			"${BR_PA_PATH}/Multiple-fingerprinting-mitigations.patch"
			"${BR_PA_PATH}/Add-flag-to-configure-maximum-connections-per-host.patch"
			"${BR_PA_PATH}/Add-a-proxy-configuration-page.patch"
			"${BR_PA_PATH}/Enable-StrictOriginIsolation-and-SitePerProcess.patch"
			"${BR_PA_PATH}/Disable-requests-for-single-word-Omnibar-searches.patch"
			"${BR_PA_PATH}/Reduce-HTTP-headers-in-DoH-requests-to-bare-minimum.patch"
			"${BR_PA_PATH}/Hardening-against-incognito-mode-detection.patch"
			"${BR_PA_PATH}/Client-hints-overrides.patch"
			"${BR_PA_PATH}/Disable-idle-detection.patch"
			"${BR_PA_PATH}/Disable-TLS-resumption.patch"
			"${BR_PA_PATH}/Remove-navigator.connection-info.patch"

			"${BR_PA_PATH}/AudioBuffer-AnalyserNode-fp-mitigations.patch"
			"${BR_PA_PATH}/Fonts-fingerprinting-mitigation.patch"
			"${BR_PA_PATH}/Content-settings-infrastructure.patch"
			"${BR_PA_PATH}/Add-autoplay-site-setting.patch"
			"${BR_PA_PATH}/Site-setting-for-images.patch"
			"${BR_PA_PATH}/JIT-site-settings.patch"
			"${BR_PA_PATH}/Add-webGL-site-setting.patch"
			"${BR_PA_PATH}/Add-webRTC-site-settings.patch"
			"${BR_PA_PATH}/Show-site-settings-for-cookies-javascript-and-ads.patch"
			"${BR_PA_PATH}/Viewport-Protection-flag.patch"
			"${BR_PA_PATH}/Revert-remove-allowscript-content-setting-secondary-url.patch"
			"${BR_PA_PATH}/Timezone-customization.patch"
			"${BR_PA_PATH}/Disable-speechSynthesis-getVoices-API.patch"
			"${BR_PA_PATH}/Remove-support-for-device-memory-and-cpu-recovery.patch"
			"${BR_PA_PATH}/Disable-Feeback-Collector.patch"
			"${BR_PA_PATH}/Disable-remote-altsvc-for-h3-connections.patch"
			"${BR_PA_PATH}/Add-cromite-flags-support.patch"
			"${BR_PA_PATH}/Enables-deactivation-of-the-js-debugger-statement.patch"
		)
		for i in "${BROMITE_PATCHES[@]}"; do
			if [[ "$i" =~ "Add-autoplay-site-setting.patch" ]] ||
				[[ "$i" =~ "JIT-site-settings.patch" ]] ||
				[[ "$i" =~ "Site-setting-for-images.patch" ]]; then
				einfo "Git binary patch: ${i##*/}"
				git_wrapper apply -p1 < "$i"
			else
				filter_wrapper "$i" --exclude="chrome/android/*"
			fi
		done

		#! conflicting patches
		sed -i '/browser_features.cc/,+17d' \
			"${UGC_WD}/patches/extra/ungoogled-chromium/add-flag-to-clear-data-on-exit.patch" || die
		sed -i 's$}  // namespace features$BASE_FEATURE(kClearDataOnExit, "ClearDataOnExit", base::FEATURE_DISABLED_BY_DEFAULT);}$' \
			chrome/browser/browser_features.cc || die
		sed -i 's$}  // namespace features$BASE_DECLARE_FEATURE(kClearDataOnExit);}$' \
			chrome/browser/browser_features.h || die
		sed -i 's$kChromeUIAboutHost,$kChromeUIAboutHost,"ungoogled-first-run",$' \
			chrome/common/webui_url_constants.cc || die
		sed -i '/chrome\/common\/webui_url_constants.cc/Q' \
			"${UGC_WD}/patches/extra/ungoogled-chromium/first-run-page.patch" || die

	fi

	mkdir -p third_party/node/linux/node-linux-x64/bin || die
	ln -s "${EPREFIX}"/usr/bin/node third_party/node/linux/node-linux-x64/bin/node || die

	# adjust python interpreter version
	sed -i -e "s|\(^script_executable = \).*|\1\"${EPYTHON}\"|g" .gn || die

	cp "${FILESDIR}/libusb.gn" build/linux/unbundle || die
	sed -i '/^REPLACEMENTS.*$/{s++REPLACEMENTS = {"libusb":"third_party/libusb/BUILD.gn",+;h};${x;/./{x;q0};x;q1}' \
		build/linux/unbundle/replace_gn_files.py || die
	sed -i '/^.*deps.*third_party\/jsoncpp.*$/{s++public_deps \+= [ "//third_party/jsoncpp" ]+;h};${x;/./{x;q0};x;q1}' \
		third_party/webrtc/rtc_base/BUILD.gn || die

	if use override-data-dir; then
		sed -i '/"chromium";/{s++"ungoogled-chromium";+;h};${x;/./{x;q0};x;q1}' \
			chrome/common/chrome_paths_linux.cc || die
	fi

	if use system-abseil-cpp; then
		eapply_wrapper "${FILESDIR}/chromium-system-abseil.patch"
		cp -f /usr/include/absl/base/options.h third_party/abseil-cpp/absl/base/options.h
		sed -i '/^#define ABSL_OPTION_USE_STD_OPTIONAL.*$/{s++#define ABSL_OPTION_USE_STD_OPTIONAL 0+;h};${x;/./{x;q0};x;q1}' \
			third_party/abseil-cpp/absl/base/options.h || die
	fi

	#* Applying UGC PRs here
	if [ ! -z "${UGC_PR_COMMITS[*]}" ]; then
		pushd "${UGC_WD}" >/dev/null
		for i in "${UGC_PR_COMMITS[@]}"; do
			eapply_wrapper "${DISTDIR}/${PN}-$i.patch"
		done
		popd >/dev/null
	fi

	# From here we adapt ungoogled-chromium's patches to our needs
	local ugc_pruning_list="${UGC_WD}/pruning.list"
	local ugc_patch_series="${UGC_WD}/patches/series"
	local ugc_substitution_list="${UGC_WD}/domain_substitution.list"

	local ugc_unneeded=(
		# GN bootstrap
		extra/debian/gn/parallel
	)

	if use cromite ; then
		einfo "Using fingerprinting patches from Cromite instead"
		ugc_unneeded+=(
			extra/bromite/fingerprinting-flags-client-rects-and-measuretext
			extra/bromite/flag-max-connections-per-host
			extra/bromite/flag-fingerprinting-canvas-image-data-noise
			extra/ungoogled-chromium/add-components-ungoogled
		)
	fi

	#* Temporary fix
	sed -i "\!ios/!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/icu/!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/libjpeg_turbo/!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/snappy/!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/closure_compiler/!d" "${ugc_pruning_list}" || die

	#* Didn't unpack them at the first place
	sed -i "\!build/linux/debian_bullseye_i386-sysroot!d" "${ugc_pruning_list}" || die
	sed -i "\!build/linux/debian_bullseye_amd64-sysroot!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/llvm-build!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/node/linux!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/rust-src!d" "${ugc_pruning_list}" || die
	sed -i "\!third_party/rust-toolchain!d" "${ugc_pruning_list}" || die
	if ! use libcxx ; then
		sed -i "\!third_party/libc!d" "${ugc_pruning_list}" || die
	fi
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
		chrome/third_party/mozilla_security_manager
	)
	use cromite && keeplibs+=(
		cromite_flags/third_party
	)
	keeplibs+=(
		net/third_party/mozilla_security_manager
		net/third_party/nss
		net/third_party/quic
		net/third_party/uri_template
		third_party/abseil-cpp/absl/base
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
		third_party/dawn/third_party/khronos
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
		third_party/devtools-frontend/src/front_end/third_party/lighthouse
		third_party/devtools-frontend/src/front_end/third_party/lit
		third_party/devtools-frontend/src/front_end/third_party/marked
		third_party/devtools-frontend/src/front_end/third_party/puppeteer
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/parsel-js
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/rxjs
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/third_party/rxjs
		third_party/devtools-frontend/src/front_end/third_party/third-party-web
		third_party/devtools-frontend/src/front_end/third_party/vscode.web-custom-data
		third_party/devtools-frontend/src/front_end/third_party/wasmparser
		third_party/devtools-frontend/src/front_end/third_party/web-vitals
		third_party/devtools-frontend/src/third_party
		third_party/distributed_point_functions
		third_party/dom_distiller_js
		third_party/eigen3
		third_party/emoji-segmenter
		third_party/farmhash
		third_party/fast_float
		third_party/fdlibm
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
		third_party/libdrm
		third_party/libgav1
		third_party/libjingle
		third_party/libphonenumber
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
		third_party/lottie
		third_party/lss
		third_party/lzma_sdk
		third_party/mako
		third_party/markupsafe
		third_party/material_color_utilities
		third_party/mesa
		third_party/metrics_proto
		third_party/minigbm
		third_party/modp_b64
		third_party/nasm
		third_party/nearby
		third_party/neon_2_sse
		third_party/node
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
		third_party/rnnoise
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
		third_party/skia/third_party/vulkan
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
		third_party/tflite/src/third_party/eigen3
		third_party/tflite/src/third_party/fft2d
		third_party/tflite/src/third_party/xla/third_party/tsl
		third_party/tflite/src/third_party/xla/xla/tsl/framework
		third_party/tflite/src/third_party/xla/xla/tsl/lib/random
		third_party/tflite/src/third_party/xla/xla/tsl/protobuf
		third_party/tflite/src/third_party/xla/xla/tsl/util
		third_party/ukey2
		third_party/utf
		third_party/vulkan
		third_party/wasm_tts_engine
		third_party/wayland
		third_party/webdriver
		third_party/webgpu-cts
		third_party/webrtc
		third_party/webrtc/common_audio/third_party/ooura
		third_party/webrtc/common_audio/third_party/spl_sqrt_floor
		third_party/webrtc/modules/third_party/fft
		third_party/webrtc/modules/third_party/g711
		third_party/webrtc/modules/third_party/g722
		third_party/webrtc/rtc_base/third_party/base64
		third_party/webrtc/rtc_base/third_party/sigslot
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
		v8/third_party/siphash
		v8/third_party/utf8-decoder
		v8/third_party/glibc
		v8/third_party/inspector_protocol
		v8/third_party/rapidhash-v8
		v8/third_party/v8
		v8/third_party/valgrind

		# gyp -> gn leftovers
		third_party/speech-dispatcher
		third_party/usb_ids
		third_party/xdg-utils
	)
	if ! use system-harfbuzz; then
		keeplibs+=( third_party/harfbuzz-ng )
	fi

	if ! use system-ffmpeg; then
		keeplibs+=( third_party/ffmpeg third_party/opus )
	fi

	if ! use system-icu; then
		keeplibs+=( third_party/icu )
	fi

	if ! use system-png; then
		keeplibs+=( third_party/libpng )
	fi

	if ! use system-zstd; then
		keeplibs+=( third_party/zstd )
	fi

	if ! use system-av1; then
		keeplibs+=(
			third_party/dav1d
			third_party/libaom
			third_party/libaom/source/libaom/third_party/fastfeat
			third_party/libaom/source/libaom/third_party/SVT-AV1
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

	if use cromite ; then
		keeplibs+=( third_party/ungoogled )
	fi

	ebegin "Removing bundled libraries"
	# Remove most bundled libraries. Some are still needed.
	build/linux/unbundle/remove_bundled_libraries.py "${keeplibs[@]}" --do-remove
	eend $? || die

	# bundled eu-strip is for amd64 only and we don't want to pre-stripped binaries
	mkdir -p buildtools/third_party/eu-strip/bin || die
	ln -s "${EPREFIX}"/bin/true buildtools/third_party/eu-strip/bin/eu-strip || die
}

src_configure() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	local myconf_gn=""

	# Make sure the build system will use the right tools, bug #340795.
	tc-export AR CC CXX NM

	if use clang && ! tc-is-clang ; then
		einfo "Enforcing the use of clang due to USE=clang ..."
		if tc-is-cross-compiler; then
			CC="${CBUILD}-clang -target ${CHOST} --sysroot ${ESYSROOT}"
			CXX="${CBUILD}-clang++ -target ${CHOST} --sysroot ${ESYSROOT}"
			BUILD_CC=${CBUILD}-clang
			BUILD_CXX=${CBUILD}-clang++
		else
			CC=${CHOST}-clang
			CXX=${CHOST}-clang++
		fi
		strip-unsupported-flags
	elif ! use clang && ! tc-is-gcc ; then
		einfo "Enforcing the use of gcc due to USE=-clang ..."
		CC=${CHOST}-gcc
		CXX=${CHOST}-g++
		strip-unsupported-flags
	fi

	if tc-is-clang; then
		myconf_gn+=" is_clang=true clang_use_chrome_plugins=false"
	else
		myconf_gn+=" is_clang=false"
	fi

	# Force lld for lto or pgo builds only, otherwise disable, bug 641556
	if use thinlto || use pgo || use clang || use nvidia; then
		myconf_gn+=" use_lld=true"
	else
		myconf_gn+=" use_lld=false"
	fi

	if use thinlto || use pgo; then
		AR=llvm-ar
		NM=llvm-nm
		if tc-is-cross-compiler; then
			BUILD_AR=llvm-ar
			BUILD_NM=llvm-nm
		fi
	fi

	# Define a custom toolchain for GN
	myconf_gn+=" custom_toolchain=\"//build/toolchain/linux/unbundle:default\""

	if tc-is-cross-compiler; then
		tc-export BUILD_{AR,CC,CXX,NM}
		myconf_gn+=" host_toolchain=\"//build/toolchain/linux/unbundle:host\""
		myconf_gn+=" v8_snapshot_toolchain=\"//build/toolchain/linux/unbundle:host\""
		myconf_gn+=" pkg_config=\"$(tc-getPKG_CONFIG)\""
		myconf_gn+=" host_pkg_config=\"$(tc-getBUILD_PKG_CONFIG)\""

		# setup cups-config, build system only uses --libs option
		if use cups; then
			mkdir "${T}/cups-config" || die
			cp "${ESYSROOT}/usr/bin/${CHOST}-cups-config" "${T}/cups-config/cups-config" || die
			export PATH="${PATH}:${T}/cups-config"
		fi

		# Don't inherit PKG_CONFIG_PATH from environment
		local -x PKG_CONFIG_PATH=
	else
		myconf_gn+=" host_toolchain=\"//build/toolchain/linux/unbundle:default\""
	fi

	# Disable rust for now; it's only used for testing and we don't need the additional bdep
	myconf_gn+=" enable_rust=false"
	myconf_gn+=" enable_rust_png=false"

	# GN needs explicit config for Debug/Release as opposed to inferring it from build directory.
	myconf_gn+=" is_debug=$(usex debug true false)"

	# enable DCHECK with USE=debug only, increases chrome binary size by 30%, bug #811138.
	# DCHECK is fatal by default, make it configurable at runtime, #bug 807881.
	myconf_gn+=" dcheck_always_on=$(usex debug true false)"
	myconf_gn+=" dcheck_is_configurable=$(usex debug true false)"

	myconf_gn+=" enable_iterator_debugging=$(usex debug true false)"

	if use debug; then
		myconf_gn+=" symbol_level=2"
		myconf_gn+=" blink_symbol_level=2"
		myconf_gn+=" v8_symbol_level=2"
	else
		myconf_gn+=" symbol_level=0"
		myconf_gn+=" blink_symbol_level=0"
		myconf_gn+=" v8_symbol_level=0"
	fi

	# Component build isn't generally intended for use by end users. It's mostly useful
	# for development and debugging.
	myconf_gn+=" is_component_build=false"

	# Disable nacl, we can't build without pnacl (http://crbug.com/269560).
	myconf_gn+=" enable_nacl=false"

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
	if use system-png; then
		gn_system_libraries+=( libpng )
		myconf_gn+=" use_system_libpng=true"
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

	build/linux/unbundle/replace_gn_files.py --system-libraries "${gn_system_libraries[@]}" || die

	# TODO 131: The above call clobbers `enable_freetype = true` in the freetype gni file
	# drop the last line, then append the freetype line and a new curly brace to end the block
	local freetype_gni="build/config/freetype/freetype.gni"
	sed -i -e '$d' ${freetype_gni} || die
	echo "  enable_freetype = true" >> ${freetype_gni} || die
	echo "}" >> ${freetype_gni} || die

	# See dependency logic in third_party/BUILD.gn
	myconf_gn+=" use_system_harfbuzz=$(usex system-harfbuzz true false)"

	# Optional dependencies.
	myconf_gn+=" enable_hangout_services_extension=$(usex hangouts true false)"
	myconf_gn+=" enable_widevine=$(usex widevine true false)"

	if use headless; then
		myconf_gn+=" use_cups=false"
		myconf_gn+=" use_kerberos=false"
		myconf_gn+=" use_pulseaudio=false"
		myconf_gn+=" use_vaapi=false"
		myconf_gn+=" rtc_use_pipewire=false"
	else
		myconf_gn+=" use_cups=$(usex cups true false)"
		myconf_gn+=" use_kerberos=$(usex kerberos true false)"
		myconf_gn+=" use_pulseaudio=$(usex pulseaudio true false)"
		myconf_gn+=" use_vaapi=$(usex vaapi true false)"
		myconf_gn+=" rtc_use_pipewire=$(usex screencast true false)"
		myconf_gn+=" gtk_version=$(usex gtk4 4 3)"
	fi

	# Allows distributions to link pulseaudio directly (DT_NEEDED) instead of
	# using dlopen. This helps with automated detection of ABI mismatches and
	# prevents silent errors.
	if use pulseaudio; then
		myconf_gn+=" link_pulseaudio=true"
	fi

	# Non-developer builds of Chromium (for example, non-Chrome browsers, or
	# Chromium builds provided by Linux distros) should disable the testing config
	myconf_gn+=" disable_fieldtrial_testing_config=true"

	myconf_gn+=" use_gold=false"

	# The sysroot is the oldest debian image that chromium supports, we don't need it
	myconf_gn+=" use_sysroot=false"

	# This determines whether or not GN uses the bundled libcxx
	if use libcxx; then
		myconf_gn+=" use_custom_libcxx=true"
	else
		myconf_gn+=" use_custom_libcxx=false"
		append-cppflags -U_GLIBCXX_ASSERTIONS #See #318
	fi

	myconf_gn+=" use_bluez=$(usex bluetooth true false)"

	myconf_gn+=" is_cfi=$(usex cfi true false)"

	if use cfi; then
		myconf_gn+=" use_cfi_icall=true"
		myconf_gn+=" use_cfi_cast=true"
	fi

	if use pgo; then
		myconf_gn+=" chrome_pgo_phase=2"
		myconf_gn+=" v8_enable_builtins_optimization=true"
	else
		myconf_gn+=" chrome_pgo_phase=0"
	fi

	myconf_gn+=" optimize_webui=$(usex optimize-webui true false)"
	myconf_gn+=" use_system_freetype=$(usex system-harfbuzz true false)"
	myconf_gn+=" use_system_libopenjpeg2=$(usex system-openjpeg true false)"
	myconf_gn+=" enable_pdf=true"
	myconf_gn+=" use_system_lcms2=true"
	myconf_gn+=" enable_print_preview=true"

	# Ungoogled flags
	myconf_gn+=" build_with_tflite_lib=false"
	myconf_gn+=" enable_mdns=false"
	myconf_gn+=" enable_mse_mpeg2ts_stream_parser=$(usex proprietary-codecs true false)"
	myconf_gn+=" enable_reading_list=false"
	myconf_gn+=" enable_remoting=false"
	myconf_gn+=" enable_reporting=false"
	myconf_gn+=" enable_service_discovery=false"
	myconf_gn+=" exclude_unwind_tables=true"
	myconf_gn+=" google_api_key=\"\""
	myconf_gn+=" google_default_client_id=\"\""
	myconf_gn+=" google_default_client_secret=\"\""
	myconf_gn+=" safe_browsing_mode=0"
	myconf_gn+=" use_official_google_api_keys=false"
	myconf_gn+=" use_unofficial_version_number=false"

	# myconf_gn+=" enable_swiftshader=false"

	# Additional flags
	myconf_gn+=" perfetto_use_system_zlib=true"
	myconf_gn+=" use_system_zlib=true"
	myconf_gn+=" use_system_libjpeg=true"
	myconf_gn+=" rtc_build_examples=false"
	myconf_gn+=" enable_chromium_prelude=false"
	myconf_gn+=" enable_updater=false"
	myconf_gn+=" enable_update_notifications=false"

	# Disable pseudolocales, only used for testing
	myconf_gn+=" enable_pseudolocales=false"

	# Disable code formating of generated files
	myconf_gn+=" blink_enable_generated_code_formatting=false"

	ffmpeg_branding="$(usex proprietary-codecs Chrome Chromium)"
	myconf_gn+=" proprietary_codecs=$(usex proprietary-codecs true false)"
	myconf_gn+=" ffmpeg_branding=\"${ffmpeg_branding}\""

	local myarch="$(tc-arch)"

	# Avoid CFLAGS problems
	if ! use custom-cflags; then
		filter-flags "-O*" "-Wl,-O*" #See #25
		strip-flags

		# Prevent linker from running out of address space, bug #471810 .
		if use x86; then
			filter-flags "-g*"
		fi

		# Prevent libvpx/xnnpack build failures. Bug 530248, 544702, 546984, 853646.
		if [[ ${myarch} == amd64 || ${myarch} == x86 ]]; then
			filter-flags -mno-mmx -mno-sse2 -mno-ssse3 -mno-sse4.1 -mno-avx -mno-avx2 -mno-fma -mno-fma4 -mno-xop -mno-sse4a
		fi

		if tc-is-gcc; then
			# https://bugs.gentoo.org/904455
			local -x CPP="$(tc-getCXX) -E"
			# https://bugs.gentoo.org/912381
			filter-lto
		fi
	fi

	local dest_cpu=""

	if [[ $myarch = amd64 ]] ; then
		dest_cpu=x64
		myconf_gn+=" target_cpu=\"x64\""
		ffmpeg_target_arch=x64
		dest_cpu="x64"
	elif [[ $myarch = x86 ]] ; then
		myconf_gn+=" target_cpu=\"x86\""
		ffmpeg_target_arch=ia32
		dest_cpu="x86"

		# This is normally defined by compiler_cpu_abi in
		# build/config/compiler/BUILD.gn, but we patch that part out.
		append-flags -msse2 -mfpmath=sse -mmmx
	elif [[ $myarch = arm64 ]] ; then
		myconf_gn+=" target_cpu=\"arm64\""
		ffmpeg_target_arch=arm64
		dest_cpu="arm64"
	elif [[ $myarch = arm ]] ; then
		myconf_gn+=" target_cpu=\"arm\""
		ffmpeg_target_arch=$(usex cpu_flags_arm_neon arm-neon arm)
		dest_cpu="arm"
	elif [[ $myarch = ppc64 ]] ; then
		myconf_gn+=" target_cpu=\"ppc64\""
		ffmpeg_target_arch=ppc64
		dest_cpu="ppc64"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi

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

	myconf_gn+=" treat_warnings_as_errors=false"
	# Disable fatal linker warnings, bug 506268.
	myconf_gn+=" fatal_linker_warnings=false"

	# Disable external code space for V8 for ppc64. It is disabled for ppc64
	# by default, but cross-compiling on amd64 enables it again.
	if tc-is-cross-compiler; then
		if ! use amd64 && ! use arm64; then
			myconf_gn+=" v8_enable_external_code_space=false"
		fi
	fi

	# Only enabled for clang, but gcc has endian macros too
	myconf_gn+=" v8_use_libm_trig_functions=true"

	# Bug 491582.
	export TMPDIR="${WORKDIR}/temp"
	mkdir -p -m 755 "${TMPDIR}" || die

	# https://bugs.gentoo.org/654216
	addpredict /dev/dri/ #nowarn

	# Disable unknown warning message from clang.
	if tc-is-clang; then
		append-flags -Wno-unknown-warning-option
		if tc-is-cross-compiler; then
			export BUILD_CXXFLAGS+=" -Wno-unknown-warning-option"
			export BUILD_CFLAGS+=" -Wno-unknown-warning-option"
		fi
	fi

	# Explicitly disable ICU data file support for system-icu/headless builds.
	if use system-icu || use headless; then
		myconf_gn+=" icu_use_data_file=false"
	fi

	# Don't need nocompile checks and GN crashes with our config
	myconf_gn+=" enable_nocompile_tests=false"

	# 131 began laying the groundwork for replacing freetype with
	# "Rust-based Fontations set of libraries plus Skia path rendering"
	# We now need to opt-in
	myconf_gn+=" enable_freetype=true"

	# Enable ozone wayland and/or headless support
	myconf_gn+=" use_ozone=true ozone_auto_platforms=false"
	myconf_gn+=" ozone_platform_headless=true"
	if use headless; then
		myconf_gn+=" ozone_platform=\"headless\""
		myconf_gn+=" use_xkbcommon=false use_gtk=false use_qt=false"
		myconf_gn+=" use_glib=false use_gio=false"
		myconf_gn+=" use_pangocairo=false use_alsa=false"
		myconf_gn+=" use_libpci=false use_udev=false"
		myconf_gn+=" enable_print_preview=false"
		myconf_gn+=" enable_remoting=false"
	else
		myconf_gn+=" use_system_minigbm=true"
		myconf_gn+=" use_xkbcommon=true"
		if use qt5 || use qt6; then
			local cbuild_libdir=$(get_libdir)
			if tc-is-cross-compiler; then
				# Hack to workaround get_libdir not being able to handle CBUILD, bug #794181
				local cbuild_libdir=$($(tc-getBUILD_PKG_CONFIG) --keep-system-libs --libs-only-L libxslt)
				cbuild_libdir=${cbuild_libdir:2}
				cbuild_libdir=${cbuild_libdir/% }
			fi
			if use qt5; then
				if tc-is-cross-compiler; then
					myconf_gn+=" moc_qt5_path=\"${EPREFIX}/${cbuild_libdir}/qt5/bin\""
				else
					myconf_gn+=" moc_qt5_path=\"$(qt5_get_bindir)\""
				fi
			fi
			if use qt6; then
				myconf_gn+=" moc_qt6_path=\"${EPREFIX}/usr/${cbuild_libdir}/qt6/libexec\""
			fi

			myconf_gn+=" use_qt=true"
			myconf_gn+=" use_qt6=$(usex qt6 true false)"
		else
			myconf_gn+=" use_qt=false"
		fi
		myconf_gn+=" ozone_platform_x11=$(usex X true false)"
		myconf_gn+=" ozone_platform_wayland=$(usex wayland true false)"
		myconf_gn+=" ozone_platform=$(usex wayland \"wayland\" \"x11\")"
		use wayland && myconf_gn+=" use_system_libffi=true"
	fi

	# Results in undefined references in chrome linking, may require CFI to work
	if use arm64; then
		myconf_gn+=" arm_control_flow_integrity=\"none\""
	fi

	# Enable official builds
	myconf_gn+=" is_official_build=$(usex official true false)"
	myconf_gn+=" use_thin_lto=$(usex thinlto true false)"
	myconf_gn+=" thin_lto_enable_optimizations=$(usex optimize-thinlto true false)"
	if use official; then
		# Allow building against system libraries in official builds
		sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
			tools/generate_shim_headers/generate_shim_headers.py || die
	else
		myconf_gn+=" devtools_skip_typecheck=false"
	fi

	# user CXXFLAGS might overwrite -march=armv8-a+crc+crypto, bug #851639
	if use arm64 && tc-is-gcc; then
		sed -i '/^#if HAVE_ARM64_CRC32C/a #pragma GCC target ("+crc+crypto")' \
			third_party/crc32c/src/src/crc32c_arm64.cc || die
	fi

	# skipping typecheck is only supported on amd64, bug #876157
	if ! use amd64; then
		myconf_gn+=" devtools_skip_typecheck=false"
	fi

	# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
	append-cflags -Wno-builtin-macro-redefined
	append-cxxflags -Wno-builtin-macro-redefined
	append-cppflags "-D__DATE__= -D__TIME__= -D__TIMESTAMP__="

	local flags
	einfo "Building with the following compiler settings:"
	for flags in C{C,XX} AR NM RANLIB {C,CXX,CPP,LD}FLAGS \
		EXTRA_GN UGC_{SKIP_{PATCHES,SUBSTITUTION},KEEP_BINARIES} ; do
		einfo "  ${flags} = \"${!flags}\""
	done

	einfo "Configuring Chromium ..."
	set -- gn gen --args="${myconf_gn} ${EXTRA_GN}" out/Release
	echo "$@"
	"$@" || die

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

	# Don't inherit PYTHONPATH from environment, bug #789021, #812689
	local -x PYTHONPATH=

	use convert-dict && eninja -C out/Release convert_dict

	# Build mksnapshot and pax-mark it.
	if use pax-kernel; then
		local x
		for x in mksnapshot v8_context_snapshot_generator; do
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
	eninja -C out/Release chrome

	use enable-driver && eninja -C out/Release chromedriver
	#use suid && eninja -C out/Release chrome_sandbox

	pax-mark m out/Release/chrome

	use enable-driver && mv out/Release/chromedriver

	rm -f out/Release/locales/*.pak.info || die

	# Build manpage; bug #684550
	sed -e 's|@@PACKAGE@@|chromium-browser|g;
		s|@@MENUNAME@@|Chromium|g;' \
		chrome/app/resources/manpage.1.in > \
		out/Release/chromium-browser.1 || die

	# Build desktop file; bug #706786
	sed -e 's|@@MENUNAME@@|Chromium|g;
		s|@@USR_BIN_SYMLINK_NAME@@|chromium-browser|g;
		s|@@PACKAGE@@|chromium-browser|g;
		s|\(^Exec=\)/usr/bin/|\1|g;' \
		chrome/installer/linux/common/desktop.template > \
		out/Release/chromium-browser-chromium.desktop || die

	# Build vk_swiftshader_icd.json; bug #827861
	sed -e 's|${ICD_LIBRARY_PATH}|./libvk_swiftshader.so|g' \
		third_party/swiftshader/src/Vulkan/vk_swiftshader_icd.json.tmpl > \
		out/Release/vk_swiftshader_icd.json || die
}

src_install() {
	local CHROMIUM_HOME="/usr/$(get_libdir)/chromium-browser"
	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/chrome

	if use convert-dict; then
		newexe "${FILESDIR}/update-dicts.sh" update-dicts.sh
		doexe out/Release/convert_dict
	fi

	#if use suid; then
	#	newexe out/Release/chrome_sandbox chrome-sandbox
	#	fperms 4755 "${CHROMIUM_HOME}/chrome-sandbox"
	#fi

	use enable-driver && doexe out/Release/chromedriver
	#doexe out/Release/chrome_crashpad_handler

	ozone_auto_session () {
		use X && use wayland && ! use headless && echo true || echo false
	}
	local sedargs=( -e
			"s:/usr/lib/:/usr/$(get_libdir)/:g;
			s:@@OZONE_AUTO_SESSION@@:$(ozone_auto_session):g"
	)
	sed "${sedargs[@]}" "${FILESDIR}/chromium-launcher-r7.sh" > chromium-launcher.sh || die
	doexe chromium-launcher.sh

	# It is important that we name the target "chromium-browser",
	# xdg-utils expect it; bug #355517.
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium-browser
	# keep the old symlink around for consistency
	dosym "${CHROMIUM_HOME}/chromium-launcher.sh" /usr/bin/chromium

	use enable-driver && dosym "${CHROMIUM_HOME}/chromedriver" /usr/bin/chromedriver

	# Allow users to override command-line options, bug #357629.
	insinto /etc/chromium
	newins "${FILESDIR}/chromium.default" "default"

	pushd out/Release/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins out/Release/*.bin
	doins out/Release/*.pak
	(
		shopt -s nullglob
		local files=(out/Release/*.so out/Release/*.so.[0-9])
		[[ ${#files[@]} -gt 0 ]] && doins "${files[@]}"
	)

	# Install bundled xdg-utils, avoids installing X11 libraries with USE="-X wayland"
	doins out/Release/xdg-{settings,mime}

	if ! use system-icu && ! use headless; then
		doins out/Release/icudtl.dat
	fi

	doins -r out/Release/locales
	#doins -r out/Release/MEIPreload

	# Install vk_swiftshader_icd.json; bug #827861
	doins out/Release/vk_swiftshader_icd.json

	if [[ -d out/Release/swiftshader ]]; then
		insinto "${CHROMIUM_HOME}/swiftshader"
		doins out/Release/swiftshader/*.so
	fi

	use widevine && dosym WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so /usr/$(get_libdir)/chromium-browser/libwidevinecdm.so

	# Install icons
	local branding size
	for size in 16 24 32 48 64 128 256 ; do
		case ${size} in
			16|32) branding="chrome/app/theme/default_100_percent/chromium" ;;
				*) branding="chrome/app/theme/chromium" ;;
		esac
		newicon -s ${size} "${branding}/product_logo_${size}.png" \
			chromium-browser.png
	done

	# Install desktop entry
	domenu out/Release/chromium-browser-chromium.desktop

	# Install GNOME default application entry (bug #303100).
	insinto /usr/share/gnome-control-center/default-apps
	newins "${FILESDIR}"/chromium-browser.xml chromium-browser.xml

	# Install manpage; bug #684550
	doman out/Release/chromium-browser.1
	dosym chromium-browser.1 /usr/share/man/man1/chromium.1

	readme.gentoo_create_doc
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	readme.gentoo_print_elog

	if ! use headless; then
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
			elog
			elog "Additional setup may be required for screencasting to work."
			elog "See issue: https://github.com/PF4Public/gentoo-overlay/issues/314"
		fi
		if use gtk4; then
			elog "Chromium prefers GTK3 over GTK4 at runtime. To override this"
			elog "behaviour you need to pass --gtk-version=4, e.g. by adding it"
			elog "to CHROMIUM_FLAGS in /etc/chromium/default."
		fi
		if use widevine; then
			elog "widevine requires binary plugins, which are distributed separately"
			elog "Make sure you have www-plugins/chrome-binary-plugins installed"
		fi
		if use qt5 && use qt6; then
			elog "Chromium automatically selects Qt5 or Qt6 based on your desktop"
			elog "environment. To override you need to pass --qt-version=5 or"
			elog "--qt-version=6, e.g. by adding it to CHROMIUM_FLAGS in"
			elog "/etc/chromium/default."
		fi
	fi
}

eapply_wrapper () {
	if [ ! -z "${NODIE}" ]; then
		nonfatal eapply "$@"
	else
		eapply "$@"
	fi
}

git_wrapper () {
	if [ ! -z "${NODIE}" ]; then
		git "$@"
	else
		git "$@" || die
	fi
}

filter_wrapper () {
	einfo "Applying ${i##*/}"
	if [ ! -z "${NODIE}" ]; then
		filterdiff -p1 "${@:2}" < "$1" | patch -p1
	else
		filterdiff -p1 "${@:2}" < "$1" | patch -p1 || die
	fi
}
