# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..11} )
PYTHON_REQ_USE="xml(+)"

CHROMIUM_LANGS="af am ar bg bn ca cs da de el en-GB es es-419 et fa fi fil fr gu he
	hi hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr
	sv sw ta te th tr uk ur vi zh-CN zh-TW"

inherit check-reqs chromium-2 desktop flag-o-matic ninja-utils pax-utils python-any-r1 qmake-utils readme.gentoo-r1 toolchain-funcs xdg-utils

# Use following environment variables to customise the build
# EXTRA_GN — pass extra options to gn
# NINJAOPTS="-k0 -j8" useful to populate ccache even if ebuild is still failing
# UGC_SKIP_PATCHES — space-separated list of patches to skip
# UGC_KEEP_BINARIES — space-separated list of binaries to keep
# UGC_SKIP_SUBSTITUTION — space-separated list of files to skip domain substitution

DESCRIPTION="Modifications to Chromium for removing Google integration and enhancing privacy"
HOMEPAGE="https://github.com/ungoogled-software/ungoogled-chromium"
PATCHSET="2"
PATCHSET_NAME="chromium-$(ver_cut 1)-patchset-${PATCHSET}"
PATCHSET_URI_PPC64="https://quickbuild.io/~raptor-engineering-public"
PATCHSET_NAME_PPC64="chromium_109.0.5414.74-2raptor0~deb11u1.debian"
SRC_URI="https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${PV/_*}.tar.xz
	https://github.com/stha09/chromium-patches/releases/download/${PATCHSET_NAME}/${PATCHSET_NAME}.tar.xz
	ppc64? (
		${PATCHSET_URI_PPC64}/+archive/ubuntu/chromium/+files/${PATCHSET_NAME_PPC64}.tar.xz
		https://dev.gentoo.org/~sultan/distfiles/www-client/chromium/chromium-ppc64le-gentoo-patches-1.tar.xz
	)
"

LICENSE="BSD"
SLOT="0"
# KEYWORDS="amd64 ~arm64 ~x86"
IUSE="+X cfi +clang convert-dict cups cpu_flags_arm_neon custom-cflags debug enable-driver gtk4 hangouts headless hevc js-type-check kerberos +official optimize-thinlto optimize-webui pgo pic +proprietary-codecs pulseaudio qt5 screencast selinux suid +system-av1 +system-ffmpeg +system-harfbuzz +system-icu +system-jsoncpp +system-libevent +system-libusb system-libvpx +system-openh264 system-openjpeg +system-png +system-re2 +system-snappy thinlto vaapi vdpau wayland widevine"
RESTRICT="
	!system-ffmpeg? ( proprietary-codecs? ( bindist ) )
	!system-openh264? ( bindist )
"
REQUIRED_USE="
	thinlto? ( clang )
	optimize-thinlto? ( thinlto )
	cfi? ( thinlto )
	pgo? ( clang )
	x86? ( !thinlto !widevine )
	screencast? ( wayland )
	!headless ( || ( X wayland ) )
	!proprietary-codecs? ( !hevc )
"

# UGC_COMMIT_ID="8d48a884504c5184a9197f9128ffae8b7f106032"
# UGC_PR_COMMITS=(
# 	f2fbbb954431dcb4f1a62779053692fa2b5c7971
# 	08aaf6a0c81eb14b5eee59dd92281cd05043f3a7
# )

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
		SRC_URI+="https://github.com/ungoogled-software/${PN}/commit/$i.patch -> ${PN}-$i.patch
		"
	done
