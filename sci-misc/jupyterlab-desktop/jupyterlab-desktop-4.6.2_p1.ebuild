# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop multilib xdg-utils

DESCRIPTION="JupyterLab desktop application, based on Electron"
HOMEPAGE="https://jupyter.org/"
LICENSE="BSD"
SLOT="0"
SRC_URI="
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.27.1.tgz -> @babel-helper-string-parser-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.28.5.tgz -> @babel-helper-validator-identifier-7.28.5.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.29.3.tgz -> @babel-parser-7.29.3.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.29.0.tgz -> @babel-types-7.29.0.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-1.0.2.tgz -> @bcoe-v8-coverage-1.0.2.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/@electron-internal/extract-zip/-/extract-zip-1.0.4.tgz -> @electron-internal-extract-zip-1.0.4.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.4.1.tgz -> @electron-asar-3.4.1.tgz
	https://registry.yarnpkg.com/@electron/fuses/-/fuses-1.8.0.tgz -> @electron-fuses-1.8.0.tgz
	https://registry.yarnpkg.com/@electron/fuses/-/fuses-2.1.1.tgz -> @electron-fuses-2.1.1.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-3.1.0.tgz -> @electron-get-3.1.0.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-5.0.0.tgz -> @electron-get-5.0.0.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-2.5.0.tgz -> @electron-notarize-2.5.0.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-3.1.1.tgz -> @electron-notarize-3.1.1.tgz
	https://registry.yarnpkg.com/@electron/osx-sign/-/osx-sign-1.3.3.tgz -> @electron-osx-sign-1.3.3.tgz
	https://registry.yarnpkg.com/@electron/rebuild/-/rebuild-4.0.4.tgz -> @electron-rebuild-4.0.4.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-2.0.3.tgz -> @electron-universal-2.0.3.tgz
	https://registry.yarnpkg.com/@emnapi/core/-/core-1.10.0.tgz -> @emnapi-core-1.10.0.tgz
	https://registry.yarnpkg.com/@emnapi/runtime/-/runtime-1.10.0.tgz -> @emnapi-runtime-1.10.0.tgz
	https://registry.yarnpkg.com/@emnapi/wasi-threads/-/wasi-threads-1.2.1.tgz -> @emnapi-wasi-threads-1.2.1.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.9.1.tgz -> @eslint-community-eslint-utils-4.9.1.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.12.2.tgz -> @eslint-community-regexpp-4.12.2.tgz
	https://registry.yarnpkg.com/@eslint/config-array/-/config-array-0.23.5.tgz -> @eslint-config-array-0.23.5.tgz
	https://registry.yarnpkg.com/@eslint/config-helpers/-/config-helpers-0.6.0.tgz -> @eslint-config-helpers-0.6.0.tgz
	https://registry.yarnpkg.com/@eslint/core/-/core-1.2.1.tgz -> @eslint-core-1.2.1.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-10.0.1.tgz -> @eslint-js-10.0.1.tgz
	https://registry.yarnpkg.com/@eslint/object-schema/-/object-schema-3.0.5.tgz -> @eslint-object-schema-3.0.5.tgz
	https://registry.yarnpkg.com/@eslint/plugin-kit/-/plugin-kit-0.7.2.tgz -> @eslint-plugin-kit-0.7.2.tgz
	https://registry.yarnpkg.com/@humanfs/core/-/core-0.19.2.tgz -> @humanfs-core-0.19.2.tgz
	https://registry.yarnpkg.com/@humanfs/node/-/node-0.16.8.tgz -> @humanfs-node-0.16.8.tgz
	https://registry.yarnpkg.com/@humanfs/types/-/types-0.15.0.tgz -> @humanfs-types-0.15.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/retry/-/retry-0.4.3.tgz -> @humanwhocodes-retry-0.4.3.tgz
	https://registry.yarnpkg.com/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz -> @isaacs-fs-minipass-4.0.1.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz -> @jridgewell-gen-mapping-0.3.13.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> @jridgewell-resolve-uri-3.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.11.tgz -> @jridgewell-source-map-0.3.11.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz -> @jridgewell-sourcemap-codec-1.5.5.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz -> @jridgewell-trace-mapping-0.3.31.tgz
	https://registry.yarnpkg.com/@jupyter-notebook/web-components/-/web-components-0.9.1.tgz -> @jupyter-notebook-web-components-0.9.1.tgz
	https://registry.yarnpkg.com/@leeoniya/ufuzzy/-/ufuzzy-1.0.19.tgz -> @leeoniya-ufuzzy-1.0.19.tgz
	https://registry.yarnpkg.com/@lumino/algorithm/-/algorithm-2.0.4.tgz -> @lumino-algorithm-2.0.4.tgz
	https://registry.yarnpkg.com/@lumino/coreutils/-/coreutils-2.2.2.tgz -> @lumino-coreutils-2.2.2.tgz
	https://registry.yarnpkg.com/@lumino/signaling/-/signaling-2.1.5.tgz -> @lumino-signaling-2.1.5.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-2.0.0.tgz -> @malept-cross-spawn-promise-2.0.0.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-colors/-/fast-colors-5.3.1.tgz -> @microsoft-fast-colors-5.3.1.tgz
	https://registry.yarnpkg.com/@microsoft/fast-components/-/fast-components-2.30.6.tgz -> @microsoft-fast-components-2.30.6.tgz
	https://registry.yarnpkg.com/@microsoft/fast-element/-/fast-element-1.11.0.tgz -> @microsoft-fast-element-1.11.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-foundation/-/fast-foundation-2.47.0.tgz -> @microsoft-fast-foundation-2.47.0.tgz
	https://registry.yarnpkg.com/@microsoft/fast-web-utilities/-/fast-web-utilities-5.4.1.tgz -> @microsoft-fast-web-utilities-5.4.1.tgz
	https://registry.yarnpkg.com/@napi-rs/wasm-runtime/-/wasm-runtime-1.1.4.tgz -> @napi-rs-wasm-runtime-1.1.4.tgz
	https://registry.yarnpkg.com/@noble/hashes/-/hashes-1.4.0.tgz -> @noble-hashes-1.4.0.tgz
	https://registry.yarnpkg.com/@noble/hashes/-/hashes-2.2.0.tgz -> @noble-hashes-2.2.0.tgz
	https://registry.yarnpkg.com/@nodable/entities/-/entities-2.2.0.tgz -> @nodable-entities-2.2.0.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@oxc-project/types/-/types-0.128.0.tgz -> @oxc-project-types-0.128.0.tgz
	https://registry.yarnpkg.com/@peculiar/asn1-schema/-/asn1-schema-2.8.0.tgz -> @peculiar-asn1-schema-2.8.0.tgz
	https://registry.yarnpkg.com/@peculiar/json-schema/-/json-schema-1.1.12.tgz -> @peculiar-json-schema-1.1.12.tgz
	https://registry.yarnpkg.com/@peculiar/utils/-/utils-2.0.3.tgz -> @peculiar-utils-2.0.3.tgz
	https://registry.yarnpkg.com/@peculiar/webcrypto/-/webcrypto-1.7.1.tgz -> @peculiar-webcrypto-1.7.1.tgz
	https://registry.yarnpkg.com/@playwright/test/-/test-1.61.1.tgz -> @playwright-test-1.61.1.tgz
	https://registry.yarnpkg.com/@rolldown/binding-android-arm64/-/binding-android-arm64-1.0.0-rc.18.tgz -> @rolldown-binding-android-arm64-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-darwin-arm64/-/binding-darwin-arm64-1.0.0-rc.18.tgz -> @rolldown-binding-darwin-arm64-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-darwin-x64/-/binding-darwin-x64-1.0.0-rc.18.tgz -> @rolldown-binding-darwin-x64-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-freebsd-x64/-/binding-freebsd-x64-1.0.0-rc.18.tgz -> @rolldown-binding-freebsd-x64-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-arm-gnueabihf/-/binding-linux-arm-gnueabihf-1.0.0-rc.18.tgz -> @rolldown-binding-linux-arm-gnueabihf-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-arm64-gnu/-/binding-linux-arm64-gnu-1.0.0-rc.18.tgz -> @rolldown-binding-linux-arm64-gnu-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-arm64-musl/-/binding-linux-arm64-musl-1.0.0-rc.18.tgz -> @rolldown-binding-linux-arm64-musl-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-ppc64-gnu/-/binding-linux-ppc64-gnu-1.0.0-rc.18.tgz -> @rolldown-binding-linux-ppc64-gnu-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-s390x-gnu/-/binding-linux-s390x-gnu-1.0.0-rc.18.tgz -> @rolldown-binding-linux-s390x-gnu-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-x64-gnu/-/binding-linux-x64-gnu-1.0.0-rc.18.tgz -> @rolldown-binding-linux-x64-gnu-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-linux-x64-musl/-/binding-linux-x64-musl-1.0.0-rc.18.tgz -> @rolldown-binding-linux-x64-musl-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-openharmony-arm64/-/binding-openharmony-arm64-1.0.0-rc.18.tgz -> @rolldown-binding-openharmony-arm64-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-wasm32-wasi/-/binding-wasm32-wasi-1.0.0-rc.18.tgz -> @rolldown-binding-wasm32-wasi-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-win32-arm64-msvc/-/binding-win32-arm64-msvc-1.0.0-rc.18.tgz -> @rolldown-binding-win32-arm64-msvc-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/binding-win32-x64-msvc/-/binding-win32-x64-msvc-1.0.0-rc.18.tgz -> @rolldown-binding-win32-x64-msvc-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@rolldown/pluginutils/-/pluginutils-1.0.0-rc.18.tgz -> @rolldown-pluginutils-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/@standard-schema/spec/-/spec-1.1.0.tgz -> @standard-schema-spec-1.1.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@tybys/wasm-util/-/wasm-util-0.10.2.tgz -> @tybys-wasm-util-0.10.2.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.3.tgz -> @types-cacheable-request-6.0.3.tgz
	https://registry.yarnpkg.com/@types/chai/-/chai-5.2.3.tgz -> @types-chai-5.2.3.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.7.tgz -> @types-debug-4.1.7.tgz
	https://registry.yarnpkg.com/@types/deep-eql/-/deep-eql-4.0.2.tgz -> @types-deep-eql-4.0.2.tgz
	https://registry.yarnpkg.com/@types/ejs/-/ejs-3.1.5.tgz -> @types-ejs-3.1.5.tgz
	https://registry.yarnpkg.com/@types/esrecurse/-/esrecurse-4.3.1.tgz -> @types-esrecurse-4.3.1.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-1.0.9.tgz -> @types-estree-1.0.9.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.1.tgz -> @types-http-cache-semantics-4.0.1.tgz
	https://registry.yarnpkg.com/@types/js-yaml/-/js-yaml-4.0.9.tgz -> @types-js-yaml-4.0.9.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.15.tgz -> @types-json-schema-7.0.15.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.4.tgz -> @types-keyv-3.1.4.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node/-/node-24.13.2.tgz -> @types-node-24.13.2.tgz
	https://registry.yarnpkg.com/@types/node/-/node-26.0.1.tgz -> @types-node-26.0.1.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.0.tgz -> @types-responselike-1.0.0.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.7.1.tgz -> @types-semver-7.7.1.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.0.tgz -> @types-yargs-parser-21.0.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.35.tgz -> @types-yargs-17.0.35.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.61.1.tgz -> @typescript-eslint-eslint-plugin-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-8.61.1.tgz -> @typescript-eslint-parser-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/project-service/-/project-service-8.61.1.tgz -> @typescript-eslint-project-service-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.61.1.tgz -> @typescript-eslint-scope-manager-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/tsconfig-utils/-/tsconfig-utils-8.61.1.tgz -> @typescript-eslint-tsconfig-utils-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-8.61.1.tgz -> @typescript-eslint-type-utils-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.61.1.tgz -> @typescript-eslint-types-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.61.1.tgz -> @typescript-eslint-typescript-estree-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.61.1.tgz -> @typescript-eslint-utils-8.61.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.61.1.tgz -> @typescript-eslint-visitor-keys-8.61.1.tgz
	https://registry.yarnpkg.com/@vitest/coverage-v8/-/coverage-v8-4.1.9.tgz -> @vitest-coverage-v8-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/expect/-/expect-4.1.9.tgz -> @vitest-expect-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/mocker/-/mocker-4.1.9.tgz -> @vitest-mocker-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/pretty-format/-/pretty-format-4.1.9.tgz -> @vitest-pretty-format-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/runner/-/runner-4.1.9.tgz -> @vitest-runner-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/snapshot/-/snapshot-4.1.9.tgz -> @vitest-snapshot-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/spy/-/spy-4.1.9.tgz -> @vitest-spy-4.1.9.tgz
	https://registry.yarnpkg.com/@vitest/utils/-/utils-4.1.9.tgz -> @vitest-utils-4.1.9.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.14.1.tgz -> @webassemblyjs-ast-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.13.2.tgz -> @webassemblyjs-floating-point-hex-parser-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.13.2.tgz -> @webassemblyjs-helper-api-error-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.14.1.tgz -> @webassemblyjs-helper-buffer-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.13.2.tgz -> @webassemblyjs-helper-numbers-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.13.2.tgz -> @webassemblyjs-helper-wasm-bytecode-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.14.1.tgz -> @webassemblyjs-helper-wasm-section-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.13.2.tgz -> @webassemblyjs-ieee754-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.13.2.tgz -> @webassemblyjs-leb128-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.13.2.tgz -> @webassemblyjs-utf8-1.13.2.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.14.1.tgz -> @webassemblyjs-wasm-edit-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.14.1.tgz -> @webassemblyjs-wasm-gen-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.14.1.tgz -> @webassemblyjs-wasm-opt-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.14.1.tgz -> @webassemblyjs-wasm-parser-1.14.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.14.1.tgz -> @webassemblyjs-wast-printer-1.14.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-1.2.0.tgz -> @webpack-cli-configtest-1.2.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-1.5.0.tgz -> @webpack-cli-info-1.5.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-1.7.0.tgz -> @webpack-cli-serve-1.7.0.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.8.10.tgz -> @xmldom-xmldom-0.8.10.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.9.10.tgz -> @xmldom-xmldom-0.9.10.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-4.0.0.tgz
	https://registry.yarnpkg.com/acorn-import-phases/-/acorn-import-phases-1.0.4.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.17.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.4.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-5.1.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.15.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.20.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/anynum/-/anynum-1.0.1.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-26.15.3.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array.prototype.reduce/-/array.prototype.reduce-1.0.5.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz
	https://registry.yarnpkg.com/asn1js/-/asn1js-3.0.10.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-2.0.1.tgz
	https://registry.yarnpkg.com/ast-v8-to-istanbul/-/ast-v8-to-istanbul-1.0.0.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.4.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.13.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-4.0.4.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/baseline-browser-mapping/-/baseline-browser-mapping-2.10.40.tgz
	https://registry.yarnpkg.com/binaryextensions/-/binaryextensions-6.11.0.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.1.1.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-5.0.6.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.3.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.28.4.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-9.7.0.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-26.15.3.tgz
	https://registry.yarnpkg.com/bytestreamjs/-/bytestreamjs-2.0.1.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.2.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001799.tgz
	https://registry.yarnpkg.com/chai/-/chai-6.2.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-3.0.0.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.4.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.3.1.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.4.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.19.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-4.0.2.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.6.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.6.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.4.3.tgz
	https://registry.yarnpkg.com/debuglog/-/debuglog-1.0.1.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/default-shell/-/default-shell-1.0.1.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.4.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-2.1.2.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/dezalgo/-/dezalgo-1.0.4.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-4.2.0.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-26.15.3.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-11.0.7.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-16.6.1.tgz
	https://registry.yarnpkg.com/dunder-proto/-/dunder-proto-1.0.1.tgz
	https://registry.yarnpkg.com/duplexer2/-/duplexer2-0.1.4.tgz
	https://registry.yarnpkg.com/editions/-/editions-6.22.0.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.10.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-6.0.1.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-26.15.3.tgz
	https://registry.yarnpkg.com/electron-log/-/electron-log-5.4.4.tgz
	https://registry.yarnpkg.com/electron-playwright-helpers/-/electron-playwright-helpers-2.1.0.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-26.15.3.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.5.380.tgz
	https://registry.yarnpkg.com/electron/-/electron-42.5.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.24.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-3.0.0.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.8.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.21.1.tgz
	https://registry.yarnpkg.com/es-array-method-boxes-properly/-/es-array-method-boxes-properly-1.0.0.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.1.tgz
	https://registry.yarnpkg.com/es-errors/-/es-errors-1.3.0.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-2.1.0.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.1.2.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.1.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.2.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-10.1.8.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-9.1.2.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-5.0.1.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-10.5.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-11.2.0.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.7.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-3.0.3.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.5.1.tgz
	https://registry.yarnpkg.com/execa/-/execa-1.0.0.tgz
	https://registry.yarnpkg.com/exenv-es6/-/exenv-es6-1.1.1.tgz
	https://registry.yarnpkg.com/expect-type/-/expect-type-1.3.0.tgz
	https://registry.yarnpkg.com/exponential-backoff/-/exponential-backoff-3.1.3.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fast-uri/-/fast-uri-3.1.2.tgz
	https://registry.yarnpkg.com/fast-xml-builder/-/fast-xml-builder-1.2.0.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-5.9.3.tgz
	https://registry.yarnpkg.com/fastest-levenshtein/-/fastest-levenshtein-1.0.16.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.20.1.tgz
	https://registry.yarnpkg.com/fdir/-/fdir-6.5.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-8.0.0.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.1.1.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/fix-path/-/fix-path-3.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-4.0.1.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.4.2.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.6.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-11.3.5.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.5.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.0.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.3.0.tgz
	https://registry.yarnpkg.com/get-proto/-/get-proto-1.0.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-2.3.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/github-url-to-object/-/github-url-to-object-4.0.6.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-17.6.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.0.1.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.2.0.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.6.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.10.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.1.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.1.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.2.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.0.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.4.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-7.0.2.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.6.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.4.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-7.0.5.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.4.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.4.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-2.2.0.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.11.0.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.13.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.10.tgz
	https://registry.yarnpkg.com/is-unsafe/-/is-unsafe-1.0.1.tgz
	https://registry.yarnpkg.com/is-url/-/is-url-1.2.4.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.10.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-5.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-3.1.5.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-4.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.2.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.2.0.tgz
	https://registry.yarnpkg.com/istextorbinary/-/istextorbinary-9.5.0.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.5.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/jiti/-/jiti-2.7.0.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-10.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-5.2.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.2.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.4.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lightningcss-android-arm64/-/lightningcss-android-arm64-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-darwin-arm64/-/lightningcss-darwin-arm64-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-darwin-x64/-/lightningcss-darwin-x64-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-freebsd-x64/-/lightningcss-freebsd-x64-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-linux-arm-gnueabihf/-/lightningcss-linux-arm-gnueabihf-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-linux-arm64-gnu/-/lightningcss-linux-arm64-gnu-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-linux-arm64-musl/-/lightningcss-linux-arm64-musl-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-linux-x64-gnu/-/lightningcss-linux-x64-gnu-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-linux-x64-musl/-/lightningcss-linux-x64-musl-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-win32-arm64-msvc/-/lightningcss-win32-arm64-msvc-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss-win32-x64-msvc/-/lightningcss-win32-x64-msvc-1.32.0.tgz
	https://registry.yarnpkg.com/lightningcss/-/lightningcss-1.32.0.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.3.2.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.18.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.5.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.30.21.tgz
	https://registry.yarnpkg.com/magicast/-/magicast-0.5.2.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-4.0.0.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/math-intrinsics/-/math-intrinsics-1.1.0.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.8.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.54.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-10.2.5.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.5.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.9.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minimizer-webpack-plugin/-/minimizer-webpack-plugin-5.6.1.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.1.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-3.1.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.12.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.5.tgz
	https://registry.yarnpkg.com/node-abi/-/node-abi-4.31.0.tgz
	https://registry.yarnpkg.com/node-api-version/-/node-api-version-0.2.1.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-12.4.0.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.50.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-9.0.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.3.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.4.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.5.tgz
	https://registry.yarnpkg.com/obug/-/obug-2.1.1.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.4.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.1.1.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-expression-matcher/-/path-expression-matcher-1.6.1.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/pathe/-/pathe-2.0.3.tgz
	https://registry.yarnpkg.com/pe-library/-/pe-library-0.4.1.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-4.0.4.tgz
	https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz
	https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkijs/-/pkijs-3.4.0.tgz
	https://registry.yarnpkg.com/playwright-core/-/playwright-core-1.61.1.tgz
	https://registry.yarnpkg.com/playwright/-/playwright-1.61.1.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.0.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.1.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.5.14.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.1.2.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-6.1.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/proper-lockfile/-/proper-lockfile-4.1.2.tgz
	https://registry.yarnpkg.com/pseudomap/-/pseudomap-1.0.2.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.0.tgz
	https://registry.yarnpkg.com/pvtsutils/-/pvtsutils-1.3.6.tgz
	https://registry.yarnpkg.com/pvutils/-/pvutils-1.1.5.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/read-binary-file-arch/-/read-binary-file-arch-1.0.6.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-2.1.2.tgz
	https://registry.yarnpkg.com/read-package-tree/-/read-package-tree-5.3.1.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.8.tgz
	https://registry.yarnpkg.com/readdir-scoped-modules/-/readdir-scoped-modules-1.1.0.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.6.2.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.7.1.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.4.3.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/resedit/-/resedit-1.7.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.2.1.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.1.0.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/rolldown/-/rolldown-1.0.0-rc.18.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.0.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-4.3.3.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.6.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.7.4.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.8.4.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.8.5.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.2.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-1.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-env/-/shell-env-0.3.0.tgz
	https://registry.yarnpkg.com/shell-path/-/shell-path-2.1.0.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.9.2.tgz
	https://registry.yarnpkg.com/shx/-/shx-0.4.0.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/siginfo/-/siginfo-2.0.0.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.2.1.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.1.1.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.12.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.2.tgz
	https://registry.yarnpkg.com/stackback/-/stackback-0.0.2.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/std-env/-/std-env-4.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.6.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.6.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz
	https://registry.yarnpkg.com/strnum/-/strnum-2.4.1.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/tabbable/-/tabbable-5.3.3.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.3.3.tgz
	https://registry.yarnpkg.com/tar/-/tar-7.5.16.tgz
	https://registry.yarnpkg.com/tar/-/tar-7.5.19.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.48.0.tgz
	https://registry.yarnpkg.com/textextensions/-/textextensions-6.11.0.tgz
	https://registry.yarnpkg.com/tiny-async-pool/-/tiny-async-pool-1.3.0.tgz
	https://registry.yarnpkg.com/tinybench/-/tinybench-2.9.0.tgz
	https://registry.yarnpkg.com/tinyexec/-/tinyexec-1.1.2.tgz
	https://registry.yarnpkg.com/tinyglobby/-/tinyglobby-0.2.16.tgz
	https://registry.yarnpkg.com/tinyglobby/-/tinyglobby-0.2.17.tgz
	https://registry.yarnpkg.com/tinyrainbow/-/tinyrainbow-3.1.0.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/ts-api-utils/-/ts-api-utils-2.5.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.8.1.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.4.tgz
	https://registry.yarnpkg.com/typescript-eslint/-/typescript-eslint-8.61.1.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-6.0.3.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-7.18.2.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-8.3.0.tgz
	https://registry.yarnpkg.com/undici/-/undici-6.27.0.tgz
	https://registry.yarnpkg.com/undici/-/undici-7.28.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/unzipper/-/unzipper-0.12.3.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.2.3.tgz
	https://registry.yarnpkg.com/update-electron-app/-/update-electron-app-3.2.0.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util-promisify/-/util-promisify-2.1.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/version-range/-/version-range-4.15.0.tgz
	https://registry.yarnpkg.com/vite/-/vite-8.0.11.tgz
	https://registry.yarnpkg.com/vitest/-/vitest-4.1.9.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-2.5.2.tgz
	https://registry.yarnpkg.com/webcrypto-core/-/webcrypto-core-1.9.2.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-4.10.0.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-5.8.0.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.5.0.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.108.1.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.9.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-5.0.0.tgz
	https://registry.yarnpkg.com/which/-/which-6.0.1.tgz
	https://registry.yarnpkg.com/which/-/which-7.0.0.tgz
	https://registry.yarnpkg.com/why-is-node-running/-/why-is-node-running-2.3.0.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.0.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.5.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.5.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/xml-naming/-/xml-naming-0.1.0.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-2.1.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-5.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.6.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
