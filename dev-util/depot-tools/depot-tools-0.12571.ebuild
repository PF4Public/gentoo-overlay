# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..15} )

inherit python-single-r1 shell-completion

DESCRIPTION="Collection of scripts and tools for building Chromium"
HOMEPAGE="
	https://chromium.googlesource.com/chromium/tools/depot_tools/
	https://www.chromium.org/developers/how-tos/install-depot-tools/
"
LICENSE="BSD"
SLOT="0"
IUSE="cipd"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools"
	EGIT_BRANCH="main"
else
	# The version number is the number of commits after the initial commit,
	# following the same scheme as dev-build/gn. To bump: clone the repo at
	# the tip of main, then
	#   COMMIT_ID=$(git rev-parse HEAD)
	#   PV="0.$(( $(git rev-list --count HEAD) - 1 ))"
	# (e.g. 12572 commits including the initial one -> 0.12571)
	COMMIT_ID="46afe8bfbb57583700c01d1584e7a49638d586ed"
	SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
	# The archive has no top-level directory.
	S="${WORKDIR}"
fi

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="mirror"

# markdown_format.py would additionally need dev-python/mdformat,
# which is available in GURU.
RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/fido2[${PYTHON_USEDEP}]
		dev-python/httplib2[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/yapf[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/cipd-cache-root.patch"
	"${FILESDIR}/fetch-no-distutils.patch" 
	"${FILESDIR}/find-in-path.patch"
)

src_prepare() {
	default

	# python_fix_shebang only rewrites shebangs it recognises (python,
	# python3, python3.X, ...); it would leave the upstream 'vpython3'
	# shebangs untouched. Rewrite them to 'python3' here so that
	# python_fix_shebang can later pin them to the selected interpreter.
	while IFS= read -r -d '' f; do
		sed -i -e '1s|^#!/usr/bin/env vpython3$|#!/usr/bin/env python3|' "${f}" || die
	done < <(grep --recursive --files-with-matches --null --exclude-dir=.git '^#!/usr/bin/env vpython3' "${S}")

	# The git-* shims source python_runner.sh via a PATH lookup
	# (type -P). Point them at the copy installed next to themselves
	# instead, so python_runner.sh needs no /usr/bin entry of its own.
	while IFS= read -r -d '' f; do
		sed -i -e 's|^\. "\$(type -P python_runner\.sh)"$|. "$(dirname "$0")/python_runner.sh"|' "${f}" || die
	done < <(grep --recursive --files-with-matches --null --exclude-dir=.git 'type -P python_runner.sh' "${S}")

	# Upstream's vpython3 bootstraps a CIPD-managed Python; Chromium
	# hooks rely on its CLI (vpython3_common: 'vpython3 -vpython-spec
	# ... -vpython-tool install'). Enable its 'manually managed
	# python' bypass mode unconditionally, so that it strips the
	# vpython-specific flags and execs the selected system
	# interpreter.
	sed -i -e 's|^if \[\[ \$VPYTHON_BYPASS.*|if true|' \
		-e 's|exec "python3"|exec "'${PYTHON}'"|' "${S}/vpython3" || die

	# python_runner.sh picks the interpreter via a PATH lookup for
	# 'vpython3'. Use the selected system interpreter directly.
	sed -i -e "s|^vpython3 |\"${PYTHON}\" |" "${S}/python_runner.sh" || die

	# The tools re-invoke each other as 'vpython3 <script>' via PATH
	# lookups. Point those at the selected interpreter instead, which
	# the package runs on (cf. the shebangs above).
	while IFS= read -r -d '' f; do
		sed -i -e "s|\\[\"vpython3\",|[\"${PYTHON}\",|g" "${f}" || die
	done < <(grep --recursive --files-with-matches --null --exclude-dir=.git --include='*.py' '\["vpython3",' "${S}")
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
	dozshcomp "${S}"/zsh-goodies/_gclient

	# crowbar and git-credential-luci are CIPD tools; their docs are
	# only installed with the cipd USE flag.
	if ! use cipd; then
		rm -f "${ED}"/usr/share/man/man1/crowbar.1 \
			"${ED}"/usr/share/man/man7/depot_tools_gerrit_auth.7 \
			"${ED}"/usr/share/doc/${PF}/html/crowbar.html \
			"${ED}"/usr/share/doc/${PF}/html/depot_tools_gerrit_auth.html || die
	fi

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

	# python-bin/python3 is the in-tree alias for the selected
	# interpreter (referenced by tools such as siso); the relative
	# target assumes the interpreter lives in /usr/bin. vpython3
	# stays the upstream script, patched above.
	[[ ${PYTHON} == /usr/bin/* ]] || die "unexpected interpreter location: ${PYTHON}"
	python_rel="../../../usr/bin/${PYTHON##*/}"
	ln -sf "../${python_rel}" "${ED}${libdir}/python-bin/python3" || die

	# Install the bash completions. The git fragments define _git_*
	# functions which the standard git completion picks up on its own;
	# they require the git completion from app-shells/bash-completion.
	dobashcomp "${S}/git_completion.sh" "${S}/git_cl_completion.sh"
	newbashcomp "${S}/gclient_completion.sh" "gclient"

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
			bb|cipd|crowbar|dirmd|ensure_bootstrap|git-credential-luci|led|lucicfg|luci|luci-auth|luci-auth-ssh-helper|luci-auth-ssh-plugin|luci_auth_fido2_plugin.py|pinpoint|prpc|rdb|reclientreport)
				# CIPD tools, only exposed with the cipd USE flag.
				use cipd && dosym "${dispatcher_link}" "/usr/bin/${name}"
				;;
			autoninja.py|build_telemetry.py|download_from_google_storage.py|fetch.py|gclient.py|git_cache.py|git_cl.py|git_find_releases.py|git_footers.py|git_freezer.py|git_hyper_blame.py|git_map.py|git_map_branches.py|git_mark_merge_base.py|git_nav_downstream.py|git_new_branch.py|git_number.py|git_rebase_update.py|git_rename_branch.py|git_reparent_branch.py|git_retry.py|git_squash_branch.py|git_squash_branch_tree.py|git_upstream_diff.py|google_java_format.py|metrics_xml_format.py|roll_dep.py|run_in_virtual_path.py|upload_to_google_storage.py)
				# Implementation twins of the extensionless commands,
				# which are the entry points.
				;;
			vpython3)
				# The interpreter, not a tool: no /usr/bin entry; the
				# in-tree launchers point at the actual interpreter.
				;;
			*)
				dosym "${dispatcher_link}" "/usr/bin/${name}"
				;;
		esac
	done < <(find "${S}" -maxdepth 1 -type f -perm -u+x ! -name '*.bat' -printf '%f\n')

	python_fix_shebang "${ED}${libdir}"
}

pkg_postinst() {
	ewarn "The depot_tools self-updater is disabled."

	if use cipd; then
		ewarn
		ewarn "CIPD-based tools (bb, luci, luci-auth, rdb, dirmd, crowbar,"
		ewarn "git-credential-luci, pinpoint, led, lucicfg, prpc, reclientreport)"
		ewarn "download their binaries to \${XDG_CACHE_HOME:-~/.cache}/depot_tools"
		ewarn "on first use."
	fi
}
