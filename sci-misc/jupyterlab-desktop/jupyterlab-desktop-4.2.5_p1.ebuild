# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop multilib xdg-utils

DESCRIPTION="JupyterLab desktop application, based on Electron"
HOMEPAGE="https://jupyter.org/"
LICENSE="BSD"
SLOT="0"
SRC_URI="
	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.2.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.18.6.tgz -> @babel-code-frame-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.19.1.tgz -> @babel-helper-validator-identifier-7.19.1.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.18.6.tgz -> @babel-highlight-7.18.6.tgz
	https://registry.yarnpkg.com/@csstools/css-parser-algorithms/-/css-parser-algorithms-2.3.0.tgz -> @csstools-css-parser-algorithms-2.3.0.tgz
	https://registry.yarnpkg.com/@csstools/css-tokenizer/-/css-tokenizer-2.1.1.tgz -> @csstools-css-tokenizer-2.1.1.tgz
	https://registry.yarnpkg.com/@csstools/media-query-list-parser/-/media-query-list-parser-2.1.2.tgz -> @csstools-media-query-list-parser-2.1.2.tgz
	https://registry.yarnpkg.com/@csstools/selector-specificity/-/selector-specificity-3.0.0.tgz -> @csstools-selector-specificity-3.0.0.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.2.4.tgz -> @electron-asar-3.2.4.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-2.0.2.tgz -> @electron-get-2.0.2.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-2.1.0.tgz -> @electron-notarize-2.1.0.tgz
	https://registry.yarnpkg.com/@electron/osx-sign/-/osx-sign-1.0.5.tgz -> @electron-osx-sign-1.0.5.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-1.4.1.tgz -> @electron-universal-1.4.1.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-1.4.1.tgz -> @eslint-eslintrc-1.4.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.9.5.tgz -> @humanwhocodes-config-array-0.9.5.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz -> @humanwhocodes-object-schema-1.2.1.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.2.tgz -> @jridgewell-gen-mapping-0.3.2.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.0.tgz -> @jridgewell-resolve-uri-3.1.0.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.1.2.tgz -> @jridgewell-set-array-1.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.2.tgz -> @jridgewell-source-map-0.3.2.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.14.tgz -> @jridgewell-sourcemap-codec-1.4.14.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.17.tgz -> @jridgewell-trace-mapping-0.3.17.tgz
	https://registry.yarnpkg.com/@jupyter-notebook/web-components/-/web-components-0.9.1.tgz -> @jupyter-notebook-web-components-0.9.1.tgz
	https://registry.yarnpkg.com/@leeoniya/ufuzzy/-/ufuzzy-1.0.14.tgz -> @leeoniya-ufuzzy-1.0.14.tgz
	https://registry.yarnpkg.com/@lumino/algorithm/-/algorithm-1.9.2.tgz -> @lumino-algorithm-1.9.2.tgz
	https://registry.yarnpkg.com/@lumino/properties/-/properties-1.8.2.tgz -> @lumino-properties-1.8.2.tgz
	https://registry.yarnpkg.com/@lumino/signaling/-/signaling-1.11.1.tgz -> @lumino-signaling-1.11.1.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-1.1.1.tgz -> @malept-cross-spawn-promise-1.1.1.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-colors/-/fast-colors-5.3.1.tgz -> @microsoft-fast-colors-5.3.1.tgz
	https://registry.yarnpkg.com/@microsoft/fast-components/-/fast-components-2.30.6.tgz -> @microsoft-fast-components-2.30.6.tgz
	https://registry.yarnpkg.com/@microsoft/fast-element/-/fast-element-1.11.0.tgz -> @microsoft-fast-element-1.11.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-foundation/-/fast-foundation-2.47.0.tgz -> @microsoft-fast-foundation-2.47.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-web-utilities/-/fast-web-utilities-5.4.1.tgz -> @microsoft-fast-web-utilities-5.4.1.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.3.tgz -> @types-cacheable-request-6.0.3.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.7.tgz -> @types-debug-4.1.7.tgz
	https://registry.yarnpkg.com/@types/ejs/-/ejs-3.1.1.tgz -> @types-ejs-3.1.1.tgz
	https://registry.yarnpkg.com/@types/eslint-scope/-/eslint-scope-3.7.4.tgz -> @types-eslint-scope-3.7.4.tgz
	https://registry.yarnpkg.com/@types/eslint/-/eslint-8.21.0.tgz -> @types-eslint-8.21.0.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-0.0.51.tgz -> @types-estree-0.0.51.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-1.0.0.tgz -> @types-estree-1.0.0.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.1.tgz -> @types-http-cache-semantics-4.0.1.tgz
	https://registry.yarnpkg.com/@types/js-yaml/-/js-yaml-4.0.5.tgz -> @types-js-yaml-4.0.5.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.11.tgz -> @types-json-schema-7.0.11.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.4.tgz -> @types-keyv-3.1.4.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.2.tgz -> @types-minimist-1.2.2.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.5.12.tgz -> @types-node-fetch-2.5.12.tgz
	https://registry.yarnpkg.com/@types/node/-/node-14.18.36.tgz -> @types-node-14.18.36.tgz
	https://registry.yarnpkg.com/@types/node/-/node-18.15.12.tgz -> @types-node-18.15.12.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.1.tgz -> @types-normalize-package-data-2.4.1.tgz
	https://registry.yarnpkg.com/@types/plist/-/plist-3.0.2.tgz -> @types-plist-3.0.2.tgz
	https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.5.tgz -> @types-prop-types-15.7.5.tgz
	https://registry.yarnpkg.com/@types/react-dom/-/react-dom-17.0.18.tgz -> @types-react-dom-17.0.18.tgz
	https://registry.yarnpkg.com/@types/react/-/react-17.0.53.tgz -> @types-react-17.0.53.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.0.tgz -> @types-responselike-1.0.0.tgz
	https://registry.yarnpkg.com/@types/scheduler/-/scheduler-0.16.2.tgz -> @types-scheduler-0.16.2.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.3.13.tgz -> @types-semver-7.3.13.tgz
	https://registry.yarnpkg.com/@types/tar/-/tar-6.1.5.tgz -> @types-tar-6.1.5.tgz
	https://registry.yarnpkg.com/@types/verror/-/verror-1.10.6.tgz -> @types-verror-1.10.6.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.0.tgz -> @types-yargs-parser-21.0.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.22.tgz -> @types-yargs-17.0.22.tgz
	https://registry.yarnpkg.com/@types/yauzl/-/yauzl-2.10.0.tgz -> @types-yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.28.0.tgz -> @typescript-eslint-eslint-plugin-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.28.0.tgz -> @typescript-eslint-parser-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.28.0.tgz -> @typescript-eslint-scope-manager-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.28.0.tgz -> @typescript-eslint-type-utils-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.28.0.tgz -> @typescript-eslint-types-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.28.0.tgz -> @typescript-eslint-typescript-estree-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.28.0.tgz -> @typescript-eslint-utils-5.28.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.28.0.tgz -> @typescript-eslint-visitor-keys-5.28.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.11.1.tgz -> @webassemblyjs-ast-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.11.1.tgz -> @webassemblyjs-floating-point-hex-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.11.1.tgz -> @webassemblyjs-helper-api-error-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.11.1.tgz -> @webassemblyjs-helper-buffer-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.11.1.tgz -> @webassemblyjs-helper-numbers-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.11.1.tgz -> @webassemblyjs-helper-wasm-bytecode-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.11.1.tgz -> @webassemblyjs-helper-wasm-section-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.11.1.tgz -> @webassemblyjs-ieee754-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.11.1.tgz -> @webassemblyjs-leb128-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.11.1.tgz -> @webassemblyjs-utf8-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.11.1.tgz -> @webassemblyjs-wasm-edit-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.11.1.tgz -> @webassemblyjs-wasm-gen-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.11.1.tgz -> @webassemblyjs-wasm-opt-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.11.1.tgz -> @webassemblyjs-wasm-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.11.1.tgz -> @webassemblyjs-wast-printer-1.11.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-1.2.0.tgz -> @webpack-cli-configtest-1.2.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-1.5.0.tgz -> @webpack-cli-info-1.5.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-1.7.0.tgz -> @webpack-cli-serve-1.7.0.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.8.10.tgz -> @xmldom-xmldom-0.8.10.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/acorn-import-assertions/-/acorn-import-assertions-1.8.0.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.8.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.12.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-4.0.0.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-24.9.1.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.6.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.1.tgz
	https://registry.yarnpkg.com/array.prototype.reduce/-/array.prototype.reduce-1.0.5.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.4.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-2.0.0.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/binaryextensions/-/binaryextensions-4.18.0.tgz
	https://registry.yarnpkg.com/bluebird-lst/-/bluebird-lst-1.0.9.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.21.5.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-1.0.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-9.2.3.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-24.8.1.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-6.2.2.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-7.0.2.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001450.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.3.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.7.1.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colord/-/colord-2.9.3.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.19.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/config-file-ts/-/config-file-ts-0.2.4.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-8.2.0.tgz
	https://registry.yarnpkg.com/crc/-/crc-3.8.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-4.0.2.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/css-functions-list/-/css-functions-list-3.1.0.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.3.1.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-3.0.0.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-3.1.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/debuglog/-/debuglog-1.0.1.tgz
	https://registry.yarnpkg.com/decamelize-keys/-/decamelize-keys-1.1.1.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-5.0.1.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/default-shell/-/default-shell-1.0.1.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.4.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/dezalgo/-/dezalgo-1.0.4.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-3.3.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-24.9.1.tgz
	https://registry.yarnpkg.com/dmg-license/-/dmg-license-1.0.11.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-5.1.0.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-9.0.2.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.10.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-24.9.1.tgz
	https://registry.yarnpkg.com/electron-is-dev/-/electron-is-dev-0.3.0.tgz
	https://registry.yarnpkg.com/electron-log/-/electron-log-4.4.8.tgz
	https://registry.yarnpkg.com/electron-notarize/-/electron-notarize-1.2.2.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-24.8.1.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.4.286.tgz
	https://registry.yarnpkg.com/electron/-/electron-27.0.2.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.12.0.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.8.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.21.1.tgz
	https://registry.yarnpkg.com/es-array-method-boxes-properly/-/es-array-method-boxes-properly-1.0.0.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-0.9.3.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.1.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-8.5.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-prettier/-/eslint-plugin-prettier-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.29.4.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.1.1.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-3.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.3.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.17.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.4.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.4.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.5.1.tgz
	https://registry.yarnpkg.com/exenv-es6/-/exenv-es6-1.1.1.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-2.0.1.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.4.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-diff/-/fast-diff-1.2.0.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.2.12.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.0.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-4.2.5.tgz
	https://registry.yarnpkg.com/fastest-levenshtein/-/fastest-levenshtein-1.0.16.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.15.0.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/fix-path/-/fix-path-3.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.7.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-3.0.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.5.tgz
	https://registry.yarnpkg.com/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-2.3.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/github-url-to-object/-/github-url-to-object-4.0.6.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-2.0.0.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.20.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/globjoin/-/globjoin-0.1.4.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.0.1.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.6.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.10.tgz
	https://registry.yarnpkg.com/hard-rejection/-/hard-rejection-2.1.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.1.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/html-tags/-/html-tags-3.3.1.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/iconv-corefoundation/-/iconv-corefoundation-1.1.7.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.4.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-lazy/-/import-lazy-4.0.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-5.0.0.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.4.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.4.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-2.2.0.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-3.0.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.11.0.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.13.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-1.1.0.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.10.tgz
	https://registry.yarnpkg.com/is-url/-/is-url-1.2.4.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.10.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-5.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/istextorbinary/-/istextorbinary-6.0.0.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.5.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.3.3.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/known-css-properties/-/known-css-properties-0.27.0.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.3.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.4.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.truncate/-/lodash.truncate-4.4.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.5.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-1.0.1.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-4.3.0.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/mathml-tag-names/-/mathml-tag-names-2.1.3.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.30.tgz
	https://registry.yarnpkg.com/meow/-/meow-10.1.5.tgz
	https://registry.yarnpkg.com/meow/-/meow-6.1.1.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.5.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/mini-css-extract-plugin/-/mini-css-extract-plugin-1.6.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimist-options/-/minimist-options-4.1.0.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.3.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.0.1.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.6.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-1.7.2.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.7.0.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.9.tgz
	https://registry.yarnpkg.com/node-watch/-/node-watch-0.7.4.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-3.0.3.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.3.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.4.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.6.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.6.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.5.tgz
	https://registry.yarnpkg.com/object.hasown/-/object.hasown-1.1.2.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.6.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.1.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.1.1.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.0.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz
	https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.0.6.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.0.tgz
	https://registry.yarnpkg.com/postcss-resolve-nested-selector/-/postcss-resolve-nested-selector-0.1.1.tgz
	https://registry.yarnpkg.com/postcss-safe-parser/-/postcss-safe-parser-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-6.0.13.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.31.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prettier-linter-helpers/-/prettier-linter-helpers-1.0.0.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.1.2.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/pseudomap/-/pseudomap-1.0.2.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.0.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-4.0.1.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/read-config-file/-/read-config-file-6.3.2.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-2.1.2.tgz
	https://registry.yarnpkg.com/read-package-tree/-/read-package-tree-5.3.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-8.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-6.0.0.tgz
	https://registry.yarnpkg.com/readdir-scoped-modules/-/readdir-scoped-modules-1.1.0.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.6.2.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.7.1.tgz
	https://registry.yarnpkg.com/redent/-/redent-3.0.0.tgz
	https://registry.yarnpkg.com/redent/-/redent-4.0.0.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.4.3.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.2.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.2.1.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-2.0.0-next.4.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.0.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.1.1.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.6.0.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.1.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-env/-/shell-env-0.3.0.tgz
	https://registry.yarnpkg.com/shell-path/-/shell-path-2.1.0.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.8.5.tgz
	https://registry.yarnpkg.com/shx/-/shx-0.3.4.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.0.2.tgz
	https://registry.yarnpkg.com/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/source-list-map/-/source-list-map-2.0.1.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.0.2.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.1.1.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.12.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.2.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.6.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.6.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-4.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/strnum/-/strnum-1.0.5.tgz
	https://registry.yarnpkg.com/style-search/-/style-search-0.1.0.tgz
	https://registry.yarnpkg.com/stylelint-config-prettier/-/stylelint-config-prettier-9.0.4.tgz
	https://registry.yarnpkg.com/stylelint-config-recommended/-/stylelint-config-recommended-6.0.0.tgz
	https://registry.yarnpkg.com/stylelint-config-standard/-/stylelint-config-standard-24.0.0.tgz
	https://registry.yarnpkg.com/stylelint-prettier/-/stylelint-prettier-2.0.0.tgz
	https://registry.yarnpkg.com/stylelint/-/stylelint-15.10.1.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-3.0.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/svg-tags/-/svg-tags-1.0.0.tgz
	https://registry.yarnpkg.com/tabbable/-/tabbable-5.3.3.tgz
	https://registry.yarnpkg.com/table/-/table-6.8.1.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.2.1.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-5.3.6.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.16.3.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/textextensions/-/textextensions-5.16.0.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-3.0.1.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-4.1.1.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.21.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-1.4.0.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.4.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-4.2.4.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-4.9.5.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.0.10.tgz
	https://registry.yarnpkg.com/update-electron-app/-/update-electron-app-2.0.1.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util-promisify/-/util-promisify-2.1.0.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.3.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.1.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-2.4.0.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-4.10.0.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-5.8.0.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-1.4.3.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.2.3.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.76.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.9.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.0.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.4.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.4.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-5.0.1.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-2.1.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-18.1.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.9.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.6.2.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
