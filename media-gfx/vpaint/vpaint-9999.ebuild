# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 desktop

DESCRIPTION="Vector illustration and animation software. Prototype for VCG and forever BETA"
HOMEPAGE="https://www.vpaint.org/ https://github.com/dalboris/vpaint"
EGIT_REPO_URI="https://github.com/dalboris/${PN}.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=( "${FILESDIR}"/${PN}-eigen.patch )

src_install() {

	for size in 16 32 48 256; do
		newicon -s "${size}x${size}" src/Gui/images/icon-"${size}".png vpaint.png
	done

	domenu "${FILESDIR}"/vpaint.desktop

	newbin "${BUILD_DIR}"/src/Gui/VPaint vpaint
}