fi

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
	system-snappy? ( app-arch/snappy )
	system-jsoncpp? ( dev-libs/jsoncpp )
	system-libevent? ( dev-libs/libevent )
	system-openjpeg? ( media-libs/openjpeg:2= )
	system-re2? ( >=dev-libs/re2-0.2019.08.01:= )
	system-libvpx? ( >=media-libs/libvpx-1.8.2:=[postproc] )
	system-libusb? ( virtual/libusb:1 )
	system-icu? ( >=dev-libs/icu-71.1:= )
	>=dev-libs/libxml2-2.9.4-r3:=[icu]
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	dev-libs/libxslt:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	system-harfbuzz? ( >=media-libs/harfbuzz-3:0=[icu(-)] )
	media-libs/libjpeg-turbo:=
	system-png? ( media-libs/libpng:= )
	>=media-libs/libwebp-0.4.0:=
	media-libs/mesa:=[gbm(+)]
	>=media-libs/openh264-1.6.0:=
	system-av1? (
		>=media-libs/dav1d-1.0.0:=
		>=media-libs/libaom-3.4.0:=
	)
	sys-libs/zlib:=
	x11-libs/libdrm:=
	!headless? (
		dev-libs/glib:2
		>=media-libs/alsa-lib-1.0.19:=
		pulseaudio? (
			|| (
				media-sound/pulseaudio
				>=media-sound/apulse-0.1.9
			)
		)
		sys-apps/pciutils:=
		kerberos? ( virtual/krb5 )
		vaapi? ( >=media-libs/libva-2.7:=[X?,wayland?] )
		X? (
			x11-libs/libX11:=
			x11-libs/libXext:=
			x11-libs/libxcb:=
		)
		x11-libs/libxkbcommon:=
		wayland? (
			dev-libs/wayland:=
			screencast? ( media-video/pipewire:= )
		)
	)
"

COMMON_DEPEND="
	${COMMON_SNAPSHOT_DEPEND}
	app-arch/bzip2:=
	dev-libs/expat:=
	system-ffmpeg? (
		>=media-video/ffmpeg-4.3:=
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
		X? ( ${COMMON_X_DEPEND} )
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
	)
"
RDEPEND="${COMMON_DEPEND}
	!headless? (
		|| (
			x11-libs/gtk+:3[X?,wayland?]
			gui-libs/gtk:4[X?,wayland?]
		)
		qt5? ( dev-qt/qtgui:5[X?,wayland?] )
		x11-misc/xdg-utils
	)
	virtual/ttf-fonts
	selinux? ( sec-policy/selinux-chromium )
	!www-client/chromium
	!www-client/chromium-bin
	!www-client/ungoogled-chromium-bin
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
	)
	dev-lang/perl
	>=dev-util/gn-0.1807
	>=dev-util/gperf-3.0.3
	>=dev-util/ninja-1.7.2
	dev-vcs/git
	>=net-libs/nodejs-7.6.0[inspector]
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	js-type-check? ( virtual/jre )
	clang? ( sys-devel/clang sys-devel/lld )
	cfi? ( sys-devel/clang-runtime[sanitize] )
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
	if [[ ${MERGE_TYPE} != binary ]]; then
		# Commented due to #86
		# local -x CPP="$(tc-getCXX) -E"
		# if tc-is-gcc && ! ver_test "$(gcc-version)" -ge 9.2; then
		# 	[[ -z "${NODIE}" ]] && die "At least gcc 9.2 is required"
		# fi
		# if use clang || tc-is-clang; then
		# 	tc-is-cross-compiler && CPP=${CBUILD}-clang++ || CPP=${CHOST}-clang++
		# 	CPP+=" -E"
		# 	if ! ver_test "$(clang-major-version)" -ge 12; then
		# 		[[ -z "${NODIE}" ]] && die "At least clang 12 is required"
		# 	fi
		# fi
		if [[ ${EBUILD_PHASE_FUNC} == pkg_setup ]] && use js-type-check; then
			"${BROOT}"/usr/bin/java -version 2>1 > /dev/null || die "Java VM not setup correctly"
		fi
	fi

	# Check build requirements, bug #541816 and bug #471810 .
	CHECKREQS_MEMORY="4G"
	CHECKREQS_DISK_BUILD="12G"
	tc-is-cross-compiler && CHECKREQS_DISK_BUILD="14G"
	if ( shopt -s extglob; is-flagq '-g?(gdb)?([1-9])' ); then
		CHECKREQS_DISK_BUILD="16G"
	fi
	check-reqs_${EBUILD_PHASE_FUNC}
}