"

REPO="https://github.com/jupyterlab/jupyterlab-desktop"
ELECTRON_SLOT_DEFAULT="42"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
# IUSE="electron-40 electron-41 electron-42"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE+=" +build-online"
else
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$CODE_COMMIT_ID" ]; then
		DOWNLOAD+="v${PV/_p/-}.tar.gz -> ${P}.tar.gz"
		S="${WORKDIR}/${PN}-${PV/_p/-}"
	else
		DOWNLOAD+="${CODE_COMMIT_ID}.tar.gz -> ${PN}-${CODE_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${CODE_COMMIT_ID}"
	fi
	IUSE+=" +build-online"
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

REQUIRED_USE=""

COMMON_DEPEND="
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
"
	# electron-40? ( dev-util/electron:40 )
	# electron-41? ( dev-util/electron:41 )
	# electron-42? ( dev-util/electron:42 )
	# !electron-40? (
	# !electron-41? (
	# !electron-42? (
	# ) ) )

RDEPEND="${COMMON_DEPEND}
	>=dev-python/jupyterlab-$(ver_cut 1-3)
"

DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	>=net-libs/nodejs-7.6.0[corepack]
"

src_unpack() {
	# if use electron-41; then
	# 	export ELECTRON_SLOT=41
	# elif use electron-40; then
	# 	export ELECTRON_SLOT=40
	# elif use electron-42; then
	# 	export ELECTRON_SLOT=42
	# else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	# fi
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

	# if use electron-36 || use electron-37 || use electron-38; then
		einfo "Disabling development mode"
		sed -i 's$isDevMode(): boolean {$isDevMode(): boolean {return false;$' src/main/utils.ts || die
	# fi
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
