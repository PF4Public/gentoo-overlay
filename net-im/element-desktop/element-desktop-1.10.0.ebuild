# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit desktop flag-o-matic multilib python-any-r1 xdg-utils

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.1.1.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.4.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.7.0.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-8.2.0.tgz
	https://registry.yarnpkg.com/@actions/core/-/core-1.6.0.tgz -> @actions-core-1.6.0.tgz
	https://registry.yarnpkg.com/@actions/github/-/github-5.0.0.tgz -> @actions-github-5.0.0.tgz
	https://registry.yarnpkg.com/@actions/http-client/-/http-client-1.0.11.tgz -> @actions-http-client-1.0.11.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-4.2.0.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.8.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/allchange/-/allchange-1.0.6.tgz
	https://registry.yarnpkg.com/ansi-align/-/ansi-align-3.0.1.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/any-base/-/any-base-1.1.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.2.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-3.5.13.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-3.7.1.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-22.11.4.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-22.14.12.tgz
	https://registry.yarnpkg.com/applescript/-/applescript-1.0.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz
	https://registry.yarnpkg.com/archiver/-/archiver-5.3.0.tgz
	https://registry.yarnpkg.com/archiver-utils/-/archiver-utils-2.1.0.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.7.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.3.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.4.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.2.5.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/asar/-/asar-2.1.0.tgz
	https://registry.yarnpkg.com/asar/-/asar-3.1.0.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.6.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async/-/async-0.9.2.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.3.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/atomically/-/atomically-1.7.0.tgz
	https://registry.yarnpkg.com/auto-launch/-/auto-launch-5.0.5.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.11.0.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.7.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.16.7.tgz -> @babel-code-frame-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.16.8.tgz -> @babel-generator-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.16.7.tgz -> @babel-helper-environment-visitor-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.16.7.tgz -> @babel-helper-function-name-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.16.7.tgz -> @babel-helper-get-function-arity-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.16.7.tgz -> @babel-helper-hoist-variables-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.16.7.tgz -> @babel-helper-split-export-declaration-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.16.7.tgz -> @babel-helper-validator-identifier-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.16.7.tgz -> @babel-highlight-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.16.8.tgz -> @babel-parser-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.16.7.tgz -> @babel-runtime-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.16.7.tgz -> @babel-template-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.16.8.tgz -> @babel-traverse-7.16.8.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.16.8.tgz -> @babel-types-7.16.8.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.2.2.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.2.0.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/bluebird-lst/-/bluebird-lst-1.0.9.tgz
	https://registry.yarnpkg.com/bmp-js/-/bmp-js-0.1.0.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.1.4.tgz
	https://registry.yarnpkg.com/boxen/-/boxen-5.1.2.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/buffer-alloc/-/buffer-alloc-1.2.0.tgz
	https://registry.yarnpkg.com/buffer-alloc-unsafe/-/buffer-alloc-unsafe-1.1.0.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-0.0.1.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-fill/-/buffer-fill-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-22.11.4.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-22.14.7.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-8.7.5.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-8.9.2.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-1.0.3.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-15.3.0.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-6.1.0.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.12.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.2.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-2.0.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.3.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-boxes/-/cli-boxes-2.2.1.tgz
	https://registry.yarnpkg.com/cli-color/-/cli-color-2.0.1.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-7.0.4.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.2.tgz
	https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.0.3.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.9.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/compress-commons/-/compress-commons-4.1.1.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz
	https://registry.yarnpkg.com/conf/-/conf-7.1.2.tgz
	https://registry.yarnpkg.com/config-chain/-/config-chain-1.1.13.tgz
	https://registry.yarnpkg.com/configstore/-/configstore-5.0.1.tgz
	https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/counterpart/-/counterpart-0.18.6.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-1.2.0.tgz
	https://registry.yarnpkg.com/crc32-stream/-/crc32-stream-4.0.2.tgz
	https://registry.yarnpkg.com/crc/-/crc-3.8.0.tgz
	https://registry.yarnpkg.com/create-require/-/create-require-1.1.1.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-2.0.0.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-consumer/-/source-map-consumer-0.8.0.tgz -> @cspotcode-source-map-consumer-0.8.0.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.7.0.tgz -> @cspotcode-source-map-support-0.7.0.tgz
	https://registry.yarnpkg.com/cuint/-/cuint-0.2.2.tgz
	https://registry.yarnpkg.com/dashdash/-/dashdash-1.14.1.tgz
	https://registry.yarnpkg.com/date-names/-/date-names-0.1.13.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.1.tgz
	https://registry.yarnpkg.com/debounce-fn/-/debounce-fn-4.0.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.3.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-3.3.0.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-1.1.3.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-1.0.3.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-2.4.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-22.11.4.tgz
	https://registry.yarnpkg.com/dmg-license/-/dmg-license-1.0.10.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dom-walk/-/dom-walk-0.1.2.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-9.0.2.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-5.1.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-5.3.0.tgz
	https://registry.yarnpkg.com/duplexer3/-/duplexer3-0.1.4.tgz
	https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.6.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-22.11.4.tgz
	https://registry.yarnpkg.com/electron-builder-squirrel-windows/-/electron-builder-squirrel-windows-22.11.4.tgz
	https://registry.yarnpkg.com/electron-devtools-installer/-/electron-devtools-installer-3.2.0.tgz
	https://registry.yarnpkg.com/electron/-/electron-15.3.5.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-1.13.1.tgz -> @electron-get-1.13.1.tgz
	https://registry.yarnpkg.com/electron-notarize/-/electron-notarize-1.1.1.tgz
	https://registry.yarnpkg.com/electron-osx-sign/-/electron-osx-sign-0.5.0.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-22.11.4.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-22.14.12.tgz
	https://registry.yarnpkg.com/electron-store/-/electron-store-6.0.1.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-1.0.5.tgz -> @electron-universal-1.0.5.tgz
	https://registry.yarnpkg.com/electron-window-state/-/electron-window-state-5.0.3.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.13.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enquirer/-/enquirer-2.3.6.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.53.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.3.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.3.tgz
	https://registry.yarnpkg.com/es6-weak-map/-/es6-weak-map-2.0.3.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.19.1.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-goat/-/escape-goat-2.1.1.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-7.18.0.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-0.3.0.tgz -> @eslint-eslintrc-0.3.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.6.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.7.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.25.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-matrix-org/-/eslint-plugin-matrix-org-0.4.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-3.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.3.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.1.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-7.3.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.4.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/event-emitter/-/event-emitter-0.3.5.tgz
	https://registry.yarnpkg.com/except/-/except-0.1.3.tgz
	https://registry.yarnpkg.com/exif-parser/-/exif-parser-0.1.12.tgz
	https://registry.yarnpkg.com/exit-on-epipe/-/exit-on-epipe-1.0.1.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/ext/-/ext-1.6.0.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-1.7.0.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.3.0.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.4.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.2.10.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.13.0.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.2.tgz
	https://registry.yarnpkg.com/file-type/-/file-type-9.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/find-npm-prefix/-/find-npm-prefix-1.0.2.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-2.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.4.tgz
	https://registry.yarnpkg.com/foreachasync/-/foreachasync-3.0.0.tgz
	https://registry.yarnpkg.com/forever-agent/-/forever-agent-0.6.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.3.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-3.0.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.0.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.7.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/@gar/promisify/-/promisify-1.1.2.tgz -> @gar-promisify-1.1.2.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.1.1.tgz
	https://registry.yarnpkg.com/getpass/-/getpass-0.1.7.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/gifwrap/-/gifwrap-0.9.2.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/global-dirs/-/global-dirs-3.0.0.tgz
	https://registry.yarnpkg.com/global/-/global-4.4.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-12.4.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.2.tgz
	https://registry.yarnpkg.com/global-tunnel-ng/-/global-tunnel-ng-2.7.1.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/got/-/got-9.6.0.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.9.tgz
	https://registry.yarnpkg.com/graceful-readlink/-/graceful-readlink-1.0.1.tgz
	https://registry.yarnpkg.com/har-schema/-/har-schema-2.0.0.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.1.5.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.1.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.2.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz
	https://registry.yarnpkg.com/has-yarn/-/has-yarn-2.1.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.0.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-4.0.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.2.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/iconv-corefoundation/-/iconv-corefoundation-1.1.7.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-4.0.6.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.0.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.4.tgz
	https://registry.yarnpkg.com/image-q/-/image-q-1.1.1.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-lazy/-/import-lazy-2.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/ini/-/ini-2.0.0.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.3.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.5.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-3.0.3.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.8.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.4.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-2.0.0.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-3.0.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.8.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-function/-/is-function-1.0.2.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-installed-globally/-/is-installed-globally-0.4.0.tgz
	https://registry.yarnpkg.com/is-lambda/-/is-lambda-1.0.1.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-npm/-/is-npm-5.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.6.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-2.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.2.2.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.1.tgz
	https://registry.yarnpkg.com/isstream/-/isstream-0.1.2.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/is-yarn-global/-/is-yarn-global-0.3.0.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.2.tgz
	https://registry.yarnpkg.com/@jimp/bmp/-/bmp-0.16.1.tgz -> @jimp-bmp-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/core/-/core-0.16.1.tgz -> @jimp-core-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/custom/-/custom-0.16.1.tgz -> @jimp-custom-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/gif/-/gif-0.16.1.tgz -> @jimp-gif-0.16.1.tgz
	https://registry.yarnpkg.com/jimp/-/jimp-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/jpeg/-/jpeg-0.16.1.tgz -> @jimp-jpeg-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-blit/-/plugin-blit-0.16.1.tgz -> @jimp-plugin-blit-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-blur/-/plugin-blur-0.16.1.tgz -> @jimp-plugin-blur-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-circle/-/plugin-circle-0.16.1.tgz -> @jimp-plugin-circle-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-color/-/plugin-color-0.16.1.tgz -> @jimp-plugin-color-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-contain/-/plugin-contain-0.16.1.tgz -> @jimp-plugin-contain-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-cover/-/plugin-cover-0.16.1.tgz -> @jimp-plugin-cover-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-crop/-/plugin-crop-0.16.1.tgz -> @jimp-plugin-crop-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-displace/-/plugin-displace-0.16.1.tgz -> @jimp-plugin-displace-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-dither/-/plugin-dither-0.16.1.tgz -> @jimp-plugin-dither-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-fisheye/-/plugin-fisheye-0.16.1.tgz -> @jimp-plugin-fisheye-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-flip/-/plugin-flip-0.16.1.tgz -> @jimp-plugin-flip-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-gaussian/-/plugin-gaussian-0.16.1.tgz -> @jimp-plugin-gaussian-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-invert/-/plugin-invert-0.16.1.tgz -> @jimp-plugin-invert-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-mask/-/plugin-mask-0.16.1.tgz -> @jimp-plugin-mask-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-normalize/-/plugin-normalize-0.16.1.tgz -> @jimp-plugin-normalize-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-print/-/plugin-print-0.16.1.tgz -> @jimp-plugin-print-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-resize/-/plugin-resize-0.16.1.tgz -> @jimp-plugin-resize-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-rotate/-/plugin-rotate-0.16.1.tgz -> @jimp-plugin-rotate-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-scale/-/plugin-scale-0.16.1.tgz -> @jimp-plugin-scale-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-shadow/-/plugin-shadow-0.16.1.tgz -> @jimp-plugin-shadow-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugins/-/plugins-0.16.1.tgz -> @jimp-plugins-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/plugin-threshold/-/plugin-threshold-0.16.1.tgz -> @jimp-plugin-threshold-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/png/-/png-0.16.1.tgz -> @jimp-png-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/tiff/-/tiff-0.16.1.tgz -> @jimp-tiff-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/types/-/types-0.16.1.tgz -> @jimp-types-0.16.1.tgz
	https://registry.yarnpkg.com/@jimp/utils/-/utils-0.16.1.tgz -> @jimp-utils-0.16.1.tgz
	https://registry.yarnpkg.com/jpeg-js/-/jpeg-js-0.4.2.tgz
	https://registry.yarnpkg.com/jsbn/-/jsbn-0.1.1.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.4.0.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-schema-typed/-/json-schema-typed-7.0.3.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-1.4.2.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.7.1.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-3.1.0.tgz
	https://registry.yarnpkg.com/latest-version/-/latest-version-5.1.0.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-1.0.1.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/load-bmfont/-/load-bmfont-1.4.1.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-2.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/lodash.defaults/-/lodash.defaults-4.2.0.tgz
	https://registry.yarnpkg.com/lodash.difference/-/lodash.difference-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.flatten/-/lodash.flatten-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/lodash.truncate/-/lodash.truncate-4.4.2.tgz
	https://registry.yarnpkg.com/lodash.union/-/lodash.union-4.6.0.tgz
	https://registry.yarnpkg.com/loglevel/-/loglevel-1.8.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-1.0.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-queue/-/lru-queue-0.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.6.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-9.1.0.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-1.1.1.tgz -> @malept-cross-spawn-promise-1.1.1.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/matrix-web-i18n/-/matrix-web-i18n-1.2.0.tgz
	https://registry.yarnpkg.com/memoizee/-/memoizee-0.4.15.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.4.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.51.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.34.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-3.1.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/min-document/-/min-document-2.19.0.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.5.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-1.4.1.tgz
	https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz
	https://registry.yarnpkg.com/minipass-json-stream/-/minipass-json-stream-1.0.1.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.9.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.1.6.tgz
	https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.4.tgz
	https://registry.yarnpkg.com/minipass-sized/-/minipass-sized-1.0.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-1.3.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.5.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/needle/-/needle-2.9.1.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.2.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.0.0.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.1.0.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-1.7.2.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.7.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-7.1.2.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.15.0.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-4.0.3.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-5.0.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-4.5.1.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.1.2.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-1.1.0.tgz -> @npmcli-fs-1.1.0.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-2.1.0.tgz -> @npmcli-git-2.1.0.tgz
	https://registry.yarnpkg.com/@npmcli/installed-package-contents/-/installed-package-contents-1.0.7.tgz -> @npmcli-installed-package-contents-1.0.7.tgz
	https://registry.yarnpkg.com/@npmcli/move-file/-/move-file-1.1.2.tgz -> @npmcli-move-file-1.1.2.tgz
	https://registry.yarnpkg.com/@npmcli/node-gyp/-/node-gyp-1.0.3.tgz -> @npmcli-node-gyp-1.0.3.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-1.3.2.tgz -> @npmcli-promise-spawn-1.3.2.tgz
	https://registry.yarnpkg.com/@npmcli/run-script/-/run-script-1.8.6.tgz -> @npmcli-run-script-1.8.6.tgz
	https://registry.yarnpkg.com/npm-conf/-/npm-conf-1.1.3.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-4.0.0.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-8.1.5.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.4.8.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-2.2.2.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-6.1.1.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-11.0.0.tgz
	https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.9.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.2.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.5.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-2.5.0.tgz -> @octokit-auth-token-2.5.0.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-3.5.1.tgz -> @octokit-core-3.5.1.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-6.0.12.tgz -> @octokit-endpoint-6.0.12.tgz
	https://registry.yarnpkg.com/@octokit/graphql/-/graphql-4.8.0.tgz -> @octokit-graphql-4.8.0.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-11.2.0.tgz -> @octokit-openapi-types-11.2.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-2.17.0.tgz -> @octokit-plugin-paginate-rest-2.17.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.4.tgz -> @octokit-plugin-request-log-1.0.4.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-5.13.0.tgz -> @octokit-plugin-rest-endpoint-methods-5.13.0.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-2.1.0.tgz -> @octokit-request-error-2.1.0.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-5.6.2.tgz -> @octokit-request-5.6.2.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-18.12.0.tgz -> @octokit-rest-18.12.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-6.34.0.tgz -> @octokit-types-6.34.0.tgz
	https://registry.yarnpkg.com/omggif/-/omggif-1.0.10.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.1.tgz
	https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/package-json/-/package-json-6.5.0.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-11.3.5.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-bmfont-ascii/-/parse-bmfont-ascii-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-binary/-/parse-bmfont-binary-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-xml/-/parse-bmfont-xml-1.1.4.tgz
	https://registry.yarnpkg.com/parse-headers/-/parse-headers-2.0.4.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-1.1.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-2.1.0.tgz
	https://registry.yarnpkg.com/phin/-/phin-2.9.3.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz
	https://registry.yarnpkg.com/pixelmatch/-/pixelmatch-4.0.2.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-3.1.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.0.4.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-2.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/pluralizers/-/pluralizers-0.1.7.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-3.4.0.tgz
	https://registry.yarnpkg.com/png-to-ico/-/png-to-ico-2.1.2.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prepend-http/-/prepend-http-2.0.0.tgz
	https://registry.yarnpkg.com/printj/-/printj-1.1.2.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/proto-list/-/proto-list-1.2.4.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.8.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-1.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz
	https://registry.yarnpkg.com/pupa/-/pupa-2.1.1.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.5.3.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz
	https://registry.yarnpkg.com/read-config-file/-/read-config-file-6.2.0.tgz
	https://registry.yarnpkg.com/readdir-glob/-/readdir-glob-1.1.1.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/read-package-json-fast/-/read-package-json-fast-2.0.3.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.13.9.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.2.0.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-4.2.1.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-5.1.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.88.2.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.21.0.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-1.0.2.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver-diff/-/semver-diff-3.1.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.3.5.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/set-immediate-shim/-/set-immediate-shim-1.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.6.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz -> @sindresorhus-is-0.14.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-6.1.1.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.6.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.2.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.17.0.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-8.0.1.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.4.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.4.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz -> @szmarczak-http-timer-1.1.2.tgz
	https://registry.yarnpkg.com/table/-/table-6.8.0.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar/-/tar-4.4.19.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.1.11.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/timers-ext/-/timers-ext-0.1.7.tgz
	https://registry.yarnpkg.com/timm/-/timm-1.7.1.tgz
	https://registry.yarnpkg.com/tinycolor2/-/tinycolor2-1.4.2.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-1.1.0.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.1.0.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.1.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-1.1.2.tgz -> @tootallnate-once-1.1.2.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/to-readable-stream/-/to-readable-stream-1.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.5.0.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.8.tgz -> @tsconfig-node10-1.0.8.tgz
	https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.9.tgz -> @tsconfig-node12-1.0.9.tgz
	https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.1.tgz -> @tsconfig-node14-1.0.1.tgz
	https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.2.tgz -> @tsconfig-node16-1.0.2.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.12.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.3.1.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-10.4.0.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.21.0.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.6.0.tgz
	https://registry.yarnpkg.com/tunnel/-/tunnel-0.0.6.tgz
	https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.16.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/@types/auto-launch/-/auto-launch-5.0.2.tgz -> @types-auto-launch-5.0.2.tgz
	https://registry.yarnpkg.com/@types/counterpart/-/counterpart-0.18.1.tgz -> @types-counterpart-0.18.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.9.1.tgz -> @typescript-eslint-eslint-plugin-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/experimental-utils/-/experimental-utils-5.9.1.tgz -> @typescript-eslint-experimental-utils-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.9.1.tgz -> @typescript-eslint-parser-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.9.1.tgz -> @typescript-eslint-scope-manager-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.9.1.tgz -> @typescript-eslint-typescript-estree-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.9.1.tgz -> @typescript-eslint-types-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.9.1.tgz -> @typescript-eslint-type-utils-5.9.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.9.1.tgz -> @typescript-eslint-visitor-keys-5.9.1.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-4.5.4.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.7.tgz -> @types-debug-4.1.7.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/glob/-/glob-7.2.0.tgz -> @types-glob-7.2.0.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.9.tgz -> @types-json-schema-7.0.9.tgz
	https://registry.yarnpkg.com/@types/minimatch/-/minimatch-3.0.5.tgz -> @types-minimatch-3.0.5.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.2.tgz -> @types-minimist-1.2.2.tgz
	https://registry.yarnpkg.com/@types/mkdirp/-/mkdirp-1.0.2.tgz -> @types-mkdirp-1.0.2.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.5.12.tgz -> @types-node-fetch-2.5.12.tgz
	https://registry.yarnpkg.com/@types/node/-/node-14.18.5.tgz -> @types-node-14.18.5.tgz
	https://registry.yarnpkg.com/@types/node/-/node-17.0.8.tgz -> @types-node-17.0.8.tgz
	https://registry.yarnpkg.com/@types/npmlog/-/npmlog-4.1.4.tgz -> @types-npmlog-4.1.4.tgz
	https://registry.yarnpkg.com/@types/npm-package-arg/-/npm-package-arg-6.1.1.tgz -> @types-npm-package-arg-6.1.1.tgz
	https://registry.yarnpkg.com/@types/npm-registry-fetch/-/npm-registry-fetch-8.0.3.tgz -> @types-npm-registry-fetch-8.0.3.tgz
	https://registry.yarnpkg.com/@types/pacote/-/pacote-11.1.3.tgz -> @types-pacote-11.1.3.tgz
	https://registry.yarnpkg.com/@types/plist/-/plist-3.0.2.tgz -> @types-plist-3.0.2.tgz
	https://registry.yarnpkg.com/@types/rimraf/-/rimraf-3.0.2.tgz -> @types-rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/@types/ssri/-/ssri-7.1.1.tgz -> @types-ssri-7.1.1.tgz
	https://registry.yarnpkg.com/@types/verror/-/verror-1.10.5.tgz -> @types-verror-1.10.5.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-20.2.1.tgz -> @types-yargs-parser-20.2.1.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-16.0.4.tgz -> @types-yargs-16.0.4.tgz
	https://registry.yarnpkg.com/type/-/type-1.2.0.tgz
	https://registry.yarnpkg.com/type/-/type-2.5.0.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.1.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.2.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-2.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-6.0.0.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-3.0.3.tgz
	https://registry.yarnpkg.com/unzip-crx-3/-/unzip-crx-3-0.2.0.tgz
	https://registry.yarnpkg.com/update-notifier/-/update-notifier-5.1.0.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/url-parse-lax/-/url-parse-lax-3.0.0.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/utif/-/utif-2.0.1.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.4.0.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.3.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-3.0.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.1.tgz
	https://registry.yarnpkg.com/walk/-/walk-2.3.15.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.5.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-3.1.0.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.4.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.3.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-3.0.3.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-4.0.0.tgz
	https://registry.yarnpkg.com/xhr/-/xhr-2.6.0.tgz
	https://registry.yarnpkg.com/xml2js/-/xml2js-0.4.23.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-11.0.1.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-9.0.7.tgz
	https://registry.yarnpkg.com/xml-parse-from-string/-/xml-parse-from-string-1.0.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yaku/-/yaku-0.16.7.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.0.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.3.1.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yn/-/yn-3.1.1.tgz
	https://registry.yarnpkg.com/zip-stream/-/zip-stream-4.1.0.tgz
) "

