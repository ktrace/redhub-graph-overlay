# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils qmake-utils

DESCRIPTION="Generic 2D CAD program"
HOMEPAGE="https://www.qcad.org/"
SRC_URI="https://github.com/qcad/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxmlpatterns:5
	qt-dev/qtconcurrent:5
	qt-dev/qtnetwork:5
	qt-dev/qtopengl:5
	qt-dev/qtscript:5
	qt-dev/qtsql:5
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
	eqmake5 CONFIG+=ractivated
}

src_install() {
	emake INSTALL_ROOT="${D}" release
	insinto "/usr/$(get_libdir)/${PN}"
	doins -r {examples,fonts,patterns,ts,libraries,plugins,scripts}
#doins README.md
#	insinto "/usr/libexec/${PN}/"
#	doins release/*
	dolib.a release/*.a
	dolib.so release/*.so
	exeinto "/usr/$(get_libdir)"
#	exeinto "/usr/libexec/${PN}/"
	doexe release/qcad-bin
}

pkg_postinst() {
    gnome2_icon_cache_update
    xdg_mimeinfo_database_update
    xdg_desktop_database_update
}

pkg_postrm() {
    gnome2_icon_cache_update
    xdg_mimeinfo_database_update
    xdg_desktop_database_update
}
