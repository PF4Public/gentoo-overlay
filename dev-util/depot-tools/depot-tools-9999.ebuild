# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 shell-completion

DESCRIPTION="Collection of scripts and tools for building Chromium"
HOMEPAGE="
	https://chromium.googlesource.com/chromium/tools/depot_tools/
	https://www.chromium.org/developers/how-tos/install-depot-tools/
"
LICENSE="BSD"
SLOT="0"
IUSE="bash-completion zsh-completion"

# There are no release tarballs and the googlesource +archive endpoint
# is not byte-stable, so only a live ebuild is provided.
EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools"
EGIT_BRANCH="main"

BDEPEND="
	app-arch/unzip
"

PATCHES=(
	"${FILESDIR}/cipd-cache-root.patch"
	"${FILESDIR}/fetch-no-distutils.patch"
	"${FILESDIR}/find-in-path.patch"
)

src_unpack() {
	git-r3_src_unpack

	# gsutil.py normally downloads gsutil into external_bin/ at
	# runtime, which fails on an installed (unwritable) package dir.
	# Fetch and stage it at build time instead, so that it is
	# installed as part of the package.
	local gsutil_ver
	gsutil_ver=$(sed -n 's/^VERSION = "\(.*\)"$/\1/p' "${S}/gsutil.py") || die
	[[ ${gsutil_ver} ]] || die "cannot determine gsutil version from ${S}/gsutil.py"
	wget -q -O "${WORKDIR}/gsutil_${gsutil_ver}.zip" \
		"https://storage.googleapis.com/pub/gsutil_${gsutil_ver}.zip" || die
	mkdir -p "${S}/external_bin/gsutil/gsutil_${gsutil_ver}" || die
	unzip -q "${WORKDIR}/gsutil_${gsutil_ver}.zip" \
		-d "${S}/external_bin/gsutil/gsutil_${gsutil_ver}" || die
}

src_prepare() {
	default

	# The git-* shims source python_runner.sh via a PATH lookup
	# (type -P). Point them at the copy installed next to themselves
	# instead, so python_runner.sh needs no /usr/bin entry of its own.
	while IFS= read -r -d '' f; do
		sed -i -e 's|^\. "\$(type -P python_runner\.sh)"$|. "$(dirname "$0")/python_runner.sh"|' "${f}" || die
	done < <(grep --recursive --files-with-matches --null --exclude-dir=.git 'type -P python_runner.sh' "${S}")
}

