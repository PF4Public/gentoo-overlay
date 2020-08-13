# Copyright 2009-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kernel-build

DESCRIPTION="linux-image ebuild is used to build linux kernel image using savedconfig"
HOMEPAGE="https://github.com/PF4Public/gentoo-overlay/tree/master/sys-kernel/linux-image"
SRC_URI=""

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ~mips ppc ppc64 ~s390 sparc x86"

#TODO vanilla/kernel.org etc.
IUSE="+savedconfig"

BDEPEND="~sys-kernel/gentoo-sources-${PVR}"

#TODO restrict bindists maybe
RESTRICT="strip"

src_unpack()
{
	cp -r "/usr/src/linux-${PVR}-gentoo" "${WORKDIR}/${P}" || die
}

pkg_postinst() {
	kernel-install_pkg_postinst
	elog "Don't forget to update grub configuration using"
	elog "for example 'grub-mkconfig -o /boot/grub/grub.cfg'"
	elog "and inspect newly created config in /boot"
}