REPO="https://github.com/vector-im/element-desktop"
ELECTRON_SLOT_DEFAULT="13"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE="+build-online +electron-16 native-modules"
else
	IUSE="build-online +electron-16 native-modules"
	KEYWORDS="~amd64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$ELEMENT_COMMIT_ID" ]
	then
		DOWNLOAD+="v${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${ELEMENT_COMMIT_ID}.tar.gz -> ${PN}-${ELEMENT_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${ELEMENT_COMMIT_ID}"
	fi
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"
REQUIRED_USE="native-modules? ( build-online )"

COMMON_DEPEND="
	~net-im/element-web-${PV}
	electron-16? ( dev-util/electron:16 )
	!electron-16? ( dev-util/electron:${ELECTRON_SLOT_DEFAULT} )
	native-modules? ( dev-db/sqlcipher )
"

RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	native-modules? ( virtual/rust )
	net-libs/nodejs
	sys-apps/yarn
"

#TODO: net-im/element-web -> runtime/buildtime dep

src_unpack() {
	if [ -z "$ELEMENT_COMMIT_ID" ]
	then
		if [ -f "${DISTDIR}/${P}.tar.gz" ]; then
			unpack "${P}".tar.gz || die
		else
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${ELEMENT_COMMIT_ID}.tar.gz" || die
	fi
	if use electron-16; then
		export ELECTRON_SLOT=16
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
}

