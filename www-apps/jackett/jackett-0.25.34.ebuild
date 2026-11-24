# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="10.0"
NUGET_APIS=(
	"https://api.nuget.org/v3-flatcontainer"
)
NUGETS="
anglesharp.xml@1.3.0
anglesharp@1.10.2
anglesharp@1.9.0
autofac.extensions.dependencyinjection@9.0.0
autofac@8.0.0
bencodenet@4.0.0
commandlineparser@2.9.1
dotnet4.socksproxy@1.4.0.1
flaresolverrsharp@4.0.0
microsoft.aspnetcore.http.abstractions@2.3.13
microsoft.aspnetcore.http.features@2.3.12
microsoft.aspnetcore.http@2.3.14
microsoft.aspnetcore.jsonpatch@10.0.15
microsoft.aspnetcore.mvc.newtonsoftjson@10.0.15
microsoft.aspnetcore.webutilities@2.3.14
microsoft.csharp@4.7.0
microsoft.extensions.dependencyinjection.abstractions@8.0.0
microsoft.extensions.objectpool@8.0.11
microsoft.extensions.options@8.0.2
microsoft.extensions.primitives@8.0.0
microsoft.net.http.headers@2.3.13
mimemapping@1.0.1.50
mono.posix@7.1.0-final.1.21458.1
mono.unix@7.1.0-final.1.21458.1
newtonsoft.json.bson@1.0.2
newtonsoft.json@12.0.1
newtonsoft.json@13.0.3
newtonsoft.json@13.0.4
nlog.extensions.logging@5.5.0
nlog.web.aspnetcore@5.5.0
nlog@5.5.1
polly.core@8.9.1
polly@8.9.1
sharpziplib@1.4.2
system.diagnostics.eventlog@10.0.15
system.io.filesystem.accesscontrol@5.0.0
system.security.cryptography.protecteddata@10.0.15
system.serviceprocess.servicecontroller@10.0.15
system.text.encoding.codepages@10.0.15
system.text.json@10.0.15
yamldotnet@18.1.0
"

inherit dotnet-pkg systemd

DESCRIPTION="API support for your favorite torrent trackers"
HOMEPAGE="https://github.com/Jackett/Jackett"
SRC_URI="
	https://github.com/Jackett/Jackett/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${NUGET_URIS}
"

S="${WORKDIR}/Jackett-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DOTNET_PKG_PROJECTS=( "src/Jackett.Server/Jackett.Server.csproj" )
DOTNET_PKG_BAD_PROJECTS=(
	"src/Jackett.Service/Jackett.Service.csproj"
	"src/Jackett.Tray/Jackett.Tray.csproj"
	"src/Jackett.Updater/Jackett.Updater.csproj"
	"src/Jackett.Test/Jackett.Test.csproj"
	"src/Jackett.IntegrationTests/Jackett.IntegrationTests.csproj"
)

RDEPEND="
	acct-group/jackett
	acct-user/jackett
"

pkg_setup() {
	dotnet-pkg_pkg_setup

	export DOTNET_PKG_RESTORE_EXTRA_ARGS=(
		-p:TargetFrameworks=net10.0
	)
	export DOTNET_PKG_BUILD_EXTRA_ARGS=(
		-p:TargetFrameworks=net10.0
	)
}

src_prepare() {
	dotnet-pkg_src_prepare
	dotnet-pkg_remove-bad "src/Jackett.sln"
}

src_install() {
	dotnet-pkg_src_install

	systemd_newunit "${FILESDIR}/jackett.service" "jackett.service"
	newinitd "${FILESDIR}/jackett.init" "jackett"
}
