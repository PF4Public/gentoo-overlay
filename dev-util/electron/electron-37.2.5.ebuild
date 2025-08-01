# Copyright 2009-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="xml(+)"

CHROMIUM_LANGS="af am ar as az be bg bn bs ca cs cy da de el en-GB es es-419 et eu fa fi fil
	fr fr-CA gl gu he hi hr hu hy id is it ja ka kk km kn ko ky lo lt lv mk ml mn mr ms my
	nb ne nl or pa pl pt-BR pt-PT ro ru si sk sl sq sr sr-Latn sv sw ta te th tr uk ur uz
	vi zh-CN zh-HK zh-TW zu"

inherit check-reqs chromium-2 desktop flag-o-matic llvm ninja-utils pax-utils
inherit python-any-r1 readme.gentoo-r1 toolchain-funcs xdg-utils

CHROMIUM_VERSION_WARNING="false"
CHROMIUM_VERSION="138.0.7204.168"
CHROMIUM_P="chromium-${CHROMIUM_VERSION}"
NODE_VERSION="22.17.1"
NODE_P="node-v${NODE_VERSION}"
UGC_PVR="${CHROMIUM_VERSION}-1"
UGC_PF="ungoogled-chromium-${UGC_PVR}"
UGC_WD="${WORKDIR}/${UGC_PF}"

# Use following environment variables to customise the build
# EXTRA_GN — pass extra options to gn
# NINJAOPTS="-k0 -j8" useful to populate ccache even if ebuild is still failing
# UGC_SKIP_PATCHES — space-separated list of patches to skip
# UGC_KEEP_BINARIES — space-separated list of binaries to keep
# UGC_SKIP_SUBSTITUTION — space-separated list of files to skip domain substitution

