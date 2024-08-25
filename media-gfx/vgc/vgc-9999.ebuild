# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop git-r3

DESCRIPTION="Vector illustration and animation software. Prototype for VCG and forever BETA"
HOMEPAGE="https://www.vgc.io https://github.com/vgc/vgc"
EGIT_REPO_URI="https://github.com/vgc/${PN}.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/eigen:3
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtwidgets:5
	media-libs/glew"

RDEPEND="${DEPEND}"

#ATCHES=( "${FILESDIR}"/${PN}-eigen.patch )

#rc_install() {

#for size in 16 32 48 256; do
#	newicon -s "${size}x${size}" src/Gui/images/icon-"${size}".png vpaint.png
#done
#
#domenu "${FILESDIR}"/vpaint.desktop
#
#newbin "${BUILD_DIR}"/src/Gui/VPaint vpaint
#}
