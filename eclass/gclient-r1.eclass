# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: gclient-r1.eclass
# @MAINTAINER:
# PF4Public <PF4Public@users.noreply.github.com>
# @SUPPORTED_EAPIS: 8
# @BLURB: Eclass for fetching and unpacking gclient workspaces.
# @DESCRIPTION:
# Eclass to ease the maintenance of ebuilds which manage their sources
# with gclient (from dev-util/depot-tools), the dependency manager used
# by projects such as Chromium.
#
# The behaviour mirrors git-r3.eclass: the git mirror cache that gclient
# maintains (a bare mirror for every repository in the dependency tree,
# which the workspaces are checked out from via shared clones) is stored
# in a persistent store directory, by default ${DISTDIR}/gclient-src.
# The store survives across builds, so subsequent syncs of the same (or
# a similar) tree only fetch the delta. The workspace itself (the
# checked-out sources) lives in ${WORKDIR} and is cleaned up with it.
#
# The ebuild sets the following variables. GC_SOLUTION_URI must be
# set before inheriting the eclass, which it also activates; without
# it the eclass stays dormant, which allows inheriting it
# unconditionally. GC_SOLUTION_NAME and GC_CHECKOUT_DIR are baked
# into GC_DIR/GC_SOLUTION_DIR at inherit time; the remaining variables
# are only read at unpack time, so they may be set at any point
# before src_unpack:
#
# - GC_SOLUTION_URI: URL of the main (solution) repository,
#   e.g. https://chromium.googlesource.com/chromium/src,
# - GC_SOLUTION_NAME: name of the solution's checkout directory within
#   the workspace. Defaults to the last component of GC_SOLUTION_URI
#   (a trailing .git removed). Note that gclient resolves the paths of
#   the DEPS dependencies relative to the workspace root, not to the
#   solution directory: chromium's DEPS file prefixes all of its keys
#   with the solution path ('src/...'), so the solution must be named
#   'src' (the default) for them to check out inside it,
# - GC_DEPS_FILE: name of the DEPS file in the main repository.
#   Defaults to DEPS,
# - GC_REVISION: the git ref (commit, tag or branch) to sync the main
#   solution to. When unset, the default branch (HEAD) is tracked; a
#   commit hash or tag pins the solution,
# - GC_CLIENT_FILE: path to a ready-made .gclient file to use instead
#   of the one generated from the variables above. Needed for projects
#   with multiple solutions or extra .gclient keys (e.g. target_os).
#   Note that the file's own cache_dir key, if present, takes
#   precedence over GCLIENT_STORE_DIR,
# - GC_DEPS_ACTIONS: run the DEPS hooks during the sync (skipped by
#   default),
# - GC_CUSTOM_VARS: custom variables for the generated .gclient file,
#   a space-separated list of key=value pairs whose values are written
#   verbatim (Python literals). They can gate entries of the DEPS file,
#   e.g. to skip deps that the build does not need,
# - GC_CUSTOM_DEPS: per-dep overrides for the generated .gclient file;
#   the value None omits the dep from the sync, i.e. it is neither
#   checked out nor downloaded, a string overrides its URL,
# - GC_EXTRA_FLAGS: extra flags for 'gclient sync', e.g. a repeated
#   --ignore-dep-type to skip an entire dep type.
#
# The build dependencies are added to BDEPEND via the function
# gclient_gen_dep(), guarded by the flag that selects the gclient
# unpack (the flag cannot be used in the dependency itself, as
# dependencies are evaluated before USE is resolved).
#
# The eclass then:
#
# - creates the .gclient configuration in the workspace pointing the
#   git mirror cache at GCLIENT_STORE_DIR,
# - runs 'gclient sync' during src_unpack (via EXPORT_FUNCTIONS),
#   checking out the solution and all of its dependencies to
#   ${GC_SOLUTION_DIR},
# - exports GC_DIR (the workspace), GC_SOLUTION_DIR and GC_VERSION
#   (the commit the solution was synced to).
#
# DEPS hooks are skipped by default, as they frequently assume a
# developer environment; set GC_DEPS_ACTIONS to run them.
#
# Note that 'gclient sync' runs during src_unpack and needs network
# access. Under FEATURES=network-sandbox, portage only grants network
# in src_unpack to live ebuilds (which is how git-r3 gets it). The
# eclass does not set the live property itself, as it cannot know
# which ebuild mode fetches; the ebuild must add it, e.g.
# PROPERTIES+=" live" for a live ebuild, or conditionally for a
# dual-mode one, e.g. PROPERTIES+=" gclient? ( live )".
#
# Example:
# @CODE
# GC_SOLUTION_URI="https://chromium.googlesource.com/chromium/src"
# GC_REVISION="abcdef1234..."
#
# inherit gclient-r1
#
# BDEPEND="
# 	gclient? ( $(gclient_gen_dep) )
# "
#
# S="${GC_SOLUTION_DIR}"
#
# src_prepare() {
#   # the sources are already checked out in ${S}
#   ...
# }
# @CODE

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ -z ${_GCLIENT_R1_ECLASS} ]]; then
_GCLIENT_R1_ECLASS=1