pkg_pretend() {
	if has_version "sys-libs/libcxx"; then
		ewarn
		ewarn "You have sys-libs/libcxx, please be aware that system-*"
		ewarn "and some other c++ dependencies need to be compiled"
		ewarn "with the same library as ungoogled-chromium itself"
		ewarn "dev-libs/jsoncpp is most problematic, see #58 #49 #119 for details"
		ewarn
	fi
	if use cfi; then
		ewarn
		ewarn "Building with cfi is only possible if building with -stdlib=libc++"
		ewarn "Make sure all dependencies are also built this way, see #40"
		ewarn
	fi
	if use system-libvpx && use vaapi; then
		ewarn
		ewarn "New vaapi code depends heavily on libvpx, see #43"
		ewarn "Consider disabling system-libvpx USE flag if using vaapi"
		ewarn "A patch to make vaapi compatible with system libvpx is welcome"
		ewarn
		[[ -z "${NODIE}" ]] && die "The build will fail!"
	fi
	pre_build_checks

	if use headless; then
		local headless_unused_flags=("cups" "kerberos" "pulseaudio" "qt5" "vaapi" "wayland")
		for myiuse in ${headless_unused_flags[@]}; do
			use ${myiuse} && ewarn "Ignoring USE=${myiuse} since USE=headless is set."
		done
	fi
}

pkg_setup() {
	pre_build_checks

	chromium_suid_sandbox_check_kernel_config

	# nvidia-drivers does not work correctly with Wayland due to unsupported EGLStreams
	if use wayland && ! use headless && has_version "x11-drivers/nvidia-drivers"; then
		ewarn "Proprietary nVidia driver does not work with Wayland. You can disable"
		ewarn "Wayland by setting DISABLE_OZONE_PLATFORM=true in /etc/chromium/default."
	fi
}

