# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: electron-r1.eclass
# @MAINTAINER:
# PF4Public <PF4Public@users.noreply.github.com>
# @SUPPORTED_EAPIS: 8
# @BLURB: Common electron slot handling
# @DESCRIPTION:
# An eclass to depend on a single electron slot. dev-util/electron is
# slotted by major version (dev-util/electron:43, dev-util/electron:44, ...),
# and an application is built and run against exactly one of them.
#
# The ebuild declares the supported slots with two variables set before
# inheriting this eclass:
#
# - ELECTRON_COMPAT: a list of supported electron major versions.
# - ELECTRON_SLOT_DEFAULT: the version used when no slot is selected.
#   It must be one of the versions in ELECTRON_COMPAT.
#
# The eclass will then:
#
# - declare one USE flag per supported version in IUSE, named
#   electron_slot_N, but only when ELECTRON_COMPAT has more than one
#   version; the default slot's flag is enabled by default (e.g.
#   ELECTRON_COMPAT=( {43,44} ) with default 43 declares
#   +electron_slot_43 and electron_slot_44); with a single version
#   there is nothing to select, so no flag is declared,
# - select the slot by reading which electron_slot_N flag is enabled in
#   USE (falling back to ELECTRON_SLOT_DEFAULT when none is), and export
#   it as ELECTRON_SLOT,
# - require exactly one electron_slot_N flag to be selected via
#   REQUIRED_USE, so that when nothing is selected the default slot is
#   the enabled one, and selecting a different slot in package.use also
#   disables the default slot's flag,
# - provide the electron_gen_dep() function, which the ebuild adds to
#   BDEPEND and RDEPEND; it generates a plain dev-util/electron:N atom
#   when only one version is supported, or a USE-conditional atom per
#   supported version otherwise, because the selected slot is not known
#   when the dependencies are evaluated (portage evaluates the ebuild
#   before USE is final); since exactly one slot is selected, portage
#   activates exactly the selected one,
# - automatically set up the build environment (electron PATH, Node
#   headers in CFLAGS/CPPFLAGS, no binary downloads, and ELECTRON_DIST
#   pointing at the installed runtime so electron-builder can package
#   against it) around all src_* phase functions (via portage's
#   pre_/post_ phase hooks), so the ebuild does not have to do it
#   manually.
#
# Slot selection is a USE_EXPAND-style variable: in
# /etc/portage/package.use (extended syntax), it is written as
# ELECTRON_SLOT followed by a colon and the value, e.g.:
#
# @CODE
# app-editors/vscode ELECTRON_SLOT: 44
# @CODE
#
# For full USE_EXPAND semantics (e.g. ELECTRON_SLOT="44" in make.conf being
# expanded to flags, the variable shown in emerge --info, values validated
# against profiles/desc/electron_slot.desc), register ELECTRON_SLOT in the
# profile environment, e.g. in /etc/portage/make.conf:
#
# @CODE
# USE_EXPAND="${USE_EXPAND} ELECTRON_SLOT"
# @CODE
#
# Without registering ELECTRON_SLOT, a slot is selected directly with its
# flag; since exactly one slot may be enabled (see REQUIRED_USE), the
# default slot's flag must be disabled at the same time, e.g.
# 'app-editors/vscode -electron_slot_43 electron_slot_44'. Bumping an
# electron release within the same major slot does not require any
# changes to dependent ebuilds.
#
# Example:
# @CODE
# ELECTRON_COMPAT=( {43,44} )
# ELECTRON_SLOT_DEFAULT="43"
#
# inherit electron-r1
#
# IUSE="foo"
#
# # (IUSE additionally gets +electron_slot_43 and electron_slot_44, and
# # REQUIRED_USE gets:
# #  || ( electron_slot_43 electron_slot_44 )
# #  ^^ ( electron_slot_43 electron_slot_44 )
# # )
#
# BDEPEND="
# 	$(electron_gen_dep)
# "
# RDEPEND="
# 	$(electron_gen_dep)
# "
#
# # (electron_gen_dep generates the following for this example:
# #  electron_slot_43? ( dev-util/electron:43 )
# #  electron_slot_44? ( dev-util/electron:44 )
# # )
#
# src_compile() {
#   # ELECTRON_SLOT is exported (43, or 44 with ELECTRON_SLOT: 44)
#   # and the electron build environment is already set up
#   ...
# }
# @CODE

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_ELECTRON_R1_ECLASS} ]]; then
_ELECTRON_R1_ECLASS=1

