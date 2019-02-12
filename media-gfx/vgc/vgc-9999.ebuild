# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="Next-Gen Graphic Design and 2D Animation"
HOMEPAGE="https://www.vgc.io/"
EGIT_REPO_URI="https://github.com/vgc/${PN}.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
# TODO:
# Eigen from system
# Python >3.5 deps
# Correct Install

RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	cmake-utils_src_install all
}