"

REPO="https://github.com/jupyterlab/jupyterlab-desktop"
ELECTRON_SLOT_DEFAULT="27"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="electron-28 electron-29 electron-30 electron-31 electron-32 electron-33 electron-34 electron-35"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE+=" +build-online"
else
	KEYWORDS="amd64 ~arm64 ~ppc64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$CODE_COMMIT_ID" ]; then
		DOWNLOAD+="v${PV/_p/-}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/${PN}-${PV/_p/-}"
	else
		DOWNLOAD+="${CODE_COMMIT_ID}.tar.gz -> ${PN}-${CODE_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${CODE_COMMIT_ID}"
	fi
	IUSE+=" build-online"
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

REQUIRED_USE=""

COMMON_DEPEND="
	electron-28? ( dev-util/electron:28 )
	electron-29? ( dev-util/electron:29 )
	electron-30? ( dev-util/electron:30 )
	electron-31? ( dev-util/electron:31 )
	electron-32? ( dev-util/electron:32 )
	electron-33? ( dev-util/electron:33 )
	electron-34? ( dev-util/electron:34 )
	electron-35? ( dev-util/electron:35 )
	!electron-28? (
	!electron-29? (
	!electron-30? (
	!electron-31? (
	!electron-32? (
	!electron-33? (
	!electron-34? (
	!electron-35? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) ) )
"

RDEPEND="${COMMON_DEPEND}
	>=dev-python/jupyterlab-$(ver_cut 1-3)
"

DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	sys-apps/yarn
"

src_unpack() {
	if use electron-28; then
		export ELECTRON_SLOT=28
	elif use electron-29; then
		export ELECTRON_SLOT=29
	elif use electron-30; then
		export ELECTRON_SLOT=30
	elif use electron-31; then
		export ELECTRON_SLOT=31
	elif use electron-32; then
		export ELECTRON_SLOT=32
	elif use electron-33; then
		export ELECTRON_SLOT=33
	elif use electron-34; then
		export ELECTRON_SLOT=34
	elif use electron-35; then
		export ELECTRON_SLOT=35
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
	if [ -z "$CODE_COMMIT_ID" ]; then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
			# if use electron-24; then
			# 	EGIT_BRANCH="electron-24.x.y"
			# fi
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${CODE_COMMIT_ID}.tar.gz" || die
	fi
}

src_prepare() {
	default

	einfo "Using system python by default"
	sed -i 's$getBundledPythonPath();$"/usr/bin/python";getBundledPythonPath();$' src/main/registry.ts || die

	if use electron-28 || use electron-29 || use electron-30 || use electron-31 || use electron-32 || use electron-33 || use electron-34 || use electron-35; then
		einfo "Disabling development mode"
		sed -i 's$isDevMode(): boolean {$isDevMode(): boolean {return false;$' src/main/utils.ts || die
	fi
}

src_configure() {
	einfo "Installing node_modules"
	OLD_PATH=$PATH

	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	# echo "$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	if ! use build-online; then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	yarn install --frozen-lockfile ${ONLINE_OFFLINE} --no-progress || die

	export PATH=${OLD_PATH}
}

src_compile() {
	OLD_PATH=$PATH

	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	# echo "$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	if ! use build-online; then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	yarn build || die

	einfo "Manually preparing app.asar"
	local distdir="dist/linux-unpacked/resources"
	mkdir -p ${distdir}/node_modules || die
	cp -r build ${distdir} || die
	# Copying yarn.lock allows freezing versions to the build versions
	cp package.json yarn.lock ${distdir} || die
	pushd ${distdir} &> /dev/null || die
		yarn install ${ONLINE_OFFLINE} --production --no-progress --frozen-lockfile || die
	popd &> /dev/null || die
	rm ${distdir}/yarn.lock || die

	einfo "Creating archive"
	/usr/bin/node node_modules/@electron/asar/bin/asar.js pack ${distdir} ${distdir}/app.asar || die

	export PATH=${OLD_PATH}
}

src_install() {
	insinto "/usr/$(get_libdir)/jupyterlab-desktop"

	doins dist/linux-unpacked/resources/app.asar

	exeinto "/usr/$(get_libdir)/jupyterlab-desktop"
	cp "${FILESDIR}/read_flags_file" dist/linux-unpacked/resources/jupyterlab-desktop
	sed -i "s|@ELECTRON@|jupyterlab-desktop|" dist/linux-unpacked/resources/jupyterlab-desktop

	echo "\"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/electron\" \
--app=\"/usr/$(get_libdir)/jupyterlab-desktop/app.asar\" \"\${flags[@]}\" \"\$@\"" >> dist/linux-unpacked/resources/jupyterlab-desktop
	doexe dist/linux-unpacked/resources/jupyterlab-desktop
	dosym "/usr/$(get_libdir)/jupyterlab-desktop/jupyterlab-desktop" /usr/bin/jupyterlab-desktop

	newicon -s 512 dist-resources/icons/512x512.png jupyterlab-desktop.png

	make_desktop_entry "/usr/bin/jupyterlab-desktop" "JupyterLab Desktop" \
		"jupyterlab-desktop" "Science;Development;"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