# @ECLASS_VARIABLE: ELECTRON_COMPAT
# @PRE_INHERIT
# @REQUIRED
# @DESCRIPTION:
# A list of electron major versions (slots) supported by the package,
# oldest to newest.
#
# Example:
# @CODE
# ELECTRON_COMPAT=( {43,44} )
# @CODE

# @ECLASS_VARIABLE: ELECTRON_SLOT_DEFAULT
# @PRE_INHERIT
# @REQUIRED
# @DESCRIPTION:
# The electron slot used when no slot is selected via USE flags.
# Must be one of the versions in ELECTRON_COMPAT.

# @ECLASS_VARIABLE: ELECTRON_SLOT
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The selected electron major version. Set and exported by this eclass,
# available in all ebuild phase functions. When the dependencies are
# evaluated (the depend phase), the selected slot is not known yet, so
# the dependencies are declared as conditional atoms (see above).

# @ECLASS_VARIABLE: ELECTRON_DIST
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The absolute path of the installed electron runtime for the selected
# slot (e.g. /usr/lib64/electron-44). Exported by electron-r1_env_setup
# so that electron-builder-based apps can pass it as
# --config.electronDist and package against the system runtime instead
# of downloading the official Electron dist zip (which, together with
# the --dir target, also avoids the fpm/7zip binary downloads).
#
# Example:
# @CODE
# electron-builder --dir --publish=never --config.electronDist="${ELECTRON_DIST}"
# @CODE

_electron_r1_die_usage() {
	die "
${ECLASS}: Set ELECTRON_COMPAT to an array of electron major versions
(e.g. ELECTRON_COMPAT=( {43,44} )) and ELECTRON_SLOT_DEFAULT to one of
them, both before inheriting ${ECLASS}.
"
}

