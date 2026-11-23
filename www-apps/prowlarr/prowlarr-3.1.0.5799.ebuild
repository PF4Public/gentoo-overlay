# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOTNET_PKG_COMPAT="10.0"
NUGET_APIS=(
	"https://api.nuget.org/v3-flatcontainer"
	"https://pkgs.dev.azure.com/Servarr/Servarr/_packaging/dotnet-bsd-crossbuild/nuget/v3/flat2"
	"https://pkgs.dev.azure.com/Servarr/Servarr/_packaging/Mono.Posix.NETStandard/nuget/v3/flat2"
)
NUGETS="
anglesharp.xml@1.3.1
anglesharp@1.10.5
anglesharp@1.9.0
bouncycastle.cryptography@2.7.0
dapper@2.1.100
diacritical.net@1.0.5
dryioc.dll@5.4.0
dryioc.dll@5.4.3
dryioc.microsoft.dependencyinjection@6.2.0
dynamitey@3.0.3
fluentmigrator.abstractions@8.0.1
fluentmigrator.extensions.postgres@8.0.1
fluentmigrator.runner.core@8.0.1
fluentmigrator.runner.postgres@8.0.1
fluentmigrator.runner.sqlite@8.0.1
fluentmigrator@8.0.1
fluentvalidation@9.5.4
impromptuinterface@8.1.0
ipaddressrange@6.3.0
mailkit@4.18.2
microsoft.aspnetcore.cryptography.internal@10.0.15
microsoft.aspnetcore.cryptography.keyderivation@10.0.15
microsoft.aspnetcore.webutilities@10.0.15
microsoft.extensions.configuration.abstractions@10.0.15
microsoft.extensions.configuration.abstractions@8.0.0
microsoft.extensions.configuration.binder@10.0.15
microsoft.extensions.configuration.commandline@10.0.15
microsoft.extensions.configuration.environmentvariables@10.0.15
microsoft.extensions.configuration.fileextensions@10.0.15
microsoft.extensions.configuration.json@10.0.15
microsoft.extensions.configuration.usersecrets@10.0.15
microsoft.extensions.configuration@10.0.15
microsoft.extensions.dependencyinjection.abstractions@10.0.0
microsoft.extensions.dependencyinjection.abstractions@10.0.15
microsoft.extensions.dependencyinjection.abstractions@7.0.0
microsoft.extensions.dependencyinjection.abstractions@8.0.0
microsoft.extensions.dependencyinjection@10.0.15
microsoft.extensions.dependencyinjection@8.0.0
microsoft.extensions.diagnostics.abstractions@10.0.15
microsoft.extensions.diagnostics@10.0.15
microsoft.extensions.fileproviders.abstractions@10.0.15
microsoft.extensions.fileproviders.physical@10.0.15
microsoft.extensions.filesystemglobbing@10.0.15
microsoft.extensions.hosting.abstractions@10.0.15
microsoft.extensions.hosting.windowsservices@10.0.15
microsoft.extensions.hosting@10.0.15
microsoft.extensions.logging.abstractions@10.0.0
microsoft.extensions.logging.abstractions@10.0.15
microsoft.extensions.logging.abstractions@8.0.0
microsoft.extensions.logging.configuration@10.0.15
microsoft.extensions.logging.console@10.0.15
microsoft.extensions.logging.debug@10.0.15
microsoft.extensions.logging.eventlog@10.0.15
microsoft.extensions.logging.eventsource@10.0.15
microsoft.extensions.logging@10.0.15
microsoft.extensions.logging@8.0.0
microsoft.extensions.options.configurationextensions@10.0.15
microsoft.extensions.options@10.0.15
microsoft.extensions.options@8.0.0
microsoft.extensions.primitives@10.0.15
microsoft.extensions.primitives@8.0.0
microsoft.net.http.headers@10.0.15
microsoft.openapi@2.7.5
mimekit@4.18.2
mono.nat@3.0.0
monotorrent@3.0.2
newtonsoft.json@13.0.4
nlog.extensions.logging@5.5.0
nlog.layouts.clefjsonlayout@1.0.5
nlog.targets.syslog@7.0.0
nlog@5.0.0
nlog@5.2.5
nlog@5.5.0
nlog@5.5.1
npgsql@10.0.4
openur.mono.unix@7.1.0.256
polly.contrib.waitandretry@1.1.1
polly.core@8.9.1
polly@8.9.1
reusabletasks@4.0.0
sentry@5.16.3
sharpziplib@1.4.2
sourcegear.sqlite3@3.53.4
stylecop.analyzers.unstable@1.2.0.556
swashbuckle.aspnetcore.swagger@10.3.1
swashbuckle.aspnetcore.swaggergen@10.3.1
system.componentmodel.annotations@5.0.0
system.data.sqlite@2.0.4
system.diagnostics.eventlog@10.0.15
system.io.filesystem.accesscontrol@5.0.0
system.security.cryptography.pkcs@10.0.13
system.security.cryptography.pkcs@10.0.15
system.serviceprocess.servicecontroller@10.0.15
system.valuetuple@4.6.1
system.valuetuple@4.6.2
yamldotnet@18.1.0
"