src_install() {
	libdir="/usr/$(get_libdir)/${PN}"

	# Install man pages and docs into their standard locations, then
	# drop them (and VCS metadata, tests and Windows bits) from the
	# tree, which is installed whole (dotfiles and symlinks included)
	# so the tools can find each other by relative path. doins
	# installs every file with mode 0644, so restore the exec bits
	# afterwards.
	doman "${S}"/man/man1/*.1 "${S}"/man/man7/*.7
	dodoc -r "${S}"/man/html
	dodoc "${S}"/LICENSE "${S}"/README*.md "${S}"/metrics.README.md
	use zsh-completion && dozshcomp "${S}"/zsh-goodies/_gclient

	rm -rf "${S}/.git" "${S}/tests" "${S}/man" "${S}/zsh-goodies" || die
	rm -f "${S}"/*.bat "${S}"/*.exe "${S}"/README*.md \
		"${S}"/metrics.README.md "${S}"/LICENSE || die

	shopt -s dotglob nullglob
	files=( "${S}"/* )
	shopt -u dotglob nullglob

	insinto "${libdir}"
	doins -r "${files[@]}"

	# Restore the exec bits doins stripped.
	while IFS= read -r -d '' f; do
		chmod 0755 "${ED}${libdir}/${f#"${S}"/}" || die
	done < <(find "${S}" -type f -perm -u+x -print0)

	# Upstream's own switch to disable the self-update machinery
	# (cf. update_depot_tools_toggle.py). DEPOT_TOOLS_UPDATE=0 keeps
	# working as well.
	touch "${ED}${libdir}/.disable_auto_update" || die

	# Flag file that makes gsutil.py consider gsutil installed,
	# preventing a re-download at runtime.
	local gsutil_ver
	gsutil_ver=$(sed -n 's/^VERSION = "\(.*\)"$/\1/p' "${S}/gsutil.py") || die
	[[ ${gsutil_ver} ]] || die "cannot determine gsutil version from ${S}/gsutil.py"
	echo "This flag file is dropped by gsutil.py" > \
		"${ED}${libdir}/external_bin/gsutil/gsutil_${gsutil_ver}/gsutil/install.flag" || die

	# Install the bash completions. The git fragments define _git_*
	# functions which the standard git completion picks up on its own;
	# they require the git completion from app-shells/bash-completion.
	if use bash-completion; then
		dobashcomp "${S}/git_completion.sh" "${S}/git_cl_completion.sh"
		newbashcomp "${S}/gclient_completion.sh" "gclient"
	fi

	# The tools derive their location from $0, so /usr/bin entries
	# cannot point at them directly (that would make $0 resolve to
	# /usr/bin); they are symlinks to a single dispatcher that
	# re-execs the tool by its real path, keeping $0 correct.
	exeinto "${libdir}"
	doexe "${FILESDIR}/dispatcher"

	# The symlinks are relative so they resolve inside the package,
	# not against an existing install on the target system.
	dispatcher_link="../$(get_libdir)/${PN}/dispatcher"

	exeinto /usr/bin
	while IFS= read -r name; do
		case "${name}" in
			python_runner.sh)
				# Sourced (not executed) by the git-* shims, which
				# src_prepare patched to find it next to themselves.
				;;
			*_completion.sh)
				# Installed as bash completions, not a tool.
				;;
			WATCHLISTS)
				# Data file with a stray executable bit, not a tool.
				;;
			black|isort|yapf|gn|gn.py|ninja|clang-format|repo)
				# Already provided by dev-python/black, dev-python/isort,
				# dev-python/yapf, dev-build/gn, app-alternatives/ninja,
				# dev-clang/clang and dev-vcs/repo; skip to avoid file
				# collisions. gn.py does not collide, but as the wrapper
				# twin of gn it stays out of PATH for consistency.
				;;
			autoninja.py|build_telemetry.py|download_from_google_storage.py|fetch.py|gclient.py|git_cache.py|git_cl.py|git_find_releases.py|git_footers.py|git_freezer.py|git_hyper_blame.py|git_map.py|git_map_branches.py|git_mark_merge_base.py|git_nav_downstream.py|git_new_branch.py|git_number.py|git_rebase_update.py|git_rename_branch.py|git_reparent_branch.py|git_retry.py|git_squash_branch.py|git_squash_branch_tree.py|git_upstream_diff.py|google_java_format.py|metrics_xml_format.py|roll_dep.py|run_in_virtual_path.py|upload_to_google_storage.py)
				# Implementation twins of the extensionless commands,
				# which are the entry points.
				;;
			vpython3)
				# Not exposed on the PATH itself: the dispatcher
				# appends the package dir to PATH for every tool, so
				# shebangs ('env vpython3') and subprocess lookups
				# resolve the in-tree copy, which bootstraps the
				# CIPD-managed Python the toolchain runs on.
				;;
			*)
				dosym "${dispatcher_link}" "/usr/bin/${name}"
				;;
		esac
	done < <(find "${S}" -maxdepth 1 -type f -perm -u+x ! -name '*.bat' -printf '%f\n')
}

pkg_postinst() {
	ewarn "The depot_tools self-updater is disabled."

	ewarn
	ewarn "On first use, CIPD downloads the infrastructure tools (bb, luci,"
	ewarn "luci-auth, rdb, ...) and the Python interpreter the vpython3"
	ewarn "scripts run on into \${XDG_CACHE_HOME:-~/.cache}/depot_tools."
}
