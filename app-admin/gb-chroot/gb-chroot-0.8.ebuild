# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/PF4Public/gb-chroot.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/PF4Public/gb-chroot/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
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
BDEPEND=""

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
	else
		dobin scripts/target/*
		dobin scripts/chroot/*
		insinto /etc
		newins config/gb-chroot-target gb-chroot.conf
	fi
}