inherit dotnet-pkg systemd
if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Prowlarr/Prowlarr.git"
	EGIT_BRANCH="develop"
	S="${WORKDIR}/${P}"
	GITHUB_SRC=""
	DEPS_SRC=""
else
	KEYWORDS="~amd64"
	S="${WORKDIR}/Prowlarr-${PV}"
	GITHUB_SRC="
	https://github.com/Prowlarr/Prowlarr/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	DEPS_SRC="
	https://github.com/PF4Public/gentoo-overlay/releases/download/prowlarr/${PV}/${P}-deps.tar.xz"
fi

DESCRIPTION="Prowlarr is an indexer manager/proxy to integrate with your various PVR apps"
HOMEPAGE="https://prowlarr.com"
SRC_URI="${GITHUB_SRC}
	${DEPS_SRC}
	${NUGET_URIS}
"

LICENSE="GPL-3+"
SLOT="0"
# build-online: the live ebuild installs the UI deps at build time (yarn
# install); the released ebuilds are offline (prebuilt node_modules distfile)
IUSE="+build-online"
RESTRICT="test build-online? ( network-sandbox )"

DOTNET_PKG_PROJECTS=( "src/Prowlarr.sln" )
DOTNET_PKG_BAD_PROJECTS=(
	"src/NzbDrone.Automation.Test/Prowlarr.Automation.Test.csproj"
	"src/NzbDrone.Common.Test/Prowlarr.Common.Test.csproj"
	"src/NzbDrone.Core.Test/Prowlarr.Core.Test.csproj"
	"src/NzbDrone.Host.Test/Prowlarr.Host.Test.csproj"
	"src/NzbDrone.Integration.Test/Prowlarr.Integration.Test.csproj"
	"src/NzbDrone.Libraries.Test/Prowlarr.Libraries.Test.csproj"
	"src/NzbDrone.Mono.Test/Prowlarr.Mono.Test.csproj"
	"src/NzbDrone.Test.Common/Prowlarr.Test.Common.csproj"
	"src/NzbDrone.Test.Dummy/Prowlarr.Test.Dummy.csproj"
	"src/NzbDrone.Update.Test/Prowlarr.Update.Test.csproj"
	"src/NzbDrone.Windows.Test/Prowlarr.Windows.Test.csproj"
	"src/Prowlarr.Api.V1.Test/Prowlarr.Api.V1.Test.csproj"
	"src/Prowlarr.Benchmark.Test/Prowlarr.Benchmark.Test.csproj"
	"src/NzbDrone.Windows/Prowlarr.Windows.csproj"
	"src/ServiceHelpers/ServiceInstall/ServiceInstall.csproj"
	"src/ServiceHelpers/ServiceUninstall/ServiceUninstall.csproj"
)

RDEPEND="
	acct-group/prowlarr
	acct-user/prowlarr
	dev-db/sqlite
"
BDEPEND="
	sys-apps/yarn
"

PATCHES=(
	"${FILESDIR}/look-up-package_info-in-the-startup-folder.patch"
)

pkg_setup() {
	dotnet-pkg_pkg_setup

	export DOTNET_PKG_BUILD_EXTRA_ARGS=(
		-p:"AssemblyConfiguration=develop"
		-p:"AssemblyVersion=${PV}"
		-p:"RuntimeIdentifiers=${DOTNET_PKG_RUNTIME}"
		-p:"SentryUploadSymbols=false"
		-t:"PublishAllRids"
	)

	# don't emit PDBs, they would just be installed; EmbedAllSources
	# (set in the source tree) needs a PDB to embed sources into
	if ! use debug ; then
		DOTNET_PKG_BUILD_EXTRA_ARGS+=(
			-p:"DebugType=none"
			-p:"EmbedAllSources=false"
		)
	fi
}

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		# populate the local nuget feed the offline restore reads from
		dotnet-pkg_src_unpack
		# the live tree's UI deps, installed at build time (build-online);
		# the released ebuilds unpack the prebuilt node_modules distfile
		( cd "${S}" && yarn install --frozen-lockfile ) || die
	else
		# dotnet-pkg_src_unpack unpacks the source and the
		# ${P}-deps.tar.xz distfile (the prebuilt UI node_modules)
		dotnet-pkg_src_unpack
	fi
}

src_prepare() {
	dotnet-pkg_src_prepare
	dotnet-pkg_remove-bad "${DOTNET_PKG_PROJECTS[0]}"
}

src_compile() {
	dotnet-pkg_src_compile

	yarn run build --env production --no-stats || die
	cp -r "${S}/_output/UI" "${DOTNET_PKG_OUTPUT}" || die
}

src_install() {
	dotnet-pkg_src_install

	# drop the UI sourcemaps
	find "${ED}/usr/share/${P}" -name "*.map" -delete

	# This disables the built-in update feature
	insinto "/usr/share/${P}"
	echo "PackageVersion=${PV}" | cat "${FILESDIR}/package_info" - > package_info
	doins package_info

	systemd_newunit "${FILESDIR}/prowlarr.service" "prowlarr.service"
	newinitd "${FILESDIR}/prowlarr.init" "prowlarr"
}
