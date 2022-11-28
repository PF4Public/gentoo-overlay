# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/StevenBlack/hosts.git"
	SRC_URI=""
	# KEYWORDS="~amd64 ~x86"
else
	SRC_URI="https://github.com/StevenBlack/hosts/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
	S="${WORKDIR}/hosts-${PV}"
fi

DESCRIPTION="A hosts file from several well-curated sources"
HOMEPAGE="https://github.com/StevenBlack/hosts"

LICENSE="MIT"
SLOT="0"
IUSE="fakenews gambling porn social"

RDEPEND="
"

DEPEND="${RDEPEND}
"

src_install() {
	insinto "/etc"

	if ( use fakenews || use gambling || use porn || use social ); then
		NEW_HOSTS="./alternates/"
		ADD_DASH=false
		if use fakenews; then
			check_dash
			NEW_HOSTS+="fakenews"
		fi
		if use gambling; then
			check_dash
			NEW_HOSTS+="gambling"
		fi
		if use porn; then
			check_dash
			NEW_HOSTS+="porn"
		fi
		if use social; then
			check_dash
			NEW_HOSTS+="social"
		fi
		NEW_HOSTS+="/hosts"
		doins ${NEW_HOSTS}
	else
		doins ./hosts
	fi
}

check_dash(){
	if ${ADD_DASH}; then
		NEW_HOSTS+="-"
	else
		ADD_DASH=true
	fi
}
