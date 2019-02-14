# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod udev
# eutils

DESCRIPTION="UCLogic graphics tablet drivers"
HOMEPAGE="https://github.com/DIGImend/"
SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

MODULE_NAMES="hid-kye(extra:${S}) hid-polostar(extra:${S}) hid-uclogic(extra:${S}) hid-viewsonic(extra:${S})"
BUILD_TARGETS="modules"

RDEPEND="
	virtual/udev
	x11-drivers/xf86-input-wacom
	"
DEPEND="${RDEPEND}"

#pkg_setup() {
#	linux-mod_pkg_setup
#	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
#}

src_install() {
	linux-mod_src_install
	udev_newrules udev.rules 90-digimend.rules
	exeinto $(get_udevdir)
	doexe hid-rebind
	insinto etc/depmod.d
	newins depmod.conf digimend.conf
	insinto usr/share/X11/xorg.conf.d
	newins xorg.conf 50-digimend.conf
}

pkg_postinst() {
	udev_reload
	linux-mod_pkg_postinst
}

pkg_postrm() {
	udev_reload
	linux-mod_pkg_postrm
}
