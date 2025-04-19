# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic linux-mod-r1 udev

DESCRIPTION="VMware kernel modules"
HOMEPAGE="https://github.com/bytium/vm-host-modules"

# Highest kernel version known to work:
MY_KERNEL_VERSION="6.14"

MY_COMMIT="7bab658ccb4ba783b984e800a30925eea46448ff"

SRC_URI=" https://github.com/bytium/vm-host-modules/archive/${MY_COMMIT}.tar.gz -> ${P}-${MY_COMMIT}.tar.gz"
S="${WORKDIR}/vm-host-modules-${MY_COMMIT}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	acct-group/vmware
"

pkg_setup() {
	CONFIG_CHECK="~HIGH_RES_TIMERS"
	if kernel_is -ge 5 5; then
		CONFIG_CHECK="${CONFIG_CHECK} X86_IOPL_IOPERM"
	fi
	if kernel_is -ge 2 6 37 && kernel_is -lt 2 6 39; then
		CONFIG_CHECK="${CONFIG_CHECK} BKL"
	fi
	CONFIG_CHECK="${CONFIG_CHECK} VMWARE_VMCI ~VMWARE_VMCI_VSOCKETS"

	linux-info_pkg_setup
	linux-mod-r1_pkg_setup

	if kernel_is gt ${MY_KERNEL_VERSION//./ }; then
		ewarn
		ewarn "Warning: this version of the modules is only known to work with kernels up to ${MY_KERNEL_VERSION}, while you are building them for a ${KV_FULL} kernel."
		ewarn
	fi

	BUILD_TARGETS="auto-build KERNEL_DIR=${KERNEL_DIR} KBUILD_OUTPUT=${KV_OUT_DIR}"

	filter-flags -mfpmath=sse -mavx -mpclmul -maes
	append-cflags -mno-sse  # Found a problem similar to bug #492964
}

src_prepare() {
	# decouple the kernel include dir from the running kernel version: https://github.com/stefantalpalaru/gentoo-overlay/issues/17
	sed -i \
		-e "s%HEADER_DIR = /lib/modules/\$(VM_UNAME)/build/include%HEADER_DIR = ${KERNEL_DIR}/include%" \
		-e "s%VM_UNAME = .*\$%VM_UNAME = ${KV_FULL}%" \
		*/Makefile || die "sed failed"

	# Allow user patches so they can support RC kernels and whatever else
	default
}

src_compile() {
	for mod in vmmon vmnet; do
		local modlist+=( ${mod}=misc:"${S}"/${mod}-only )
	done

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install
	local udevrules="${T}/60-vmware.rules"
	cat > "${udevrules}" <<-EOF
		KERNEL=="vmci",  GROUP="vmware", MODE="660"
		KERNEL=="vmw_vmci",  GROUP="vmware", MODE="660"
		KERNEL=="vmmon", GROUP="vmware", MODE="660"
		KERNEL=="vsock", GROUP="vmware", MODE="660"
	EOF
	udev_dorules "${udevrules}"

	dodir /etc/modprobe.d/

	cat > "${D}"/etc/modprobe.d/vmware.conf <<-EOF
		# Support for vmware vmci in kernel module
		alias vmci	vmw_vmci
	EOF

	export installed_modprobe_conf=1
	dodir /etc/modprobe.d/
	cat >> "${D}"/etc/modprobe.d/vmware.conf <<-EOF
		# Support for vmware vsock in kernel module
		alias vsock	vmw_vsock_vmci_transport
	EOF

	export installed_modprobe_conf=1
}

pkg_postinst() {
	linux-mod-r1_pkg_postinst
	udev_reload
	ewarn "Don't forget to run '/etc/init.d/vmware restart' to use the new kernel modules."
}

pkg_postrm() {
	udev_reload
}