_electron_r1_init() {
	local -a slots=()
	local -A seen=()
	local myver

	[[ ${ELECTRON_COMPAT@a} == *a* ]] || _electron_r1_die_usage
	(( ${#ELECTRON_COMPAT[@]} > 0 )) || _electron_r1_die_usage
	for myver in "${ELECTRON_COMPAT[@]}"; do
		[[ ${myver} =~ ^[0-9]+$ ]] && (( myver > 0 )) ||
			die "${ECLASS}: invalid electron slot '${myver}' (must be a positive integer)"
		[[ -n ${seen[${myver}]-} ]] && continue
		seen[${myver}]=1
		slots+=( "${myver}" )
	done

	[[ -n ${ELECTRON_SLOT_DEFAULT-} ]] || _electron_r1_die_usage
	has "${ELECTRON_SLOT_DEFAULT}" "${slots[@]}" ||
		die "${ECLASS}: ELECTRON_SLOT_DEFAULT '${ELECTRON_SLOT_DEFAULT}' is not in ELECTRON_COMPAT (${slots[*]})"

	_ELECTRON_R1_SLOTS=( "${slots[@]}" )

	local myslot=""
	local myuse=" ${USE-} "
	for myver in "${slots[@]}"; do
		if [[ ${myuse} == *" electron_slot_${myver} "* ]]; then
			[[ -z ${myslot} ]] ||
				die "Only one electron slot may be enabled at a time (electron_slot_${myslot} and electron_slot_${myver} are both enabled); use e.g. 'ELECTRON_SLOT: ${myver}' in package.use"
			myslot="${myver}"
		fi
	done

	export ELECTRON_SLOT="${myslot:-${ELECTRON_SLOT_DEFAULT}}"

	if (( ${#slots[@]} > 1 )); then
		local myflag myflags=""
		for myver in "${slots[@]}"; do
			myflag="electron_slot_${myver}"
			if [[ ${myver} == "${ELECTRON_SLOT_DEFAULT}" ]]; then
				# The default slot is enabled by default; selecting a
				# different slot disables it (see REQUIRED_USE below).
				has "${myflag}" ${IUSE-} || IUSE+=" +${myflag}"
			else
				has "${myflag}" ${IUSE-} || IUSE+=" ${myflag}"
			fi
			myflags+=" ${myflag}"
		done
		# Exactly one slot must be selected: '||' enforces at least one
		# (so disabling the default slot without selecting another is
		# caught), and '^^' enforces at most one (so selecting a
		# different slot also requires disabling the default slot's
		# flag).
		REQUIRED_USE="${REQUIRED_USE-} || ( ${myflags# } ) ^^ ( ${myflags# } )"
	fi
}
_electron_r1_init
unset -f _electron_r1_init _electron_r1_die_usage

# @FUNCTION: electron_gen_dep
# @USAGE:
# @DESCRIPTION:
# Generate the dependency on the electron slot(s) the package supports:
# a plain dev-util/electron:N atom when only one version is supported,
# or a USE-conditional atom per supported version otherwise. The
# selected slot is not known when the dependencies are evaluated
# (portage evaluates the ebuild before USE is final), so portage
# resolves the conditionals with the final USE; since exactly one slot
# is selected (see REQUIRED_USE), exactly one atom is active. Add the
# result to BDEPEND and RDEPEND:
#
# @CODE
# BDEPEND+="
# 	$(electron_gen_dep)
# "
# RDEPEND+="
# 	$(electron_gen_dep)
# "
# @CODE
electron_gen_dep() {
	local mydeps=""
	if (( ${#_ELECTRON_R1_SLOTS[@]} == 1 )); then
		# A single supported slot is always the selected one.
		echo "dev-util/electron:${_ELECTRON_R1_SLOTS[0]}"
		return
	fi
	local myver
	for myver in "${_ELECTRON_R1_SLOTS[@]}"; do
		mydeps+=" electron_slot_${myver}? ( dev-util/electron:${myver} )"
	done
	echo "${mydeps# }"
}

# @FUNCTION: electron-r1_env_setup
# @DESCRIPTION:
# Prepare the environment for building against the selected electron slot:
# prepend the electron runtime and its bundled npm to PATH, add the electron
# Node headers to CFLAGS and CPPFLAGS, export ELECTRON_DIST (the installed
# runtime, for electron-builder's --config.electronDist), and tell electron
# and Playwright not to download their own binaries.
#
# Note: the runtime directory contains a 'node' wrapper script that runs the
# electron binary with ELECTRON_RUN_AS_NODE=1. It works for most build
# tooling, but Electron's argv convention (process.argv[1] = the electron
# binary's path) breaks argv-strict CLI tools invoked through it (e.g.
# electron-builder's yargs fails with "Unknown argument"); invoke those with
# the system node explicitly (e.g. /usr/bin/node).
#
# This is called automatically from the pre_<phase> hook of every src_*
# phase. Call it manually only if the environment is needed somewhere the
# eclass cannot reach, in which case electron-r1_env_cleanup must be
# called to restore PATH.
electron-r1_env_setup() {
	[[ -n ${ELECTRON_SLOT-} ]] ||
		die "${ECLASS}: ELECTRON_SLOT is not set (inherited ${ECLASS} correctly?)"

	_ELECTRON_R1_OLD_PATH=${PATH}
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:${PATH}"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:${PATH}"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:${PATH}"
	export PATH

	# The modified CFLAGS/CPPFLAGS persist in the ebuild environment across
	# phases, so add the header path only once.
	local mynode="-I/usr/include/electron-${ELECTRON_SLOT}/node"
	case " ${CFLAGS-} " in
		*" ${mynode} "*) ;;
		*) CFLAGS="${CFLAGS-} ${mynode}" ;;
	esac
	case " ${CPPFLAGS-} " in
		*" ${mynode} "*) ;;
		*) CPPFLAGS="${CPPFLAGS-} ${mynode}" ;;
	esac
	export CFLAGS CPPFLAGS

	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1

	# The installed runtime itself; electron-builder can use it as
	# --config.electronDist instead of downloading the official dist zip.
	export ELECTRON_DIST="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}"
}

# @FUNCTION: electron-r1_env_cleanup
# @DESCRIPTION:
# Restore the PATH saved by electron-r1_env_setup.
electron-r1_env_cleanup() {
	[[ -n ${_ELECTRON_R1_OLD_PATH-} ]] ||
		die "${ECLASS}: ${FUNCNAME} called without ${ECLASS}_env_setup"

	export PATH=${_ELECTRON_R1_OLD_PATH}
	unset _ELECTRON_R1_OLD_PATH
}

# Portage dispatches a pre_<phase> and a post_<phase> hook function around
# every src_* phase function. Export those hooks so the ebuild's own phase
# functions run with the electron build environment set up, without any
# changes to the ebuild.
#
# @FUNCTION: electron-r1_pre_src_unpack
# @DESCRIPTION:
# pre_src_unpack hook: set up the electron build environment
# (electron-r1_env_setup) before the ebuild's src_unpack.
electron-r1_pre_src_unpack() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_unpack
# @DESCRIPTION:
# post_src_unpack hook: restore the environment after the ebuild's
# src_unpack (electron-r1_env_cleanup).
electron-r1_post_src_unpack() { electron-r1_env_cleanup; }

# @FUNCTION: electron-r1_pre_src_prepare
# @DESCRIPTION:
# pre_src_prepare hook: set up the electron build environment before the
# ebuild's src_prepare.
electron-r1_pre_src_prepare() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_prepare
# @DESCRIPTION:
# post_src_prepare hook: restore the environment after the ebuild's
# src_prepare.
electron-r1_post_src_prepare() { electron-r1_env_cleanup; }

# @FUNCTION: electron-r1_pre_src_configure
# @DESCRIPTION:
# pre_src_configure hook: set up the electron build environment before the
# ebuild's src_configure.
electron-r1_pre_src_configure() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_configure
# @DESCRIPTION:
# post_src_configure hook: restore the environment after the ebuild's
# src_configure.
electron-r1_post_src_configure() { electron-r1_env_cleanup; }

# @FUNCTION: electron-r1_pre_src_compile
# @DESCRIPTION:
# pre_src_compile hook: set up the electron build environment before the
# ebuild's src_compile.
electron-r1_pre_src_compile() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_compile
# @DESCRIPTION:
# post_src_compile hook: restore the environment after the ebuild's
# src_compile.
electron-r1_post_src_compile() { electron-r1_env_cleanup; }

# @FUNCTION: electron-r1_pre_src_test
# @DESCRIPTION:
# pre_src_test hook: set up the electron build environment before the
# ebuild's src_test.
electron-r1_pre_src_test() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_test
# @DESCRIPTION:
# post_src_test hook: restore the environment after the ebuild's src_test.
electron-r1_post_src_test() { electron-r1_env_cleanup; }

# @FUNCTION: electron-r1_pre_src_install
# @DESCRIPTION:
# pre_src_install hook: set up the electron build environment before the
# ebuild's src_install.
electron-r1_pre_src_install() { electron-r1_env_setup; }

# @FUNCTION: electron-r1_post_src_install
# @DESCRIPTION:
# post_src_install hook: restore the environment after the ebuild's
# src_install.
electron-r1_post_src_install() { electron-r1_env_cleanup; }

EXPORT_FUNCTIONS \
	pre_src_unpack post_src_unpack \
	pre_src_prepare post_src_prepare \
	pre_src_configure post_src_configure \
	pre_src_compile post_src_compile \
	pre_src_test post_src_test \
	pre_src_install post_src_install

fi
