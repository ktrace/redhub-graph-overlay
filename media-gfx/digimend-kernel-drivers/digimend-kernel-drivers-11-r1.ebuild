# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 udev

DESCRIPTION="UCLogic graphics tablet drivers"
HOMEPAGE="https://github.com/DIGImend/"
SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#MODULE_NAMES="hid-kye(extra:${S}) hid-polostar(extra:${S}) hid-uclogic(extra:${S}) hid-viewsonic(extra:${S})"
#BUILD_TARGETS="modules"

RDEPEND="
	virtual/udev
	x11-drivers/xf86-input-wacom
	"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}"/${PN}-kernel6-fix.patch )

src_install() {
	linux-mod-r1_src_install
	udev_newrules udev.rules 90-digimend.rules
	exeinto $(get_udevdir)
	doexe hid-rebind
	insinto etc/depmod.d
	newins depmod.conf digimend.conf
	insinto usr/share/X11/xorg.conf.d
	newins xorg.conf 50-digimend.conf
}

src_compile() {
	local modlist=( {hid-kye,hid-polostar,hid-uclogic,hid-viewsonic}=kernel/drivers/hid )
#	local modargs=( KSRC="${KV_OUT_DIR}" )
	local modargs=( KERN_DIR="${KV_OUT_DIR}" KERN_VER="${KV_FULL}" )


	linux-mod-r1_src_compile
}


pkg_postinst() {
	udev_reload
	linux-mod-r1_pkg_postinst
}

pkg_postrm() {
	udev_reload
	linux-mod-r1_pkg_postrm
}
