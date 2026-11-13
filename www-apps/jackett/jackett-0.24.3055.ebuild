# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="9.0"
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
coverlet.msbuild@6.0.4
dotnet4.socksproxy@1.4.0.1
flaresolverrsharp@4.0.0
fluentassertions@7.2.2
microsoft.applicationinsights@2.23.0
microsoft.aspnetcore.cryptography.internal@9.0.23
microsoft.aspnetcore.dataprotection.abstractions@9.0.23
microsoft.aspnetcore.dataprotection@9.0.23
microsoft.aspnetcore.http.abstractions@2.3.13
microsoft.aspnetcore.http.features@2.3.12
microsoft.aspnetcore.http@2.3.14
microsoft.aspnetcore.jsonpatch@9.0.23
microsoft.aspnetcore.mvc.newtonsoftjson@9.0.23
microsoft.aspnetcore.webutilities@2.3.13
microsoft.aspnetcore.webutilities@2.3.14
microsoft.codecoverage@17.14.1
microsoft.csharp@4.7.0
microsoft.extensions.configuration.abstractions@8.0.0
microsoft.extensions.configuration.abstractions@9.0.23
microsoft.extensions.configuration@9.0.23
microsoft.extensions.dependencyinjection.abstractions@8.0.0
microsoft.extensions.dependencyinjection.abstractions@9.0.23
microsoft.extensions.dependencyinjection@8.0.0
microsoft.extensions.diagnostics.abstractions@9.0.23
microsoft.extensions.fileproviders.abstractions@9.0.23
microsoft.extensions.hosting.abstractions@9.0.23
microsoft.extensions.logging.abstractions@8.0.0
microsoft.extensions.logging.abstractions@9.0.23
microsoft.extensions.logging@8.0.0
microsoft.extensions.objectpool@8.0.11
microsoft.extensions.options@8.0.0
microsoft.extensions.options@8.0.2
microsoft.extensions.options@9.0.23
microsoft.extensions.primitives@8.0.0
microsoft.extensions.primitives@9.0.23
microsoft.net.http.headers@2.3.13
microsoft.net.test.sdk@17.14.1
microsoft.netcore.platforms@1.1.0
microsoft.netcore.platforms@5.0.0
microsoft.testing.extensions.telemetry@1.8.4
microsoft.testing.extensions.trxreport.abstractions@1.8.4
microsoft.testing.extensions.vstestbridge@1.8.4
microsoft.testing.platform.msbuild@1.8.4
microsoft.testing.platform@1.8.4
microsoft.testplatform.adapterutilities@17.13.0
microsoft.testplatform.objectmodel@17.13.0
microsoft.testplatform.objectmodel@17.14.1
microsoft.testplatform.testhost@17.14.1
microsoft.win32.systemevents@6.0.0
microsoft.windowsdesktop.app.ref@9.0.11
mimemapping@1.0.1.50
mono.posix@7.1.0-final.1.21458.1
mono.unix@7.1.0-final.1.21458.1
mstest.analyzers@3.10.4
mstest.testadapter@3.10.4
mstest.testframework@3.10.4
netstandard.library@2.0.0
newtonsoft.json.bson@1.0.2
newtonsoft.json@12.0.1
newtonsoft.json@13.0.3
newtonsoft.json@13.0.4
nlog.extensions.logging@5.5.0
nlog.web.aspnetcore@5.5.0
nlog@5.5.0
nlog@5.5.1
nunit.consolerunner@3.17.0
nunit3testadapter@4.5.0
nunit@3.14.0
polly.core@8.9.1
polly@8.9.1
selenium.chrome.webdriver@85.0.0
selenium.webdriver@4.35.0
sharpziplib@1.4.2
system.buffers@4.6.0
system.collections.immutable@8.0.0
system.configuration.configurationmanager@6.0.0
system.diagnostics.diagnosticsource@5.0.0
system.diagnostics.diagnosticsource@7.0.2
system.diagnostics.eventlog@9.0.23
system.drawing.common@6.0.0
system.io.filesystem.accesscontrol@5.0.0
system.io.pipelines@5.0.1
system.reflection.metadata@8.0.0
system.security.accesscontrol@5.0.0
system.security.accesscontrol@6.0.0
system.security.cryptography.pkcs@9.0.23
system.security.cryptography.protecteddata@6.0.0
system.security.cryptography.protecteddata@9.0.23
system.security.cryptography.xml@9.0.23
system.security.permissions@6.0.0
system.security.principal.windows@5.0.0
system.serviceprocess.servicecontroller@9.0.23
system.text.encoding.codepages@9.0.23
system.text.encodings.web@8.0.0
system.text.json@9.0.23
system.windows.extensions@6.0.0
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
		-p:TargetFrameworks=net9.0
	)
	export DOTNET_PKG_BUILD_EXTRA_ARGS=(
		-p:TargetFrameworks=net9.0
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
