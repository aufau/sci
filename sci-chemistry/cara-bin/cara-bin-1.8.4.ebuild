# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="${PN%%-bin}"
MY_P="${MY_PN}_${PV}"

DESCRIPTION="An application for the analysis of NMR spectra and Computer Aided Resonance Assignment"
SRC_URI="http://www.cara.nmr-software.org/downloads/${MY_P}_linux.gz
		 ftp://ftp.mol.biol.ethz.ch/software/${MY_PN}/Start1.2.cara"
HOMEPAGE="www.nmr.ch"
RESTRICT="mirror"
LICENSE="CARA"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="lua"
RDEPEND="x86? ( sys-libs/libstdc++-v3
		x11-libs/libXext
		x11-libs/libX11
		media-libs/fontconfig
		x11-libs/libSM
		x11-libs/libICE
		media-libs/freetype
		x11-libs/libXrender
		x11-libs/libXrandr
		x11-libs/libXcursor
		x11-libs/libXi
		x11-libs/libXau
		x11-libs/libXdmcp
		sys-libs/zlib
		dev-libs/expat
		x11-libs/libXfixes )
	amd64? ( app-emulation/emul-linux-x86-compat
		 app-emulation/emul-linux-x86-baselibs
		 app-emulation/emul-linux-x86-xlibs )
	lua? ( dev-lang/lua )"
DEPEND=""

src_unpack(){
	unpack ${MY_P}_linux.gz
	cp "${DISTDIR}"/Start1.2.cara "${WORKDIR}"
}

src_install() {
	exeinto "/opt/cara"
	doexe cara_1.8.4_linux
	dosym cara_1.8.4_linux /opt/cara/cara
	dodoc Start1.2.cara

	cat>>"${T}"/20cara<<-EOF
	PATH="/opt/cara/"
	EOF
	doenvd "${T}"/20cara
}

