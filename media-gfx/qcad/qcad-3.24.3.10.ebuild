# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils

DESCRIPTION="Generic 2D CAD program"
HOMEPAGE="https://www.qcad.org/"
SRC_URI="https://github.com/qcad/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND="
	dev-qt/qtxmlpatterns:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	media-libs/freetype:2"

DEPEND="${RDEPEND}
	dev-qt/qthelp:5
	dev-qt/qtxml:5
"

BDEPEND="dev-qt/linguist-tools:5
	dev-qt/qt-creator"

#S="${WORKDIR}/LibreCAD-${PV}"

#PATCHES=( "${FILESDIR}/${P}-qt-5.14.1.patch" )

src_configure() {
	lrelease ts/*.ts
	eqmake5 PREFIX="${D}"/usr -r
}

src_install() {
#	emake INSTALL_ROOT="${D}" install
	insinto "/usr/share/${PN}"
	doins -r {examples,fonts,libraries,patterns,plugins,scripts,ts}
	doins README.md
	insinto "/usr/libexec/${PN}/"
	doins release/*
#	dolib.a release/*.a
#	dolib.so release/*.so
#	exeinto "/usr/libexec/${PN}/"
#	doexe release/qcad-bin
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
