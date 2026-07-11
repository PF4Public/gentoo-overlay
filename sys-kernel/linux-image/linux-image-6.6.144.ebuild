# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig toolchain-funcs

DESCRIPTION="linux-image ebuild is used to build linux kernel image using savedconfig"
HOMEPAGE="https://github.com/PF4Public/gentoo-overlay/tree/master/sys-kernel/linux-image"
SRC_URI=""

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

#TODO vanilla/kernel.org etc.
IUSE="+savedconfig"

REQUIRED_USE="savedconfig"

DEPEND="~sys-kernel/gentoo-sources-${PVR}"

S="${WORKDIR}/linux-${PV}-gentoo-$PR"

#TODO restrict bindists maybe
RESTRICT="strip"

#TODO initramfs?

src_unpack()
{
	mkdir "$S" || die
	if [ $PR = "r0" ]; then
		cp -r "/usr/src/linux-${PV}-gentoo/." "$S" || die
	else
		cp -r "/usr/src/linux-${PV}-gentoo-$PR/." "$S" || die
	fi
}

src_prepare()
{
	default
}

src_configure()
{
	unset KBUILD_OUTPUT

	env_setup_xmakeopts

	restore_config .config

	if [ ! -f .config ]; then
		die "Could not locate user configfile, cannot continue"
	fi

	emake olddefconfig ${xmakeopts}

	grep "CONFIG_MODULES=y" .config >/dev/null
	RETVAL=$?
	if [ $RETVAL -ne 0 ]; then
		export DO_I_HAVE_MODULES=false
	else
		export DO_I_HAVE_MODULES=true
	fi
}

src_compile()
{
	unset KBUILD_OUTPUT

	env_setup_xmakeopts

	emake bzImage ${xmakeopts}

	if ${DO_I_HAVE_MODULES}; then
		emake modules ${xmakeopts}
	fi
}

src_install()
{
	unset KBUILD_OUTPUT

	env_setup_xmakeopts

	mkdir "${D}/boot"

	emake install ${xmakeopts} INSTALL_PATH="${D}/boot";

	if ${DO_I_HAVE_MODULES}; then
		emake modules_install ${xmakeopts} INSTALL_MOD_PATH="${D}";
	fi

	rm "${D}/lib/modules/*/build ${D}/lib/modules/*/source"
}

#modified version from kernel-2.eclass
env_setup_xmakeopts()
{
	export CTARGET=${CTARGET:-${CHOST}}

	# Kernel ARCH != portage ARCH
	export KARCH=$(tc-arch-kernel)

	# When cross-compiling, we need to set the ARCH/CROSS_COMPILE
	# variables properly or bad things happen !
	xmakeopts="ARCH=${KARCH}"
	if [[ ${CTARGET} != ${CHOST} ]] ; then
		xmakeopts="${xmakeopts} CROSS_COMPILE=${CTARGET}-"
	elif type -p ${CHOST}-ar > /dev/null ; then
		xmakeopts="${xmakeopts} CROSS_COMPILE=${CHOST}-"
	fi
	export xmakeopts
}
