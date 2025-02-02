# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/PF4Public/gb-chroot.git"
else
	SRC_URI="https://github.com/PF4Public/gb-chroot/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha amd64 arm arm64 hppa ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"
fi

DESCRIPTION="gb-chroot is a collection of scripts for building Gentoo's binpkgs"
HOMEPAGE="https://pf4public.github.io/gb-chroot/"

LICENSE="MIT"
SLOT="0"
IUSE="doc host"

DOCS=( README.md )

DEPEND="
	app-portage/gentoolkit
"
RDEPEND="${DEPEND}"

src_install()
{
	if use doc
	then
		DOCS+=( docs/index.md )
	fi
	einstalldocs

	if use host
	then
		doconfd config/gb-chroot
		doinitd scripts/gb-chroot
		dobin scripts/host/*
		keepdir /var/lib/gb-chroot
		insinto /usr/share/gb-chroot
		doins templates/*
		newbashcomp completions/bash-completions ${PN}
		bashcomp_alias ${PN} gb-enter gb-clone gb-all gb-emerge
	else
		dobin scripts/target/*
		dobin scripts/chroot/*
		insinto /etc
		newins config/gb-chroot-target gb-chroot.conf
	fi
}