src_prepare() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	if ! use custom-cflags; then #See #25 #92
		sed -i '/default_stack_frames/Q' ${WORKDIR}/patches/chromium-*-compiler.patch || die
	fi

	# disable global media controls, crashes with libstdc++
	sed -i -e \
		"/\"GlobalMediaControlsCastStartStop\",/{n;s/ENABLED/DISABLED/;}" \
		"chrome/browser/media/router/media_router_feature.cc" || die

	local PATCHES=(
		"${WORKDIR}/patches"
		"${FILESDIR}/chromium-93-InkDropHost-crash.patch"
		"${FILESDIR}/chromium-98-gtk4-build.patch"
		"${FILESDIR}/chromium-108-EnumTable-crash.patch"
		"${FILESDIR}/chromium-109-system-zlib.patch"
		"${FILESDIR}/chromium-109-system-openh264.patch"
		"${FILESDIR}/chromium-109-system-icu.patch"
		"${FILESDIR}/chromium-use-oauth2-client-switches-as-default.patch"
		"${FILESDIR}/chromium-shim_headers.patch"
		"${FILESDIR}/chromium-cross-compile.patch"
		"${FILESDIR}/perfetto-system-zlib.patch"
		"${FILESDIR}/gtk-fix-prefers-color-scheme-query.diff"
		"${FILESDIR}/restore-x86-r2.patch"
	)

	if use ppc64 ; then
		local p
		for p in $(grep -v "^#" "${WORKDIR}"/debian/patches/series | grep "^ppc64le" || die); do
			if [[ ! $p =~ "fix-breakpad-compile.patch" ]]; then
				eapply "${WORKDIR}/debian/patches/${p}"
			fi
		done
		PATCHES+=( "${WORKDIR}/ppc64le" )
	fi

	default

	mkdir -p third_party/node/linux/node-linux-x64/bin || die
	ln -s "${EPREFIX}"/usr/bin/node third_party/node/linux/node-linux-x64/bin/node || die

	# adjust python interpreter version
	sed -i -e "s|\(^script_executable = \).*|\1\"${EPYTHON}\"|g" .gn || die

	cp "${FILESDIR}/jsoncpp.gn" build/linux/unbundle || die
	cp "${FILESDIR}/libusb.gn" build/linux/unbundle || die
	sed -i '/^REPLACEMENTS.*$/{s++REPLACEMENTS = {"libusb":"third_party/libusb/BUILD.gn","jsoncpp":"third_party/jsoncpp/BUILD.gn",+;h};${x;/./{x;q0};x;q1}' \
		build/linux/unbundle/replace_gn_files.py || die
	sed -i '/^.*deps.*third_party\/jsoncpp.*$/{s++public_deps = [ "//third_party/jsoncpp" ]+;h};${x;/./{x;q0};x;q1}' \
		third_party/webrtc/rtc_base/BUILD.gn || die

	use convert-dict && eapply "${FILESDIR}/chromium-ucf-dict-utility.patch"

	if use hevc; then
		sed -i '/^bool IsHevcProfileSupported(const VideoType& type) {$/{s++bool IsHevcProfileSupported(const VideoType\& type) { return true;+;h};${x;/./{x;q0};x;q1}' \
			media/base/supported_types.cc || die
	fi

	use system-ffmpeg && eapply "${FILESDIR}/chromium-99-opus.patch"

	if use system-ffmpeg; then
		if has_version "<media-video/ffmpeg-5.0"; then
			eapply "${FILESDIR}/chromium-93-ffmpeg-4.4.patch"
			eapply "${FILESDIR}/unbundle-ffmpeg-av_stream_get_first_dts.patch"
		fi
		eapply "${FILESDIR}/reverse-roll-src-third_party-ffmpeg.patch"
		eapply "${FILESDIR}/reverse-roll-src-third_party-ffmpeg_duration.patch"
	fi

	use system-openjpeg && eapply "${FILESDIR}/chromium-system-openjpeg-r3.patch"

	use vdpau && eapply "${FILESDIR}/vdpau-support-r4.patch"

	#* Applying UGC PRs here
	if [ ! -z "${UGC_PR_COMMITS[*]}" ]; then
		pushd "${UGC_WD}" >/dev/null
		for i in "${UGC_PR_COMMITS[@]}"; do
			eapply "${DISTDIR}/${PN}-$i.patch"
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

	local ugc_p ugc_dir
	for p in "${ugc_unneeded[@]}"; do
		einfo "Removing ${p}.patch"
		sed -i "\!${p}.patch!d" "${ugc_patch_series}" || die
	done

	if use js-type-check; then
		ewarn "Keeping binary compiler.jar in source tree for js-type-check"
		sed -i '\!third_party/closure_compiler/compiler/compiler.jar!d' "${ugc_pruning_list}" || die
	fi

	sed -i '\!third_party/hyphenation-patterns/hyb/.*!d' "${ugc_pruning_list}" || die

	if use pgo || [ ! -z "$UGC_COMMIT_ID" ]; then
		ewarn "Keeping binary profile data in source tree for pgo"
		sed -i '\!chrome/build/pgo_profiles/.*!d' "${ugc_pruning_list}" || die
	fi

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
	"${UGC_WD}/utils/domain_substitution.py" -q apply -r "${UGC_WD}/domain_regex.list" -f "${UGC_WD}/domain_substitution.list" -c build/domsubcache.tar.gz .
	eend $? || die

	local keeplibs=(
		base/third_party/cityhash
		base/third_party/double_conversion
		base/third_party/dynamic_annotations
		base/third_party/icu
		base/third_party/nspr
		base/third_party/superfasthash
		base/third_party/symbolize
		base/third_party/valgrind
		base/third_party/xdg_mime
		base/third_party/xdg_user_dirs
		buildtools/third_party/libc++
		buildtools/third_party/libc++abi
		chrome/third_party/mozilla_security_manager
		courgette/third_party
		net/third_party/mozilla_security_manager
		net/third_party/nss
		net/third_party/quic
		net/third_party/uri_template
		third_party/abseil-cpp
		third_party/angle
		third_party/angle/src/common/third_party/base
		third_party/angle/src/common/third_party/smhasher
		third_party/angle/src/common/third_party/xxhash
		third_party/angle/src/third_party/libXNVCtrl
		third_party/angle/src/third_party/trace_event
		third_party/angle/src/third_party/volk
		third_party/apple_apsl
		third_party/axe-core
		third_party/blink
		third_party/bidimapper
		third_party/boringssl
		third_party/boringssl/src/third_party/fiat
		third_party/breakpad
		third_party/breakpad/breakpad/src/third_party/curl
		third_party/brotli
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
		third_party/crashpad
		third_party/crashpad/crashpad/third_party/lss
		third_party/crashpad/crashpad/third_party/zlib
		third_party/crc32c
		third_party/cros_system_api
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
		third_party/devtools-frontend/src/front_end/third_party/diff
		third_party/devtools-frontend/src/front_end/third_party/i18n
		third_party/devtools-frontend/src/front_end/third_party/intl-messageformat
		third_party/devtools-frontend/src/front_end/third_party/lighthouse
		third_party/devtools-frontend/src/front_end/third_party/lit-html
		third_party/devtools-frontend/src/front_end/third_party/lodash-isequal
		third_party/devtools-frontend/src/front_end/third_party/marked
		third_party/devtools-frontend/src/front_end/third_party/puppeteer
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/wasmparser
		third_party/devtools-frontend/src/test/unittests/front_end/third_party/i18n
		third_party/devtools-frontend/src/third_party
		third_party/distributed_point_functions
		third_party/dom_distiller_js
		third_party/eigen3
		third_party/emoji-segmenter
		third_party/farmhash
		third_party/fdlibm
		third_party/fft2d
		third_party/flatbuffers
		third_party/fp16
		third_party/freetype
		third_party/fusejs
		third_party/fxdiv
		third_party/highway
		third_party/liburlpattern
		third_party/libzip
		third_party/gemmlowp
		third_party/google_input_tools
		third_party/google_input_tools/third_party/closure_library
		third_party/google_input_tools/third_party/closure_library/third_party/closure
		third_party/googletest
		third_party/hunspell
		third_party/hyphenation-patterns
		third_party/iccjpeg
		third_party/inspector_protocol
		third_party/ipcz
		third_party/jinja2
	)
	use system-jsoncpp || keeplibs+=(
		third_party/jsoncpp
	)
	keeplibs+=(
		third_party/jstemplate
		third_party/khronos
		third_party/leveldatabase
		third_party/libaddressinput
		third_party/libavif
	)
	use system-libevent || keeplibs+=(
		third_party/libevent
	)
	keeplibs+=(

		third_party/libgav1
		third_party/libjingle
		third_party/libjxl
		third_party/libphonenumber
		third_party/libsecret
		third_party/libsrtp
		third_party/libsync
		third_party/libudev
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
		third_party/llvm
		third_party/lottie
		third_party/lss
		third_party/lzma_sdk
		third_party/mako
		third_party/maldoca
		third_party/maldoca/src/third_party/tensorflow_protos
		third_party/maldoca/src/third_party/zlibwrapper
		third_party/markupsafe
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
		third_party/openscreen/src/third_party/mozilla
		third_party/openscreen/src/third_party/tinycbor/src/src
		third_party/ots
		third_party/pdfium
		third_party/pdfium/third_party/agg23
		third_party/pdfium/third_party/base
		third_party/pdfium/third_party/bigint
		third_party/pdfium/third_party/freetype
		third_party/pdfium/third_party/lcms
	)
	use system-openjpeg || keeplibs+=(
		third_party/pdfium/third_party/libopenjpeg
	)
	keeplibs+=(
		third_party/pdfium/third_party/libpng16
		third_party/pdfium/third_party/libtiff
		third_party/pdfium/third_party/skia_shared
		third_party/perfetto
		third_party/perfetto/protos/third_party/chromium
		third_party/pffft
		third_party/ply
		third_party/polymer
		third_party/private-join-and-compute
		third_party/private_membership
		third_party/protobuf
		third_party/protobuf/third_party/six
		third_party/pthreadpool
		third_party/pyjson5
		third_party/pyyaml
		third_party/qcms
		third_party/rnnoise
		third_party/s2cellid
		third_party/securemessage
		third_party/selenium-atoms
		third_party/shell-encryption
		third_party/simplejson
		third_party/skia
		third_party/skia/include/third_party/vulkan
		third_party/skia/third_party/vulkan
		third_party/smhasher
	)
	use system-snappy || keeplibs+=(
		third_party/snappy
	)
	keeplibs+=(
		third_party/sqlite
		third_party/swiftshader
		third_party/swiftshader/third_party/astc-encoder
		third_party/swiftshader/third_party/llvm-subzero
		third_party/swiftshader/third_party/marl
		third_party/swiftshader/third_party/subzero
		third_party/swiftshader/third_party/SPIRV-Headers/include/spirv
		third_party/swiftshader/third_party/SPIRV-Tools
		third_party/tensorflow_models
		third_party/tensorflow-text
		third_party/tflite
		third_party/tflite/src/third_party/eigen3
		third_party/tflite/src/third_party/fft2d
		third_party/ruy
		third_party/six
		third_party/ukey2
		third_party/utf
		third_party/vulkan
		third_party/web-animations-js
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
		third_party/woff2
		third_party/wuffs
		third_party/x11proto
		third_party/xcbproto
		third_party/xnnpack
		third_party/zxcvbn-cpp
		third_party/zlib/google
		url/third_party/mozilla
		v8/src/third_party/siphash
		v8/src/third_party/valgrind
		v8/src/third_party/utf8-decoder
		v8/third_party/inspector_protocol
		v8/third_party/v8

		# gyp -> gn leftovers
		third_party/speech-dispatcher
		third_party/usb_ids
		third_party/xdg-utils
	)
	if ! use system-ffmpeg; then
		keeplibs+=( third_party/ffmpeg third_party/opus )
	fi
	if ! use system-icu; then
		keeplibs+=( third_party/icu )
	fi
	if ! use system-png; then
		keeplibs+=( third_party/libpng )
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
	if ! use system-harfbuzz; then
		keeplibs+=( third_party/harfbuzz-ng )
	fi
	if use wayland && ! use headless ; then
		keeplibs+=( third_party/wayland )
	fi
	if ! use system-openh264; then
		keeplibs+=( third_party/openh264 )
	fi
	if ! use system-re2; then
		keeplibs+=( third_party/re2 )
	fi
	if use arm64 || use ppc64 ; then
		keeplibs+=( third_party/swiftshader/third_party/llvm-10.0 )
	fi
	# we need to generate ppc64 stuff because upstream does not ship it yet
	# it has to be done before unbundling.
	if use ppc64; then
		pushd third_party/libvpx >/dev/null || die
		mkdir -p source/config/linux/ppc64 || die
		# requires git and clang, bug #832803
		sed -i -e "s|^update_readme||g; s|clang-format|${EPREFIX}/bin/true|g" \
			generate_gni.sh || die
		./generate_gni.sh || die
		popd >/dev/null || die

		pushd third_party/ffmpeg >/dev/null || die
		cp libavcodec/ppc/h264dsp.c libavcodec/ppc/h264dsp_ppc.c || die
		cp libavcodec/ppc/h264qpel.c libavcodec/ppc/h264qpel_ppc.c || die
		popd >/dev/null || die
	fi

	# Remove most bundled libraries. Some are still needed.
	build/linux/unbundle/remove_bundled_libraries.py "${keeplibs[@]}" --do-remove || die

	if use js-type-check; then
		mkdir -p third_party/jdk/current/bin/ || die
		ln -s "${EPREFIX}"/usr/bin/java third_party/jdk/current/bin/java || die
	fi

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
	if use thinlto || use pgo; then
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

	# GN needs explicit config for Debug/Release as opposed to inferring it from build directory.
	myconf_gn+=" is_debug=false"

	# enable DCHECK with USE=debug only, increases chrome binary size by 30%, bug #811138.
	# DCHECK is fatal by default, make it configurable at runtime, #bug 807881.
	myconf_gn+=" dcheck_always_on=$(usex debug true false)"
	myconf_gn+=" dcheck_is_configurable=$(usex debug true false)"

	# Disable nacl, we can't build without pnacl (http://crbug.com/269560).
	myconf_gn+=" enable_nacl=false"

	local gn_system_libraries=(
		flac
		fontconfig
		freetype
		libdrm
		libjpeg
		libwebp
		libxml
		libxslt
		zlib
	)
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
	if use system-av1; then
		gn_system_libraries+=( dav1d libaom )
	fi
	if use system-libusb; then
		gn_system_libraries+=( libusb )
	fi
	if use system-libvpx; then
		gn_system_libraries+=( libvpx )
	fi
	if use system-libevent; then
		gn_system_libraries+=( libevent )
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

	# See dependency logic in third_party/BUILD.gn
	myconf_gn+=" use_system_harfbuzz=$(usex system-harfbuzz true false)"

	# Disable deprecated libgnome-keyring dependency, bug #713012
	myconf_gn+=" use_gnome_keyring=false"

	# Optional dependencies.
	myconf_gn+=" enable_js_type_check=$(usex js-type-check true false)"
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

	# TODO: link_pulseaudio=true for GN.

	myconf_gn+=" disable_fieldtrial_testing_config=true"

	myconf_gn+=" is_cfi=$(usex cfi true false)"

	if use cfi; then
		myconf_gn+=" use_cfi_icall=true"
		myconf_gn+=" use_cfi_cast=true"
	fi

	if use pgo; then
		myconf_gn+=" chrome_pgo_phase=2"
	else
		myconf_gn+=" chrome_pgo_phase=0"
	fi

	myconf_gn+=" optimize_webui=$(usex optimize-webui true false)"
	myconf_gn+=" use_system_freetype=$(usex system-harfbuzz true false)"
	myconf_gn+=" use_system_libopenjpeg2=$(usex system-openjpeg true false)"
	myconf_gn+=" enable_pdf=true"
	myconf_gn+=" use_system_lcms2=true"
	myconf_gn+=" enable_print_preview=true"
	myconf_gn+=" enable_platform_hevc=$(usex hevc true false)"
	myconf_gn+=" enable_hevc_parser_and_hw_decoder=$(usex hevc true false)"

	# Ungoogled flags
	myconf_gn+=" enable_mdns=false"
	myconf_gn+=" enable_mse_mpeg2ts_stream_parser=$(usex proprietary-codecs true false)"
	myconf_gn+=" enable_reading_list=false"
	myconf_gn+=" enable_remoting=false"
	myconf_gn+=" enable_reporting=false"
	myconf_gn+=" enable_service_discovery=false"
	myconf_gn+=" exclude_unwind_tables=true"
	myconf_gn+=" use_official_google_api_keys=false"
	myconf_gn+=" google_api_key=\"\""
	myconf_gn+=" google_default_client_id=\"\""
	myconf_gn+=" google_default_client_secret=\"\""
	myconf_gn+=" safe_browsing_mode=0"
	myconf_gn+=" use_unofficial_version_number=false"
	myconf_gn+=" blink_symbol_level=0"
	myconf_gn+=" symbol_level=0"
	myconf_gn+=" enable_iterator_debugging=false"
	myconf_gn+=" enable_swiftshader=false"
	myconf_gn+=" build_with_tflite_lib=false"

	# Additional flags
	myconf_gn+=" perfetto_use_system_zlib=true"
	myconf_gn+=" use_system_zlib=true"
	myconf_gn+=" use_system_libjpeg=true"
	myconf_gn+=" rtc_build_examples=false"

	# Never use bundled gold binary. Disable gold linker flags for now.
	# Do not use bundled clang.
	# Trying to use gold results in linker crash.
	myconf_gn+=" use_gold=false use_sysroot=false use_custom_libcxx=false"

	# Disable pseudolocales, only used for testing
	myconf_gn+=" enable_pseudolocales=false"

	# Disable code formating of generated files
	myconf_gn+=" blink_enable_generated_code_formatting=false"

	ffmpeg_branding="$(usex proprietary-codecs Chrome Chromium)"
	myconf_gn+=" proprietary_codecs=$(usex proprietary-codecs true false)"
	myconf_gn+=" ffmpeg_branding=\"${ffmpeg_branding}\""

	local myarch="$(tc-arch)"

	# Avoid CFLAGS problems, bug #352457, bug #390147.
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
	fi

	if [[ $myarch = amd64 ]] ; then
		myconf_gn+=" target_cpu=\"x64\""
		ffmpeg_target_arch=x64
	elif [[ $myarch = x86 ]] ; then
		myconf_gn+=" target_cpu=\"x86\""
		ffmpeg_target_arch=ia32

		# This is normally defined by compiler_cpu_abi in
		# build/config/compiler/BUILD.gn, but we patch that part out.
		append-flags -msse2 -mfpmath=sse -mmmx
	elif [[ $myarch = arm64 ]] ; then
		myconf_gn+=" target_cpu=\"arm64\""
		ffmpeg_target_arch=arm64
	elif [[ $myarch = arm ]] ; then
		myconf_gn+=" target_cpu=\"arm\""
		ffmpeg_target_arch=$(usex cpu_flags_arm_neon arm-neon arm)
	elif [[ $myarch = ppc64 ]] ; then
		myconf_gn+=" target_cpu=\"ppc64\""
		ffmpeg_target_arch=ppc64
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

	# Make sure that -Werror doesn't get added to CFLAGS by the build system.
	# Depending on GCC version the warnings are different and we don't want
	# the build to fail because of that.
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

	# Bug 491582.
	export TMPDIR="${WORKDIR}/temp"
	mkdir -p -m 755 "${TMPDIR}" || die

	# https://bugs.gentoo.org/654216
	addpredict /dev/dri/ #nowarn

	#if ! use system-ffmpeg; then
	if false; then
		local build_ffmpeg_args=""
		if use pic && [[ "${ffmpeg_target_arch}" == "ia32" ]]; then
			build_ffmpeg_args+=" --disable-asm"
		fi

		# Re-configure bundled ffmpeg. See bug #491378 for example reasons.
		einfo "Configuring bundled ffmpeg..."
		pushd third_party/ffmpeg > /dev/null || die
		chromium/scripts/build_ffmpeg.py linux ${ffmpeg_target_arch} \
			--branding ${ffmpeg_branding} -- ${build_ffmpeg_args} || die
		chromium/scripts/copy_config.sh || die
		chromium/scripts/generate_gn.py || die
		popd > /dev/null || die
	fi

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
		myconf_gn+=" use_system_libdrm=true"
		myconf_gn+=" use_system_minigbm=true"
		myconf_gn+=" use_xkbcommon=true"
		if use qt5; then
			local moc_dir="$(qt5_get_bindir)"
			if tc-is-cross-compiler; then
				# Hack to workaround get_libdir not being able to handle CBUILD, bug #794181
				local cbuild_libdir=$($(tc-getBUILD_PKG_CONFIG) --keep-system-libs --libs-only-L libxslt)
				cbuild_libdir=${cbuild_libdir:2}
				moc_dir="${EPREFIX}"/${cbuild_libdir/% }/qt5/bin
			fi
			export PATH="${PATH}:${moc_dir}"
		fi
		myconf_gn+=" use_qt=$(usex qt5 true false)"
		myconf_gn+=" ozone_platform_x11=$(usex X true false)"
		myconf_gn+=" ozone_platform_wayland=$(usex wayland true false)"
		myconf_gn+=" ozone_platform=$(usex wayland \"wayland\" \"x11\")"
		if use wayland; then
			myconf_gn+=" use_system_libwayland=true"
			myconf_gn+=" use_system_wayland_scanner=true"
		fi
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
		# Don't add symbols to build
		myconf_gn+=" symbol_level=0"
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

	einfo "Configuring Chromium..."
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

	# Even though ninja autodetects number of CPUs, we respect
	# user's options, for debugging with -j 1 or any other reason.
	eninja -C out/Release chrome

	use enable-driver && eninja -C out/Release chromedriver
	use suid && eninja -C out/Release chrome_sandbox

	pax-mark m out/Release/chrome

	use enable-driver && mv out/Release/chromedriver{.unstripped,}

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
	#sed -e 's|${ICD_LIBRARY_PATH}|./libvk_swiftshader.so|g' \
	#	third_party/swiftshader/src/Vulkan/vk_swiftshader_icd.json.tmpl > \
	#	out/Release/vk_swiftshader_icd.json || die
}