# @ECLASS_VARIABLE: GCLIENT_STORE_DIR
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Storage directory for the gclient git mirror cache.
#
# This is intended to be set by the user in make.conf. Ebuilds must not
# set it.
#
# GCLIENT_STORE_DIR=${DISTDIR}/gclient-src

# @ECLASS_VARIABLE: GC_SOLUTION_URI
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# URL of the main (solution) repository to sync, e.g.
# https://chromium.googlesource.com/chromium/src.
#
# The eclass only activates when this variable is set; otherwise it
# stays dormant, so ebuilds may inherit it unconditionally.

# @ECLASS_VARIABLE: GC_SOLUTION_NAME
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Name of the solution's checkout directory within the workspace.
# Defaults to the last component of GC_SOLUTION_URI (a trailing .git
# removed).
#
# gclient resolves the paths of the DEPS dependencies relative to the
# workspace root, not to the solution directory. Chromium's DEPS file
# prefixes all of its keys with the solution path ('src/...'), so the
# solution must keep the name 'src' (its default) for the dependencies
# to check out inside it.

# @ECLASS_VARIABLE: GC_DEPS_FILE
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Name of the DEPS file in the main repository. Defaults to DEPS.

# @ECLASS_VARIABLE: GC_REVISION
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# The git ref (commit, tag or branch) to sync the main solution to.
# When unset, the default branch (HEAD) is tracked.
#
# For a multi-solution workspace (see GC_CLIENT_FILE), use the
# name@ref form to disambiguate.

# @ECLASS_VARIABLE: GC_CLIENT_FILE
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Path to a ready-made .gclient file to copy into the workspace
# instead of generating one from GC_SOLUTION_URI and friends.

# @ECLASS_VARIABLE: GC_DEPS_ACTIONS
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# If set, the actions defined in the DEPS file (its pre- and
# post-update hooks) are run during the sync. They are skipped by
# default, as they frequently assume a developer environment.

# @ECLASS_VARIABLE: GC_JOBS
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Number of parallel SCM jobs for 'gclient sync' (its -j flag).
# Defaults to a value gclient picks based on the number of CPUs.

# @ECLASS_VARIABLE: GC_VERBOSE
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Number of -v flags passed to 'gclient sync'. Without it, gclient
# buffers each repository's output and only shows a "still working
# on" summary. The first -v streams that output as the sync happens:
# per-repository fetch progress with start/finish timestamps. gclient
# accepts the flag up to three times for even more logging.
#
# Can be set in make.conf, e.g. GC_VERBOSE=1.

# @ECLASS_VARIABLE: GC_EXTRA_FLAGS
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Extra flags passed to 'gclient sync'. A repeated --ignore-dep-type
# (git, cipd, gcs) skips an entire dep type; ebuilds that provide the
# toolchain themselves can skip chromium's bundled-clang CIPD deps
# that way. Note that --no-history and --shallow are accepted by
# gclient but currently have no effect.

# @ECLASS_VARIABLE: GC_CUSTOM_VARS
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Custom variables for the generated .gclient file, as a
# space-separated list of key=value pairs. Each value is written
# verbatim into the file, i.e. it must be a valid Python literal:
# False or True for booleans, 42 for a number, 'quoted' for a string.
#
# custom_vars can gate entries of the DEPS file, which ebuilds can use
# to skip deps the build does not need. E.g. chromium's DEPS downloads
# per-architecture build sysroots for the checkout architectures; an
# ebuild that builds with use_sysroot=false can skip the host one:
#
# @CODE
# GC_CUSTOM_VARS="checkout_x64=False"
# @CODE

