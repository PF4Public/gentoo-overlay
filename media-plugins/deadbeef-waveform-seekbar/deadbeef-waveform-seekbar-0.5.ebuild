# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_waveform_seekbar.git"
	SRC_URI=""
else
	SRC_URI="https://github.com/cboxdoerfer/ddb_waveform_seekbar/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/ddb_waveform_seekbar-${PV}"
fi

DESCRIPTION="Waveform Seekbar plugin for DeaDBeeF audio player"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_waveform_seekbar"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="dev-db/sqlite:3
	media-sound/deadbeef
"

DEPEND="${RDEPEND}
"

src_compile() {
	emake gtk3
}

src_install() {
	insinto /usr/$(get_libdir)/deadbeef
	doins gtk3/ddb_misc_waveform_GTK3.so
}