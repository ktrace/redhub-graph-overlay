# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake-utils git-r3

DESCRIPTION="Next-Gen Graphic Design and 2D Animation"
HOMEPAGE="https://www.vgc.io/"
EGIT_REPO_URI="https://github.com/vgc/${PN}.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-cpp/eigen:3
	dev-libs/libfmt
	dev-python/pybind11
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	media-libs/harfbuzz"

RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	cmake-utils_src_install all
}