# @ECLASS_VARIABLE: GC_CUSTOM_DEPS
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Custom dependency overrides for the generated .gclient file, as a
# space-separated list of name=value pairs. The name is the gclient
# item name: for git deps it is the key of the solution's DEPS file,
# for deps of type gcs it is '<key>:<object_name>', since gclient
# models each object of a gcs dep (e.g. the per-platform tarballs) as
# a separate item.
#
# The value is a Python literal: None omits the item from the sync,
# i.e. it is neither checked out nor downloaded; a string overrides
# the item's URL (it may also point at a local path).
#
# Note that gcs object names are pinned per release; if they change,
# the entry silently stops matching, so update them when bumping
# GC_REVISION.
#
# @CODE
# GC_CUSTOM_DEPS="
# 	src/third_party/rust-toolchain:Linux_x64/rust-toolchain-....tar.xz=None
# 	third_party/some-test-suite=None
# "
# @CODE

# @ECLASS_VARIABLE: GC_SKIP_DEPS_ACTIONS
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# Names of DEPS actions (hooks) to suppress in the generated .gclient
# file, as a space-separated list. A custom hook entry matching a DEPS
# action by name (and carrying no action) replaces it with nothing,
# i.e. the DEPS action is not run. Use this to disable DEPS actions
# that a custom_var would otherwise activate, e.g.
# rust_force_head_revision=True skips chromium's prebuilt rust
# toolchain deps but activates the 'rust_tot' action, which would
# build the rust toolchain from source:
#
# @CODE
# GC_CUSTOM_VARS="rust_force_head_revision=True"
# GC_SKIP_DEPS_ACTIONS="rust_tot"
# @CODE

# @ECLASS_VARIABLE: GC_CHECKOUT_DIR
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# The workspace directory (where the .gclient file lives and the
# solutions are checked out into).
#
# GC_CHECKOUT_DIR=${WORKDIR}/${P}

# @ECLASS_VARIABLE: GC_DIR
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The workspace directory. Same as GC_CHECKOUT_DIR after defaults are
# applied.

# @ECLASS_VARIABLE: GC_SOLUTION_DIR
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The directory the main solution is checked out to, i.e.
# ${GC_DIR}/${GC_SOLUTION_NAME}. A suitable value for S.

# @ECLASS_VARIABLE: GC_VERSION
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# The commit the main solution was synced to. Set and exported by
# src_unpack.

_gclient-r1_die_usage() {
	die "
${ECLASS}: Set GC_SOLUTION_URI to the URL of the main repository
before inheriting ${ECLASS}.
"
}

