# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod
# eutils

DESCRIPTION="UCLogic graphics tablet drivers"
HOMEPAGE="https://github.com/DIGImend/"
SRC_URI="https://github.com/DIGImend/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

#MODULE_NAMES="r8168(net:${S}/src)"
#BUILD_TARGETS="modules"


#pkg_setup() {
#	linux-mod_pkg_setup
#	BUILD_PARAMS="KERNELDIR=${KV_DIR}"
#}

#src_install() {
#	linux-mod_src_install
#	dodoc README
#}