src_install() {
	local CHROMIUM_HOME="/usr/$(get_libdir)/chromium-browser"
	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/chrome

	if use convert-dict; then
		newexe "${FILESDIR}/update-dicts.sh" update-dicts.sh
		doexe out/Release/convert_dict
	fi

	if use suid; then
		newexe out/Release/chrome_sandbox chrome-sandbox
		fperms 4755 "${CHROMIUM_HOME}/chrome-sandbox"
	fi

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
	if  has_version ">=media-sound/apulse-0.1.9" ; then
		sed -i 's/exec -a "chromium-browser"/exec -a "chromium-browser" apulse/' chromium-launcher.sh || die
	fi
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

	if ! use system-icu && ! use headless; then
		doins out/Release/icudtl.dat
	fi

	doins -r out/Release/locales
	#doins -r out/Release/MEIPreload

	# Install vk_swiftshader_icd.json; bug #827861
	#doins out/Release/vk_swiftshader_icd.json

	#if [[ -d out/Release/swiftshader ]]; then
	#	insinto "${CHROMIUM_HOME}/swiftshader"
	#	doins out/Release/swiftshader/*.so
	#fi

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
		if use hevc; then
			elog "HEVC decoding is disabled by default at runtime. You have to enable it"
			elog "by adding --enable-features=PlatformHEVCDecoderSupport to CHROMIUM_FLAGS"
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
			elog "behaviour you need to pass --gtk-version=4, e.g. by adding it"
			elog "to CHROMIUM_FLAGS in /etc/chromium/default."
		fi
		if use widevine; then
			elog "widevine requires binary plugins, which are distributed separately"
			elog "Make sure you have www-plugins/chrome-binary-plugins installed"
		fi
	fi
}