# @FUNCTION: _gclient-r1_is_commit
# @USAGE: <ref>
# @INTERNAL
# @DESCRIPTION:
# Return 0 if <ref> looks like a git commit hash (7 to 64
# hexadecimal characters).
_gclient-r1_is_commit() {
	local rev=${1}
	local stripped=${rev//[0-9a-fA-F]/}
	(( ${#rev} >= 7 && ${#rev} <= 64 )) && [[ -z ${stripped} ]]
}

_gclient-r1_init() {
	[[ ${GC_SOLUTION_URI} ]] || _gclient-r1_die_usage

	local uri=${GC_SOLUTION_URI%/}
	local tail=${uri##*/}
	[[ ${tail} ]] ||
		die "${ECLASS}: cannot derive GC_SOLUTION_NAME from URI '${GC_SOLUTION_URI}'"

	: "${GC_SOLUTION_NAME:=${tail%.git}}"
	: "${GC_DEPS_FILE:=DEPS}"
	: "${GC_CHECKOUT_DIR:=${WORKDIR}/${P}}"

	local distdir=${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}
	: "${GCLIENT_STORE_DIR:=${distdir}/gclient-src}"

	GC_DIR=${GC_CHECKOUT_DIR}
	GC_SOLUTION_DIR=${GC_DIR}/${GC_SOLUTION_NAME}
	export GC_DIR GC_SOLUTION_DIR GCLIENT_STORE_DIR
}
# Activate the eclass: only ebuilds that set GC_SOLUTION_URI get the
# gclient unpack; others may inherit this eclass without side effects.
if [[ -n ${GC_SOLUTION_URI-} ]]; then
	_gclient-r1_init

	# ebuilds that need a different unpack sequence can override this
	# by defining their own src_unpack after inheriting the eclass
	src_unpack() {
		gclient-r1_src_unpack
	}
	EXPORT_FUNCTIONS src_unpack
fi
unset -f _gclient-r1_init _gclient-r1_die_usage

# @FUNCTION: gclient_gen_dep
# @USAGE:
# @DESCRIPTION:
# Generate the build dependencies of 'gclient sync' (git and
# dev-util/depot-tools). Ebuilds add the result to their BDEPEND,
# typically guarded by the flag that selects the gclient unpack:
#
# @CODE
# BDEPEND="
# 	...
# 	gclient? ( $(gclient_gen_dep) )
# "
# @CODE
gclient_gen_dep() {
	printf '%s\n' \
		">=dev-vcs/git-2.46" \
		"dev-util/depot-tools"
}

# @FUNCTION: gclient-sync
# @DESCRIPTION:
# Fetch the workspace: write the .gclient configuration into ${GC_DIR}
# (or copy GC_CLIENT_FILE) and run 'gclient sync', populating the git
# mirror cache in ${GCLIENT_STORE_DIR} and checking out the solution
# and all of its dependencies to ${GC_SOLUTION_DIR}.
#
# This is called automatically from src_unpack. Call it manually only
# if the ebuild needs to sync again at a later phase.
gclient-sync() {
	debug-print-function ${FUNCNAME} "$@"

	# the mirror cache is the persistent part; create it if necessary
	if [[ ! -d ${GCLIENT_STORE_DIR} ]]; then
		local saved_umask
		if [[ ${EVCS_UMASK} ]]; then
			saved_umask=$(umask)
			umask "${EVCS_UMASK}" || die "Bad options to umask: ${EVCS_UMASK}"
		fi
		(
			addwrite /
			mkdir -p "${GCLIENT_STORE_DIR}"
		) || die "Unable to create ${GCLIENT_STORE_DIR}"
		if [[ ${saved_umask} ]]; then
			umask "${saved_umask}" || die
		fi
	fi
	addwrite "${GCLIENT_STORE_DIR}"
	# fallback for the cache location, see the .gclient file below
	export GIT_CACHE_PATH="${GCLIENT_STORE_DIR}"
	EVCS_STORE_DIRS+=( "${GCLIENT_STORE_DIR}" )

	mkdir -p "${GC_DIR}" || die

	local -a sync_args=( sync --force )
	if [[ ! ${GC_DEPS_ACTIONS} ]]; then
		sync_args+=( --nohooks --noprehooks )
	fi
	if [[ ${GC_REVISION} ]]; then
		sync_args+=( --revision "${GC_REVISION}" )
	fi
	if [[ ${GC_JOBS} ]]; then
		sync_args+=( --jobs "${GC_JOBS}" )
	fi
	# gclient's -v is cumulative (up to -vvv)
	local v
	if [[ ${GC_VERBOSE} ]]; then
		for ((v = 0; v < ${GC_VERBOSE} && v < 3; v++)); do
			sync_args+=( -v )
		done
	fi
	if [[ ${GC_EXTRA_FLAGS} ]]; then
		sync_args+=( ${GC_EXTRA_FLAGS} )
	fi

	if [[ ${GC_CLIENT_FILE} ]]; then
		cp "${GC_CLIENT_FILE}" "${GC_DIR}/.gclient" || die
		# the file's own cache_dir key wins; otherwise git's global
		# cache.cachepath takes precedence over GIT_CACHE_PATH
		local configured
		configured=$(git config --type path cache.cachepath) || true
		if [[ ${configured} && ${configured} != ${GCLIENT_STORE_DIR} ]]; then
			ewarn "gclient-r1: git cache.cachepath=${configured} takes precedence"
			ewarn "over GCLIENT_STORE_DIR=${GCLIENT_STORE_DIR} unless ${GC_CLIENT_FILE}"
			ewarn "sets cache_dir itself."
		fi
	else
		# custom_vars are written verbatim, i.e. they are Python
		# literals in the generated .gclient file; a None custom_dep
		# value omits the item, a string one overrides its URL
		local custom_vars=""
		local custom_deps=""
		local skip_actions=""
		local kv
		for kv in ${GC_CUSTOM_VARS-}; do
			[[ ${kv} == *=* ]] ||
				die "${ECLASS}: GC_CUSTOM_VARS entry '${kv}' is not key=value"
			custom_vars+="    '${kv%%=*}' : ${kv#*=},
"
		done
		for kv in ${GC_CUSTOM_DEPS-}; do
			[[ ${kv} == *=* ]] ||
				die "${ECLASS}: GC_CUSTOM_DEPS entry '${kv}' is not name=value"
			case ${kv#*=} in
				None)
					# omit the item from the sync
					custom_deps+="    '${kv%%=*}' : None,
" ;;
				"")
					die "${ECLASS}: GC_CUSTOM_DEPS entry '${kv}' has an empty value; use None to omit the item" ;;
				*)
					custom_deps+="    '${kv%%=*}' : '${kv#*=}',
" ;;
			esac
		done
		# a custom hook matching a DEPS action by name and carrying no
		# action replaces it with nothing, i.e. suppresses it
		for kv in ${GC_SKIP_DEPS_ACTIONS-}; do
			skip_actions+="      {\"name\" : \"${kv}\"},
"
		done
		if [[ -n ${skip_actions} ]]; then
			skip_actions="    \"custom_hooks\" : [
${skip_actions}    ],
"
		fi

		# cache_dir in the .gclient file takes precedence over git's
		# global cache.cachepath and $GIT_CACHE_PATH, so the store
		# location is deterministic
		cat > "${GC_DIR}/.gclient" <<EOF
solutions = [
  { "name"        : '${GC_SOLUTION_NAME}',
    "url"         : '${GC_SOLUTION_URI}',
    "deps_file"   : '${GC_DEPS_FILE}',
    "custom_deps" : {
${custom_deps}    },
    "custom_vars": {
${custom_vars}    },
${skip_actions}  },
]
cache_dir = '${GCLIENT_STORE_DIR}'
EOF
	fi

	einfo "gclient sync: ${GC_SOLUTION_NAME} @ ${GC_REVISION:-HEAD}"
	einfo "  workspace: ${GC_DIR}"
	einfo "  mirror cache: ${GCLIENT_STORE_DIR}"

	(
		cd "${GC_DIR}" || exit 1
		# metrics are meaningless in a build environment, and with a
		# missing config file gclient would print a warning and probe
		# the network to check whether it runs on a Google bot
		export DEPOT_TOOLS_METRICS=0
		echo "gclient ${sync_args[*]}" >&2
		gclient "${sync_args[@]}"
	) || die "gclient sync failed"
}

gclient-r1_src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	gclient-sync

	# record the synced commit of the solution
	GC_VERSION=$(git -C "${GC_SOLUTION_DIR}" rev-parse HEAD 2>/dev/null) ||
		die "Unable to determine the synced commit of ${GC_SOLUTION_URI}"
	export GC_VERSION
	einfo "synced ${GC_SOLUTION_NAME} to commit ${GC_VERSION}"

	# mark the checkout as safe so later phases can access it
	# (cf. git-r3, https://bugs.gentoo.org/879353)
	local safe_dir
	safe_dir=$(cd "${GC_SOLUTION_DIR}" && pwd) || die
	if ! git config --global --get-all safe.directory 2>/dev/null |
		grep -qx "${safe_dir}"
	then
		git config --global --add safe.directory "${safe_dir}" || die
	fi
}

# @FUNCTION: gclient-r1_pkg_needrebuild
# @DESCRIPTION:
# Return 0 (rebuild needed) when the tracked branch moved on since the
# last sync. Always returns 1 for a pinned commit.
gclient-r1_pkg_needrebuild() {
	debug-print-function ${FUNCNAME} "$@"

	# a pinned commit can never become stale
	if _gclient-r1_is_commit "${GC_REVISION-}"; then
		return 1
	fi

	local ref=HEAD
	if [[ ${GC_REVISION} ]]; then
		# an immutable tag is stable
		if git ls-remote "${GC_SOLUTION_URI}" "refs/tags/${GC_REVISION}" 2>/dev/null |
			grep -q .
		then
			return 1
		fi
		ref="refs/heads/${GC_REVISION}"
	fi

	local new_commit_id
	new_commit_id=$(
		git ls-remote "${GC_SOLUTION_URI}" "${ref}" 2>/dev/null |
			awk '{print $1; exit}'
	)
	[[ ${new_commit_id} && ${GC_VERSION} ]] || die "Lookup failed"

	if [[ ${GC_VERSION} != ${new_commit_id} ]]; then
		einfo "Update from ${GC_VERSION} to ${new_commit_id}"
	else
		einfo "Local and remote at ${GC_VERSION}"
	fi

	[[ ${GC_VERSION} != ${new_commit_id} ]]
}

# @FUNCTION: pkg_needrebuild
# @DESCRIPTION:
# Rebuild check for live ebuilds: returns 0 when the tracked branch
# moved on since the last sync. See gclient-r1_pkg_needrebuild.
#
# 'export' locally until this gets into EAPI
pkg_needrebuild() {
	# dormant ebuilds have nothing to check
	[[ -n ${GC_SOLUTION_URI-} ]] || return 1
	gclient-r1_pkg_needrebuild
}

fi