DESCRIPTION="Cross platform application development framework based on web technologies"
HOMEPAGE="https://electronjs.org/"
PPC64_HASH="a85b64f07b489b8c6fdb13ecf79c16c56c560fc6"
PATCH_V="${CHROMIUM_VERSION%%\.*}-1"
SRC_URI="mirror+https://commondatastorage.googleapis.com/chromium-browser-official/${CHROMIUM_P}-lite.tar.xz
	mirror+https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.xz
	https://github.com/electron/electron/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/${PATCH_V}/chromium-patches-${PATCH_V}.tar.bz2
	ppc64? (
		https://gitlab.raptorengineering.com/raptor-engineering-public/chromium/openpower-patches/-/archive/${PPC64_HASH}/openpower-patches-${PPC64_HASH}.tar.bz2 -> chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	)

	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://codeload.github.com/nodejs/nan/tar.gz/e14bdcd1f72d62bca1d541b66da43130384ec213
	https://registry.yarnpkg.com/@azure/abort-controller/-/abort-controller-1.0.4.tgz -> @azure-abort-controller-1.0.4.tgz
	https://registry.yarnpkg.com/@azure/abort-controller/-/abort-controller-2.1.2.tgz -> @azure-abort-controller-2.1.2.tgz
	https://registry.yarnpkg.com/@azure/core-asynciterator-polyfill/-/core-asynciterator-polyfill-1.0.2.tgz -> @azure-core-asynciterator-polyfill-1.0.2.tgz
	https://registry.yarnpkg.com/@azure/core-auth/-/core-auth-1.8.0.tgz -> @azure-core-auth-1.8.0.tgz
	https://registry.yarnpkg.com/@azure/core-client/-/core-client-1.9.2.tgz -> @azure-core-client-1.9.2.tgz
	https://registry.yarnpkg.com/@azure/core-http-compat/-/core-http-compat-2.1.2.tgz -> @azure-core-http-compat-2.1.2.tgz
	https://registry.yarnpkg.com/@azure/core-lro/-/core-lro-2.2.4.tgz -> @azure-core-lro-2.2.4.tgz
	https://registry.yarnpkg.com/@azure/core-paging/-/core-paging-1.2.1.tgz -> @azure-core-paging-1.2.1.tgz
	https://registry.yarnpkg.com/@azure/core-rest-pipeline/-/core-rest-pipeline-1.17.0.tgz -> @azure-core-rest-pipeline-1.17.0.tgz
	https://registry.yarnpkg.com/@azure/core-tracing/-/core-tracing-1.0.0-preview.13.tgz -> @azure-core-tracing-1.0.0-preview.13.tgz
	https://registry.yarnpkg.com/@azure/core-tracing/-/core-tracing-1.1.2.tgz -> @azure-core-tracing-1.1.2.tgz
	https://registry.yarnpkg.com/@azure/core-util/-/core-util-1.10.0.tgz -> @azure-core-util-1.10.0.tgz
	https://registry.yarnpkg.com/@azure/core-xml/-/core-xml-1.4.3.tgz -> @azure-core-xml-1.4.3.tgz
	https://registry.yarnpkg.com/@azure/logger/-/logger-1.0.3.tgz -> @azure-logger-1.0.3.tgz
	https://registry.yarnpkg.com/@azure/storage-blob/-/storage-blob-12.25.0.tgz -> @azure-storage-blob-12.25.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.25.7.tgz -> @babel-code-frame-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.5.5.tgz -> @babel-code-frame-7.5.5.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.25.7.tgz -> @babel-helper-validator-identifier-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.25.7.tgz -> @babel-highlight-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.5.0.tgz -> @babel-highlight-7.5.0.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/@dsanders11/vscode-markdown-languageservice/-/vscode-markdown-languageservice-0.3.0.tgz -> @dsanders11-vscode-markdown-languageservice-0.3.0.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.2.13.tgz -> @electron-asar-3.2.13.tgz
	https://registry.yarnpkg.com/@electron/docs-parser/-/docs-parser-2.0.0.tgz -> @electron-docs-parser-2.0.0.tgz
	https://registry.yarnpkg.com/@electron/fiddle-core/-/fiddle-core-1.3.4.tgz -> @electron-fiddle-core-1.3.4.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-2.0.2.tgz -> @electron-get-2.0.2.tgz
	https://registry.yarnpkg.com/@electron/github-app-auth/-/github-app-auth-2.2.1.tgz -> @electron-github-app-auth-2.2.1.tgz
	https://registry.yarnpkg.com/@electron/lint-roller/-/lint-roller-3.1.1.tgz -> @electron-lint-roller-3.1.1.tgz
	https://registry.yarnpkg.com/@electron/typescript-definitions/-/typescript-definitions-9.1.2.tgz -> @electron-typescript-definitions-9.1.2.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.11.1.tgz -> @eslint-community-regexpp-4.11.1.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.4.tgz -> @eslint-eslintrc-2.1.4.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.57.1.tgz -> @eslint-js-8.57.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.13.0.tgz -> @humanwhocodes-config-array-0.13.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-2.0.3.tgz -> @humanwhocodes-object-schema-2.0.3.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.5.tgz -> @jridgewell-gen-mapping-0.3.5.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> @jridgewell-resolve-uri-3.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.2.1.tgz -> @jridgewell-set-array-1.2.1.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.6.tgz -> @jridgewell-source-map-0.3.6.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.14.tgz -> @jridgewell-sourcemap-codec-1.4.14.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.0.tgz -> @jridgewell-sourcemap-codec-1.5.0.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.25.tgz -> @jridgewell-trace-mapping-0.3.25.tgz
	https://registry.yarnpkg.com/@kwsites/file-exists/-/file-exists-1.1.1.tgz -> @kwsites-file-exists-1.1.1.tgz
	https://registry.yarnpkg.com/@kwsites/promise-deferred/-/promise-deferred-1.1.1.tgz -> @kwsites-promise-deferred-1.1.1.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.3.tgz -> @nodelib-fs.stat-2.0.3.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@npmcli/config/-/config-8.3.4.tgz -> @npmcli-config-8.3.4.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-5.0.8.tgz -> @npmcli-git-5.0.8.tgz
	https://registry.yarnpkg.com/@npmcli/map-workspaces/-/map-workspaces-3.0.6.tgz -> @npmcli-map-workspaces-3.0.6.tgz
	https://registry.yarnpkg.com/@npmcli/name-from-folder/-/name-from-folder-2.0.0.tgz -> @npmcli-name-from-folder-2.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/package-json/-/package-json-5.2.1.tgz -> @npmcli-package-json-5.2.1.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-7.0.2.tgz -> @npmcli-promise-spawn-7.0.2.tgz
	https://registry.yarnpkg.com/@octokit/auth-app/-/auth-app-4.0.13.tgz -> @octokit-auth-app-4.0.13.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-app/-/auth-oauth-app-5.0.5.tgz -> @octokit-auth-oauth-app-5.0.5.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-device/-/auth-oauth-device-4.0.3.tgz -> @octokit-auth-oauth-device-4.0.3.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-user/-/auth-oauth-user-2.0.4.tgz -> @octokit-auth-oauth-user-2.0.4.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-3.0.3.tgz -> @octokit-auth-token-3.0.3.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-4.0.0.tgz -> @octokit-auth-token-4.0.0.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-4.2.1.tgz -> @octokit-core-4.2.1.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-5.2.0.tgz -> @octokit-core-5.2.0.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-7.0.3.tgz -> @octokit-endpoint-7.0.3.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-9.0.5.tgz -> @octokit-endpoint-9.0.5.tgz
	https://registry.yarnpkg.com/@octokit/graphql/-/graphql-5.0.5.tgz -> @octokit-graphql-5.0.5.tgz
	https://registry.yarnpkg.com/@octokit/graphql/-/graphql-7.1.0.tgz -> @octokit-graphql-7.1.0.tgz
	https://registry.yarnpkg.com/@octokit/oauth-authorization-url/-/oauth-authorization-url-5.0.0.tgz -> @octokit-oauth-authorization-url-5.0.0.tgz
	https://registry.yarnpkg.com/@octokit/oauth-methods/-/oauth-methods-2.0.4.tgz -> @octokit-oauth-methods-2.0.4.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-14.0.0.tgz -> @octokit-openapi-types-14.0.0.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-16.0.0.tgz -> @octokit-openapi-types-16.0.0.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-17.2.0.tgz -> @octokit-openapi-types-17.2.0.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-22.2.0.tgz -> @octokit-openapi-types-22.2.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-11.3.1.tgz -> @octokit-plugin-paginate-rest-11.3.1.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-6.1.2.tgz -> @octokit-plugin-paginate-rest-6.1.2.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.4.tgz -> @octokit-plugin-request-log-1.0.4.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-4.0.1.tgz -> @octokit-plugin-request-log-4.0.1.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-13.2.2.tgz -> @octokit-plugin-rest-endpoint-methods-13.2.2.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-7.1.2.tgz -> @octokit-plugin-rest-endpoint-methods-7.1.2.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-3.0.2.tgz -> @octokit-request-error-3.0.2.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-5.1.0.tgz -> @octokit-request-error-5.1.0.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-6.2.4.tgz -> @octokit-request-6.2.4.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-8.4.0.tgz -> @octokit-request-8.4.0.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-19.0.11.tgz -> @octokit-rest-19.0.11.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-20.1.1.tgz -> @octokit-rest-20.1.1.tgz
	https://registry.yarnpkg.com/@octokit/tsconfig/-/tsconfig-1.0.2.tgz -> @octokit-tsconfig-1.0.2.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-13.5.0.tgz -> @octokit-types-13.5.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-8.0.0.tgz -> @octokit-types-8.0.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-9.0.0.tgz -> @octokit-types-9.0.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-9.2.3.tgz -> @octokit-types-9.2.3.tgz
	https://registry.yarnpkg.com/@opentelemetry/api/-/api-1.0.4.tgz -> @opentelemetry-api-1.0.4.tgz
	https://registry.yarnpkg.com/@pkgjs/parseargs/-/parseargs-0.11.0.tgz -> @pkgjs-parseargs-0.11.0.tgz
	https://registry.yarnpkg.com/@primer/octicons/-/octicons-10.0.0.tgz -> @primer-octicons-10.0.0.tgz
	https://registry.yarnpkg.com/@rtsao/scc/-/scc-1.1.0.tgz -> @rtsao-scc-1.1.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/merge-streams/-/merge-streams-2.3.0.tgz -> @sindresorhus-merge-streams-2.3.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@types/btoa-lite/-/btoa-lite-1.0.0.tgz -> @types-btoa-lite-1.0.0.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.2.tgz -> @types-cacheable-request-6.0.2.tgz
	https://registry.yarnpkg.com/@types/color-name/-/color-name-1.1.1.tgz -> @types-color-name-1.1.1.tgz
	https://registry.yarnpkg.com/@types/concat-stream/-/concat-stream-2.0.3.tgz -> @types-concat-stream-2.0.3.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.7.tgz -> @types-debug-4.1.7.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-1.0.5.tgz -> @types-estree-1.0.5.tgz
	https://registry.yarnpkg.com/@types/glob/-/glob-7.2.0.tgz -> @types-glob-7.2.0.tgz
	https://registry.yarnpkg.com/@types/hast/-/hast-3.0.4.tgz -> @types-hast-3.0.4.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.1.tgz -> @types-http-cache-semantics-4.0.1.tgz
	https://registry.yarnpkg.com/@types/is-empty/-/is-empty-1.2.0.tgz -> @types-is-empty-1.2.0.tgz
	https://registry.yarnpkg.com/@types/json-buffer/-/json-buffer-3.0.0.tgz -> @types-json-buffer-3.0.0.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.11.tgz -> @types-json-schema-7.0.11.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/jsonwebtoken/-/jsonwebtoken-9.0.1.tgz -> @types-jsonwebtoken-9.0.1.tgz
	https://registry.yarnpkg.com/@types/katex/-/katex-0.16.7.tgz -> @types-katex-0.16.7.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.4.tgz -> @types-keyv-3.1.4.tgz
	https://registry.yarnpkg.com/@types/linkify-it/-/linkify-it-5.0.0.tgz -> @types-linkify-it-5.0.0.tgz
	https://registry.yarnpkg.com/@types/markdown-it/-/markdown-it-14.1.2.tgz -> @types-markdown-it-14.1.2.tgz
	https://registry.yarnpkg.com/@types/mdast/-/mdast-4.0.4.tgz -> @types-mdast-4.0.4.tgz
	https://registry.yarnpkg.com/@types/mdurl/-/mdurl-2.0.0.tgz -> @types-mdurl-2.0.0.tgz
	https://registry.yarnpkg.com/@types/minimatch/-/minimatch-3.0.3.tgz -> @types-minimatch-3.0.3.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.5.tgz -> @types-minimist-1.2.5.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node/-/node-12.6.1.tgz -> @types-node-12.6.1.tgz
	https://registry.yarnpkg.com/@types/node/-/node-20.16.12.tgz -> @types-node-20.16.12.tgz
	https://registry.yarnpkg.com/@types/node/-/node-20.16.9.tgz -> @types-node-20.16.9.tgz
	https://registry.yarnpkg.com/@types/node/-/node-22.7.7.tgz -> @types-node-22.7.7.tgz
	https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz -> @types-parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.0.tgz -> @types-responselike-1.0.0.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.5.8.tgz -> @types-semver-7.5.8.tgz
	https://registry.yarnpkg.com/@types/stream-chain/-/stream-chain-2.0.0.tgz -> @types-stream-chain-2.0.0.tgz
	https://registry.yarnpkg.com/@types/stream-json/-/stream-json-1.7.7.tgz -> @types-stream-json-1.7.7.tgz
	https://registry.yarnpkg.com/@types/supports-color/-/supports-color-8.1.1.tgz -> @types-supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/@types/temp/-/temp-0.9.4.tgz -> @types-temp-0.9.4.tgz
	https://registry.yarnpkg.com/@types/text-table/-/text-table-0.2.2.tgz -> @types-text-table-0.2.2.tgz
	https://registry.yarnpkg.com/@types/unist/-/unist-2.0.3.tgz -> @types-unist-2.0.3.tgz
	https://registry.yarnpkg.com/@types/unist/-/unist-2.0.6.tgz -> @types-unist-2.0.6.tgz
	https://registry.yarnpkg.com/@types/unist/-/unist-3.0.2.tgz -> @types-unist-3.0.2.tgz
	https://registry.yarnpkg.com/@types/webpack-env/-/webpack-env-1.18.5.tgz -> @types-webpack-env-1.18.5.tgz
	https://registry.yarnpkg.com/@types/yauzl/-/yauzl-2.10.0.tgz -> @types-yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.7.0.tgz -> @typescript-eslint-eslint-plugin-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-8.7.0.tgz -> @typescript-eslint-parser-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.7.0.tgz -> @typescript-eslint-scope-manager-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-8.7.0.tgz -> @typescript-eslint-type-utils-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.7.0.tgz -> @typescript-eslint-types-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.7.0.tgz -> @typescript-eslint-typescript-estree-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.7.0.tgz -> @typescript-eslint-utils-8.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.7.0.tgz -> @typescript-eslint-visitor-keys-8.7.0.tgz
	https://registry.yarnpkg.com/@ungap/structured-clone/-/structured-clone-1.2.0.tgz -> @ungap-structured-clone-1.2.0.tgz
	https://registry.yarnpkg.com/@vscode/l10n/-/l10n-0.0.10.tgz -> @vscode-l10n-0.0.10.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.12.1.tgz -> @webassemblyjs-ast-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.11.6.tgz -> @webassemblyjs-floating-point-hex-parser-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.11.6.tgz -> @webassemblyjs-helper-api-error-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.12.1.tgz -> @webassemblyjs-helper-buffer-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.11.6.tgz -> @webassemblyjs-helper-numbers-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.11.6.tgz -> @webassemblyjs-helper-wasm-bytecode-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.12.1.tgz -> @webassemblyjs-helper-wasm-section-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.11.6.tgz -> @webassemblyjs-ieee754-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.11.6.tgz -> @webassemblyjs-leb128-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.11.6.tgz -> @webassemblyjs-utf8-1.11.6.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.12.1.tgz -> @webassemblyjs-wasm-edit-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.12.1.tgz -> @webassemblyjs-wasm-gen-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.12.1.tgz -> @webassemblyjs-wasm-opt-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.12.1.tgz -> @webassemblyjs-wasm-parser-1.12.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.12.1.tgz -> @webassemblyjs-wast-printer-1.12.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-2.1.1.tgz -> @webpack-cli-configtest-2.1.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-2.0.2.tgz -> @webpack-cli-info-2.0.2.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-2.0.5.tgz -> @webpack-cli-serve-2.0.5.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-2.0.0.tgz
	https://registry.yarnpkg.com/acorn-import-attributes/-/acorn-import-attributes-1.9.5.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.12.1.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.1.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.0.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.17.1.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.0.3.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.2.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.0.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.2.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.6.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.9.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.6.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.1.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.3.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.1.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.3.tgz
	https://registry.yarnpkg.com/array.prototype.tosorted/-/array.prototype.tosorted-1.1.1.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.3.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.4.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-2.0.1.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-function/-/async-function-1.0.0.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.4.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz
	https://registry.yarnpkg.com/bail/-/bail-2.0.1.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-3.0.1.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.2.3.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.1.0.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.12.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.3.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.23.3.tgz
	https://registry.yarnpkg.com/btoa-lite/-/btoa-lite-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal-constant-time/-/buffer-equal-constant-time-1.0.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-6.0.3.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.3.0.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-5.0.1.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.2.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.7.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.8.tgz
	https://registry.yarnpkg.com/call-bound/-/call-bound-1.0.4.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001659.tgz
	https://registry.yarnpkg.com/chai/-/chai-5.1.1.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.3.0.tgz
	https://registry.yarnpkg.com/character-entities-legacy/-/character-entities-legacy-3.0.0.tgz
	https://registry.yarnpkg.com/character-entities/-/character-entities-2.0.0.tgz
	https://registry.yarnpkg.com/character-reference-invalid/-/character-reference-invalid-2.0.0.tgz
	https://registry.yarnpkg.com/check-error/-/check-error-2.1.1.tgz
	https://registry.yarnpkg.com/check-for-leaks/-/check-for-leaks-1.2.1.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.2.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.2.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.0.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-5.0.0.tgz
	https://registry.yarnpkg.com/cli-spinners/-/cli-spinners-2.9.2.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.2.tgz
	https://registry.yarnpkg.com/co/-/co-3.1.0.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.19.tgz
	https://registry.yarnpkg.com/comma-separated-tokens/-/comma-separated-tokens-2.0.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-10.0.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-8.3.0.tgz
	https://registry.yarnpkg.com/compress-brotli/-/compress-brotli-1.3.8.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-2.0.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-6.0.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.6.tgz
	https://registry.yarnpkg.com/data-view-buffer/-/data-view-buffer-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-buffer/-/data-view-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/data-view-byte-length/-/data-view-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-byte-length/-/data-view-byte-length-1.0.2.tgz
	https://registry.yarnpkg.com/data-view-byte-offset/-/data-view-byte-offset-1.0.0.tgz
	https://registry.yarnpkg.com/data-view-byte-offset/-/data-view-byte-offset-1.0.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.7.tgz
	https://registry.yarnpkg.com/decode-named-character-reference/-/decode-named-character-reference-1.0.2.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-0.7.0.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-5.0.2.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.3.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-data-property/-/define-data-property-1.1.4.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.1.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/dequal/-/dequal-2.0.3.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/devlop/-/devlop-1.1.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.5.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dugite/-/dugite-2.7.1.tgz
	https://registry.yarnpkg.com/dunder-proto/-/dunder-proto-1.0.1.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.1.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/ecdsa-sig-formatter/-/ecdsa-sig-formatter-1.0.11.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.5.18.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-10.4.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-4.1.0.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.17.1.tgz
	https://registry.yarnpkg.com/enquirer/-/enquirer-2.3.6.tgz
	https://registry.yarnpkg.com/ensure-posix-path/-/ensure-posix-path-1.1.1.tgz
	https://registry.yarnpkg.com/entities/-/entities-4.5.0.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.8.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/errno/-/errno-0.1.7.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.21.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.23.3.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.24.0.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.0.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.1.tgz
	https://registry.yarnpkg.com/es-errors/-/es-errors-1.3.0.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-1.5.4.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.0.0.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.1.1.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.1.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.3.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.0.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.2.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.1.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.3.0.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.2.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-compat-utils/-/eslint-compat-utils-0.5.1.tgz
	https://registry.yarnpkg.com/eslint-config-standard-jsx/-/eslint-config-standard-jsx-11.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-standard/-/eslint-config-standard-17.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-standard/-/eslint-config-standard-17.1.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.7.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.12.1.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.8.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-es-x/-/eslint-plugin-es-x-7.8.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-es/-/eslint-plugin-es-3.0.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-es/-/eslint-plugin-es-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.27.5.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.32.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-mocha/-/eslint-plugin-mocha-10.5.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-n/-/eslint-plugin-n-15.7.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-n/-/eslint-plugin-n-16.6.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-node/-/eslint-plugin-node-11.1.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-promise/-/eslint-plugin-promise-6.1.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-promise/-/eslint-plugin-promise-6.6.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.32.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-standard/-/eslint-plugin-standard-5.0.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-3.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.57.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.5.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.1.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/events-to-array/-/events-to-array-1.1.2.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-4.0.3.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-2.0.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.2.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fast-uri/-/fast-uri-3.0.1.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-4.5.0.tgz
	https://registry.yarnpkg.com/fastest-levenshtein/-/fastest-levenshtein-1.0.14.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.8.0.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-3.2.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.1.1.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.7.tgz
	https://registry.yarnpkg.com/folder-hash/-/folder-hash-2.1.2.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.5.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.1.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.5.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.6.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.8.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/get-east-asian-width/-/get-east-asian-width-1.2.0.tgz
	https://registry.yarnpkg.com/get-func-name/-/get-func-name-2.0.2.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.1.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.4.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.3.0.tgz
	https://registry.yarnpkg.com/get-own-enumerable-property-symbols/-/get-own-enumerable-property-symbols-3.0.0.tgz
	https://registry.yarnpkg.com/get-proto/-/get-proto-1.0.1.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-8.0.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.2.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.1.0.tgz
	https://registry.yarnpkg.com/get-tsconfig/-/get-tsconfig-4.8.1.tgz
	https://registry.yarnpkg.com/getos/-/getos-3.2.1.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.4.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-9.3.5.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.20.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.24.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.4.tgz
	https://registry.yarnpkg.com/globby/-/globby-14.1.0.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.0.1.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.2.0.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.5.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.1.15.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-5.0.1.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.1.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.3.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.2.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.1.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.2.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.2.tgz
	https://registry.yarnpkg.com/hast-util-from-html/-/hast-util-from-html-2.0.1.tgz
	https://registry.yarnpkg.com/hast-util-from-parse5/-/hast-util-from-parse5-8.0.1.tgz
	https://registry.yarnpkg.com/hast-util-parse-selector/-/hast-util-parse-selector-4.0.0.tgz
	https://registry.yarnpkg.com/hastscript/-/hastscript-8.0.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-7.0.2.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-7.0.2.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.5.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-1.1.1.tgz
	https://registry.yarnpkg.com/husky/-/husky-8.0.1.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.3.1.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.3.2.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-7.0.4.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/import-meta-resolve/-/import-meta-resolve-4.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-4.1.3.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.5.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.7.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.1.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.4.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-3.1.1.tgz
	https://registry.yarnpkg.com/is-alphabetical/-/is-alphabetical-2.0.0.tgz
	https://registry.yarnpkg.com/is-alphanumerical/-/is-alphanumerical-2.0.0.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.2.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.4.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.5.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-async-function/-/is-async-function-2.1.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.1.0.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.2.2.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-3.2.1.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.12.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.15.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.16.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.8.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.9.0.tgz
	https://registry.yarnpkg.com/is-data-view/-/is-data-view-1.0.1.tgz
	https://registry.yarnpkg.com/is-data-view/-/is-data-view-1.0.2.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.1.0.tgz
	https://registry.yarnpkg.com/is-decimal/-/is-decimal-2.0.0.tgz
	https://registry.yarnpkg.com/is-empty/-/is-empty-1.2.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-finalizationregistry/-/is-finalizationregistry-1.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-generator-function/-/is-generator-function-1.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-hexadecimal/-/is-hexadecimal-2.0.0.tgz
	https://registry.yarnpkg.com/is-interactive/-/is-interactive-2.0.0.tgz
	https://registry.yarnpkg.com/is-map/-/is-map-2.0.3.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.3.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.1.1.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-4.0.0.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.2.1.tgz
	https://registry.yarnpkg.com/is-regexp/-/is-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/is-set/-/is-set-2.0.3.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.3.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.4.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.1.1.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.1.1.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.10.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.13.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/is-unicode-supported/-/is-unicode-supported-1.3.0.tgz
	https://registry.yarnpkg.com/is-unicode-supported/-/is-unicode-supported-2.1.0.tgz
	https://registry.yarnpkg.com/is-weakmap/-/is-weakmap-2.0.2.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.1.1.tgz
	https://registry.yarnpkg.com/is-weakset/-/is-weakset-2.0.4.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-3.1.1.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-3.4.3.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.13.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-3.0.2.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonc-parser/-/jsonc-parser-3.3.1.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.0.1.tgz
	https://registry.yarnpkg.com/jsonwebtoken/-/jsonwebtoken-9.0.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.3.3.tgz
	https://registry.yarnpkg.com/jwa/-/jwa-1.4.1.tgz
	https://registry.yarnpkg.com/jws/-/jws-3.2.2.tgz
	https://registry.yarnpkg.com/katex/-/katex-0.16.22.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.3.1.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.1.6.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-2.0.4.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-5.0.0.tgz
	https://registry.yarnpkg.com/lint-staged/-/lint-staged-10.2.11.tgz
	https://registry.yarnpkg.com/listr2/-/listr2-2.2.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-5.3.0.tgz
	https://registry.yarnpkg.com/load-plugin/-/load-plugin-6.0.3.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.3.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-1.4.2.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.4.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-4.0.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-6.0.0.tgz
	https://registry.yarnpkg.com/log-update/-/log-update-4.0.0.tgz
	https://registry.yarnpkg.com/longest-streak/-/longest-streak-3.0.0.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/loupe/-/loupe-3.1.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.2.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.4.3.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-9.1.1.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.5.tgz
	https://registry.yarnpkg.com/markdown-extensions/-/markdown-extensions-2.0.0.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-14.1.0.tgz
	https://registry.yarnpkg.com/markdownlint-cli2-formatter-default/-/markdownlint-cli2-formatter-default-0.0.5.tgz
	https://registry.yarnpkg.com/markdownlint-cli2/-/markdownlint-cli2-0.18.0.tgz
	https://registry.yarnpkg.com/markdownlint/-/markdownlint-0.38.0.tgz
	https://registry.yarnpkg.com/matcher-collection/-/matcher-collection-1.1.2.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/math-intrinsics/-/math-intrinsics-1.1.0.tgz
	https://registry.yarnpkg.com/mdast-comment-marker/-/mdast-comment-marker-1.1.1.tgz
	https://registry.yarnpkg.com/mdast-util-from-markdown/-/mdast-util-from-markdown-2.0.1.tgz
	https://registry.yarnpkg.com/mdast-util-from-markdown/-/mdast-util-from-markdown-2.0.2.tgz
	https://registry.yarnpkg.com/mdast-util-heading-style/-/mdast-util-heading-style-1.0.5.tgz
	https://registry.yarnpkg.com/mdast-util-phrasing/-/mdast-util-phrasing-4.1.0.tgz
	https://registry.yarnpkg.com/mdast-util-to-markdown/-/mdast-util-to-markdown-2.1.0.tgz
	https://registry.yarnpkg.com/mdast-util-to-string/-/mdast-util-to-string-1.0.6.tgz
	https://registry.yarnpkg.com/mdast-util-to-string/-/mdast-util-to-string-4.0.0.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-2.0.0.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.4.1.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromark-core-commonmark/-/micromark-core-commonmark-2.0.1.tgz
	https://registry.yarnpkg.com/micromark-core-commonmark/-/micromark-core-commonmark-2.0.3.tgz
	https://registry.yarnpkg.com/micromark-extension-directive/-/micromark-extension-directive-4.0.0.tgz
	https://registry.yarnpkg.com/micromark-extension-gfm-autolink-literal/-/micromark-extension-gfm-autolink-literal-2.1.0.tgz
	https://registry.yarnpkg.com/micromark-extension-gfm-footnote/-/micromark-extension-gfm-footnote-2.1.0.tgz
	https://registry.yarnpkg.com/micromark-extension-gfm-table/-/micromark-extension-gfm-table-2.1.1.tgz
	https://registry.yarnpkg.com/micromark-extension-math/-/micromark-extension-math-3.1.0.tgz
	https://registry.yarnpkg.com/micromark-factory-destination/-/micromark-factory-destination-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-factory-label/-/micromark-factory-label-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-factory-space/-/micromark-factory-space-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-factory-title/-/micromark-factory-title-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-factory-whitespace/-/micromark-factory-whitespace-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-character/-/micromark-util-character-2.1.0.tgz
	https://registry.yarnpkg.com/micromark-util-chunked/-/micromark-util-chunked-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-classify-character/-/micromark-util-classify-character-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-combine-extensions/-/micromark-util-combine-extensions-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-decode-numeric-character-reference/-/micromark-util-decode-numeric-character-reference-2.0.1.tgz
	https://registry.yarnpkg.com/micromark-util-decode-string/-/micromark-util-decode-string-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-encode/-/micromark-util-encode-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-html-tag-name/-/micromark-util-html-tag-name-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-normalize-identifier/-/micromark-util-normalize-identifier-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-resolve-all/-/micromark-util-resolve-all-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-sanitize-uri/-/micromark-util-sanitize-uri-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-subtokenize/-/micromark-util-subtokenize-2.0.1.tgz
	https://registry.yarnpkg.com/micromark-util-symbol/-/micromark-util-symbol-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-types/-/micromark-util-types-2.0.0.tgz
	https://registry.yarnpkg.com/micromark-util-types/-/micromark-util-types-2.0.2.tgz
	https://registry.yarnpkg.com/micromark/-/micromark-4.0.0.tgz
	https://registry.yarnpkg.com/micromark/-/micromark-4.0.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.8.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-function/-/mimic-function-5.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.8.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-8.0.4.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.5.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.6.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.3.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-6.0.2.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.1.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.1.2.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.5.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.7.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.8.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.18.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-7.2.1.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-6.0.2.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-6.3.0.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-3.0.1.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-11.0.3.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-9.1.0.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/null-loader/-/null-loader-4.0.1.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.3.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.2.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.4.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.4.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.5.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.7.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.6.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.6.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.8.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.3.tgz
	https://registry.yarnpkg.com/object.hasown/-/object.hasown-1.1.2.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.6.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.2.1.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-7.0.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.4.tgz
	https://registry.yarnpkg.com/ora/-/ora-8.1.0.tgz
	https://registry.yarnpkg.com/own-keys/-/own-keys-1.0.1.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.1.1.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.2.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/package-json-from-dist/-/package-json-from-dist-1.0.1.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-entities/-/parse-entities-4.0.2.tgz
	https://registry.yarnpkg.com/parse-gitignore/-/parse-gitignore-0.4.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-7.1.1.tgz
	https://registry.yarnpkg.com/parse-ms/-/parse-ms-4.0.0.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-7.1.2.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.11.1.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.9.2.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-6.0.0.tgz
	https://registry.yarnpkg.com/pathval/-/pathval-2.0.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.0.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.0.7.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.2.2.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz
	https://registry.yarnpkg.com/pkg-conf/-/pkg-conf-3.1.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/please-upgrade-node/-/please-upgrade-node-3.2.0.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/possible-typed-array-names/-/possible-typed-array-names-1.0.0.tgz
	https://registry.yarnpkg.com/pre-flight/-/pre-flight-2.0.0.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/pretty-ms/-/pretty-ms-9.1.0.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-4.2.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/property-information/-/property-information-6.5.0.tgz
	https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode.js/-/punycode.js-2.3.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.13.0.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/rambda/-/rambda-7.5.0.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/read-package-json-fast/-/read-package-json-fast-3.0.2.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.6.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.6.2.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.8.0.tgz
	https://registry.yarnpkg.com/reflect.getprototypeof/-/reflect.getprototypeof-1.0.10.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.0.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.2.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.4.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.0.0.tgz
	https://registry.yarnpkg.com/remark-cli/-/remark-cli-12.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-blockquote-indentation/-/remark-lint-blockquote-indentation-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-code-block-style/-/remark-lint-code-block-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-definition-case/-/remark-lint-definition-case-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-definition-spacing/-/remark-lint-definition-spacing-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-emphasis-marker/-/remark-lint-emphasis-marker-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-fenced-code-flag/-/remark-lint-fenced-code-flag-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-fenced-code-marker/-/remark-lint-fenced-code-marker-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-file-extension/-/remark-lint-file-extension-1.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-final-definition/-/remark-lint-final-definition-2.1.0.tgz
	https://registry.yarnpkg.com/remark-lint-hard-break-spaces/-/remark-lint-hard-break-spaces-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-heading-increment/-/remark-lint-heading-increment-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-heading-style/-/remark-lint-heading-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-link-title-style/-/remark-lint-link-title-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-list-item-content-indent/-/remark-lint-list-item-content-indent-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-list-item-indent/-/remark-lint-list-item-indent-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-list-item-spacing/-/remark-lint-list-item-spacing-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-maximum-heading-length/-/remark-lint-maximum-heading-length-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-maximum-line-length/-/remark-lint-maximum-line-length-2.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-no-auto-link-without-protocol/-/remark-lint-no-auto-link-without-protocol-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-blockquote-without-marker/-/remark-lint-no-blockquote-without-marker-4.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-no-consecutive-blank-lines/-/remark-lint-no-consecutive-blank-lines-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-no-duplicate-headings/-/remark-lint-no-duplicate-headings-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-emphasis-as-heading/-/remark-lint-no-emphasis-as-heading-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-file-name-articles/-/remark-lint-no-file-name-articles-1.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-no-file-name-consecutive-dashes/-/remark-lint-no-file-name-consecutive-dashes-1.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-no-file-name-irregular-characters/-/remark-lint-no-file-name-irregular-characters-1.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-no-file-name-mixed-case/-/remark-lint-no-file-name-mixed-case-1.0.3.tgz
	https://registry.yarnpkg.com/remark-lint-no-file-name-outer-dashes/-/remark-lint-no-file-name-outer-dashes-1.0.4.tgz
	https://registry.yarnpkg.com/remark-lint-no-heading-punctuation/-/remark-lint-no-heading-punctuation-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-inline-padding/-/remark-lint-no-inline-padding-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-no-literal-urls/-/remark-lint-no-literal-urls-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-multiple-toplevel-headings/-/remark-lint-no-multiple-toplevel-headings-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-shell-dollars/-/remark-lint-no-shell-dollars-2.0.2.tgz
	https://registry.yarnpkg.com/remark-lint-no-shortcut-reference-image/-/remark-lint-no-shortcut-reference-image-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-shortcut-reference-link/-/remark-lint-no-shortcut-reference-link-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-no-table-indentation/-/remark-lint-no-table-indentation-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-ordered-list-marker-style/-/remark-lint-ordered-list-marker-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-ordered-list-marker-value/-/remark-lint-ordered-list-marker-value-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-rule-style/-/remark-lint-rule-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-strong-marker/-/remark-lint-strong-marker-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-table-cell-padding/-/remark-lint-table-cell-padding-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-table-pipe-alignment/-/remark-lint-table-pipe-alignment-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint-table-pipes/-/remark-lint-table-pipes-3.0.0.tgz
	https://registry.yarnpkg.com/remark-lint-unordered-list-marker-style/-/remark-lint-unordered-list-marker-style-2.0.1.tgz
	https://registry.yarnpkg.com/remark-lint/-/remark-lint-8.0.0.tgz
	https://registry.yarnpkg.com/remark-message-control/-/remark-message-control-6.0.0.tgz
	https://registry.yarnpkg.com/remark-parse/-/remark-parse-11.0.0.tgz
	https://registry.yarnpkg.com/remark-preset-lint-markdown-style-guide/-/remark-preset-lint-markdown-style-guide-4.0.0.tgz
	https://registry.yarnpkg.com/remark-stringify/-/remark-stringify-11.0.0.tgz
	https://registry.yarnpkg.com/remark/-/remark-15.0.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.2.1.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-pkg-maps/-/resolve-pkg-maps-1.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.17.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.21.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.2.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-2.0.0-next.4.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-5.1.0.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-4.4.1.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.1.9.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.6.0.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.1.2.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.1.3.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-push-apply/-/safe-push-apply-1.0.0.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.0.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.3.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.1.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.3.0.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.5.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.6.3.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.2.tgz
	https://registry.yarnpkg.com/set-function-length/-/set-function-length-1.2.2.tgz
	https://registry.yarnpkg.com/set-function-name/-/set-function-name-2.0.2.tgz
	https://registry.yarnpkg.com/set-proto/-/set-proto-1.0.0.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.8.5.tgz
	https://registry.yarnpkg.com/shx/-/shx-0.3.4.tgz
	https://registry.yarnpkg.com/side-channel-list/-/side-channel-list-1.0.0.tgz
	https://registry.yarnpkg.com/side-channel-map/-/side-channel-map-1.0.1.tgz
	https://registry.yarnpkg.com/side-channel-weakmap/-/side-channel-weakmap-1.0.2.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.6.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.1.0.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.3.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.yarnpkg.com/simple-git/-/simple-git-3.16.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-5.1.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/sliced/-/sliced-1.0.1.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.19.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/space-separated-tokens/-/space-separated-tokens-2.0.2.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.13.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.2.tgz
	https://registry.yarnpkg.com/standard-engine/-/standard-engine-15.0.0.tgz
	https://registry.yarnpkg.com/standard/-/standard-17.0.0.tgz
	https://registry.yarnpkg.com/stdin-discarder/-/stdin-discarder-0.2.2.tgz
	https://registry.yarnpkg.com/stop-iteration-iterator/-/stop-iteration-iterator-1.1.0.tgz
	https://registry.yarnpkg.com/stream-chain/-/stream-chain-2.2.5.tgz
	https://registry.yarnpkg.com/stream-json/-/stream-json-1.8.0.tgz
	https://registry.yarnpkg.com/string-argv/-/string-argv-0.3.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-6.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-7.2.0.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.10.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.7.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.9.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.6.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.9.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.6.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.8.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/stringify-object/-/stringify-object-3.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/strnum/-/strnum-1.0.5.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.1.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-9.0.2.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/tap-parser/-/tap-parser-1.2.2.tgz
	https://registry.yarnpkg.com/tap-xunit/-/tap-xunit-2.4.1.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-1.1.3.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.2.1.tgz
	https://registry.yarnpkg.com/temp/-/temp-0.9.4.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-5.3.10.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.32.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/through/-/through-2.3.8.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-1.4.2.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/trough/-/trough-2.0.2.tgz
	https://registry.yarnpkg.com/ts-api-utils/-/ts-api-utils-1.3.0.tgz
	https://registry.yarnpkg.com/ts-loader/-/ts-loader-8.0.2.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-6.2.0.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.14.2.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.15.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.10.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.3.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.7.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.11.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.3.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-3.13.1.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.3.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.3.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.4.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.4.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.6.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.7.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.6.2.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-2.1.0.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.1.0.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-6.19.8.tgz
	https://registry.yarnpkg.com/unicorn-magic/-/unicorn-magic-0.3.0.tgz
	https://registry.yarnpkg.com/unified-args/-/unified-args-11.0.1.tgz
	https://registry.yarnpkg.com/unified-engine/-/unified-engine-11.2.1.tgz
	https://registry.yarnpkg.com/unified-lint-rule/-/unified-lint-rule-1.0.4.tgz
	https://registry.yarnpkg.com/unified-message-control/-/unified-message-control-3.0.3.tgz
	https://registry.yarnpkg.com/unified/-/unified-11.0.5.tgz
	https://registry.yarnpkg.com/unist-util-generated/-/unist-util-generated-1.1.4.tgz
	https://registry.yarnpkg.com/unist-util-generated/-/unist-util-generated-1.1.6.tgz
	https://registry.yarnpkg.com/unist-util-inspect/-/unist-util-inspect-8.1.0.tgz
	https://registry.yarnpkg.com/unist-util-is/-/unist-util-is-4.1.0.tgz
	https://registry.yarnpkg.com/unist-util-is/-/unist-util-is-6.0.0.tgz
	https://registry.yarnpkg.com/unist-util-position/-/unist-util-position-3.0.3.tgz
	https://registry.yarnpkg.com/unist-util-stringify-position/-/unist-util-stringify-position-2.0.1.tgz
	https://registry.yarnpkg.com/unist-util-stringify-position/-/unist-util-stringify-position-4.0.0.tgz
	https://registry.yarnpkg.com/unist-util-visit-parents/-/unist-util-visit-parents-3.1.1.tgz
	https://registry.yarnpkg.com/unist-util-visit-parents/-/unist-util-visit-parents-6.0.1.tgz
	https://registry.yarnpkg.com/unist-util-visit/-/unist-util-visit-2.0.3.tgz
	https://registry.yarnpkg.com/unist-util-visit/-/unist-util-visit-5.0.0.tgz
	https://registry.yarnpkg.com/universal-github-app-jwt/-/universal-github-app-jwt-1.1.1.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-6.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-1.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.1.0.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/url/-/url-0.11.4.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-5.0.1.tgz
	https://registry.yarnpkg.com/vfile-location/-/vfile-location-3.2.0.tgz
	https://registry.yarnpkg.com/vfile-location/-/vfile-location-5.0.3.tgz
	https://registry.yarnpkg.com/vfile-message/-/vfile-message-4.0.2.tgz
	https://registry.yarnpkg.com/vfile-reporter/-/vfile-reporter-8.1.1.tgz
	https://registry.yarnpkg.com/vfile-sort/-/vfile-sort-4.0.0.tgz
	https://registry.yarnpkg.com/vfile-statistics/-/vfile-statistics-3.0.0.tgz
	https://registry.yarnpkg.com/vfile/-/vfile-6.0.2.tgz
	https://registry.yarnpkg.com/vscode-jsonrpc/-/vscode-jsonrpc-8.1.0.tgz
	https://registry.yarnpkg.com/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.17.3.tgz
	https://registry.yarnpkg.com/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.7.tgz
	https://registry.yarnpkg.com/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.8.tgz
	https://registry.yarnpkg.com/vscode-languageserver-types/-/vscode-languageserver-types-3.17.2.tgz
	https://registry.yarnpkg.com/vscode-languageserver-types/-/vscode-languageserver-types-3.17.3.tgz
	https://registry.yarnpkg.com/vscode-languageserver/-/vscode-languageserver-8.1.0.tgz
	https://registry.yarnpkg.com/vscode-uri/-/vscode-uri-3.0.6.tgz
	https://registry.yarnpkg.com/vscode-uri/-/vscode-uri-3.1.0.tgz
	https://registry.yarnpkg.com/walk-sync/-/walk-sync-0.3.4.tgz
	https://registry.yarnpkg.com/walk-up-path/-/walk-up-path-3.0.1.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-2.4.2.tgz
	https://registry.yarnpkg.com/web-namespaces/-/web-namespaces-2.0.1.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-5.1.4.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-5.8.0.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.2.3.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.95.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.1.1.tgz
	https://registry.yarnpkg.com/which-builtin-type/-/which-builtin-type-1.2.1.tgz
	https://registry.yarnpkg.com/which-collection/-/which-collection-1.0.2.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.19.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.9.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-4.0.0.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.0.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.5.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-6.2.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz
	https://registry.yarnpkg.com/wrapped/-/wrapped-1.0.1.tgz
	https://registry.yarnpkg.com/wrapper-webpack-plugin/-/wrapper-webpack-plugin-2.2.2.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-4.0.0.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-4.2.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-1.10.0.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-2.4.5.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-2.6.0.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yn/-/yn-2.0.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/zwitch/-/zwitch-2.0.2.tgz
"

LICENSE="BSD"
SLOT="$(ver_cut 1)/$(ver_cut 2-)"
KEYWORDS="amd64 ~arm64 ~ppc64 ~x86"
IUSE_SYSTEM_LIBS="abseil-cpp av1 brotli crc32c double-conversion ffmpeg +harfbuzz +icu jsoncpp +libusb libvpx +openh264 openjpeg +png re2 snappy woff2 +zstd"
IUSE="+X bluetooth +clang cups cpu_flags_arm_neon custom-cflags debug dev-dependencies gtk4 hangouts kerberos libcxx nvidia optimize-thinlto optimize-webui pax-kernel pgo +proprietary-codecs pulseaudio screencast selinux thinlto ungoogled vaapi wayland"
RESTRICT="
	!system-ffmpeg? ( proprietary-codecs? ( bindist ) )
	!system-openh264? ( bindist )
	mirror
"
REQUIRED_USE="
	thinlto? ( clang )
	optimize-thinlto? ( thinlto )
	pgo? ( clang )
	x86? ( !thinlto )
	vaapi? ( !system-av1 !system-libvpx )
"

# UGC_COMMIT_ID="9756f4778855da36c246852e669495f9e124bab3"

#CHROMIUM_COMMITS=(
#	-da443d7bd3777a5dd0587ecff1fbad1722b106b5
#	-7c6c78ad4e0ed6a0e1204264b02db8f85d34994e
#	-49b23faa16ad14e96601aea8772c7279fcbd6b44
#	-6db9674ad4375d40db7df622652287ccdae82f24
#	-fd011815c455976b15e31966f826628b4f9f61d4
#	-234e68c6b6cf66bec7f367c3be40ff19b5100cc5
#	-be0c460cbca7b0c927e44a529b8489c6d50ea463
#	-4308d83bdf54a2f99329708308a358f930000c63
#	ba427d080df41b82e0e121326e9dd8e1853ea7bc
#)

UGC_URL="https://github.com/ungoogled-software/ungoogled-chromium/archive/"

if [ -z "$UGC_COMMIT_ID" ]; then
	UGC_URL="${UGC_URL}${UGC_PVR}.tar.gz -> ${UGC_PF}.tar.gz"
	UGC_WD="${WORKDIR}/${UGC_PF}"
else
	UGC_URL="${UGC_URL}${UGC_COMMIT_ID}.tar.gz -> ungoogled-chromium-${UGC_COMMIT_ID}.tar.gz"
	UGC_WD="${WORKDIR}/ungoogled-chromium-${UGC_COMMIT_ID}"
fi

SRC_URI+="ungoogled? ( ${UGC_URL} )
"

if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
	for i in "${CHROMIUM_COMMITS[@]}"; do
	# for i in "${!CHROMIUM_COMMITS[@]}"; do
		# if [[ ${CHROMIUM_COMMITS[$i]} =~ webrtc ]]; then
		# #TODO: is it safe to use this mirror?
		# SRC_URI+="https://github.com/webrtc-mirror/webrtc/commit/${i/-}.patch?full_index=true -> webrtc-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ angle ]]; then
		# SRC_URI+="https://github.com/google/angle/commit/${i/-}.patch?full_index=true -> angle-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ quiche ]]; then
		# SRC_URI+="https://github.com/google/quiche/commit/${i/-}.patch?full_index=true -> quiche-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ dawn ]]; then
		# SRC_URI+="https://github.com/google/dawn/commit/${i/-}.patch?full_index=true -> dawn-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ ink ]]; then
		# SRC_URI+="https://github.com/google/ink/commit/${i/-}.patch?full_index=true -> ink-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ vulkan-utility-libraries ]]; then
		# SRC_URI+="https://github.com/KhronosGroup/Vulkan-Utility-Libraries/commit/${i/-}.patch?full_index=true -> vulkan-utility-libraries-${i/-}.patch
		# "
		# elif [[ ${CHROMIUM_COMMITS[$i]} =~ ruy ]]; then
		# SRC_URI+="https://github.com/google/ruy/commit/${i/-}.patch?full_index=true -> ruy-${i/-}.patch
		# "
		# else
		SRC_URI+="https://github.com/chromium/chromium/commit/${i/-}.patch?full_index=true -> chromium-${i/-}.patch
		"
		# fi
	done
fi

for i in ${IUSE_SYSTEM_LIBS}; do
	[[ $i =~ ^(\+)?(.*)$ ]]
	IUSE+=" ${BASH_REMATCH[1]}system-${BASH_REMATCH[2]}"
done

COMMON_X_DEPEND="
	x11-libs/libXcomposite:=
	x11-libs/libXcursor:=
	x11-libs/libXdamage:=
	x11-libs/libXfixes:=
	>=x11-libs/libXi-1.6.0:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/libXtst:=
	x11-libs/libxshmfence:=
"

COMMON_SNAPSHOT_DEPEND="
	system-icu? ( >=dev-libs/icu-73.0:= )
	system-abseil-cpp? ( >=dev-cpp/abseil-cpp-20250512.0 )
	system-brotli? ( >=app-arch/brotli-9999 )
	system-crc32c? ( dev-libs/crc32c )
	system-double-conversion? ( dev-libs/double-conversion )
	system-woff2? ( media-libs/woff2 )
	system-snappy? ( app-arch/snappy )
	system-jsoncpp? ( dev-libs/jsoncpp )
	system-openjpeg? ( media-libs/openjpeg:2= )
	system-re2? ( >=dev-libs/re2-0.2019.08.01:= )
	system-libvpx? ( >=media-libs/libvpx-1.13.0:=[postproc] )
	system-libusb? ( virtual/libusb:1 )
	x11-libs/libnotify
	>=dev-libs/libxml2-2.12.4:=[icu]
	dev-libs/nspr:=
	>=dev-libs/nss-3.26:=
	dev-libs/libxslt:=
	media-libs/fontconfig:=
	>=media-libs/freetype-2.11.0-r1:=
	system-harfbuzz? ( >=media-libs/harfbuzz-3:0=[icu(-)] )
	media-libs/libjpeg-turbo:=
	system-png? ( media-libs/libpng:= )
	system-zstd? ( >=app-arch/zstd-1.5.5:= )
	>=media-libs/libwebp-0.4.0:=
	media-libs/mesa:=[gbm(+)]
	>=media-libs/openh264-1.6.0:=
	system-av1? (
		>=media-libs/dav1d-1.0.0:=
		>=media-libs/libaom-3.7.0:=
	)
	sys-libs/zlib:=
	>=media-libs/libavif-1.2.0:=
	dev-libs/glib:2
	>=media-libs/alsa-lib-1.0.19:=
	pulseaudio? (
		|| (
			media-libs/libpulse
			>=media-sound/apulse-0.1.9
		)
	)
	sys-apps/pciutils:=
	kerberos? ( virtual/krb5 )
	vaapi? ( >=media-libs/libva-2.7:=[X?,wayland?] )
	X? (
	x11-base/xorg-proto:=
	x11-libs/libX11:=
	x11-libs/libxcb:=
	x11-libs/libXext:=
	)
	x11-libs/libxkbcommon:=
	wayland? (
		dev-libs/libffi:=
		dev-libs/wayland:=
		screencast? (
			media-video/pipewire:=
			|| (
				sys-apps/xdg-desktop-portal-gnome
				sys-apps/xdg-desktop-portal-gtk
				kde-plasma/xdg-desktop-portal-kde
				gui-libs/xdg-desktop-portal-lxqt
				gui-libs/xdg-desktop-portal-wlr
			)
		)
	)
"

COMMON_DEPEND="
	app-eselect/eselect-electron
	${COMMON_SNAPSHOT_DEPEND}
	app-arch/bzip2:=
	dev-libs/expat:=
	system-ffmpeg? (
		>=media-video/ffmpeg-6.1:=
		|| (
			media-video/ffmpeg[-samba]
			>=net-fs/samba-4.5.10-r1[-debug(-)]
		)
		>=media-libs/opus-1.3.1:=
	)
	net-misc/curl[ssl]
	sys-apps/dbus:=
	sys-libs/zlib:=[minizip]
	X? ( ${COMMON_X_DEPEND} )
	>=app-accessibility/at-spi2-core-2.46.0:2
	media-libs/mesa:=[X?,wayland?]
	cups? ( >=net-print/cups-1.3.11:= )
	virtual/udev
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:2
	x11-libs/pango:=
"

RDEPEND="${COMMON_DEPEND}
	|| (
		x11-libs/gtk+:3[X?,wayland?]
		gui-libs/gtk:4[X?,wayland?]
	)
	virtual/ttf-fonts
	selinux? ( sec-policy/selinux-chromium )
"

DEPEND="${COMMON_DEPEND}
	gtk4? ( gui-libs/gtk:4[X?,wayland?] )
	!gtk4? ( x11-libs/gtk+:3[X?,wayland?] )
"

BDEPEND="
	${COMMON_SNAPSHOT_DEPEND}
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	>=app-arch/gzip-1.7
	>=dev-build/gn-0.2114
	app-alternatives/ninja
	dev-lang/perl
	>=dev-util/gperf-3.2
	dev-vcs/git
	>=net-libs/nodejs-7.6.0[inspector,npm]
	>=sys-devel/bison-2.4.3
	sys-devel/flex
	virtual/pkgconfig
	clang? (
		pgo? ( >llvm-core/clang-19.0.0_pre20240518 >llvm-core/lld-19.0.0_pre20240518	)
		!pgo? ( llvm-core/clang llvm-core/lld )
	)
	sys-apps/yarn
"

S="${WORKDIR}/${CHROMIUM_P}"

python_check_deps() {
	python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

pre_build_checks() {
	# Check build requirements: bugs #471810, #541816, #914220
	# We're going to start doing maths here on the size of an unpacked source tarball,
	# this should make updates easier as chromium continues to balloon in size.
	local BASE_DISK=18
	local EXTRA_DISK=1
	local CHECKREQS_MEMORY="4G"
	tc-is-cross-compiler && EXTRA_DISK=2
	if use thinlto || use pgo; then
		CHECKREQS_MEMORY="9G"
		tc-is-cross-compiler && EXTRA_DISK=4
		use pgo && EXTRA_DISK=8
	fi
	if is-flagq '-g?(gdb)?([1-9])'; then
		if use custom-cflags; then
			EXTRA_DISK=13
		fi
		CHECKREQS_MEMORY="16G"
	fi
	CHECKREQS_DISK_BUILD="$((BASE_DISK + EXTRA_DISK))G"
	check-reqs_${EBUILD_PHASE_FUNC}
}

pkg_pretend() {
	if use libcxx; then
		ewarn
		ewarn "Building with libcxx, please be aware that system-*"
		ewarn "and some other c++ dependencies need to be compiled"
		ewarn "with the same c++ library as ungoogled-chromium itself"
		ewarn "dev-libs/jsoncpp is most problematic, see #58 #49 #119 for details"
		ewarn "Simplest solution would be to disable corresponding system-* flags"
		ewarn
	fi
	pre_build_checks

	if [ "$CHROMIUM_VERSION_WARNING" = "true" ]; then
		ewarn
		ewarn "Chromium ${CHROMIUM_VERSION} will be used instead of the required one"
		ewarn
	fi
}

pkg_setup() {
	pre_build_checks

	chromium_suid_sandbox_check_kernel_config
}

src_unpack() {
	# Here be dragons!
	local XCLD="--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/instrumented_libs  \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/llvm \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/llvm-build \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/node/linux \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/rust-src \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/rust-toolchain \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/build/linux/debian_bullseye_i386-sysroot \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/build/linux/debian_bullseye_amd64-sysroot \
		--exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/angle/third_party/VK-GL-CTS \
	"

	if ! use libcxx ; then
		XCLD+=" --exclude=chromium-${CHROMIUM_VERSION/_*}/third_party/libc++"
	fi

	if ! use pgo ; then
		XCLD+=" --exclude=chromium-${CHROMIUM_VERSION/_*}/chrome/build/pgo_profiles"
	fi

	einfo "Unpacking chromium-${CHROMIUM_VERSION/_*}.tar.xz to ${WORKDIR}"
	tar ${XCLD} -xf "${DISTDIR}/chromium-${CHROMIUM_VERSION/_*}-lite.tar.xz" -C "${WORKDIR}" || die

	unpack "${P}.tar.gz"
	unpack "node-v${NODE_VERSION}.tar.xz"

	use ungoogled && unpack ${UGC_URL#*->}
	unpack chromium-patches-${PATCH_V}.tar.bz2
	# Warned you!

	if use ppc64; then
		unpack chromium-openpower-${PPC64_HASH:0:10}.tar.bz2
	fi
}

src_prepare() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	cp -f ${WORKDIR}/chromium-patches-${PATCH_V}/*-compiler.patch "${T}/compiler.patch"
	if ! use custom-cflags; then #See #25 #92
		sed -i '/default_stack_frames/Q' "${T}/compiler.patch" || die
	fi

	# einfo "Disabling dugite"
	# sed -i '/dugite/d' "${WORKDIR}/${P}/package.json" || die

	# pushd "${WORKDIR}/${NODE_P}" > /dev/null || die
	# eapply "${FILESDIR}/openssl_fips-r2.patch" || die
	# popd > /dev/null || die

	pushd "${WORKDIR}/${P}" > /dev/null || die
		# sed -i '/web_tests/Q' "patches/chromium/cherry-pick-1eb1e18ad41d.patch" || die

		sed -i 's/std::vector<const/std::vector</' patches/chromium/feat_add_data_parameter_to_processsingleton.patch || die
		sed -i 's/std::vector<const/std::vector</' shell/browser/api/electron_api_app.cc || die
		sed -i 's/std::vector<const/std::vector</' shell/browser/api/electron_api_app.h || die
		# sed -i 's/std::variant/absl::variant/' shell/browser/electron_browser_context.h || die
		# sed -i 's/std::get_if/absl::get_if/' shell/browser/electron_browser_context.cc || die
		sed -i 's/constexpr CodeAndShiftedChar/CodeAndShiftedChar/' shell/common/keyboard_util.cc || die

		sed -i 's/NODE_DIR = os.path.join/NODE_DIR = os.path.abspath(os.path.join/' script/generate-config-gypi.py || die
		sed -i "s/'electron_node')/'electron_node'))/" script/generate-config-gypi.py || die

		sed -i 's/Path(__file__).resolve()/Path(__file__).absolute()/' script/node/generate_node_headers.py || die
		sed -i 's/os.path.join(node_root_dir, file)/os.path.abspath(os.path.join(node_root_dir, file))/' script/node/generate_node_headers.py || die

		# #? Funny, huh?
		# sed -i "s/module.exports.getElectronVersion = () => {/module.exports.getElectronVersion = () => {return '${PV}';/" \
		# 	script/lib/get-version.js || die
		# mkdir -p .git/packed-refs .git/HEAD;
		# sed -i '/git\/packed-refs/d' BUILD.gn || die
		# sed -i '/git\/HEAD/d' BUILD.gn || die

		grep "'--openssl-no-asm'" script/generate-config-gypi.py > /dev/null || die
		NODE_CONFIG_ARGS="'--without-bundled-v8', '--shared-openssl', '--shared-zlib', '--without-npm', '--shared-cares', '--shared-http-parser', '--shared-nghttp2'"
		use system-icu && NODE_CONFIG_ARGS+=", '--with-intl=system-icu'"
		sed -i "s/'--openssl-no-asm'/$NODE_CONFIG_ARGS/" script/generate-config-gypi.py || die

		# See #166
		sed -i '/proprietary_codecs/d' build/args/all.gn || die
		sed -i '/ffmpeg_branding/d' build/args/all.gn || die
		sed -i '/rtc_use_h264/d' build/args/release.gn || die

		use bluetooth || eapply "${FILESDIR}/disable-bluez-electron-r3.patch"

		if use ungoogled; then
			# sed -i '/SecurityStateTabHelper::GetMaliciousContentStatus/Q' "patches/chromium/ssl_security_state_tab_helper.patch" || die
			sed -i "s/https/trk:173:https/" "patches/chromium/feat_add_support_for_overriding_the_base_spellchecker_download_url.patch" || die
			sed -i "s/AfterWriteCheckResult)> callback) override;/AfterWriteCheckResult)> callback);/" \
				"shell/browser/file_system_access/file_system_access_permission_context.h" || die
			sed -i '/@@ -38/,+7d' "patches/chromium/refactor_expose_file_system_access_blocklist.patch" || die
			sed -i '/test\/BUILD.gn/Q' "patches/chromium/build_do_not_depend_on_packed_resource_integrity.patch" || die
		fi
		eapply "${FILESDIR}/ungoogled-electron.patch" || die
		eapply "${FILESDIR}/fix-portal-r1.patch" || die
	popd > /dev/null || die

	local PATCHES=(
		"${T}/compiler.patch"
		"${FILESDIR}/chromium-cross-compile.patch"
		"${FILESDIR}/chromium-109-system-openh264.patch"
		"${FILESDIR}/chromium-109-system-zlib.patch"
		"${FILESDIR}/chromium-111-InkDropHost-crash.patch"
		"${FILESDIR}/chromium-131-unbundle-icu-target.patch"
		"${FILESDIR}/chromium-135-oauth2-client-switches.patch"
		"${FILESDIR}/chromium-135-map_droppable-glibc.patch"
		"${FILESDIR}/chromium-137-openh264-include-path.patch"
		"${FILESDIR}/chromium-138-nodejs-version-check.patch"
		"${FILESDIR}/chromium-125-cloud_authenticator.patch"
		"${FILESDIR}/chromium-123-qrcode.patch"
		"${FILESDIR}/perfetto-system-zlib.patch"
		"${FILESDIR}/chromium-127-cargo_crate.patch"
		"${FILESDIR}/chromium-128-gtk-fix-prefers-color-scheme-query.patch"
		"${FILESDIR}/chromium-128-cfi-split-lto-unit.patch"
		"${FILESDIR}/chromium-132-no-link-builtins.patch"
		"${FILESDIR}/restore-x86-r2.patch"
		"${FILESDIR}/chromium-132-optional-lens.patch"
		"${FILESDIR}/chromium-133-webrtc-fixes.patch"
		"${FILESDIR}/chromium-137-fix-for-kde.patch"
		"${FILESDIR}/chromium-138-fontations.patch"
		"${FILESDIR}/chromium-138-no-rust.patch"
		"${FILESDIR}/chromium-138-crabby.patch"
		"${FILESDIR}/chromium-138-gcc.patch"
		"${FILESDIR}/chromium-134-stdatomic.patch"
		"${FILESDIR}/chromium-137-constexpr.patch"
		"${FILESDIR}/font-gc-asan.patch"
		"${FILESDIR}/fix-pdf-r1.patch"
	)

	#shopt -s globstar nullglob
	## 130: moved the PPC64 patches into the chromium-patches repo
	#local patch
	#for patch in "${WORKDIR}/chromium-patches-${PATCH_V}"/**/*.patch; do
	#		if [[ ${patch} == *"ppc64le"* ]]; then
	#				use ppc64 && PATCHES+=( "${patch}" )
	#		else
	#				PATCHES+=( "${patch}" )
	#		fi
	#done
	#shopt -u globstar nullglob

	# Strictly speaking this doesn't need to be gated (no bundled toolchain for ppc64); it keeps the logic together
	if use ppc64; then
		local patchset_dir="${WORKDIR}/openpower-patches-${PPC64_HASH}/patches"
		# patch causes build errors on 4K page systems (https://bugs.gentoo.org/show_bug.cgi?id=940304)
		local page_size_patch="ppc64le/third_party/use-sysconf-page-size-on-ppc64.patch"
		local isa_3_patch="ppc64le/core/baseline-isa-3-0.patch"
		# Apply the OpenPOWER patches (check for page size and isa 3.0)
		openpower_patches=( $(grep -E "^ppc64le|^upstream" "${patchset_dir}/series" | grep -v "${page_size_patch}" |
			grep -v "${isa_3_patch}" || die) )
		for patch in "${openpower_patches[@]}"; do
			PATCHES+=( "${patchset_dir}/${patch}" )
		done
		if [[ $(getconf PAGESIZE) == 65536 ]]; then
			PATCHES+=( "${patchset_dir}/${page_size_patch}" )
		fi
		# We use vsx3 as a proxy for 'want isa3.0' (POWER9)
		if use cpu_flags_ppc_vsx3 ; then
			PATCHES+=( "${patchset_dir}/${isa_3_patch}" )
		fi
	fi

	ewarn
	ewarn "Fontations Rust font stack is disabled"
	ewarn "Using media-libs/libavif instead of CrabbyAvif"
	ewarn

	if [ ! -z "${CHROMIUM_COMMITS[*]}" ]; then
		for i in "${CHROMIUM_COMMITS[@]}"; do
		# for i in "${!CHROMIUM_COMMITS[@]}"; do
			# if [[ ${CHROMIUM_COMMITS[$i]} =~ webrtc ]]; then
			# 	patch_prefix="webrtc"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ angle ]]; then
			# 	patch_prefix="angle"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ quiche ]]; then
			# 	patch_prefix="quiche"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ dawn ]]; then
			# 	patch_prefix="dawn"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ ink ]]; then
			# 	patch_prefix="ink"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ vulkan-utility-libraries ]]; then
			# 	patch_prefix="vulkan-utility-libraries"
			# elif [[ ${CHROMIUM_COMMITS[$i]} =~ ruy ]]; then
			# 	patch_prefix="ruy"
			# else
				patch_prefix="chromium"
			# fi
			# pushd "${CHROMIUM_COMMITS[$i]}" > /dev/null || die
			if [[ $i = -*  ]]; then
				einfo "Reverting ${patch_prefix}-${i/-}.patch"
				git apply -R --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch" || die
			else
				einfo "Applying ${patch_prefix}-${i/-}.patch"
				git apply --exclude="*unittest.cc" --exclude="DEPS" \
					-p1 < "${DISTDIR}/${patch_prefix}-${i/-}.patch" || die
			fi
			# popd > /dev/null || die
		done
	fi

	use bluetooth || eapply "${FILESDIR}/disable-bluez-r4.patch"

	if use system-ffmpeg; then
		PATCHES+=(
			"${FILESDIR}/chromium-135-opus.patch"
			"${FILESDIR}/chromium-135-hevc.patch"
		)
		sed -i "\!AVFMT_FLAG_NOH264PARSE!d" media/filters/ffmpeg_glue.cc || die
		ewarn "You need to expose \"av_stream_get_first_dts\" in ffmpeg via user patch"
	fi

	if use system-av1; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-av1-r1.patch"
		)
	fi

	if use system-libvpx; then
		PATCHES+=(
			"${FILESDIR}/chromium-system-libvpx-r1.patch"
		)
	fi

	use system-openjpeg && eapply "${FILESDIR}/chromium-system-openjpeg-r4.patch"

	default

	ln -s "${WORKDIR}/${P}" electron || die
	ln -s "${WORKDIR}/${NODE_P}" third_party/electron_node || die

	# if [[ ${LLVM_SLOT} == "19" ]]; then
	# 	# Upstream now hard depend on a feature that was added in LLVM 20.1, but we don't want to stabilise that yet.
	# 	# Do the temp file shuffle in case someone is using something other than `gawk`
	# 	{
	# 		awk '/config\("clang_warning_suppression"\) \{/	{ print $0 " }"; sub(/clang/, "xclang"); print; next }
	# 			{ print }' build/config/compiler/BUILD.gn > "${T}/build.gn" && \
	# 			mv "${T}/build.gn" build/config/compiler/BUILD.gn
	# 	} || die "Unable to disable warning suppression"
	# fi

	# Not included in -lite tarballs, but we should check for it anyway.
	if [[ -f third_party/node/linux/node-linux-x64/bin/node ]]; then
		rm third_party/node/linux/node-linux-x64/bin/node || die
	else
		mkdir -p third_party/node/linux/node-linux-x64/bin || die
	fi
	ln -s "${EPREFIX}"/usr/bin/node third_party/node/linux/node-linux-x64/bin/node || die

	# adjust python interpreter version
	sed -i -e "s|\(^script_executable = \).*|\1\"${EPYTHON}\"|g" .gn || die

	cp "${FILESDIR}/libusb.gn" build/linux/unbundle || die
	sed -i '/^REPLACEMENTS.*$/{s++REPLACEMENTS = {"libusb":"third_party/libusb/BUILD.gn",+;h};${x;/./{x;q0};x;q1}' \
		build/linux/unbundle/replace_gn_files.py || die
	sed -i '/^.*deps.*third_party\/jsoncpp.*$/{s++public_deps \+= [ "//third_party/jsoncpp" ]+;h};${x;/./{x;q0};x;q1}' \
		third_party/webrtc/rtc_base/BUILD.gn || die


	if use system-abseil-cpp; then
		eapply_wrapper "${FILESDIR}/chromium-system-abseil.patch"
		eapply_wrapper "${FILESDIR}/chromium-138-system-abseil.patch"
		cp -f /usr/include/absl/base/options.h third_party/abseil-cpp/absl/base/options.h
		sed -i '/^#define ABSL_OPTION_USE_STD_ORDERING.*$/{s++#define ABSL_OPTION_USE_STD_ORDERING 1+;h};${x;/./{x;q0};x;q1}' \
			third_party/abseil-cpp/absl/base/options.h || die

	fi


	if use ungoogled; then
		# From here we adapt ungoogled-chromium's patches to our needs
		local ugc_pruning_list="${UGC_WD}/pruning.list"
		local ugc_patch_series="${UGC_WD}/patches/series"
		local ugc_substitution_list="${UGC_WD}/domain_substitution.list"

		#! conflicting patches
		sed -i '/print_view_manager_base.cc/,+37d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die
		sed -i '/print_view_manager_base.h/,+10d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die
		sed -i '/chrome_file_system_access_permission_context.cc/,+166d' \
			"${UGC_WD}/patches/core/ungoogled-chromium/fix-building-without-safebrowsing.patch" || die

		UGC_SKIP_SUBSTITUTION="${UGC_SKIP_SUBSTITUTION} flag-metadata.json histograms.xml \
			chrome_file_system_access_permission_context.cc layer_tree_view.cc http_response_headers.cc"

		local ugc_unneeded=(
			# GN bootstrap
			extra/debian/gn/parallel
		)

		#* Temporary fix
		sed -i "\!ios/!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/icu/!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/libjpeg_turbo/!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/snappy/!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/closure_compiler/!d" "${ugc_pruning_list}" || die

		#* Didn't unpack them at the first place
		sed -i "\!build/linux/debian_bullseye_i386-sysroot!d" "${ugc_pruning_list}" || die
		sed -i "\!build/linux/debian_bullseye_amd64-sysroot!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/llvm-build!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/node/linux!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/rust-src!d" "${ugc_pruning_list}" || die
		sed -i "\!third_party/rust-toolchain!d" "${ugc_pruning_list}" || die
		if ! use libcxx ; then
			sed -i "\!third_party/libc!d" "${ugc_pruning_list}" || die
		fi
		sed -i "s|debug('files|error('files|" \
			"${UGC_WD}/utils/prune_binaries.py" || die
		sed -i "\!third_party/node/linux!d" \
			"${UGC_WD}/utils/prune_binaries.py" || die

		local ugc_p ugc_dir
		for p in "${ugc_unneeded[@]}"; do
			einfo "Removing ${p}.patch"
			sed -i "\!${p}.patch!d" "${ugc_patch_series}" || die
		done

		if [ ! -z "${UGC_SKIP_PATCHES}" ]; then
		for p in ${UGC_SKIP_PATCHES}; do
			ewarn "Removing ${p}"
			sed -i "\!${p}!d" "${ugc_patch_series}" || die
		done
		fi

		if [ ! -z "${UGC_KEEP_BINARIES}" ]; then
		for p in ${UGC_KEEP_BINARIES}; do
			ewarn "Keeping binary ${p}"
			sed -i "\!${p}!d" "${ugc_pruning_list}" || die
		done
		fi

		if [ ! -z "${UGC_SKIP_SUBSTITUTION}" ]; then
		for p in ${UGC_SKIP_SUBSTITUTION}; do
			ewarn "No substitutions in ${p}"
			sed -i "\!${p}!d" "${ugc_substitution_list}" || die
		done
		fi

		ebegin "Pruning binaries"
		"${UGC_WD}/utils/prune_binaries.py" -q . "${UGC_WD}/pruning.list"
		eend $? || die

		ebegin "Applying ungoogled-chromium patches"
		"${UGC_WD}/utils/patches.py" -q apply . "${UGC_WD}/patches"
		eend $? || die

		ebegin "Applying domain substitution"
		"${UGC_WD}/utils/domain_substitution.py" -q apply -r "${UGC_WD}/domain_regex.list" -f "${UGC_WD}/domain_substitution.list" .
		eend $? || die

		sed -i '/packed_resources_integrity_header/d' chrome/test/BUILD.gn || die
	else
		eapply "${FILESDIR}/more-locales.patch"
	fi

	if use system-zstd; then
		sed -i '/zstd:headers/{s++zstd:zstd_headers+;h};${x;/./{x;q0};x;q1}' \
			electron/patches/node/build_add_gn_build_files.patch || die
	fi

	declare -A patches=(
		["electron/patches/chromium"]="."
		["electron/patches/boringssl"]="third_party/boringssl/src"
		["electron/patches/devtools_frontend"]="third_party/devtools-frontend/src"
		["electron/patches/ffmpeg"]="third_party/ffmpeg"
		["electron/patches/v8"]="v8"
		["electron/patches/node"]="third_party/electron_node"
		["electron/patches/perfetto"]="third_party/perfetto"
		["electron/patches/webrtc"]="third_party/webrtc"
		["electron/patches/sqlite"]="third_party/sqlite/src"
	)
	for patch_folder in "${!patches[@]}";
	do
		readarray -t topatch < "${patch_folder}/.patches"
		einfo "- ${patch_folder}"
		for i in "${topatch[@]}"; do
			# if	[ "$i" = "feat_add_uv_loop_interrupt_on_io_change_option_to_uv_loop_configure.patch" ]; then
			# 	einfo "Partially applying ${i}"
			# 	pushd "${patches[$patch_folder]}" > /dev/null || die
			# 	git apply -p1 --exclude="test" --exclude="loop.rst" < "${FILESDIR}/$i" || die
			# 	popd > /dev/null || die
			# 	continue;
			# fi
			# if [ "$i" = "cherry-pick-5902d1aa722a.patch" ] ||
			# if	[ "$i" = "regexp_add_a_currently_failing_cctest_for_irregexp_reentrancy.patch" ]; then
			# 	einfo "Skipping ${i}: No files to patch."
			# 	continue;
			# fi
			if [ "$i" = "cherry-pick-dd8e2822e507.patch" ] ||
				[ "$i" = "revert_enable_crel_for_arm32_targets.patch" ]; then
				ewarn "Skipping ${i} due to... reasons..."
				continue;
			fi
			if [ "$i" = "sysroot.patch" ] ||
				[ "$i" = "build_disable_print_content_analysis.patch" ]; then
				if use ungoogled; then
					ewarn "Skipping ${i} due to ungoogled."
					continue;
				fi
			fi
			# if [ "$i" = "fix_preserve_proper_method_names_as-is_in_error_stack.patch" ]; then
			# 	einfo "Git binary patch: ${i}"
			# 	pushd "${patches[$patch_folder]}" > /dev/null || die
			# 	git apply -p1 < "${S}/${patch_folder}/$i" || die
			# 	popd > /dev/null || die
			# 	continue;
			# fi
			# pushd "${patches[$patch_folder]}" > /dev/null || die
			# eapply "${S}/${patch_folder}/$i" || die
			# popd > /dev/null || die
			pushd "${patches[$patch_folder]}" > /dev/null || die
			einfo "$i"
			# ebegin "$i"
			git apply --exclude="*/web_tests/*" --exclude="*/test-list/*" \
				--exclude="*/uv/test/*" --exclude="*.rst" \
				--exclude="*/cctest/*" --exclude="*/unittests/*" \
				--exclude="*/test/data/*" --exclude="*/.eslintrc*" \
				--exclude="*/__config_site" \
				-p1 < "${S}/${patch_folder}/$i" || die
			# eend $? || die
			popd > /dev/null || die
		done
	done

	local keeplibs=(
		base/third_party/cityhash
	)
	use system-double-conversion || keeplibs+=(
		base/third_party/double_conversion
	)
	keeplibs+=(
		base/third_party/icu
		base/third_party/nspr
		base/third_party/superfasthash
		base/third_party/symbolize
		base/third_party/xdg_user_dirs
		buildtools/third_party/libc++
		buildtools/third_party/libc++abi
		chrome/third_party/mozilla_security_manager
		net/third_party/mozilla_security_manager
		net/third_party/nss
		net/third_party/quic
		net/third_party/uri_template
		third_party/abseil-cpp/absl/base
	)
	use system-abseil-cpp || keeplibs+=(
		third_party/abseil-cpp
	)
	keeplibs+=(
		third_party/angle
		third_party/angle/src/common/third_party/xxhash
		third_party/angle/src/third_party/ceval
	)
	use nvidia || keeplibs+=(
		third_party/angle/src/third_party/libXNVCtrl
	)
	keeplibs+=(
		third_party/angle/src/third_party/volk
		third_party/anonymous_tokens
		third_party/apple_apsl
		third_party/axe-core
		third_party/bidimapper
		third_party/blink
		third_party/boringssl
		third_party/boringssl/src/third_party/fiat
		third_party/breakpad
		third_party/breakpad/breakpad/src/third_party/curl
	)
	use system-brotli || keeplibs+=(
		third_party/brotli
	)
	keeplibs+=(
		third_party/catapult
		third_party/catapult/common/py_vulcanize/third_party/rcssmin
		third_party/catapult/common/py_vulcanize/third_party/rjsmin
		third_party/catapult/third_party/beautifulsoup4-4.9.3
		third_party/catapult/third_party/html5lib-1.1
		third_party/catapult/third_party/polymer
		third_party/catapult/third_party/six
		third_party/catapult/tracing/third_party/d3
		third_party/catapult/tracing/third_party/gl-matrix
		third_party/catapult/tracing/third_party/jpeg-js
		third_party/catapult/tracing/third_party/jszip
		third_party/catapult/tracing/third_party/mannwhitneyu
		third_party/catapult/tracing/third_party/oboe
		third_party/catapult/tracing/third_party/pako
		third_party/ced
		third_party/cld_3
		third_party/closure_compiler
		third_party/content_analysis_sdk
		third_party/cpuinfo
		third_party/crabbyavif
		third_party/crashpad
		third_party/crashpad/crashpad/third_party/lss
		third_party/crashpad/crashpad/third_party/zlib
	)
	use system-crc32c || keeplibs+=(
		third_party/crc32c
	)
	keeplibs+=(
		third_party/cros_system_api
		third_party/d3
		third_party/dawn
		third_party/dawn/third_party/gn/webgpu-cts
		third_party/dawn/third_party/khronos
		third_party/depot_tools
		third_party/devscripts
		third_party/devtools-frontend
		third_party/devtools-frontend/src/front_end/third_party/acorn
		third_party/devtools-frontend/src/front_end/third_party/additional_readme_paths.json
		third_party/devtools-frontend/src/front_end/third_party/axe-core
		third_party/devtools-frontend/src/front_end/third_party/chromium
		third_party/devtools-frontend/src/front_end/third_party/codemirror
		third_party/devtools-frontend/src/front_end/third_party/csp_evaluator
		third_party/devtools-frontend/src/front_end/third_party/diff
		third_party/devtools-frontend/src/front_end/third_party/i18n
		third_party/devtools-frontend/src/front_end/third_party/intl-messageformat
		third_party/devtools-frontend/src/front_end/third_party/json5
		third_party/devtools-frontend/src/front_end/third_party/legacy-javascript
		third_party/devtools-frontend/src/front_end/third_party/lighthouse
		third_party/devtools-frontend/src/front_end/third_party/lit
		third_party/devtools-frontend/src/front_end/third_party/marked
		third_party/devtools-frontend/src/front_end/third_party/puppeteer
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/parsel-js
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/package/lib/esm/third_party/rxjs
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/third_party/mitt
		third_party/devtools-frontend/src/front_end/third_party/puppeteer/third_party/rxjs
		third_party/devtools-frontend/src/front_end/third_party/third-party-web
		third_party/devtools-frontend/src/front_end/third_party/vscode.web-custom-data
		third_party/devtools-frontend/src/front_end/third_party/wasmparser
		third_party/devtools-frontend/src/front_end/third_party/web-vitals
		third_party/devtools-frontend/src/third_party
		third_party/dom_distiller_js
		third_party/dragonbox
		third_party/eigen3
		third_party/emoji-segmenter
		third_party/farmhash
		third_party/fast_float
		third_party/fdlibm
		third_party/fft2d
		third_party/flatbuffers
		third_party/fp16
		third_party/freetype
		third_party/fusejs
		third_party/fxdiv
		third_party/gemmlowp
		third_party/google_input_tools
		third_party/google_input_tools/third_party/closure_library
		third_party/google_input_tools/third_party/closure_library/third_party/closure
		third_party/googletest
		third_party/highway
		third_party/hunspell
		third_party/ink_stroke_modeler/src/ink_stroke_modeler
		third_party/ink_stroke_modeler/src/ink_stroke_modeler/internal
		third_party/ink/src/ink/brush
		third_party/ink/src/ink/color
		third_party/ink/src/ink/geometry
		third_party/ink/src/ink/rendering
		third_party/ink/src/ink/rendering/skia/common_internal
		third_party/ink/src/ink/rendering/skia/native
		third_party/ink/src/ink/rendering/skia/native/internal
		third_party/ink/src/ink/strokes
		third_party/ink/src/ink/types
		third_party/inspector_protocol
		third_party/ipcz
		third_party/jinja2
	)
	use system-jsoncpp || keeplibs+=(
		third_party/jsoncpp
	)
	keeplibs+=(
		third_party/khronos
		third_party/lens_server_proto
		third_party/leveldatabase
		third_party/libaddressinput
		third_party/libdrm
		third_party/libgav1
		third_party/libjingle
		third_party/libphonenumber
		third_party/libsecret
		third_party/libsrtp
		third_party/libsync
		third_party/libtess2/libtess2
		third_party/libtess2/src/Include
		third_party/libtess2/src/Source
		third_party/liburlpattern
	)
	use system-libusb || keeplibs+=(
		third_party/libusb
	)
	keeplibs+=(
		third_party/libva_protected_content
	)
	use system-libvpx || keeplibs+=(
		third_party/libvpx
		third_party/libvpx/source/libvpx/third_party/x86inc
	)
	keeplibs+=(
		third_party/libwebm
		third_party/libx11
		third_party/libxcb-keysyms
		third_party/libxml/chromium
		third_party/libyuv
		third_party/libzip
		third_party/lit
		third_party/lottie
		third_party/lss
		third_party/lzma_sdk
		third_party/mako
		third_party/markupsafe
		third_party/material_color_utilities
		third_party/mesa
		third_party/metrics_proto
		third_party/minigbm
		third_party/modp_b64
		third_party/nasm
		third_party/nearby
		third_party/neon_2_sse
		third_party/node
		third_party/omnibox_proto
		third_party/one_euro_filter
		third_party/openscreen
		third_party/openscreen/src/third_party/
		third_party/openscreen/src/third_party/tinycbor/src/src
		third_party/ots
		third_party/pdfium
		third_party/pdfium/third_party/agg23
		third_party/pdfium/third_party/bigint
		third_party/pdfium/third_party/freetype
		third_party/pdfium/third_party/lcms
	)
	use system-openjpeg || keeplibs+=(
		third_party/pdfium/third_party/libopenjpeg
	)
	keeplibs+=(
		third_party/pdfium/third_party/libtiff
		third_party/perfetto
		third_party/perfetto/protos/third_party/chromium
		third_party/perfetto/protos/third_party/simpleperf
		third_party/pffft
		third_party/ply
		third_party/polymer
		third_party/private_membership
		third_party/private-join-and-compute
		third_party/protobuf
		third_party/protobuf/third_party/utf8_range
		third_party/pthreadpool
		third_party/puffin
		third_party/pyjson5
		third_party/pyyaml
		third_party/rapidhash
		third_party/rnnoise
		third_party/ruy
		third_party/s2cellid
		third_party/search_engines_data
		third_party/securemessage
		third_party/selenium-atoms
		third_party/sentencepiece
		third_party/sentencepiece/src/third_party/darts_clone
		third_party/shell-encryption
		third_party/simdutf
		third_party/simplejson
		third_party/six
		third_party/skia
		third_party/skia/include/third_party/vulkan
		third_party/skia/third_party/vulkan
		third_party/smhasher
	)
	use system-snappy || keeplibs+=(
		third_party/snappy
	)
	keeplibs+=(
		third_party/spirv-headers
		third_party/spirv-tools
		third_party/sqlite
		third_party/swiftshader
		third_party/swiftshader/third_party/astc-encoder
		third_party/swiftshader/third_party/llvm-subzero
		third_party/swiftshader/third_party/marl
		third_party/swiftshader/third_party/SPIRV-Headers/include/spirv
		third_party/swiftshader/third_party/SPIRV-Tools
		third_party/swiftshader/third_party/subzero
		third_party/tensorflow_models
		third_party/tensorflow-text
		third_party/tflite
		third_party/tflite/src/third_party/fft2d
		third_party/tflite/src/third_party/xla/third_party/tsl
		third_party/tflite/src/third_party/xla/xla/tsl/framework
		third_party/tflite/src/third_party/xla/xla/tsl/lib/random
		third_party/tflite/src/third_party/xla/xla/tsl/protobuf
		third_party/tflite/src/third_party/xla/xla/tsl/util
		third_party/ukey2
		third_party/utf
		third_party/vulkan
		third_party/wasm_tts_engine
		third_party/wayland
		third_party/webdriver
		third_party/webgpu-cts
		third_party/webrtc
		third_party/webrtc/common_audio/third_party/ooura
		third_party/webrtc/common_audio/third_party/spl_sqrt_floor
		third_party/webrtc/modules/third_party/fft
		third_party/webrtc/modules/third_party/g711
		third_party/webrtc/modules/third_party/g722
		third_party/webrtc/rtc_base/third_party/sigslot
		third_party/widevine
	)
	use system-woff2 || keeplibs+=(
		third_party/woff2
	)
	keeplibs+=(
		third_party/wuffs
		third_party/x11proto
		third_party/xcbproto
		third_party/xnnpack
		third_party/zlib/google
		third_party/zxcvbn-cpp
		url/third_party/mozilla
		v8/third_party/siphash
		v8/third_party/utf8-decoder
		v8/third_party/glibc
		v8/third_party/inspector_protocol
		v8/third_party/rapidhash-v8
		v8/third_party/v8
		v8/third_party/valgrind

		# gyp -> gn leftovers
		third_party/speech-dispatcher
		third_party/usb_ids
		third_party/xdg-utils
	)
	if ! use system-harfbuzz; then
		keeplibs+=( third_party/harfbuzz-ng )
	fi

	if ! use system-ffmpeg; then
		keeplibs+=( third_party/ffmpeg third_party/opus )
	fi

	if ! use system-icu; then
		keeplibs+=( third_party/icu )
	fi

	if ! use system-png; then
		keeplibs+=( third_party/libpng )
	fi

	if ! use system-zstd; then
		keeplibs+=( third_party/zstd )
	fi

	if ! use system-av1; then
		keeplibs+=(
			third_party/dav1d
			third_party/libaom
			third_party/libaom/source/libaom/third_party/fastfeat
			third_party/libaom/source/libaom/third_party/SVT-AV1
			third_party/libaom/source/libaom/third_party/vector
			third_party/libaom/source/libaom/third_party/x86inc
		)
	fi

	if use libcxx; then
		keeplibs+=(
				third_party/libc++
				third_party/llvm-libc
		)
	fi

	if ! use system-openh264; then
		keeplibs+=( third_party/openh264 )
	fi

	if ! use system-re2; then
		keeplibs+=( third_party/re2 )
	fi

	# Arch-specific
	if use arm64 || use ppc64 ; then
		keeplibs+=( third_party/swiftshader/third_party/llvm-10.0 )
	fi

	# we need to generate ppc64 stuff because upstream does not ship it yet
	# it has to be done before unbundling.
	if use ppc64; then
		pushd third_party/libvpx >/dev/null || die
		mkdir -p source/config/linux/ppc64 || die
		# requires git and clang, bug #832803
		# Revert https://chromium.googlesource.com/chromium/src/+/b463d0f40b08b4e896e7f458d89ae58ce2a27165%5E%21/third_party/libvpx/generate_gni.sh
		# and https://chromium.googlesource.com/chromium/src/+/71ebcbce867dd31da5f8b405a28fcb0de0657d91%5E%21/third_party/libvpx/generate_gni.sh
		# since we're not in a git repo
		sed -i -e "s|^update_readme||g; s|clang-format|${EPREFIX}/bin/true|g; /^git -C/d; /git cl/d; /cd \$BASE_DIR\/\$LIBVPX_SRC_DIR/ign format --in-place \$BASE_DIR\/BUILD.gn\ngn format --in-place \$BASE_DIR\/libvpx_srcs.gni" \
			generate_gni.sh || die
		./generate_gni.sh || die
		popd >/dev/null || die

		pushd third_party/ffmpeg >/dev/null || die
		cp libavcodec/ppc/h264dsp.c libavcodec/ppc/h264dsp_ppc.c || die
		cp libavcodec/ppc/h264qpel.c libavcodec/ppc/h264qpel_ppc.c || die
		popd >/dev/null || die
	fi

	# Sanity check keeplibs, on major version bumps it is often necessary to update this list
	# and this enables us to hit them all at once.
	# There are some entries that need to be whitelisted (TODO: Why? The file is understandable, the rest seem odd)
	whitelist_libs=(
		net/third_party/quic
		third_party/devtools-frontend/src/front_end/third_party/additional_readme_paths.json
		third_party/libjingle
		third_party/mesa
		third_party/skia/third_party/vulkan
		third_party/vulkan
	)
	local not_found_libs=()
	for lib in "${keeplibs[@]}"; do
		if [[ ! -d "${lib}" ]] && ! has "${lib}" "${whitelist_libs[@]}"; then
			not_found_libs+=( "${lib}" )
		fi
	done

	if [[ ${#not_found_libs[@]} -gt 0 ]]; then
		ewarn "The following \`keeplibs\` directories were not found in the source tree:"
		for lib in "${not_found_libs[@]}"; do
			ewarn "  ${lib}"
		done
	fi

	# Remove most bundled libraries. Some are still needed.
	einfo "Unbundling third-party libraries ..."
	build/linux/unbundle/remove_bundled_libraries.py "${keeplibs[@]}" --do-remove || die

	# bundled eu-strip is for amd64 only and we don't want to pre-stripped binaries
	mkdir -p buildtools/third_party/eu-strip/bin || die
	ln -s "${EPREFIX}"/bin/true buildtools/third_party/eu-strip/bin/eu-strip || die

	cp "${FILESDIR}/electron-launcher.sh" "${WORKDIR}"
	sed -i "s|@ELECTRON@|electron-${PV%%.*}|" "${WORKDIR}/electron-launcher.sh"
	sed -i "s|@LIBDIR@|$(get_libdir)|" "${WORKDIR}/electron-launcher.sh"
}

src_configure() {
	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	ebegin "Installing node_modules"
	pushd electron > /dev/null || die
		yarn config set disable-self-update-check true || die
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
		yarn install --frozen-lockfile --offline --no-progress --ignore-scripts || die

		# # Workaround md4 see https://github.com/webpack/webpack/issues/14560
		# find node_modules/webpack/lib -type f -exec sed -i 's|md4|sha512|g' {} \; || die
		# # For webpack >= 5.61.0
		# sed -i 's/case "sha512"/case "md4"/' node_modules/webpack/lib/util/createHash.js || die
	popd > /dev/null || die
	eend $? || die

	local myconf_gn=""

	# Make sure the build system will use the right tools, bug #340795.
	tc-export AR CC CXX NM

	if use clang && ! tc-is-clang ; then
		einfo "Enforcing the use of clang due to USE=clang ..."
		if tc-is-cross-compiler; then
			CC="${CBUILD}-clang -target ${CHOST} --sysroot ${ESYSROOT}"
			CXX="${CBUILD}-clang++ -target ${CHOST} --sysroot ${ESYSROOT}"
			BUILD_CC=${CBUILD}-clang
			BUILD_CXX=${CBUILD}-clang++
		else
			CC=${CHOST}-clang
			CXX=${CHOST}-clang++
		fi
		strip-unsupported-flags
	elif ! use clang && ! tc-is-gcc ; then
		einfo "Enforcing the use of gcc due to USE=-clang ..."
		CC=${CHOST}-gcc
		CXX=${CHOST}-g++
		strip-unsupported-flags
	fi

	if tc-is-clang; then
		myconf_gn+=" is_clang=true clang_use_chrome_plugins=false"
	else
		myconf_gn+=" is_clang=false"
	fi

	# Force lld for lto or pgo builds only, otherwise disable, bug 641556
	if use thinlto || use pgo || use clang || use nvidia; then
		myconf_gn+=" use_lld=true"
	else
		myconf_gn+=" use_lld=false"
	fi

	if use thinlto || use pgo; then
		AR=llvm-ar
		NM=llvm-nm
		if tc-is-cross-compiler; then
			BUILD_AR=llvm-ar
			BUILD_NM=llvm-nm
		fi
	fi

	# Define a custom toolchain for GN
	myconf_gn+=" custom_toolchain=\"//build/toolchain/linux/unbundle:default\""

	if tc-is-cross-compiler; then
		tc-export BUILD_{AR,CC,CXX,NM}
		myconf_gn+=" host_toolchain=\"//build/toolchain/linux/unbundle:host\""
		myconf_gn+=" v8_snapshot_toolchain=\"//build/toolchain/linux/unbundle:host\""
		myconf_gn+=" pkg_config=\"$(tc-getPKG_CONFIG)\""
		myconf_gn+=" host_pkg_config=\"$(tc-getBUILD_PKG_CONFIG)\""

		# setup cups-config, build system only uses --libs option
		if use cups; then
			mkdir "${T}/cups-config" || die
			cp "${ESYSROOT}/usr/bin/${CHOST}-cups-config" "${T}/cups-config/cups-config" || die
			export PATH="${PATH}:${T}/cups-config"
		fi

		# Don't inherit PKG_CONFIG_PATH from environment
		local -x PKG_CONFIG_PATH=
	else
		myconf_gn+=" host_toolchain=\"//build/toolchain/linux/unbundle:default\""
	fi

	# Disable rust for now; it's only used for testing and we don't need the additional bdep
	myconf_gn+=" enable_rust=false"
	myconf_gn+=" enable_rust_png=false"

	# GN needs explicit config for Debug/Release as opposed to inferring it from build directory.
	myconf_gn+=" is_debug=$(usex debug true false)"

	# enable DCHECK with USE=debug only, increases chrome binary size by 30%, bug #811138.
	# DCHECK is fatal by default, make it configurable at runtime, #bug 807881.
	myconf_gn+=" dcheck_always_on=$(usex debug true false)"
	myconf_gn+=" dcheck_is_configurable=$(usex debug true false)"

	myconf_gn+=" enable_iterator_debugging=$(usex debug true false)"

	if use debug; then
		myconf_gn+=" symbol_level=2"
		myconf_gn+=" blink_symbol_level=2"
		myconf_gn+=" v8_symbol_level=2"
	else
		myconf_gn+=" symbol_level=0"
		myconf_gn+=" blink_symbol_level=0"
		myconf_gn+=" v8_symbol_level=0"
	fi

	# Component build isn't generally intended for use by end users. It's mostly useful
	# for development and debugging.
	myconf_gn+=" is_component_build=false"

	# Disable nacl, we can't build without pnacl (http://crbug.com/269560).
	myconf_gn+=" enable_nacl=false"

	local gn_system_libraries=(
		flac
		fontconfig
		freetype
		libjpeg
		libwebp
		libxml
		libxslt
		zlib
	)
	if use system-abseil-cpp; then
	gn_system_libraries+=(
		absl_algorithm
		absl_base
		absl_cleanup
		absl_container
		absl_crc
		absl_debugging
		absl_flags
		absl_functional
		absl_hash
		absl_log
		absl_log_internal
		absl_memory
		absl_meta
		absl_numeric
		absl_random
		absl_status
		absl_strings
		absl_synchronization
		absl_time
		absl_types
		absl_utility
	)
	fi
	if use system-brotli; then
		gn_system_libraries+=( brotli )
	fi
	if use system-crc32c; then
		gn_system_libraries+=( crc32c )
	fi
	if use system-double-conversion; then
		gn_system_libraries+=( double-conversion )
	fi
	if use system-woff2; then
		gn_system_libraries+=( woff2 )
	fi
	if use nvidia; then
		gn_system_libraries+=( libXNVCtrl )
	fi
	if use system-ffmpeg; then
		gn_system_libraries+=( ffmpeg opus )
	fi
	if use system-jsoncpp; then
		gn_system_libraries+=( jsoncpp )
	fi
	if use system-icu; then
		gn_system_libraries+=( icu )
	fi
	if use system-png; then
		gn_system_libraries+=( libpng )
		myconf_gn+=" use_system_libpng=true"
	fi
	if use system-zstd; then
		gn_system_libraries+=( zstd )
	fi
	if use system-av1; then
		gn_system_libraries+=( dav1d libaom )
	fi
	if use system-libusb; then
		gn_system_libraries+=( libusb )
	fi
	if use system-libvpx; then
		gn_system_libraries+=( libvpx )
	fi
	use system-openh264 && gn_system_libraries+=(
		openh264
	)
	use system-re2 && gn_system_libraries+=(
		re2
	)
	use system-snappy && gn_system_libraries+=(
		snappy
	)

	build/linux/unbundle/replace_gn_files.py --system-libraries "${gn_system_libraries[@]}" ||
		die "Failed to replace GN files for system libraries"

	# TODO 131: The above call clobbers `enable_freetype = true` in the freetype gni file
	# drop the last line, then append the freetype line and a new curly brace to end the block
	local freetype_gni="build/config/freetype/freetype.gni"
	sed -i -e '$d' ${freetype_gni} || die
	echo "  enable_freetype = true" >> ${freetype_gni} || die
	echo "}" >> ${freetype_gni} || die

	# See dependency logic in third_party/BUILD.gn
	myconf_gn+=" use_system_harfbuzz=$(usex system-harfbuzz true false)"

	# Optional dependencies.
	myconf_gn+=" enable_hangout_services_extension=$(usex hangouts true false)"
	myconf_gn+=" use_cups=$(usex cups true false)"
	myconf_gn+=" use_kerberos=$(usex kerberos true false)"
	myconf_gn+=" use_pulseaudio=$(usex pulseaudio true false)"
	myconf_gn+=" use_vaapi=$(usex vaapi true false)"
	myconf_gn+=" rtc_use_pipewire=$(usex screencast true false)"
	myconf_gn+=" gtk_version=$(usex gtk4 4 3)"

	myconf_gn+=" disable_fieldtrial_testing_config=true"

	# The sysroot is the oldest debian image that chromium supports, we don't need it
	myconf_gn+=" use_sysroot=false"

	# This determines whether or not GN uses the bundled libcxx
	if use libcxx; then
		myconf_gn+=" use_custom_libcxx=true"
	else
		myconf_gn+=" use_custom_libcxx=false"
		myconf_gn+=" use_llvm_libatomic=false"
		append-cppflags -U_GLIBCXX_ASSERTIONS #See #318
	fi

	myconf_gn+=" use_bluez=$(usex bluetooth true false)"

	if use pgo; then
		myconf_gn+=" chrome_pgo_phase=2"
		myconf_gn+=" v8_enable_builtins_optimization=true"
	else
		myconf_gn+=" chrome_pgo_phase=0"
	fi

	myconf_gn+=" optimize_webui=$(usex optimize-webui true false)"
	myconf_gn+=" use_system_freetype=$(usex system-harfbuzz true false)"
	myconf_gn+=" use_system_libopenjpeg2=$(usex system-openjpeg true false)"
	myconf_gn+=" enable_pdf=true"
	myconf_gn+=" use_system_lcms2=true"
	myconf_gn+=" enable_print_preview=true"

	# Ungoogled flags
	myconf_gn+=" build_with_tflite_lib=false"
	myconf_gn+=" enable_mse_mpeg2ts_stream_parser=$(usex proprietary-codecs true false)"
	myconf_gn+=" enable_remoting=false"
	myconf_gn+=" enable_reporting=false"
	if use ungoogled; then
	myconf_gn+=" enable_mdns=false"
	myconf_gn+=" enable_service_discovery=false"
	fi
	myconf_gn+=" exclude_unwind_tables=true"
	myconf_gn+=" google_api_key=\"\""
	myconf_gn+=" google_default_client_id=\"\""
	myconf_gn+=" google_default_client_secret=\"\""
	myconf_gn+=" safe_browsing_mode=0"
	myconf_gn+=" use_official_google_api_keys=false"
	myconf_gn+=" use_unofficial_version_number=false"

	# myconf_gn+=" enable_swiftshader=false"
	myconf_gn+=" enterprise_local_content_analysis=false"

	# Additional flags
	myconf_gn+=" perfetto_use_system_zlib=true"
	myconf_gn+=" use_system_zlib=true"
	myconf_gn+=" use_system_libjpeg=true"
	myconf_gn+=" rtc_build_examples=false"
	myconf_gn+=" enable_chromium_prelude=false"
	myconf_gn+=" enable_updater=false"
	myconf_gn+=" enable_update_notifications=false"
	myconf_gn+=" enable_video_effects=false"
	myconf_gn+=" enable_constraints=false"
	myconf_gn+=" rtc_rusty_base64=false"
	myconf_gn+=" v8_enable_temporal_support=false"
	myconf_gn+=" override_electron_version=\"${PV}\""

	# Disable pseudolocales, only used for testing
	myconf_gn+=" enable_pseudolocales=false"

	# Disable code formating of generated files
	myconf_gn+=" blink_enable_generated_code_formatting=false"

	ffmpeg_branding="$(usex proprietary-codecs Chrome Chromium)"
	myconf_gn+=" proprietary_codecs=$(usex proprietary-codecs true false)"
	myconf_gn+=" rtc_use_h264=$(usex proprietary-codecs true false)"
	myconf_gn+=" ffmpeg_branding=\"${ffmpeg_branding}\""

	local myarch="$(tc-arch)"

	# Avoid CFLAGS problems
	if ! use custom-cflags; then
		filter-flags "-O*" "-Wl,-O*" #See #25
		strip-flags

		# Prevent linker from running out of address space, bug #471810 .
		if use x86; then
			filter-flags "-g*"
		fi

		# Prevent libvpx/xnnpack build failures. Bug 530248, 544702, 546984, 853646.
		if [[ ${myarch} == amd64 || ${myarch} == x86 ]]; then
			filter-flags -mno-mmx -mno-sse2 -mno-ssse3 -mno-sse4.1 -mno-avx -mno-avx2 -mno-fma -mno-fma4 -mno-xop -mno-sse4a
		fi

		if tc-is-gcc; then
			# https://bugs.gentoo.org/904455
			local -x CPP="$(tc-getCXX) -E"
			# https://bugs.gentoo.org/912381
			filter-lto
		fi
	fi

	local dest_cpu=""

	if [[ $myarch = amd64 ]] ; then
		dest_cpu=x64
		myconf_gn+=" target_cpu=\"x64\""
		ffmpeg_target_arch=x64
		dest_cpu="x64"
	elif [[ $myarch = x86 ]] ; then
		myconf_gn+=" target_cpu=\"x86\""
		ffmpeg_target_arch=ia32
		dest_cpu="x86"

		# This is normally defined by compiler_cpu_abi in
		# build/config/compiler/BUILD.gn, but we patch that part out.
		append-flags -msse2 -mfpmath=sse -mmmx
	elif [[ $myarch = arm64 ]] ; then
		myconf_gn+=" target_cpu=\"arm64\""
		ffmpeg_target_arch=arm64
		dest_cpu="arm64"
	elif [[ $myarch = arm ]] ; then
		myconf_gn+=" target_cpu=\"arm\""
		ffmpeg_target_arch=$(usex cpu_flags_arm_neon arm-neon arm)
		dest_cpu="arm"
	elif [[ $myarch = ppc64 ]] ; then
		myconf_gn+=" target_cpu=\"ppc64\""
		ffmpeg_target_arch=ppc64
		dest_cpu="ppc64"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi

	if use thinlto; then
		# We need to change the default value of import-instr-limit in
		# LLVM to limit the text size increase. The default value is
		# 100, and we change it to 30 to reduce the text size increase
		# from 25% to 10%. The performance number of page_cycler is the
		# same on two of the thinLTO configurations, we got 1% slowdown
		# on speedometer when changing import-instr-limit from 100 to 30.
		# append-ldflags "-Wl,-plugin-opt,-import-instr-limit=30"
		sed -i '/import_instr_limit = 5/{s++import_instr_limit = 30+;h};${x;/./{x;q0};x;q1}' \
			build/config/compiler/BUILD.gn || die

		append-ldflags "-Wl,--thinlto-jobs=$(makeopts_jobs)"
	fi

	myconf_gn+=" treat_warnings_as_errors=false"
	# Disable fatal linker warnings, bug 506268.
	myconf_gn+=" fatal_linker_warnings=false"

	# Disable external code space for V8 for ppc64. It is disabled for ppc64
	# by default, but cross-compiling on amd64 enables it again.
	if tc-is-cross-compiler; then
		if ! use amd64 && ! use arm64; then
			myconf_gn+=" v8_enable_external_code_space=false"
		fi
	fi

	# Only enabled for clang, but gcc has endian macros too
	myconf_gn+=" v8_use_libm_trig_functions=true"

	# Bug 491582.
	export TMPDIR="${WORKDIR}/temp"
	mkdir -p -m 755 "${TMPDIR}" || die

	# https://bugs.gentoo.org/654216
	addpredict /dev/dri/ #nowarn

	# Disable unknown warning message from clang.
	if tc-is-clang; then
		append-flags -Wno-unknown-warning-option
		if tc-is-cross-compiler; then
			export BUILD_CXXFLAGS+=" -Wno-unknown-warning-option"
			export BUILD_CFLAGS+=" -Wno-unknown-warning-option"
		fi
	fi

	# Explicitly disable ICU data file support for system-icu builds.
	if use system-icu; then
		myconf_gn+=" icu_use_data_file=false"
	fi

	# Don't need nocompile checks and GN crashes with our config
	myconf_gn+=" enable_nocompile_tests=false"

	# 131 began laying the groundwork for replacing freetype with
	# "Rust-based Fontations set of libraries plus Skia path rendering"
	# We now need to opt-in
	myconf_gn+=" enable_freetype=true"

	# Enable ozone wayland support
	myconf_gn+=" use_ozone=true ozone_auto_platforms=false"
	myconf_gn+=" ozone_platform_headless=true"
	myconf_gn+=" use_system_minigbm=true"
	myconf_gn+=" use_xkbcommon=true"
	myconf_gn+=" ozone_platform_x11=$(usex X true false)"
	myconf_gn+=" ozone_platform_wayland=$(usex wayland true false)"
	myconf_gn+=" ozone_platform=$(usex wayland \"wayland\" \"x11\")"
	use wayland && myconf_gn+=" use_system_libffi=true"

	# Results in undefined references in chrome linking, may require CFI to work
	if use arm64; then
		myconf_gn+=" arm_control_flow_integrity=\"none\""
	fi

	# Enable official builds
	myconf_gn+=" is_official_build=true"
	myconf_gn+=" use_thin_lto=$(usex thinlto true false)"
	myconf_gn+=" thin_lto_enable_optimizations=$(usex optimize-thinlto true false)"
	# Allow building against system libraries in official builds
	sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
		tools/generate_shim_headers/generate_shim_headers.py || die

	# user CXXFLAGS might overwrite -march=armv8-a+crc+crypto, bug #851639
	if use arm64 && tc-is-gcc; then
		sed -i '/^#if HAVE_ARM64_CRC32C/a #pragma GCC target ("+crc+crypto")' \
			third_party/crc32c/src/src/crc32c_arm64.cc || die
	fi

	# skipping typecheck is only supported on amd64, bug #876157
	if ! use amd64; then
		myconf_gn+=" devtools_skip_typecheck=false"
	fi

	# Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
	append-cflags -Wno-builtin-macro-redefined
	append-cxxflags -Wno-builtin-macro-redefined
	append-cppflags "-D__DATE__= -D__TIME__= -D__TIMESTAMP__="

	myconf_gn+=" import(\"//electron/build/args/release.gn\")"

	local flags
	einfo "Building with the following compiler settings:"
	for flags in C{C,XX} AR NM RANLIB {C,CXX,CPP,LD}FLAGS \
		EXTRA_GN UGC_{SKIP_{PATCHES,SUBSTITUTION},KEEP_BINARIES} ; do
		einfo "  ${flags} = \"${!flags}\""
	done

	einfo "Configuring Electron ..."
	set -- gn gen --args="${myconf_gn} ${EXTRA_GN}" out/Release
	echo "$@"
	"$@" || die

	# The "if" below should not be executed unless testing
	if [ ! -z "${NODIE}" ]; then
		# List all args
		# gn args --list out/Release

		# Quick compiler check
		eninja -C out/Release protoc torque
	fi
}

src_compile() {
	# Final link uses lots of file descriptors.
	ulimit -n 2048

	# Calling this here supports resumption via FEATURES=keepwork
	python_setup

	# Don't inherit PYTHONPATH from environment, bug #789021, #812689
	local -x PYTHONPATH=

	#! Fixing things
	export ELECTRON_OUT_DIR=Release
	eninja -C out/Release electron:node_headers

	# Build mksnapshot and pax-mark it.
	if use pax-kernel; then
		local x
		for x in mksnapshot v8_context_snapshot_generator; do
			if tc-is-cross-compiler; then
				eninja -C out/Release "host/${x}"
				pax-mark m "out/Release/host/${x}"
			else
				eninja -C out/Release "${x}"
				pax-mark m "out/Release/${x}"
			fi
		done
	fi

	# Even though ninja autodetects number of CPUs, we respect
	# user's options, for debugging with -j 1 or any other reason.
	eninja -C out/Release electron

	pax-mark m out/Release/electron
}

src_install() {
	local CHROMIUM_HOME="/usr/$(get_libdir)/electron-${PV%%.*}"
	exeinto "${CHROMIUM_HOME}"
	doexe out/Release/electron
	doexe "${FILESDIR}/node"

	exeinto "/usr/bin"
	newexe "${WORKDIR}/electron-launcher.sh" "electron-${PV%%.*}"

	pushd out/Release/locales > /dev/null || die
	chromium_remove_language_paks
	popd

	insinto "${CHROMIUM_HOME}"
	doins out/Release/*.bin
	doins out/Release/*.pak
	(
		shopt -s nullglob
		local files=(out/Release/*.so out/Release/*.so.[0-9])
		[[ ${#files[@]} -gt 0 ]] && doins "${files[@]}"
	)

	# # Install bundled xdg-utils, avoids installing X11 libraries with USE="-X wayland"
	# doins out/Release/xdg-{settings,mime}

	if ! use system-icu; then
		doins out/Release/icudtl.dat
	fi

	doins -r out/Release/locales
	doins -r out/Release/resources
	#doins -r out/Release/MEIPreload

	# Install vk_swiftshader_icd.json; bug #827861
	doins out/Release/vk_swiftshader_icd.json

	if [[ -d out/Release/swiftshader ]]; then
		insinto "${CHROMIUM_HOME}/swiftshader"
		doins out/Release/swiftshader/*.so
	fi

	if use dev-dependencies; then
		doins -r electron/node_modules
		fperms -R 755 "${CHROMIUM_HOME}/node_modules/.bin/"
	fi

	insinto "${CHROMIUM_HOME}/node_modules"
	doins -r "${WORKDIR}/${NODE_P}/deps/npm"
	fperms -R 755 "${CHROMIUM_HOME}/node_modules/npm/bin/"

	exeinto "${CHROMIUM_HOME}/node_modules/npm/bin/"
	doexe "${FILESDIR}/node-gyp"

	insinto "/usr/include/electron-${PV%%.*}/node/"
	doins -r out/Release/gen/node_headers/include

}

pkg_postinst() {
	#? How to supply these flags to Electron?
	if use vaapi; then
		elog "VA-API is disabled by default at runtime. You have to enable it"
		elog "by adding --enable-features=VaapiVideoDecoder and "
		elog "--disable-features=UseChromeOSDirectVideoDecoder to CHROMIUM_FLAGS"
		elog "in /etc/chromium/default."
	fi
	if use screencast; then
		elog "Screencast is disabled by default at runtime. Either enable it"
		elog "by navigating to chrome://flags/#enable-webrtc-pipewire-capturer"
		elog "inside Chromium or add --enable-features=WebRTCPipeWireCapturer"
		elog "to CHROMIUM_FLAGS in /etc/chromium/default."
	fi
	if use gtk4; then
		elog "Chromium prefers GTK3 over GTK4 at runtime. To override this"
		elog "behavior you need to pass --gtk-version=4, e.g. by adding it"
		elog "to CHROMIUM_FLAGS in /etc/chromium/default."
	fi

	electron-config update
}

pkg_postrm() {
	electron-config update
}