src_compile() {
	OLD_PATH=$PATH
	export PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/npm/bin/node-gyp-bin:$PATH"
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	#! Until electron-builder >=22.11.5
	yarn config set ignore-engines true || die

	if ! use build-online
	then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Installing node_modules"
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress || die

	einfo "Editing ElectronFramework.js"
	sed -i 's/return unpack(options, createDownloadOpts.*$/return true;/' \
		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die
	sed -i 's/return beforeCopyExtraFiles(options);$/return true;/' \
		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die

	node node_modules/.bin/tsc || die
	node scripts/copy-res.js || die

	if use native-modules
	then
		node /usr/bin/yarn run build:native || die
	fi

	#!Error: "Unknown argument" with electron's node
	/usr/bin/node node_modules/.bin/electron-builder --dir || die

	#cp -r /usr/share/element-web webapp
	#rm -f webapp/config.json
	#cp -f /etc/element-web/config.json webapp/config.json
	#node node_modules/.bin/asar p webapp webapp.asar
	#node node_modules/.bin/asar l webapp.asar

	export PATH=${OLD_PATH}
}

src_install() {
	insinto "/usr/$(get_libdir)/element-desktop"

	doins -r dist/linux-unpacked/resources/*
	dosym ../../share/element-web /usr/$(get_libdir)/element-desktop/webapp

	make_desktop_entry "electron-${ELECTRON_SLOT} /usr/$(get_libdir)/element-desktop/app.asar" \
		Element "/usr/$(get_libdir)/element-desktop/img/element.png" "Network;Chat"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
