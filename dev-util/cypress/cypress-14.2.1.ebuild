# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit desktop flag-o-matic multilib ninja-utils pax-utils portability python-any-r1 toolchain-funcs xdg-utils

DESCRIPTION="Fast, easy and reliable testing for anything that runs in a browser."
HOMEPAGE="https://github.com/cypress-io/cypress"
LICENSE="MIT"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.npmjs.org/acorn-typescript/-/acorn-typescript-1.4.13.tgz
	https://registry.npmjs.org/aggregate-error/-/aggregate-error-5.0.0.tgz
	https://registry.npmjs.org/ajv/-/ajv-8.17.1.tgz
	https://registry.npmjs.org/ajv-formats/-/ajv-formats-3.0.1.tgz
	https://registry.npmjs.org/@angular/cli/-/cli-18.2.11.tgz -> @angular-cli-18.2.11.tgz
	https://registry.npmjs.org/@angular-devkit/architect/-/architect-0.1802.11.tgz -> @angular-devkit-architect-0.1802.11.tgz
	https://registry.npmjs.org/@angular-devkit/core/-/core-18.2.11.tgz -> @angular-devkit-core-18.2.11.tgz
	https://registry.npmjs.org/@angular-devkit/schematics-cli/-/schematics-cli-18.2.11.tgz -> @angular-devkit-schematics-cli-18.2.11.tgz
	https://registry.npmjs.org/@angular-devkit/schematics/-/schematics-18.2.11.tgz -> @angular-devkit-schematics-18.2.11.tgz
	https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-6.2.1.tgz
	https://registry.npmjs.org/ansi-escapes/-/ansi-escapes-7.0.0.tgz
	https://registry.npmjs.org/assertion-error/-/assertion-error-2.0.1.tgz
	https://registry.npmjs.org/b4a/-/b4a-1.6.6.tgz
	https://registry.npmjs.org/@babel/helper-plugin-utils/-/helper-plugin-utils-7.25.9.tgz -> @babel-helper-plugin-utils-7.25.9.tgz
	https://registry.npmjs.org/@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.25.9.tgz -> @babel-plugin-transform-react-jsx-self-7.25.9.tgz
	https://registry.npmjs.org/@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.25.9.tgz -> @babel-plugin-transform-react-jsx-source-7.25.9.tgz
	https://registry.npmjs.org/bare-events/-/bare-events-2.4.2.tgz
	https://registry.npmjs.org/bare-fs/-/bare-fs-2.3.4.tgz
	https://registry.npmjs.org/bare-os/-/bare-os-2.4.3.tgz
	https://registry.npmjs.org/bare-path/-/bare-path-2.1.3.tgz
	https://registry.npmjs.org/bare-stream/-/bare-stream-2.3.0.tgz
	https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.3.0.tgz
	https://registry.npmjs.org/bin-links/-/bin-links-4.0.4.tgz
	https://registry.npmjs.org/bottleneck/-/bottleneck-2.19.5.tgz
	https://registry.npmjs.org/browserslist/-/browserslist-4.24.4.tgz
	https://registry.npmjs.org/cacache/-/cacache-18.0.4.tgz
	https://registry.npmjs.org/cac/-/cac-6.7.14.tgz
	https://registry.npmjs.org/caniuse-lite/-/caniuse-lite-1.0.30001704.tgz
	https://registry.npmjs.org/chai-as-promised/-/chai-as-promised-7.1.2.tgz
	https://registry.npmjs.org/chai/-/chai-5.1.2.tgz
	https://registry.npmjs.org/chalk/-/chalk-5.3.0.tgz
	https://registry.npmjs.org/char-regex/-/char-regex-1.0.2.tgz
	https://registry.npmjs.org/check-error/-/check-error-2.1.1.tgz
	https://registry.npmjs.org/cidr-regex/-/cidr-regex-4.1.1.tgz
	https://registry.npmjs.org/ci-info/-/ci-info-3.9.0.tgz
	https://registry.npmjs.org/clean-stack/-/clean-stack-5.2.0.tgz
	https://registry.npmjs.org/cli-cursor/-/cli-cursor-5.0.0.tgz
	https://registry.npmjs.org/cli-highlight/-/cli-highlight-2.1.11.tgz
	https://registry.npmjs.org/cli-table3/-/cli-table3-0.6.5.tgz
	https://registry.npmjs.org/cli-truncate/-/cli-truncate-4.0.0.tgz
	https://registry.npmjs.org/cli-width/-/cli-width-4.1.0.tgz
	https://registry.npmjs.org/commander/-/commander-9.5.0.tgz
	https://registry.npmjs.org/config-chain/-/config-chain-1.1.13.tgz
	https://registry.npmjs.org/conventional-changelog-writer/-/conventional-changelog-writer-7.0.1.tgz
	https://registry.npmjs.org/conventional-commits-filter/-/conventional-commits-filter-4.0.0.tgz
	https://registry.npmjs.org/conventional-commits-parser/-/conventional-commits-parser-5.0.0.tgz
	https://registry.npmjs.org/cookie/-/cookie-0.7.1.tgz
	https://registry.npmjs.org/core-js/-/core-js-3.38.0.tgz
	https://registry.npmjs.org/crypto-random-string/-/crypto-random-string-4.0.0.tgz
	https://registry.npmjs.org/data-uri-to-buffer/-/data-uri-to-buffer-4.0.1.tgz
	https://registry.npmjs.org/debug/-/debug-4.3.7.tgz
	https://registry.npmjs.org/decamelize/-/decamelize-6.0.0.tgz
	https://registry.npmjs.org/deep-eql/-/deep-eql-5.0.2.tgz
	https://registry.npmjs.org/deepmerge-ts/-/deepmerge-ts-7.1.0.tgz
	https://registry.npmjs.org/default-gateway/-/default-gateway-6.0.3.tgz
	https://registry.npmjs.org/edgedriver/-/edgedriver-6.1.1.tgz
	https://registry.npmjs.org/edge-paths/-/edge-paths-3.0.5.tgz
	https://registry.npmjs.org/editorconfig/-/editorconfig-1.0.4.tgz
	https://registry.npmjs.org/electron-to-chromium/-/electron-to-chromium-1.5.116.tgz
	https://registry.npmjs.org/emojilib/-/emojilib-2.4.0.tgz
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-10.4.0.tgz
	https://registry.npmjs.org/enhanced-resolve/-/enhanced-resolve-5.18.1.tgz
	https://registry.npmjs.org/env-ci/-/env-ci-10.0.0.tgz
	https://registry.npmjs.org/environment/-/environment-1.1.0.tgz
	https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.21.5.tgz -> @esbuild-aix-ppc64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/aix-ppc64/-/aix-ppc64-0.24.0.tgz -> @esbuild-aix-ppc64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.21.5.tgz -> @esbuild-android-arm64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/android-arm64/-/android-arm64-0.24.0.tgz -> @esbuild-android-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.21.5.tgz -> @esbuild-android-arm-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/android-arm/-/android-arm-0.24.0.tgz -> @esbuild-android-arm-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.21.5.tgz -> @esbuild-android-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/android-x64/-/android-x64-0.24.0.tgz -> @esbuild-android-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.21.5.tgz -> @esbuild-darwin-arm64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/darwin-arm64/-/darwin-arm64-0.24.0.tgz -> @esbuild-darwin-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.21.5.tgz -> @esbuild-darwin-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/darwin-x64/-/darwin-x64-0.24.0.tgz -> @esbuild-darwin-x64-0.24.0.tgz
	https://registry.npmjs.org/esbuild/-/esbuild-0.21.5.tgz
	https://registry.npmjs.org/esbuild/-/esbuild-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.21.5.tgz -> @esbuild-freebsd-arm64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/freebsd-arm64/-/freebsd-arm64-0.24.0.tgz -> @esbuild-freebsd-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.21.5.tgz -> @esbuild-freebsd-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/freebsd-x64/-/freebsd-x64-0.24.0.tgz -> @esbuild-freebsd-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.21.5.tgz -> @esbuild-linux-arm64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-arm64/-/linux-arm64-0.24.0.tgz -> @esbuild-linux-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.21.5.tgz -> @esbuild-linux-arm-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-arm/-/linux-arm-0.24.0.tgz -> @esbuild-linux-arm-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.21.5.tgz -> @esbuild-linux-ia32-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-ia32/-/linux-ia32-0.24.0.tgz -> @esbuild-linux-ia32-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.21.5.tgz -> @esbuild-linux-loong64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-loong64/-/linux-loong64-0.24.0.tgz -> @esbuild-linux-loong64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.21.5.tgz -> @esbuild-linux-mips64el-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-mips64el/-/linux-mips64el-0.24.0.tgz -> @esbuild-linux-mips64el-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.21.5.tgz -> @esbuild-linux-ppc64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-ppc64/-/linux-ppc64-0.24.0.tgz -> @esbuild-linux-ppc64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.21.5.tgz -> @esbuild-linux-riscv64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-riscv64/-/linux-riscv64-0.24.0.tgz -> @esbuild-linux-riscv64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.21.5.tgz -> @esbuild-linux-s390x-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-s390x/-/linux-s390x-0.24.0.tgz -> @esbuild-linux-s390x-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.21.5.tgz -> @esbuild-linux-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/linux-x64/-/linux-x64-0.24.0.tgz -> @esbuild-linux-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.21.5.tgz -> @esbuild-netbsd-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/netbsd-x64/-/netbsd-x64-0.24.0.tgz -> @esbuild-netbsd-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/openbsd-arm64/-/openbsd-arm64-0.24.0.tgz -> @esbuild-openbsd-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.21.5.tgz -> @esbuild-openbsd-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/openbsd-x64/-/openbsd-x64-0.24.0.tgz -> @esbuild-openbsd-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.21.5.tgz -> @esbuild-sunos-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/sunos-x64/-/sunos-x64-0.24.0.tgz -> @esbuild-sunos-x64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.21.5.tgz -> @esbuild-win32-arm64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/win32-arm64/-/win32-arm64-0.24.0.tgz -> @esbuild-win32-arm64-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.21.5.tgz -> @esbuild-win32-ia32-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/win32-ia32/-/win32-ia32-0.24.0.tgz -> @esbuild-win32-ia32-0.24.0.tgz
	https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.21.5.tgz -> @esbuild-win32-x64-0.21.5.tgz
	https://registry.npmjs.org/@esbuild/win32-x64/-/win32-x64-0.24.0.tgz -> @esbuild-win32-x64-0.24.0.tgz
	https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz
	https://registry.npmjs.org/escape-string-regexp/-/escape-string-regexp-5.0.0.tgz
	https://registry.npmjs.org/esm-env/-/esm-env-1.2.1.tgz
	https://registry.npmjs.org/esrap/-/esrap-1.2.3.tgz
	https://registry.npmjs.org/estree-walker/-/estree-walker-3.0.3.tgz
	https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.1.tgz
	https://registry.npmjs.org/execa/-/execa-8.0.1.tgz
	https://registry.npmjs.org/expect-type/-/expect-type-1.1.0.tgz
	https://registry.npmjs.org/exponential-backoff/-/exponential-backoff-3.1.1.tgz
	https://registry.npmjs.org/express/-/express-4.21.1.tgz
	https://registry.npmjs.org/fastest-levenshtein/-/fastest-levenshtein-1.0.16.tgz
	https://registry.npmjs.org/fast-uri/-/fast-uri-3.0.3.tgz
	https://registry.npmjs.org/fetch-blob/-/fetch-blob-3.2.0.tgz
	https://registry.npmjs.org/figures/-/figures-6.1.0.tgz
	https://registry.npmjs.org/find-up-simple/-/find-up-simple-1.0.0.tgz
	https://registry.npmjs.org/find-versions/-/find-versions-5.1.0.tgz
	https://registry.npmjs.org/firefox-profile/-/firefox-profile-4.7.0.tgz
	https://registry.npmjs.org/formdata-polyfill/-/formdata-polyfill-4.0.10.tgz
	https://registry.npmjs.org/fs-extra/-/fs-extra-7.0.1.tgz
	https://registry.npmjs.org/fs-minipass/-/fs-minipass-3.0.3.tgz
	https://registry.npmjs.org/geckodriver/-/geckodriver-5.0.0.tgz
	https://registry.npmjs.org/get-east-asian-width/-/get-east-asian-width-1.3.0.tgz
	https://registry.npmjs.org/get-port/-/get-port-7.1.0.tgz
	https://registry.npmjs.org/get-stream/-/get-stream-6.0.1.tgz
	https://registry.npmjs.org/get-stream/-/get-stream-7.0.1.tgz
	https://registry.npmjs.org/get-stream/-/get-stream-8.0.1.tgz
	https://registry.npmjs.org/get-tsconfig/-/get-tsconfig-4.10.0.tgz
	https://registry.npmjs.org/globby/-/globby-14.0.2.tgz
	https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.npmjs.org/highlight.js/-/highlight.js-10.7.3.tgz
	https://registry.npmjs.org/hook-std/-/hook-std-3.0.0.tgz
	https://registry.npmjs.org/hosted-git-info/-/hosted-git-info-7.0.2.tgz
	https://registry.npmjs.org/http-proxy-agent/-/http-proxy-agent-7.0.2.tgz
	https://registry.npmjs.org/human-signals/-/human-signals-5.0.0.tgz
	https://registry.npmjs.org/ignore-walk/-/ignore-walk-6.0.5.tgz
	https://registry.npmjs.org/import-from-esm/-/import-from-esm-1.3.4.tgz
	https://registry.npmjs.org/import-meta-resolve/-/import-meta-resolve-4.1.0.tgz
	https://registry.npmjs.org/indent-string/-/indent-string-5.0.0.tgz
	https://registry.npmjs.org/index-to-position/-/index-to-position-0.1.2.tgz
	https://registry.npmjs.org/ini/-/ini-4.1.3.tgz
	https://registry.npmjs.org/@inquirer/checkbox/-/checkbox-2.5.0.tgz -> @inquirer-checkbox-2.5.0.tgz
	https://registry.npmjs.org/@inquirer/confirm/-/confirm-3.2.0.tgz -> @inquirer-confirm-3.2.0.tgz
	https://registry.npmjs.org/@inquirer/core/-/core-9.2.1.tgz -> @inquirer-core-9.2.1.tgz
	https://registry.npmjs.org/@inquirer/editor/-/editor-2.2.0.tgz -> @inquirer-editor-2.2.0.tgz
	https://registry.npmjs.org/@inquirer/expand/-/expand-2.3.0.tgz -> @inquirer-expand-2.3.0.tgz
	https://registry.npmjs.org/@inquirer/figures/-/figures-1.0.7.tgz -> @inquirer-figures-1.0.7.tgz
	https://registry.npmjs.org/@inquirer/input/-/input-2.3.0.tgz -> @inquirer-input-2.3.0.tgz
	https://registry.npmjs.org/@inquirer/number/-/number-1.1.0.tgz -> @inquirer-number-1.1.0.tgz
	https://registry.npmjs.org/@inquirer/password/-/password-2.2.0.tgz -> @inquirer-password-2.2.0.tgz
	https://registry.npmjs.org/@inquirer/prompts/-/prompts-5.3.8.tgz -> @inquirer-prompts-5.3.8.tgz
	https://registry.npmjs.org/@inquirer/rawlist/-/rawlist-2.3.0.tgz -> @inquirer-rawlist-2.3.0.tgz
	https://registry.npmjs.org/@inquirer/search/-/search-1.1.0.tgz -> @inquirer-search-1.1.0.tgz
	https://registry.npmjs.org/@inquirer/select/-/select-2.5.0.tgz -> @inquirer-select-2.5.0.tgz
	https://registry.npmjs.org/@inquirer/type/-/type-1.5.5.tgz -> @inquirer-type-1.5.5.tgz
	https://registry.npmjs.org/@inquirer/type/-/type-2.0.0.tgz -> @inquirer-type-2.0.0.tgz
	https://registry.npmjs.org/into-stream/-/into-stream-7.0.0.tgz
	https://registry.npmjs.org/ip-address/-/ip-address-9.0.5.tgz
	https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-2.2.0.tgz
	https://registry.npmjs.org/ip-regex/-/ip-regex-5.0.0.tgz
	https://registry.npmjs.org/is-cidr/-/is-cidr-5.1.0.tgz
	https://registry.npmjs.org/isexe/-/isexe-3.1.1.tgz
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-4.0.0.tgz
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-5.0.0.tgz
	https://registry.npmjs.org/is-reference/-/is-reference-3.0.3.tgz
	https://registry.npmjs.org/is-stream/-/is-stream-3.0.0.tgz
	https://registry.npmjs.org/is-text-path/-/is-text-path-2.0.0.tgz
	https://registry.npmjs.org/is-unicode-supported/-/is-unicode-supported-2.0.0.tgz
	https://registry.npmjs.org/jackspeak/-/jackspeak-3.4.3.tgz
	https://registry.npmjs.org/java-properties/-/java-properties-1.0.2.tgz
	https://registry.npmjs.org/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.0.tgz -> @jridgewell-sourcemap-codec-1.5.0.tgz
	https://registry.npmjs.org/js-beautify/-/js-beautify-1.15.1.tgz
	https://registry.npmjs.org/jsbn/-/jsbn-1.1.0.tgz
	https://registry.npmjs.org/jsonc-parser/-/jsonc-parser-3.3.1.tgz
	https://registry.npmjs.org/jsonify/-/jsonify-0.0.1.tgz
	https://registry.npmjs.org/json-stable-stringify/-/json-stable-stringify-1.1.1.tgz
	https://registry.npmjs.org/libnpmdiff/-/libnpmdiff-6.1.4.tgz
	https://registry.npmjs.org/libnpmexec/-/libnpmexec-8.1.3.tgz
	https://registry.npmjs.org/libnpmfund/-/libnpmfund-5.0.12.tgz
	https://registry.npmjs.org/libnpmhook/-/libnpmhook-10.0.5.tgz
	https://registry.npmjs.org/libnpmorg/-/libnpmorg-6.0.6.tgz
	https://registry.npmjs.org/libnpmpack/-/libnpmpack-7.0.4.tgz
	https://registry.npmjs.org/libnpmsearch/-/libnpmsearch-7.0.6.tgz
	https://registry.npmjs.org/libnpmteam/-/libnpmteam-6.0.5.tgz
	https://registry.npmjs.org/libnpmversion/-/libnpmversion-6.0.3.tgz
	https://registry.npmjs.org/listr2/-/listr2-8.2.4.tgz
	https://registry.npmjs.org/locate-app/-/locate-app-2.4.43.tgz
	https://registry.npmjs.org/loglevel/-/loglevel-1.9.2.tgz
	https://registry.npmjs.org/loglevel-plugin-prefix/-/loglevel-plugin-prefix-0.8.4.tgz
	https://registry.npmjs.org/log-update/-/log-update-6.1.0.tgz
	https://registry.npmjs.org/loupe/-/loupe-3.1.2.tgz
	https://registry.npmjs.org/lru-cache/-/lru-cache-10.4.3.tgz
	https://registry.npmjs.org/magic-string/-/magic-string-0.30.14.tgz
	https://registry.npmjs.org/make-fetch-happen/-/make-fetch-happen-13.0.1.tgz
	https://registry.npmjs.org/marked/-/marked-9.1.6.tgz
	https://registry.npmjs.org/marked-terminal/-/marked-terminal-6.3.0.tgz
	https://registry.npmjs.org/memfs/-/memfs-3.6.0.tgz
	https://registry.npmjs.org/meow/-/meow-12.1.1.tgz
	https://registry.npmjs.org/mime/-/mime-3.0.0.tgz
	https://registry.npmjs.org/mimic-fn/-/mimic-fn-4.0.0.tgz
	https://registry.npmjs.org/mimic-function/-/mimic-function-5.0.1.tgz
	https://registry.npmjs.org/minimatch/-/minimatch-9.0.1.tgz
	https://registry.npmjs.org/minimatch/-/minimatch-9.0.5.tgz
	https://registry.npmjs.org/minipass-collect/-/minipass-collect-2.0.1.tgz
	https://registry.npmjs.org/minipass/-/minipass-7.1.2.tgz
	https://registry.npmjs.org/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.npmjs.org/mobx-react-lite/-/mobx-react-lite-4.0.7.tgz
	https://registry.npmjs.org/mobx-react/-/mobx-react-9.1.1.tgz
	https://registry.npmjs.org/mute-stream/-/mute-stream-1.0.0.tgz
	https://registry.npmjs.org/mz/-/mz-2.7.0.tgz
	https://registry.npmjs.org/node-domexception/-/node-domexception-1.0.0.tgz
	https://registry.npmjs.org/node-emoji/-/node-emoji-2.1.3.tgz
	https://registry.npmjs.org/node-fetch/-/node-fetch-3.3.2.tgz
	https://registry.npmjs.org/node-gyp/-/node-gyp-10.2.0.tgz
	https://registry.npmjs.org/node-releases/-/node-releases-2.0.19.tgz
	https://registry.npmjs.org/nopt/-/nopt-7.2.1.tgz
	https://registry.npmjs.org/normalize-package-data/-/normalize-package-data-6.0.2.tgz
	https://registry.npmjs.org/normalize-url/-/normalize-url-8.0.1.tgz
	https://registry.npmjs.org/npm-audit-report/-/npm-audit-report-5.0.0.tgz
	https://registry.npmjs.org/@npmcli/agent/-/agent-2.2.2.tgz -> @npmcli-agent-2.2.2.tgz
	https://registry.npmjs.org/@npmcli/config/-/config-8.3.4.tgz -> @npmcli-config-8.3.4.tgz
	https://registry.npmjs.org/@npmcli/fs/-/fs-3.1.1.tgz -> @npmcli-fs-3.1.1.tgz
	https://registry.npmjs.org/@npmcli/git/-/git-5.0.8.tgz -> @npmcli-git-5.0.8.tgz
	https://registry.npmjs.org/@npmcli/installed-package-contents/-/installed-package-contents-2.1.0.tgz -> @npmcli-installed-package-contents-2.1.0.tgz
	https://registry.npmjs.org/@npmcli/map-workspaces/-/map-workspaces-3.0.6.tgz -> @npmcli-map-workspaces-3.0.6.tgz
	https://registry.npmjs.org/@npmcli/metavuln-calculator/-/metavuln-calculator-7.1.1.tgz -> @npmcli-metavuln-calculator-7.1.1.tgz
	https://registry.npmjs.org/@npmcli/package-json/-/package-json-5.2.0.tgz -> @npmcli-package-json-5.2.0.tgz
	https://registry.npmjs.org/@npmcli/promise-spawn/-/promise-spawn-7.0.2.tgz -> @npmcli-promise-spawn-7.0.2.tgz
	https://registry.npmjs.org/@npmcli/query/-/query-3.1.0.tgz -> @npmcli-query-3.1.0.tgz
	https://registry.npmjs.org/@npmcli/redact/-/redact-2.0.1.tgz -> @npmcli-redact-2.0.1.tgz
	https://registry.npmjs.org/@npmcli/run-script/-/run-script-8.1.0.tgz -> @npmcli-run-script-8.1.0.tgz
	https://registry.npmjs.org/npm-install-checks/-/npm-install-checks-6.3.0.tgz
	https://registry.npmjs.org/npm/-/npm-10.8.2.tgz
	https://registry.npmjs.org/npm-package-arg/-/npm-package-arg-11.0.3.tgz
	https://registry.npmjs.org/npm-packlist/-/npm-packlist-8.0.2.tgz
	https://registry.npmjs.org/npm-pick-manifest/-/npm-pick-manifest-9.1.0.tgz
	https://registry.npmjs.org/npm-profile/-/npm-profile-10.0.0.tgz
	https://registry.npmjs.org/npm-registry-fetch/-/npm-registry-fetch-17.1.0.tgz
	https://registry.npmjs.org/npm-run-path/-/npm-run-path-5.3.0.tgz
	https://registry.npmjs.org/npm-user-validate/-/npm-user-validate-2.0.1.tgz
	https://registry.npmjs.org/@octokit/core/-/core-5.2.0.tgz -> @octokit-core-5.2.0.tgz
	https://registry.npmjs.org/@octokit/endpoint/-/endpoint-9.0.5.tgz -> @octokit-endpoint-9.0.5.tgz
	https://registry.npmjs.org/@octokit/graphql/-/graphql-7.1.0.tgz -> @octokit-graphql-7.1.0.tgz
	https://registry.npmjs.org/@octokit/openapi-types/-/openapi-types-20.0.0.tgz -> @octokit-openapi-types-20.0.0.tgz
	https://registry.npmjs.org/@octokit/openapi-types/-/openapi-types-22.2.0.tgz -> @octokit-openapi-types-22.2.0.tgz
	https://registry.npmjs.org/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-9.2.1.tgz -> @octokit-plugin-paginate-rest-9.2.1.tgz
	https://registry.npmjs.org/@octokit/plugin-retry/-/plugin-retry-6.0.1.tgz -> @octokit-plugin-retry-6.0.1.tgz
	https://registry.npmjs.org/@octokit/plugin-throttling/-/plugin-throttling-8.2.0.tgz -> @octokit-plugin-throttling-8.2.0.tgz
	https://registry.npmjs.org/@octokit/request-error/-/request-error-5.1.0.tgz -> @octokit-request-error-5.1.0.tgz
	https://registry.npmjs.org/@octokit/request/-/request-8.4.0.tgz -> @octokit-request-8.4.0.tgz
	https://registry.npmjs.org/@octokit/types/-/types-12.6.0.tgz -> @octokit-types-12.6.0.tgz
	https://registry.npmjs.org/@octokit/types/-/types-13.5.0.tgz -> @octokit-types-13.5.0.tgz
	https://registry.npmjs.org/@one-ini/wasm/-/wasm-0.1.1.tgz -> @one-ini-wasm-0.1.1.tgz
	https://registry.npmjs.org/onetime/-/onetime-6.0.0.tgz
	https://registry.npmjs.org/onetime/-/onetime-7.0.0.tgz
	https://registry.npmjs.org/package-json-from-dist/-/package-json-from-dist-1.0.0.tgz
	https://registry.npmjs.org/pacote/-/pacote-18.0.6.tgz
	https://registry.npmjs.org/parse5-htmlparser2-tree-adapter/-/parse5-htmlparser2-tree-adapter-6.0.1.tgz
	https://registry.npmjs.org/parse5/-/parse5-6.0.1.tgz
	https://registry.npmjs.org/parse-json/-/parse-json-8.1.0.tgz
	https://registry.npmjs.org/patch-package/-/patch-package-6.4.7.tgz
	https://registry.npmjs.org/path-key/-/path-key-4.0.0.tgz
	https://registry.npmjs.org/path-scurry/-/path-scurry-1.11.1.tgz
	https://registry.npmjs.org/path-type/-/path-type-5.0.0.tgz
	https://registry.npmjs.org/pathval/-/pathval-2.0.0.tgz
	https://registry.npmjs.org/p-each-series/-/p-each-series-2.2.0.tgz
	https://registry.npmjs.org/p-each-series/-/p-each-series-3.0.0.tgz
	https://registry.npmjs.org/p-filter/-/p-filter-4.1.0.tgz
	https://registry.npmjs.org/playwright-core/-/playwright-core-1.24.2.tgz
	https://registry.npmjs.org/playwright-webkit/-/playwright-webkit-1.24.2.tgz
	https://registry.npmjs.org/@pnpm/config.env-replace/-/config.env-replace-1.1.0.tgz -> @pnpm-config.env-replace-1.1.0.tgz
	https://registry.npmjs.org/@pnpm/network.ca-file/-/network.ca-file-1.0.2.tgz -> @pnpm-network.ca-file-1.0.2.tgz
	https://registry.npmjs.org/@pnpm/npm-conf/-/npm-conf-2.3.1.tgz -> @pnpm-npm-conf-2.3.1.tgz
	https://registry.npmjs.org/portfinder/-/portfinder-1.0.32.tgz
	https://registry.npmjs.org/p-reduce/-/p-reduce-3.0.0.tgz
	https://registry.npmjs.org/p-retry/-/p-retry-4.6.2.tgz
	https://registry.npmjs.org/proc-log/-/proc-log-4.2.0.tgz
	https://registry.npmjs.org/proggy/-/proggy-2.0.0.tgz
	https://registry.npmjs.org/promise-call-limit/-/promise-call-limit-3.0.1.tgz
	https://registry.npmjs.org/@promptbook/utils/-/utils-0.70.0-1.tgz -> @promptbook-utils-0.70.0-1.tgz
	https://registry.npmjs.org/promzard/-/promzard-1.0.2.tgz
	https://registry.npmjs.org/proxy-agent/-/proxy-agent-6.4.0.tgz
	https://registry.npmjs.org/pump/-/pump-3.0.2.tgz
	https://registry.npmjs.org/@puppeteer/browsers/-/browsers-2.4.0.tgz -> @puppeteer-browsers-2.4.0.tgz
	https://registry.npmjs.org/ramda/-/ramda-0.27.2.tgz
	https://registry.npmjs.org/react-dom/-/react-dom-18.3.1.tgz
	https://registry.npmjs.org/react/-/react-18.3.1.tgz
	https://registry.npmjs.org/react-router-dom/-/react-router-dom-6.28.0.tgz
	https://registry.npmjs.org/react-router/-/react-router-6.28.0.tgz
	https://registry.npmjs.org/read-pkg/-/read-pkg-9.0.1.tgz
	https://registry.npmjs.org/read-pkg-up/-/read-pkg-up-11.0.0.tgz
	https://registry.npmjs.org/read/-/read-3.0.1.tgz
	https://registry.npmjs.org/registry-auth-token/-/registry-auth-token-5.0.2.tgz
	https://registry.npmjs.org/@remix-run/router/-/router-1.21.0.tgz -> @remix-run-router-1.21.0.tgz
	https://registry.npmjs.org/resolve-pkg-maps/-/resolve-pkg-maps-1.0.0.tgz
	https://registry.npmjs.org/restore-cursor/-/restore-cursor-5.1.0.tgz
	https://registry.npmjs.org/rfdc/-/rfdc-1.4.1.tgz
	https://registry.npmjs.org/rollup/-/rollup-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-android-arm64/-/rollup-android-arm64-4.27.4.tgz -> @rollup-rollup-android-arm64-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-android-arm-eabi/-/rollup-android-arm-eabi-4.27.4.tgz -> @rollup-rollup-android-arm-eabi-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-darwin-arm64/-/rollup-darwin-arm64-4.27.4.tgz -> @rollup-rollup-darwin-arm64-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-darwin-x64/-/rollup-darwin-x64-4.27.4.tgz -> @rollup-rollup-darwin-x64-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-freebsd-arm64/-/rollup-freebsd-arm64-4.27.4.tgz -> @rollup-rollup-freebsd-arm64-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-freebsd-x64/-/rollup-freebsd-x64-4.27.4.tgz -> @rollup-rollup-freebsd-x64-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.27.4.tgz -> @rollup-rollup-linux-arm64-gnu-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.27.4.tgz -> @rollup-rollup-linux-arm64-musl-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm-gnueabihf/-/rollup-linux-arm-gnueabihf-4.27.4.tgz -> @rollup-rollup-linux-arm-gnueabihf-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-arm-musleabihf/-/rollup-linux-arm-musleabihf-4.27.4.tgz -> @rollup-rollup-linux-arm-musleabihf-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-powerpc64le-gnu/-/rollup-linux-powerpc64le-gnu-4.27.4.tgz -> @rollup-rollup-linux-powerpc64le-gnu-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-riscv64-gnu/-/rollup-linux-riscv64-gnu-4.27.4.tgz -> @rollup-rollup-linux-riscv64-gnu-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-s390x-gnu/-/rollup-linux-s390x-gnu-4.27.4.tgz -> @rollup-rollup-linux-s390x-gnu-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.27.4.tgz -> @rollup-rollup-linux-x64-gnu-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.27.4.tgz -> @rollup-rollup-linux-x64-musl-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-arm64-msvc/-/rollup-win32-arm64-msvc-4.27.4.tgz -> @rollup-rollup-win32-arm64-msvc-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-ia32-msvc/-/rollup-win32-ia32-msvc-4.27.4.tgz -> @rollup-rollup-win32-ia32-msvc-4.27.4.tgz
	https://registry.npmjs.org/@rollup/rollup-win32-x64-msvc/-/rollup-win32-x64-msvc-4.27.4.tgz -> @rollup-rollup-win32-x64-msvc-4.27.4.tgz
	https://registry.npmjs.org/rxjs/-/rxjs-7.8.1.tgz
	https://registry.npmjs.org/safaridriver/-/safaridriver-1.0.0.tgz
	https://registry.npmjs.org/scheduler/-/scheduler-0.23.2.tgz
	https://registry.npmjs.org/@schematics/angular/-/angular-18.2.11.tgz -> @schematics-angular-18.2.11.tgz
	https://registry.npmjs.org/schema-utils/-/schema-utils-4.3.0.tgz
	https://registry.npmjs.org/@semantic-release/changelog/-/changelog-6.0.3.tgz -> @semantic-release-changelog-6.0.3.tgz
	https://registry.npmjs.org/@semantic-release/commit-analyzer/-/commit-analyzer-11.1.0.tgz -> @semantic-release-commit-analyzer-11.1.0.tgz
	https://registry.npmjs.org/@semantic-release/error/-/error-4.0.0.tgz -> @semantic-release-error-4.0.0.tgz
	https://registry.npmjs.org/@semantic-release/github/-/github-9.2.6.tgz -> @semantic-release-github-9.2.6.tgz
	https://registry.npmjs.org/semantic-release-monorepo/-/semantic-release-monorepo-8.0.2.tgz
	https://registry.npmjs.org/@semantic-release/npm/-/npm-11.0.3.tgz -> @semantic-release-npm-11.0.3.tgz
	https://registry.npmjs.org/semantic-release-plugin-decorators/-/semantic-release-plugin-decorators-4.0.0.tgz
	https://registry.npmjs.org/@semantic-release/release-notes-generator/-/release-notes-generator-12.1.0.tgz -> @semantic-release-release-notes-generator-12.1.0.tgz
	https://registry.npmjs.org/semantic-release/-/semantic-release-22.0.12.tgz
	https://registry.npmjs.org/semver-diff/-/semver-diff-4.0.0.tgz
	https://registry.npmjs.org/semver-regex/-/semver-regex-4.0.5.tgz
	https://registry.npmjs.org/semver/-/semver-7.6.3.tgz
	https://registry.npmjs.org/serialize-javascript/-/serialize-javascript-6.0.2.tgz
	https://registry.npmjs.org/siginfo/-/siginfo-2.0.0.tgz
	https://registry.npmjs.org/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.npmjs.org/@sigstore/bundle/-/bundle-2.3.2.tgz -> @sigstore-bundle-2.3.2.tgz
	https://registry.npmjs.org/@sigstore/core/-/core-1.1.0.tgz -> @sigstore-core-1.1.0.tgz
	https://registry.npmjs.org/@sigstore/protobuf-specs/-/protobuf-specs-0.3.2.tgz -> @sigstore-protobuf-specs-0.3.2.tgz
	https://registry.npmjs.org/@sigstore/sign/-/sign-2.3.2.tgz -> @sigstore-sign-2.3.2.tgz
	https://registry.npmjs.org/sigstore/-/sigstore-2.3.1.tgz
	https://registry.npmjs.org/@sigstore/tuf/-/tuf-2.3.4.tgz -> @sigstore-tuf-2.3.4.tgz
	https://registry.npmjs.org/@sigstore/verify/-/verify-1.2.1.tgz -> @sigstore-verify-1.2.1.tgz
	https://registry.npmjs.org/@sindresorhus/merge-streams/-/merge-streams-2.3.0.tgz -> @sindresorhus-merge-streams-2.3.0.tgz
	https://registry.npmjs.org/skin-tone/-/skin-tone-2.0.0.tgz
	https://registry.npmjs.org/slash/-/slash-5.1.0.tgz
	https://registry.npmjs.org/slice-ansi/-/slice-ansi-5.0.0.tgz
	https://registry.npmjs.org/slice-ansi/-/slice-ansi-7.1.0.tgz
	https://registry.npmjs.org/socks-proxy-agent/-/socks-proxy-agent-8.0.4.tgz
	https://registry.npmjs.org/socks/-/socks-2.8.3.tgz
	https://registry.npmjs.org/spacetrim/-/spacetrim-0.11.39.tgz
	https://registry.npmjs.org/spdx-expression-parse/-/spdx-expression-parse-4.0.0.tgz
	https://registry.npmjs.org/split2/-/split2-4.2.0.tgz
	https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.1.3.tgz
	https://registry.npmjs.org/ssri/-/ssri-10.0.6.tgz
	https://registry.npmjs.org/stackback/-/stackback-0.0.2.tgz
	https://registry.npmjs.org/streamx/-/streamx-2.20.0.tgz
	https://registry.npmjs.org/string-width/-/string-width-7.2.0.tgz
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.npmjs.org/strip-final-newline/-/strip-final-newline-3.0.0.tgz
	https://registry.npmjs.org/supports-color/-/supports-color-9.4.0.tgz
	https://registry.npmjs.org/supports-hyperlinks/-/supports-hyperlinks-3.1.0.tgz
	https://registry.npmjs.org/svelte/-/svelte-5.4.0.tgz
	https://registry.npmjs.org/tar-fs/-/tar-fs-3.0.6.tgz
	https://registry.npmjs.org/tar/-/tar-6.2.1.tgz
	https://registry.npmjs.org/temp-dir/-/temp-dir-3.0.0.tgz
	https://registry.npmjs.org/tempy/-/tempy-1.0.1.tgz
	https://registry.npmjs.org/tempy/-/tempy-3.1.0.tgz
	https://registry.npmjs.org/terser-webpack-plugin/-/terser-webpack-plugin-5.3.14.tgz
	https://registry.npmjs.org/text-decoder/-/text-decoder-1.1.1.tgz
	https://registry.npmjs.org/text-extensions/-/text-extensions-2.4.0.tgz
	https://registry.npmjs.org/tinybench/-/tinybench-2.9.0.tgz
	https://registry.npmjs.org/tinypool/-/tinypool-1.0.1.tgz
	https://registry.npmjs.org/tinyrainbow/-/tinyrainbow-1.2.0.tgz
	https://registry.npmjs.org/tinyspy/-/tinyspy-3.0.2.tgz
	https://registry.npmjs.org/tsconfig-paths-webpack-plugin/-/tsconfig-paths-webpack-plugin-3.5.2.tgz
	https://registry.npmjs.org/ts-loader/-/ts-loader-9.5.2.tgz
	https://registry.npmjs.org/@tufjs/canonical-json/-/canonical-json-2.0.0.tgz -> @tufjs-canonical-json-2.0.0.tgz
	https://registry.npmjs.org/@tufjs/models/-/models-2.0.1.tgz -> @tufjs-models-2.0.1.tgz
	https://registry.npmjs.org/tuf-js/-/tuf-js-2.2.1.tgz
	https://registry.npmjs.org/type-fest/-/type-fest-1.4.0.tgz
	https://registry.npmjs.org/type-fest/-/type-fest-2.13.0.tgz
	https://registry.npmjs.org/type-fest/-/type-fest-2.19.0.tgz
	https://registry.npmjs.org/type-fest/-/type-fest-4.25.0.tgz
	https://registry.npmjs.org/@types/btoa-lite/-/btoa-lite-1.0.0.tgz -> @types-btoa-lite-1.0.0.tgz
	https://registry.npmjs.org/@types/chai-enzyme/-/chai-enzyme-0.6.13.tgz -> @types-chai-enzyme-0.6.13.tgz
	https://registry.npmjs.org/@types/eslint-scope/-/eslint-scope-3.7.7.tgz -> @types-eslint-scope-3.7.7.tgz
	https://registry.npmjs.org/@types/estree/-/estree-1.0.6.tgz -> @types-estree-1.0.6.tgz
	https://registry.npmjs.org/@types/jsonwebtoken/-/jsonwebtoken-8.5.8.tgz -> @types-jsonwebtoken-8.5.8.tgz
	https://registry.npmjs.org/@types/mime/-/mime-3.0.4.tgz -> @types-mime-3.0.4.tgz
	https://registry.npmjs.org/@types/mute-stream/-/mute-stream-0.0.4.tgz -> @types-mute-stream-0.0.4.tgz
	https://registry.npmjs.org/@types/normalize-package-data/-/normalize-package-data-2.4.4.tgz -> @types-normalize-package-data-2.4.4.tgz
	https://registry.npmjs.org/@types/react-dom/-/react-dom-18.3.1.tgz -> @types-react-dom-18.3.1.tgz
	https://registry.npmjs.org/@types/retry/-/retry-0.12.0.tgz -> @types-retry-0.12.0.tgz
	https://registry.npmjs.org/@types/which/-/which-2.0.2.tgz -> @types-which-2.0.2.tgz
	https://registry.npmjs.org/@types/wrap-ansi/-/wrap-ansi-3.0.0.tgz -> @types-wrap-ansi-3.0.0.tgz
	https://registry.npmjs.org/@types/ws/-/ws-8.5.12.tgz -> @types-ws-8.5.12.tgz
	https://registry.npmjs.org/undici/-/undici-6.21.0.tgz
	https://registry.npmjs.org/unicode-emoji-modifier-base/-/unicode-emoji-modifier-base-1.0.0.tgz
	https://registry.npmjs.org/unicorn-magic/-/unicorn-magic-0.1.0.tgz
	https://registry.npmjs.org/unique-string/-/unique-string-3.0.0.tgz
	https://registry.npmjs.org/update-browserslist-db/-/update-browserslist-db-1.1.3.tgz
	https://registry.npmjs.org/url-join/-/url-join-5.0.0.tgz
	https://registry.npmjs.org/userhome/-/userhome-1.0.0.tgz
	https://registry.npmjs.org/validate-npm-package-name/-/validate-npm-package-name-5.0.1.tgz
	https://registry.npmjs.org/@vitejs/plugin-react/-/plugin-react-4.3.3.tgz -> @vitejs-plugin-react-4.3.3.tgz
	https://registry.npmjs.org/vite-node/-/vite-node-2.1.4.tgz
	https://registry.npmjs.org/@vitest/expect/-/expect-2.1.4.tgz -> @vitest-expect-2.1.4.tgz
	https://registry.npmjs.org/@vitest/mocker/-/mocker-2.1.4.tgz -> @vitest-mocker-2.1.4.tgz
	https://registry.npmjs.org/@vitest/pretty-format/-/pretty-format-2.1.4.tgz -> @vitest-pretty-format-2.1.4.tgz
	https://registry.npmjs.org/@vitest/runner/-/runner-2.1.4.tgz -> @vitest-runner-2.1.4.tgz
	https://registry.npmjs.org/@vitest/snapshot/-/snapshot-2.1.4.tgz -> @vitest-snapshot-2.1.4.tgz
	https://registry.npmjs.org/@vitest/spy/-/spy-2.1.4.tgz -> @vitest-spy-2.1.4.tgz
	https://registry.npmjs.org/@vitest/utils/-/utils-2.1.4.tgz -> @vitest-utils-2.1.4.tgz
	https://registry.npmjs.org/vitest/-/vitest-2.1.4.tgz
	https://registry.npmjs.org/vite/-/vite-5.4.10.tgz
	https://registry.npmjs.org/vite/-/vite-6.0.0.tgz
	https://registry.npmjs.org/vue-component-type-helpers/-/vue-component-type-helpers-2.1.10.tgz
	https://registry.npmjs.org/@vue/test-utils/-/test-utils-2.4.6.tgz -> @vue-test-utils-2.4.6.tgz
	https://registry.npmjs.org/wait-port/-/wait-port-1.1.0.tgz
	https://registry.npmjs.org/walk-up-path/-/walk-up-path-3.0.1.tgz
	https://registry.npmjs.org/watchpack/-/watchpack-2.4.2.tgz
	https://registry.npmjs.org/@wdio/config/-/config-9.7.3.tgz -> @wdio-config-9.7.3.tgz
	https://registry.npmjs.org/@wdio/logger/-/logger-9.4.4.tgz -> @wdio-logger-9.4.4.tgz
	https://registry.npmjs.org/@wdio/protocols/-/protocols-9.7.0.tgz -> @wdio-protocols-9.7.0.tgz
	https://registry.npmjs.org/@wdio/types/-/types-9.6.3.tgz -> @wdio-types-9.6.3.tgz
	https://registry.npmjs.org/@wdio/utils/-/utils-9.7.3.tgz -> @wdio-utils-9.7.3.tgz
	https://registry.npmjs.org/@webassemblyjs/ast/-/ast-1.14.1.tgz -> @webassemblyjs-ast-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.13.2.tgz -> @webassemblyjs-floating-point-hex-parser-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/helper-api-error/-/helper-api-error-1.13.2.tgz -> @webassemblyjs-helper-api-error-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/helper-buffer/-/helper-buffer-1.14.1.tgz -> @webassemblyjs-helper-buffer-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/helper-numbers/-/helper-numbers-1.13.2.tgz -> @webassemblyjs-helper-numbers-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.13.2.tgz -> @webassemblyjs-helper-wasm-bytecode-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.14.1.tgz -> @webassemblyjs-helper-wasm-section-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/ieee754/-/ieee754-1.13.2.tgz -> @webassemblyjs-ieee754-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/leb128/-/leb128-1.13.2.tgz -> @webassemblyjs-leb128-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/utf8/-/utf8-1.13.2.tgz -> @webassemblyjs-utf8-1.13.2.tgz
	https://registry.npmjs.org/@webassemblyjs/wasm-edit/-/wasm-edit-1.14.1.tgz -> @webassemblyjs-wasm-edit-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/wasm-gen/-/wasm-gen-1.14.1.tgz -> @webassemblyjs-wasm-gen-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/wasm-opt/-/wasm-opt-1.14.1.tgz -> @webassemblyjs-wasm-opt-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/wasm-parser/-/wasm-parser-1.14.1.tgz -> @webassemblyjs-wasm-parser-1.14.1.tgz
	https://registry.npmjs.org/@webassemblyjs/wast-printer/-/wast-printer-1.14.1.tgz -> @webassemblyjs-wast-printer-1.14.1.tgz
	https://registry.npmjs.org/webdriver/-/webdriver-9.7.3.tgz
	https://registry.npmjs.org/webpack-dev-middleware/-/webpack-dev-middleware-5.3.4.tgz
	https://registry.npmjs.org/webpack-dev-middleware/-/webpack-dev-middleware-7.4.2.tgz
	https://registry.npmjs.org/webpack-dev-server/-/webpack-dev-server-4.15.2.tgz
	https://registry.npmjs.org/webpack-dev-server/-/webpack-dev-server-5.1.0.tgz
	https://registry.npmjs.org/webpack/-/webpack-5.98.0.tgz
	https://registry.npmjs.org/web-streams-polyfill/-/web-streams-polyfill-3.3.3.tgz
	https://registry.npmjs.org/which/-/which-4.0.0.tgz
	https://registry.npmjs.org/why-is-node-running/-/why-is-node-running-2.3.0.tgz
	https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-9.0.0.tgz
	https://registry.npmjs.org/ws/-/ws-8.18.0.tgz
	https://registry.npmjs.org/xml2js/-/xml2js-0.6.2.tgz
	https://registry.npmjs.org/yaml/-/yaml-2.7.0.tgz
	https://registry.npmjs.org/yoctocolors-cjs/-/yoctocolors-cjs-2.1.2.tgz
	https://registry.npmjs.org/zimmerframe/-/zimmerframe-1.1.2.tgz
	https://registry.npmjs.org/@zip.js/zip.js/-/zip.js-2.7.54.tgz -> @zip.js-zip.js-2.7.54.tgz
	https://registry.npmmirror.com/rimraf/-/rimraf-5.0.10.tgz
	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.2.0.tgz
	https://registry.yarnpkg.com/@aashutoshrathi/word-wrap/-/word-wrap-1.2.6.tgz -> @aashutoshrathi-word-wrap-1.2.6.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-2.0.0.tgz
	https://registry.yarnpkg.com/abort-controller/-/abort-controller-3.0.0.tgz
	https://registry.yarnpkg.com/abstract-leveldown/-/abstract-leveldown-0.12.4.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.8.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-6.4.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.4.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.14.1.tgz
	https://registry.yarnpkg.com/acorn-import-assertions/-/acorn-import-assertions-1.9.0.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-node/-/acorn-node-1.8.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-7.2.0.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-8.2.0.tgz
	https://registry.yarnpkg.com/address/-/address-1.1.2.tgz
	https://registry.yarnpkg.com/add-stream/-/add-stream-1.0.0.tgz
	https://registry.yarnpkg.com/adjust-sourcemap-loader/-/adjust-sourcemap-loader-4.0.0.tgz
	https://registry.yarnpkg.com/adm-zip/-/adm-zip-0.5.10.tgz
	https://registry.yarnpkg.com/after/-/after-0.8.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-4.3.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.3.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-4.2.1.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/airbnb-prop-types/-/airbnb-prop-types-2.16.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.12.0.tgz
	https://registry.yarnpkg.com/ajv-errors/-/ajv-errors-1.0.1.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-5.1.0.tgz
	https://registry.yarnpkg.com/align-text/-/align-text-0.1.4.tgz
	https://registry.yarnpkg.com/@alloc/quick-lru/-/quick-lru-5.2.0.tgz -> @alloc-quick-lru-5.2.0.tgz
	https://registry.yarnpkg.com/ally.js/-/ally.js-1.4.1.tgz
	https://registry.yarnpkg.com/amdefine/-/amdefine-1.0.1.tgz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.3.0.tgz -> @ampproject-remapping-2.3.0.tgz
	https://registry.yarnpkg.com/@angular/common/-/common-17.3.10.tgz -> @angular-common-17.3.10.tgz
	https://registry.yarnpkg.com/@angular/core/-/core-17.3.10.tgz -> @angular-core-17.3.10.tgz
	https://registry.yarnpkg.com/@angular/platform-browser-dynamic/-/platform-browser-dynamic-17.3.10.tgz -> @angular-platform-browser-dynamic-17.3.10.tgz
	https://registry.yarnpkg.com/ansi-align/-/ansi-align-3.0.1.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-1.1.0.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-3.2.3.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.3.tgz
	https://registry.yarnpkg.com/ansi-cyan/-/ansi-cyan-0.1.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-3.2.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.2.tgz
	https://registry.yarnpkg.com/ansi-gray/-/ansi-gray-0.1.1.tgz
	https://registry.yarnpkg.com/ansi-html-community/-/ansi-html-community-0.0.8.tgz
	https://registry.yarnpkg.com/ansi-red/-/ansi-red-0.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-3.0.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-2.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-5.2.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/ansi-to-html/-/ansi-to-html-0.6.14.tgz
	https://registry.yarnpkg.com/ansi-to-html/-/ansi-to-html-0.7.2.tgz
	https://registry.yarnpkg.com/ansi_up/-/ansi_up-5.0.0.tgz
	https://registry.yarnpkg.com/ansi-wrap/-/ansi-wrap-0.1.0.tgz
	https://registry.yarnpkg.com/@antfu/install-pkg/-/install-pkg-0.3.3.tgz -> @antfu-install-pkg-0.3.3.tgz
	https://registry.yarnpkg.com/@antfu/install-pkg/-/install-pkg-1.0.0.tgz -> @antfu-install-pkg-1.0.0.tgz
	https://registry.yarnpkg.com/@antfu/utils/-/utils-0.7.8.tgz -> @antfu-utils-0.7.8.tgz
	https://registry.yarnpkg.com/@antfu/utils/-/utils-8.1.1.tgz -> @antfu-utils-8.1.1.tgz
	https://registry.yarnpkg.com/any-base/-/any-base-1.1.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-2.0.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.2.tgz
	https://registry.yarnpkg.com/any-observable/-/any-observable-0.3.0.tgz
	https://registry.yarnpkg.com/any-promise/-/any-promise-1.3.0.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-5.0.0-alpha.10.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-25.1.8.tgz
	https://registry.yarnpkg.com/append-buffer/-/append-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/append-field/-/append-field-1.0.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-2.0.0.tgz
	https://registry.yarnpkg.com/arch/-/arch-2.2.0.tgz
	https://registry.yarnpkg.com/archy/-/archy-1.0.0.tgz
	https://registry.yarnpkg.com/@ardatan/aggregate-error/-/aggregate-error-0.0.6.tgz -> @ardatan-aggregate-error-0.0.6.tgz
	https://registry.yarnpkg.com/@ardatan/fetch-event-source/-/fetch-event-source-2.0.2.tgz -> @ardatan-fetch-event-source-2.0.2.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.5.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-3.0.1.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.0.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.3.tgz
	https://registry.yarnpkg.com/arg/-/arg-5.0.2.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/argv-formatter/-/argv-formatter-1.0.0.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-5.3.0.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-5.3.2.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/arraybuffer-loader/-/arraybuffer-loader-1.0.8.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.3.tgz
	https://registry.yarnpkg.com/arraybuffer.slice/-/arraybuffer.slice-0.0.7.tgz
	https://registry.yarnpkg.com/array-differ/-/array-differ-3.0.0.tgz
	https://registry.yarnpkg.com/array-each/-/array-each-1.0.1.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-1.1.1.tgz
	https://registry.yarnpkg.com/array-from/-/array-from-2.1.1.tgz
	https://registry.yarnpkg.com/array-ify/-/array-ify-1.0.0.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.8.tgz
	https://registry.yarnpkg.com/array-initial/-/array-initial-1.1.0.tgz
	https://registry.yarnpkg.com/array-last/-/array-last-1.3.0.tgz
	https://registry.yarnpkg.com/array.prototype.find/-/array.prototype.find-2.1.1.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.5.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.2.tgz
	https://registry.yarnpkg.com/array-slice/-/array-slice-0.2.3.tgz
	https://registry.yarnpkg.com/array-slice/-/array-slice-1.1.0.tgz
	https://registry.yarnpkg.com/array-sort/-/array-sort-1.0.0.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-1.0.2.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array-uniq/-/array-uniq-1.0.2.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-1.1.0.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-4.0.0.tgz
	https://registry.yarnpkg.com/arr-filter/-/arr-filter-1.1.2.tgz
	https://registry.yarnpkg.com/arr-flatten/-/arr-flatten-1.1.0.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-2.0.1.tgz
	https://registry.yarnpkg.com/arr-map/-/arr-map-2.0.2.tgz
	https://registry.yarnpkg.com/arr-union/-/arr-union-2.1.0.tgz
	https://registry.yarnpkg.com/arr-union/-/arr-union-3.1.0.tgz
	https://registry.yarnpkg.com/@asamuzakjp/css-color/-/css-color-2.8.2.tgz -> @asamuzakjp-css-color-2.8.2.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz
	https://registry.yarnpkg.com/ascii-table/-/ascii-table-0.0.9.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.6.tgz
	https://registry.yarnpkg.com/asn1.js/-/asn1.js-5.4.1.tgz
	https://registry.yarnpkg.com/assert/-/assert-1.4.1.tgz
	https://registry.yarnpkg.com/assert/-/assert-2.0.0.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-1.0.0.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-1.1.0.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/assign-symbols/-/assign-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.13.3.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.13.4.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.14.2.tgz
	https://registry.yarnpkg.com/async/-/async-0.9.2.tgz
	https://registry.yarnpkg.com/async/-/async-2.6.4.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.4.tgz
	https://registry.yarnpkg.com/async-done/-/async-done-1.3.2.tgz
	https://registry.yarnpkg.com/async-each/-/async-each-1.0.3.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/async-limiter/-/async-limiter-1.0.1.tgz
	https://registry.yarnpkg.com/async-settle/-/async-settle-1.0.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/atob/-/atob-2.1.2.tgz
	https://registry.yarnpkg.com/author-regex/-/author-regex-1.0.0.tgz
	https://registry.yarnpkg.com/autobarrel/-/autobarrel-1.1.0.tgz
	https://registry.yarnpkg.com/auto-bind/-/auto-bind-4.0.0.tgz
	https://registry.yarnpkg.com/autoprefixer/-/autoprefixer-10.4.20.tgz
	https://registry.yarnpkg.com/autoprefixer/-/autoprefixer-9.8.6.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.11.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/crc32c/-/crc32c-3.0.0.tgz -> @aws-crypto-crc32c-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/crc32/-/crc32-3.0.0.tgz -> @aws-crypto-crc32-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/ie11-detection/-/ie11-detection-2.0.2.tgz -> @aws-crypto-ie11-detection-2.0.2.tgz
	https://registry.yarnpkg.com/@aws-crypto/ie11-detection/-/ie11-detection-3.0.0.tgz -> @aws-crypto-ie11-detection-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha1-browser/-/sha1-browser-3.0.0.tgz -> @aws-crypto-sha1-browser-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha256-browser/-/sha256-browser-2.0.0.tgz -> @aws-crypto-sha256-browser-2.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha256-browser/-/sha256-browser-3.0.0.tgz -> @aws-crypto-sha256-browser-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha256-js/-/sha256-js-2.0.0.tgz -> @aws-crypto-sha256-js-2.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha256-js/-/sha256-js-2.0.2.tgz -> @aws-crypto-sha256-js-2.0.2.tgz
	https://registry.yarnpkg.com/@aws-crypto/sha256-js/-/sha256-js-3.0.0.tgz -> @aws-crypto-sha256-js-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/supports-web-crypto/-/supports-web-crypto-2.0.2.tgz -> @aws-crypto-supports-web-crypto-2.0.2.tgz
	https://registry.yarnpkg.com/@aws-crypto/supports-web-crypto/-/supports-web-crypto-3.0.0.tgz -> @aws-crypto-supports-web-crypto-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-crypto/util/-/util-2.0.2.tgz -> @aws-crypto-util-2.0.2.tgz
	https://registry.yarnpkg.com/@aws-crypto/util/-/util-3.0.0.tgz -> @aws-crypto-util-3.0.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/abort-controller/-/abort-controller-3.53.0.tgz -> @aws-sdk-abort-controller-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-cognito-identity/-/client-cognito-identity-3.53.0.tgz -> @aws-sdk-client-cognito-identity-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-s3/-/client-s3-3.485.0.tgz -> @aws-sdk-client-s3-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-sso/-/client-sso-3.485.0.tgz -> @aws-sdk-client-sso-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-sso/-/client-sso-3.53.0.tgz -> @aws-sdk-client-sso-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-sts/-/client-sts-3.485.0.tgz -> @aws-sdk-client-sts-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/client-sts/-/client-sts-3.53.0.tgz -> @aws-sdk-client-sts-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/config-resolver/-/config-resolver-3.53.0.tgz -> @aws-sdk-config-resolver-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/core/-/core-3.485.0.tgz -> @aws-sdk-core-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-cognito-identity/-/credential-provider-cognito-identity-3.53.0.tgz -> @aws-sdk-credential-provider-cognito-identity-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-env/-/credential-provider-env-3.485.0.tgz -> @aws-sdk-credential-provider-env-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-env/-/credential-provider-env-3.53.0.tgz -> @aws-sdk-credential-provider-env-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-imds/-/credential-provider-imds-3.53.0.tgz -> @aws-sdk-credential-provider-imds-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-ini/-/credential-provider-ini-3.485.0.tgz -> @aws-sdk-credential-provider-ini-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-ini/-/credential-provider-ini-3.53.0.tgz -> @aws-sdk-credential-provider-ini-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-node/-/credential-provider-node-3.485.0.tgz -> @aws-sdk-credential-provider-node-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-node/-/credential-provider-node-3.53.0.tgz -> @aws-sdk-credential-provider-node-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-process/-/credential-provider-process-3.485.0.tgz -> @aws-sdk-credential-provider-process-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-process/-/credential-provider-process-3.53.0.tgz -> @aws-sdk-credential-provider-process-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-providers/-/credential-providers-3.53.0.tgz -> @aws-sdk-credential-providers-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-sso/-/credential-provider-sso-3.485.0.tgz -> @aws-sdk-credential-provider-sso-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-sso/-/credential-provider-sso-3.53.0.tgz -> @aws-sdk-credential-provider-sso-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-web-identity/-/credential-provider-web-identity-3.485.0.tgz -> @aws-sdk-credential-provider-web-identity-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/credential-provider-web-identity/-/credential-provider-web-identity-3.53.0.tgz -> @aws-sdk-credential-provider-web-identity-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/fetch-http-handler/-/fetch-http-handler-3.53.0.tgz -> @aws-sdk-fetch-http-handler-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/hash-node/-/hash-node-3.53.0.tgz -> @aws-sdk-hash-node-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/invalid-dependency/-/invalid-dependency-3.53.0.tgz -> @aws-sdk-invalid-dependency-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/is-array-buffer/-/is-array-buffer-3.52.0.tgz -> @aws-sdk-is-array-buffer-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-bucket-endpoint/-/middleware-bucket-endpoint-3.485.0.tgz -> @aws-sdk-middleware-bucket-endpoint-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-content-length/-/middleware-content-length-3.53.0.tgz -> @aws-sdk-middleware-content-length-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-expect-continue/-/middleware-expect-continue-3.485.0.tgz -> @aws-sdk-middleware-expect-continue-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-flexible-checksums/-/middleware-flexible-checksums-3.485.0.tgz -> @aws-sdk-middleware-flexible-checksums-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-host-header/-/middleware-host-header-3.485.0.tgz -> @aws-sdk-middleware-host-header-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-host-header/-/middleware-host-header-3.53.0.tgz -> @aws-sdk-middleware-host-header-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-location-constraint/-/middleware-location-constraint-3.485.0.tgz -> @aws-sdk-middleware-location-constraint-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-logger/-/middleware-logger-3.485.0.tgz -> @aws-sdk-middleware-logger-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-logger/-/middleware-logger-3.53.0.tgz -> @aws-sdk-middleware-logger-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-recursion-detection/-/middleware-recursion-detection-3.485.0.tgz -> @aws-sdk-middleware-recursion-detection-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-retry/-/middleware-retry-3.53.0.tgz -> @aws-sdk-middleware-retry-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-sdk-s3/-/middleware-sdk-s3-3.485.0.tgz -> @aws-sdk-middleware-sdk-s3-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-sdk-sts/-/middleware-sdk-sts-3.53.0.tgz -> @aws-sdk-middleware-sdk-sts-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-serde/-/middleware-serde-3.53.0.tgz -> @aws-sdk-middleware-serde-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-signing/-/middleware-signing-3.485.0.tgz -> @aws-sdk-middleware-signing-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-signing/-/middleware-signing-3.53.0.tgz -> @aws-sdk-middleware-signing-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-ssec/-/middleware-ssec-3.485.0.tgz -> @aws-sdk-middleware-ssec-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-stack/-/middleware-stack-3.53.0.tgz -> @aws-sdk-middleware-stack-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-user-agent/-/middleware-user-agent-3.485.0.tgz -> @aws-sdk-middleware-user-agent-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/middleware-user-agent/-/middleware-user-agent-3.53.0.tgz -> @aws-sdk-middleware-user-agent-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/node-config-provider/-/node-config-provider-3.53.0.tgz -> @aws-sdk-node-config-provider-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/node-http-handler/-/node-http-handler-3.53.0.tgz -> @aws-sdk-node-http-handler-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/property-provider/-/property-provider-3.53.0.tgz -> @aws-sdk-property-provider-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/protocol-http/-/protocol-http-3.53.0.tgz -> @aws-sdk-protocol-http-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/querystring-builder/-/querystring-builder-3.53.0.tgz -> @aws-sdk-querystring-builder-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/querystring-parser/-/querystring-parser-3.53.0.tgz -> @aws-sdk-querystring-parser-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/region-config-resolver/-/region-config-resolver-3.485.0.tgz -> @aws-sdk-region-config-resolver-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/service-error-classification/-/service-error-classification-3.53.0.tgz -> @aws-sdk-service-error-classification-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/shared-ini-file-loader/-/shared-ini-file-loader-3.52.0.tgz -> @aws-sdk-shared-ini-file-loader-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/signature-v4-multi-region/-/signature-v4-multi-region-3.485.0.tgz -> @aws-sdk-signature-v4-multi-region-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/signature-v4/-/signature-v4-3.53.0.tgz -> @aws-sdk-signature-v4-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/smithy-client/-/smithy-client-3.53.0.tgz -> @aws-sdk-smithy-client-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/token-providers/-/token-providers-3.485.0.tgz -> @aws-sdk-token-providers-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/types/-/types-3.485.0.tgz -> @aws-sdk-types-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/types/-/types-3.53.0.tgz -> @aws-sdk-types-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/url-parser/-/url-parser-3.53.0.tgz -> @aws-sdk-url-parser-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-arn-parser/-/util-arn-parser-3.465.0.tgz -> @aws-sdk-util-arn-parser-3.465.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-base64-browser/-/util-base64-browser-3.52.0.tgz -> @aws-sdk-util-base64-browser-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-base64-node/-/util-base64-node-3.52.0.tgz -> @aws-sdk-util-base64-node-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-body-length-browser/-/util-body-length-browser-3.52.0.tgz -> @aws-sdk-util-body-length-browser-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-body-length-node/-/util-body-length-node-3.52.0.tgz -> @aws-sdk-util-body-length-node-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-buffer-from/-/util-buffer-from-3.52.0.tgz -> @aws-sdk-util-buffer-from-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-config-provider/-/util-config-provider-3.52.0.tgz -> @aws-sdk-util-config-provider-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-credentials/-/util-credentials-3.53.0.tgz -> @aws-sdk-util-credentials-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-defaults-mode-browser/-/util-defaults-mode-browser-3.53.0.tgz -> @aws-sdk-util-defaults-mode-browser-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-defaults-mode-node/-/util-defaults-mode-node-3.53.0.tgz -> @aws-sdk-util-defaults-mode-node-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-endpoints/-/util-endpoints-3.485.0.tgz -> @aws-sdk-util-endpoints-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-hex-encoding/-/util-hex-encoding-3.52.0.tgz -> @aws-sdk-util-hex-encoding-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-locate-window/-/util-locate-window-3.310.0.tgz -> @aws-sdk-util-locate-window-3.310.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-uri-escape/-/util-uri-escape-3.52.0.tgz -> @aws-sdk-util-uri-escape-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-user-agent-browser/-/util-user-agent-browser-3.485.0.tgz -> @aws-sdk-util-user-agent-browser-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-user-agent-browser/-/util-user-agent-browser-3.53.0.tgz -> @aws-sdk-util-user-agent-browser-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-user-agent-node/-/util-user-agent-node-3.485.0.tgz -> @aws-sdk-util-user-agent-node-3.485.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-user-agent-node/-/util-user-agent-node-3.53.0.tgz -> @aws-sdk-util-user-agent-node-3.53.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-utf8-browser/-/util-utf8-browser-3.259.0.tgz -> @aws-sdk-util-utf8-browser-3.259.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-utf8-browser/-/util-utf8-browser-3.52.0.tgz -> @aws-sdk-util-utf8-browser-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/util-utf8-node/-/util-utf8-node-3.52.0.tgz -> @aws-sdk-util-utf8-node-3.52.0.tgz
	https://registry.yarnpkg.com/@aws-sdk/xml-builder/-/xml-builder-3.485.0.tgz -> @aws-sdk-xml-builder-3.485.0.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.7.0.tgz
	https://registry.yarnpkg.com/axe-core/-/axe-core-4.4.1.tgz
	https://registry.yarnpkg.com/axios/-/axios-0.21.2.tgz
	https://registry.yarnpkg.com/axios/-/axios-1.7.7.tgz
	https://registry.yarnpkg.com/axios/-/axios-1.8.3.tgz
	https://registry.yarnpkg.com/axobject-query/-/axobject-query-4.1.0.tgz
	https://registry.yarnpkg.com/@babel/cli/-/cli-7.24.8.tgz -> @babel-cli-7.24.8.tgz
	https://registry.yarnpkg.com/babel-code-frame/-/babel-code-frame-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.24.7.tgz -> @babel-code-frame-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.26.2.tgz -> @babel-code-frame-7.26.2.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.25.2.tgz -> @babel-compat-data-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.25.2.tgz -> @babel-core-7.25.2.tgz
	https://registry.yarnpkg.com/babel-eslint/-/babel-eslint-7.2.3.tgz
	https://registry.yarnpkg.com/@babel/eslint-parser/-/eslint-parser-7.25.1.tgz -> @babel-eslint-parser-7.25.1.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.25.0.tgz -> @babel-generator-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.24.7.tgz -> @babel-helper-annotate-as-pure-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.24.7.tgz -> @babel-helper-builder-binary-assignment-operator-visitor-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.25.2.tgz -> @babel-helper-compilation-targets-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.25.0.tgz -> @babel-helper-create-class-features-plugin-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.25.2.tgz -> @babel-helper-create-regexp-features-plugin-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/helper-define-map/-/helper-define-map-7.18.6.tgz -> @babel-helper-define-map-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.6.2.tgz -> @babel-helper-define-polyfill-provider-0.6.2.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.24.7.tgz -> @babel-helper-function-name-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.24.7.tgz -> @babel-helper-hoist-variables-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.24.8.tgz -> @babel-helper-member-expression-to-functions-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.22.15.tgz -> @babel-helper-module-imports-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.24.7.tgz -> @babel-helper-module-imports-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.25.2.tgz -> @babel-helper-module-transforms-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.24.7.tgz -> @babel-helper-optimise-call-expression-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.25.0.tgz -> @babel-helper-remap-async-to-generator-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.25.0.tgz -> @babel-helper-replace-supers-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.25.0.tgz -> @babel-helpers-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.24.7.tgz -> @babel-helper-simple-access-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.24.7.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.24.7.tgz -> @babel-helper-split-export-declaration-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.24.8.tgz -> @babel-helper-string-parser-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.25.9.tgz -> @babel-helper-validator-identifier-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.24.8.tgz -> @babel-helper-validator-option-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.25.0.tgz -> @babel-helper-wrap-function-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.24.7.tgz -> @babel-highlight-7.24.7.tgz
	https://registry.yarnpkg.com/babel-loader/-/babel-loader-9.1.3.tgz
	https://registry.yarnpkg.com/babel-messages/-/babel-messages-6.23.0.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.15.6.tgz -> @babel-parser-7.15.6.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.25.3.tgz -> @babel-parser-7.25.3.tgz
	https://registry.yarnpkg.com/babel-plugin-add-module-exports/-/babel-plugin-add-module-exports-1.0.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-firefox-class-in-computed-class-key/-/plugin-bugfix-firefox-class-in-computed-class-key-7.25.3.tgz -> @babel-plugin-bugfix-firefox-class-in-computed-class-key-7.25.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-class-field-initializer-scope/-/plugin-bugfix-safari-class-field-initializer-scope-7.25.0.tgz -> @babel-plugin-bugfix-safari-class-field-initializer-scope-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.25.0.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.24.7.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-static-class-fields-redefine-readonly/-/plugin-bugfix-v8-static-class-fields-redefine-readonly-7.25.0.tgz -> @babel-plugin-bugfix-v8-static-class-fields-redefine-readonly-7.25.0.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.4.11.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.10.4.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.6.2.tgz
	https://registry.yarnpkg.com/babel-plugin-prismjs/-/babel-plugin-prismjs-1.0.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.18.6.tgz -> @babel-plugin-proposal-class-properties-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-decorators/-/plugin-proposal-decorators-7.24.7.tgz -> @babel-plugin-proposal-decorators-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.20.7.tgz -> @babel-plugin-proposal-object-rest-spread-7.20.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz -> @babel-plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz -> @babel-plugin-syntax-class-properties-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz -> @babel-plugin-syntax-class-static-block-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-decorators/-/plugin-syntax-decorators-7.24.7.tgz -> @babel-plugin-syntax-decorators-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz -> @babel-plugin-syntax-dynamic-import-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz -> @babel-plugin-syntax-export-namespace-from-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-flow/-/plugin-syntax-flow-7.16.7.tgz -> @babel-plugin-syntax-flow-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-assertions/-/plugin-syntax-import-assertions-7.24.7.tgz -> @babel-plugin-syntax-import-assertions-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.24.7.tgz -> @babel-plugin-syntax-import-attributes-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz -> @babel-plugin-syntax-import-meta-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz -> @babel-plugin-syntax-json-strings-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.24.7.tgz -> @babel-plugin-syntax-jsx-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz -> @babel-plugin-syntax-logical-assignment-operators-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz -> @babel-plugin-syntax-nullish-coalescing-operator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz -> @babel-plugin-syntax-numeric-separator-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz -> @babel-plugin-syntax-object-rest-spread-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz -> @babel-plugin-syntax-optional-catch-binding-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz -> @babel-plugin-syntax-optional-chaining-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-private-property-in-object/-/plugin-syntax-private-property-in-object-7.14.5.tgz -> @babel-plugin-syntax-private-property-in-object-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz -> @babel-plugin-syntax-top-level-await-7.14.5.tgz
	https://registry.yarnpkg.com/babel-plugin-syntax-trailing-function-commas/-/babel-plugin-syntax-trailing-function-commas-7.0.0-beta.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.24.7.tgz -> @babel-plugin-syntax-typescript-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-unicode-sets-regex/-/plugin-syntax-unicode-sets-regex-7.18.6.tgz -> @babel-plugin-syntax-unicode-sets-regex-7.18.6.tgz
	https://registry.yarnpkg.com/babel-plugin-tester/-/babel-plugin-tester-10.1.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.24.7.tgz -> @babel-plugin-transform-arrow-functions-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-generator-functions/-/plugin-transform-async-generator-functions-7.25.0.tgz -> @babel-plugin-transform-async-generator-functions-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.24.7.tgz -> @babel-plugin-transform-async-to-generator-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.24.7.tgz -> @babel-plugin-transform-block-scoped-functions-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.25.0.tgz -> @babel-plugin-transform-block-scoping-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.25.0.tgz -> @babel-plugin-transform-classes-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-properties/-/plugin-transform-class-properties-7.24.7.tgz -> @babel-plugin-transform-class-properties-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-static-block/-/plugin-transform-class-static-block-7.24.7.tgz -> @babel-plugin-transform-class-static-block-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.24.7.tgz -> @babel-plugin-transform-computed-properties-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.24.8.tgz -> @babel-plugin-transform-destructuring-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.24.7.tgz -> @babel-plugin-transform-dotall-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.24.7.tgz -> @babel-plugin-transform-duplicate-keys-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-named-capturing-groups-regex/-/plugin-transform-duplicate-named-capturing-groups-regex-7.25.0.tgz -> @babel-plugin-transform-duplicate-named-capturing-groups-regex-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dynamic-import/-/plugin-transform-dynamic-import-7.24.7.tgz -> @babel-plugin-transform-dynamic-import-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.24.7.tgz -> @babel-plugin-transform-exponentiation-operator-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-export-namespace-from/-/plugin-transform-export-namespace-from-7.24.7.tgz -> @babel-plugin-transform-export-namespace-from-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-flow-strip-types/-/plugin-transform-flow-strip-types-7.16.7.tgz -> @babel-plugin-transform-flow-strip-types-7.16.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.24.7.tgz -> @babel-plugin-transform-for-of-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.25.1.tgz -> @babel-plugin-transform-function-name-7.25.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-json-strings/-/plugin-transform-json-strings-7.24.7.tgz -> @babel-plugin-transform-json-strings-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.25.2.tgz -> @babel-plugin-transform-literals-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-logical-assignment-operators/-/plugin-transform-logical-assignment-operators-7.24.7.tgz -> @babel-plugin-transform-logical-assignment-operators-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.24.7.tgz -> @babel-plugin-transform-member-expression-literals-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.24.7.tgz -> @babel-plugin-transform-modules-amd-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.24.8.tgz -> @babel-plugin-transform-modules-commonjs-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.25.0.tgz -> @babel-plugin-transform-modules-systemjs-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.24.7.tgz -> @babel-plugin-transform-modules-umd-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.24.7.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.24.7.tgz -> @babel-plugin-transform-new-target-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-nullish-coalescing-operator/-/plugin-transform-nullish-coalescing-operator-7.24.7.tgz -> @babel-plugin-transform-nullish-coalescing-operator-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-numeric-separator/-/plugin-transform-numeric-separator-7.24.7.tgz -> @babel-plugin-transform-numeric-separator-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-rest-spread/-/plugin-transform-object-rest-spread-7.24.7.tgz -> @babel-plugin-transform-object-rest-spread-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.24.7.tgz -> @babel-plugin-transform-object-super-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-catch-binding/-/plugin-transform-optional-catch-binding-7.24.7.tgz -> @babel-plugin-transform-optional-catch-binding-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-chaining/-/plugin-transform-optional-chaining-7.24.8.tgz -> @babel-plugin-transform-optional-chaining-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.24.7.tgz -> @babel-plugin-transform-parameters-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-methods/-/plugin-transform-private-methods-7.24.7.tgz -> @babel-plugin-transform-private-methods-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-property-in-object/-/plugin-transform-private-property-in-object-7.24.7.tgz -> @babel-plugin-transform-private-property-in-object-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.24.7.tgz -> @babel-plugin-transform-property-literals-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-constant-elements/-/plugin-transform-react-constant-elements-7.22.5.tgz -> @babel-plugin-transform-react-constant-elements-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.24.7.tgz -> @babel-plugin-transform-react-display-name-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.24.7.tgz -> @babel-plugin-transform-react-jsx-development-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.25.2.tgz -> @babel-plugin-transform-react-jsx-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-pure-annotations/-/plugin-transform-react-pure-annotations-7.24.7.tgz -> @babel-plugin-transform-react-pure-annotations-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.24.7.tgz -> @babel-plugin-transform-regenerator-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.24.7.tgz -> @babel-plugin-transform-reserved-words-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-runtime/-/plugin-transform-runtime-7.24.7.tgz -> @babel-plugin-transform-runtime-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.24.7.tgz -> @babel-plugin-transform-shorthand-properties-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.24.7.tgz -> @babel-plugin-transform-spread-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.24.7.tgz -> @babel-plugin-transform-sticky-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.24.7.tgz -> @babel-plugin-transform-template-literals-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.24.8.tgz -> @babel-plugin-transform-typeof-symbol-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.25.2.tgz -> @babel-plugin-transform-typescript-7.25.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.24.7.tgz -> @babel-plugin-transform-unicode-escapes-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-property-regex/-/plugin-transform-unicode-property-regex-7.24.7.tgz -> @babel-plugin-transform-unicode-property-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.24.7.tgz -> @babel-plugin-transform-unicode-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-sets-regex/-/plugin-transform-unicode-sets-regex-7.24.7.tgz -> @babel-plugin-transform-unicode-sets-regex-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.25.3.tgz -> @babel-preset-env-7.25.3.tgz
	https://registry.yarnpkg.com/babel-preset-fbjs/-/babel-preset-fbjs-3.4.0.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.6-no-external-plugins.tgz -> @babel-preset-modules-0.1.6-no-external-plugins.tgz
	https://registry.yarnpkg.com/@babel/preset-react/-/preset-react-7.24.7.tgz -> @babel-preset-react-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.24.7.tgz -> @babel-preset-typescript-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/register/-/register-7.24.6.tgz -> @babel-register-7.24.6.tgz
	https://registry.yarnpkg.com/@babel/regjsgen/-/regjsgen-0.8.0.tgz -> @babel-regjsgen-0.8.0.tgz
	https://registry.yarnpkg.com/babel-runtime/-/babel-runtime-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.25.0.tgz -> @babel-runtime-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.25.0.tgz -> @babel-template-7.25.0.tgz
	https://registry.yarnpkg.com/babel-traverse/-/babel-traverse-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.15.4.tgz -> @babel-traverse-7.15.4.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.25.3.tgz -> @babel-traverse-7.25.3.tgz
	https://registry.yarnpkg.com/babel-types/-/babel-types-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.15.6.tgz -> @babel-types-7.15.6.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.25.2.tgz -> @babel-types-7.25.2.tgz
	https://registry.yarnpkg.com/babylon/-/babylon-6.18.0.tgz
	https://registry.yarnpkg.com/bach/-/bach-1.2.0.tgz
	https://registry.yarnpkg.com/backo2/-/backo2-1.0.2.tgz
	https://registry.yarnpkg.com/@bahmutov/all-paths/-/all-paths-1.0.2.tgz -> @bahmutov-all-paths-1.0.2.tgz
	https://registry.yarnpkg.com/@bahmutov/data-driven/-/data-driven-1.0.0.tgz -> @bahmutov-data-driven-1.0.0.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.0.tgz
	https://registry.yarnpkg.com/base64-arraybuffer/-/base64-arraybuffer-0.1.4.tgz
	https://registry.yarnpkg.com/base64id/-/base64id-2.0.0.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/base64url/-/base64url-3.0.1.tgz
	https://registry.yarnpkg.com/base/-/base-0.11.2.tgz
	https://registry.yarnpkg.com/basic-auth/-/basic-auth-1.1.0.tgz
	https://registry.yarnpkg.com/basic-auth/-/basic-auth-2.0.1.tgz
	https://registry.yarnpkg.com/basic-ftp/-/basic-ftp-5.0.3.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.6.1.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.2.2.tgz
	https://registry.yarnpkg.com/better-sqlite3/-/better-sqlite3-11.5.0.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/bignumber.js/-/bignumber.js-2.4.0.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-1.13.1.tgz
	https://registry.yarnpkg.com/binaryextensions/-/binaryextensions-4.18.0.tgz
	https://registry.yarnpkg.com/bindings/-/bindings-1.5.0.tgz
	https://registry.yarnpkg.com/bin-links/-/bin-links-5.0.0.tgz
	https://registry.yarnpkg.com/black-hole-stream/-/black-hole-stream-0.0.1.tgz
	https://registry.yarnpkg.com/bl/-/bl-0.8.2.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/blob/-/blob-0.0.5.tgz
	https://registry.yarnpkg.com/blob-util/-/blob-util-2.0.2.tgz
	https://registry.yarnpkg.com/block-stream/-/block-stream-0.0.9.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.5.3.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.5.5.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.1.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/bluebird-lst/-/bluebird-lst-1.0.9.tgz
	https://registry.yarnpkg.com/bluebird-retry/-/bluebird-retry-0.11.0.tgz
	https://registry.yarnpkg.com/blueimp-md5/-/blueimp-md5-2.18.0.tgz
	https://registry.yarnpkg.com/bmp-js/-/bmp-js-0.0.1.tgz
	https://registry.yarnpkg.com/bmp-js/-/bmp-js-0.0.3.tgz
	https://registry.yarnpkg.com/bmp-js/-/bmp-js-0.1.0.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-4.12.0.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-5.2.1.tgz
	https://registry.yarnpkg.com/body/-/body-5.1.0.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.20.0.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.20.2.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.20.3.tgz
	https://registry.yarnpkg.com/bonjour-service/-/bonjour-service-1.2.1.tgz
	https://registry.yarnpkg.com/boolbase/-/boolbase-1.0.0.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.0.2.tgz
	https://registry.yarnpkg.com/bower-config/-/bower-config-1.4.3.tgz
	https://registry.yarnpkg.com/bowser/-/bowser-2.11.0.tgz
	https://registry.yarnpkg.com/boxen/-/boxen-7.0.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/braces/-/braces-2.3.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.3.tgz
	https://registry.yarnpkg.com/brorand/-/brorand-1.1.0.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.2.0.tgz
	https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.1.tgz
	https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.2.tgz
	https://registry.yarnpkg.com/browserify-fs/-/browserify-fs-1.0.0.tgz
	https://registry.yarnpkg.com/browserify-rsa/-/browserify-rsa-4.1.0.tgz
	https://registry.yarnpkg.com/browserify-sign/-/browserify-sign-4.2.2.tgz
	https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.2.0.tgz
	https://registry.yarnpkg.com/browser-resolve/-/browser-resolve-2.0.0.tgz
	https://registry.yarnpkg.com/browserslist-to-esbuild/-/browserslist-to-esbuild-2.1.1.tgz
	https://registry.yarnpkg.com/browser-stdout/-/browser-stdout-1.3.0.tgz
	https://registry.yarnpkg.com/browser-stdout/-/browser-stdout-1.3.1.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/btoa-lite/-/btoa-lite-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-alloc/-/buffer-alloc-1.2.0.tgz
	https://registry.yarnpkg.com/buffer-alloc-unsafe/-/buffer-alloc-unsafe-1.1.0.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-4.9.2.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-6.0.3.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-0.0.1.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-equal-constant-time/-/buffer-equal-constant-time-1.0.1.tgz
	https://registry.yarnpkg.com/buffer-es6/-/buffer-es6-4.9.3.tgz
	https://registry.yarnpkg.com/buffer-fill/-/buffer-fill-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.1.tgz
	https://registry.yarnpkg.com/buffer-xor/-/buffer-xor-1.0.3.tgz
	https://registry.yarnpkg.com/buildcheck/-/buildcheck-0.0.6.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-25.1.7.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-9.2.10.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-1.1.1.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.2.0.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-1.0.3.tgz
	https://registry.yarnpkg.com/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz
	https://registry.yarnpkg.com/bundle-name/-/bundle-name-4.1.0.tgz
	https://registry.yarnpkg.com/bundle-require/-/bundle-require-3.0.4.tgz
	https://registry.yarnpkg.com/busboy/-/busboy-0.2.14.tgz
	https://registry.yarnpkg.com/bytenode/-/bytenode-1.3.7.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-1.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.1.2.tgz
	https://registry.yarnpkg.com/byte-size/-/byte-size-8.1.1.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-12.0.4.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-16.1.1.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-19.0.1.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-2.1.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-6.1.0.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.2.tgz
	https://registry.yarnpkg.com/cache-base/-/cache-base-1.0.1.tgz
	https://registry.yarnpkg.com/cachedir/-/cachedir-2.3.0.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.7.tgz
	https://registry.yarnpkg.com/call-bound/-/call-bound-1.0.4.tgz
	https://registry.yarnpkg.com/call-me-maybe/-/call-me-maybe-1.0.2.tgz
	https://registry.yarnpkg.com/callsite/-/callsite-1.0.0.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-1.2.1.tgz
	https://registry.yarnpkg.com/camel-case/-/camel-case-3.0.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-3.0.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-4.1.0.tgz
	https://registry.yarnpkg.com/camel-case/-/camel-case-4.1.2.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-7.0.1.tgz
	https://registry.yarnpkg.com/camelcase-css/-/camelcase-css-2.0.1.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-6.2.2.tgz
	https://registry.yarnpkg.com/capital-case/-/capital-case-1.0.4.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.12.0.tgz
	https://registry.yarnpkg.com/center-align/-/center-align-0.1.3.tgz
	https://registry.yarnpkg.com/chai-as-promised/-/chai-as-promised-7.1.1.tgz
	https://registry.yarnpkg.com/chai/-/chai-1.10.0.tgz
	https://registry.yarnpkg.com/chai/-/chai-3.5.0.tgz
	https://registry.yarnpkg.com/chai/-/chai-4.1.2.tgz
	https://registry.yarnpkg.com/chai/-/chai-4.2.0.tgz
	https://registry.yarnpkg.com/chai/-/chai-4.5.0.tgz
	https://registry.yarnpkg.com/chai-string/-/chai-string-1.5.0.tgz
	https://registry.yarnpkg.com/chai-subset/-/chai-subset-1.6.0.tgz
	https://registry.yarnpkg.com/chai-uuid/-/chai-uuid-1.0.6.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-1.1.3.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-3.0.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.0.1.tgz
	https://registry.yarnpkg.com/chalk-template/-/chalk-template-0.4.0.tgz
	https://registry.yarnpkg.com/change-case-all/-/change-case-all-1.0.14.tgz
	https://registry.yarnpkg.com/change-case/-/change-case-3.1.0.tgz
	https://registry.yarnpkg.com/change-case/-/change-case-4.1.2.tgz
	https://registry.yarnpkg.com/chardet/-/chardet-0.7.0.tgz
	https://registry.yarnpkg.com/charenc/-/charenc-0.0.2.tgz
	https://registry.yarnpkg.com/charm/-/charm-1.0.2.tgz
	https://registry.yarnpkg.com/charset/-/charset-1.0.1.tgz
	https://registry.yarnpkg.com/check-dependencies/-/check-dependencies-1.1.0.tgz
	https://registry.yarnpkg.com/check-error/-/check-error-1.0.3.tgz
	https://registry.yarnpkg.com/check-more-types/-/check-more-types-2.24.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-2.1.8.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.3.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.1.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.3.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.6.0.tgz
	https://registry.yarnpkg.com/chokidar-cli/-/chokidar-cli-2.1.0.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-3.0.0.tgz
	https://registry.yarnpkg.com/chrome-har-capturer/-/chrome-har-capturer-0.13.4.tgz
	https://registry.yarnpkg.com/chrome-remote-interface/-/chrome-remote-interface-0.25.7.tgz
	https://registry.yarnpkg.com/chrome-remote-interface/-/chrome-remote-interface-0.33.3.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.2.tgz
	https://registry.yarnpkg.com/chromium-bidi/-/chromium-bidi-0.4.26.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-2.0.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.1.0.tgz
	https://registry.yarnpkg.com/cipher-base/-/cipher-base-1.0.4.tgz
	https://registry.yarnpkg.com/classnames/-/classnames-2.5.1.tgz
	https://registry.yarnpkg.com/class-utils/-/class-utils-0.3.6.tgz
	https://registry.yarnpkg.com/clean-css/-/clean-css-4.2.3.tgz
	https://registry.yarnpkg.com/clean-css/-/clean-css-5.2.4.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/clean-webpack-plugin/-/clean-webpack-plugin-4.0.0.tgz
	https://registry.yarnpkg.com/cli-boxes/-/cli-boxes-3.0.0.tgz
	https://registry.yarnpkg.com/cli-columns/-/cli-columns-4.0.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-2.1.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/clipboardy/-/clipboardy-3.0.0.tgz
	https://registry.yarnpkg.com/cli-spinners/-/cli-spinners-2.6.1.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-0.2.1.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-3.2.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-4.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-5.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-6.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-7.0.4.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-2.2.1.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-3.0.0.tgz
	https://registry.yarnpkg.com/cloneable-readable/-/cloneable-readable-1.1.3.tgz
	https://registry.yarnpkg.com/clone-buffer/-/clone-buffer-1.0.0.tgz
	https://registry.yarnpkg.com/clone/-/clone-0.1.19.tgz
	https://registry.yarnpkg.com/clone/-/clone-1.0.4.tgz
	https://registry.yarnpkg.com/clone/-/clone-2.1.2.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.2.tgz
	https://registry.yarnpkg.com/clone-stats/-/clone-stats-1.0.0.tgz
	https://registry.yarnpkg.com/cmd-shim/-/cmd-shim-6.0.3.tgz
	https://registry.yarnpkg.com/cmd-shim/-/cmd-shim-7.0.0.tgz
	https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz
	https://registry.yarnpkg.com/coffee-loader/-/coffee-loader-4.0.0.tgz
	https://registry.yarnpkg.com/coffeescript/-/coffeescript-2.6.0.tgz
	https://registry.yarnpkg.com/coffeescript/-/coffeescript-2.7.0.tgz
	https://registry.yarnpkg.com/collection-map/-/collection-map-1.0.0.tgz
	https://registry.yarnpkg.com/collection-visit/-/collection-visit-1.0.0.tgz
	https://registry.yarnpkg.com/color/-/color-4.2.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-1.2.2.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.20.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.4.0.tgz
	https://registry.yarnpkg.com/@colors/colors/-/colors-1.5.0.tgz -> @colors-colors-1.5.0.tgz
	https://registry.yarnpkg.com/color-string/-/color-string-1.5.5.tgz
	https://registry.yarnpkg.com/color-string/-/color-string-1.9.1.tgz
	https://registry.yarnpkg.com/color-support/-/color-support-1.1.3.tgz
	https://registry.yarnpkg.com/columnify/-/columnify-1.6.0.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/combine-properties/-/combine-properties-0.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-10.0.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.11.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.19.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.9.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-4.1.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-6.2.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-8.3.0.tgz
	https://registry.yarnpkg.com/command-exists/-/command-exists-1.2.9.tgz
	https://registry.yarnpkg.com/common-ancestor-path/-/common-ancestor-path-1.0.1.tgz
	https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz
	https://registry.yarnpkg.com/common-path-prefix/-/common-path-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/common-tags/-/common-tags-1.7.2.tgz
	https://registry.yarnpkg.com/common-tags/-/common-tags-1.8.0.tgz
	https://registry.yarnpkg.com/common-tags/-/common-tags-1.8.2.tgz
	https://registry.yarnpkg.com/compare-func/-/compare-func-2.0.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/compare-versions/-/compare-versions-4.1.3.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.3.0.tgz
	https://registry.yarnpkg.com/component-inherit/-/component-inherit-0.0.3.tgz
	https://registry.yarnpkg.com/compressible/-/compressible-2.0.18.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.7.4.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.8.0.tgz
	https://registry.yarnpkg.com/computeds/-/computeds-0.0.1.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-2.0.0.tgz
	https://registry.yarnpkg.com/concurrently/-/concurrently-6.2.0.tgz
	https://registry.yarnpkg.com/confbox/-/confbox-0.1.8.tgz
	https://registry.yarnpkg.com/confbox/-/confbox-0.2.1.tgz
	https://registry.yarnpkg.com/config-file-ts/-/config-file-ts-0.2.8-rc1.tgz
	https://registry.yarnpkg.com/connect-history-api-fallback/-/connect-history-api-fallback-2.0.0.tgz
	https://registry.yarnpkg.com/console-browserify/-/console-browserify-1.2.0.tgz
	https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz
	https://registry.yarnpkg.com/constant-case/-/constant-case-2.0.0.tgz
	https://registry.yarnpkg.com/constant-case/-/constant-case-3.0.4.tgz
	https://registry.yarnpkg.com/constants-browserify/-/constants-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.2.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.4.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.4.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.5.tgz
	https://registry.yarnpkg.com/continuable-cache/-/continuable-cache-0.3.1.tgz
	https://registry.yarnpkg.com/conventional-changelog-angular/-/conventional-changelog-angular-7.0.0.tgz
	https://registry.yarnpkg.com/conventional-changelog-core/-/conventional-changelog-core-5.0.1.tgz
	https://registry.yarnpkg.com/conventional-changelog-preset-loader/-/conventional-changelog-preset-loader-2.3.4.tgz
	https://registry.yarnpkg.com/conventional-changelog-preset-loader/-/conventional-changelog-preset-loader-3.0.0.tgz
	https://registry.yarnpkg.com/conventional-changelog-writer/-/conventional-changelog-writer-6.0.1.tgz
	https://registry.yarnpkg.com/conventional-commits-filter/-/conventional-commits-filter-2.0.7.tgz
	https://registry.yarnpkg.com/conventional-commits-filter/-/conventional-commits-filter-3.0.0.tgz
	https://registry.yarnpkg.com/conventional-commits-parser/-/conventional-commits-parser-3.2.4.tgz
	https://registry.yarnpkg.com/conventional-commits-parser/-/conventional-commits-parser-4.0.0.tgz
	https://registry.yarnpkg.com/conventional-recommended-bump/-/conventional-recommended-bump-6.1.0.tgz
	https://registry.yarnpkg.com/conventional-recommended-bump/-/conventional-recommended-bump-7.0.1.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.8.0.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.3.1.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.4.0.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.4.2.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.6.0.tgz
	https://registry.yarnpkg.com/cookiejar/-/cookiejar-2.1.2.tgz
	https://registry.yarnpkg.com/cookie-parser/-/cookie-parser-1.4.5.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.0.6.tgz
	https://registry.yarnpkg.com/@coolaj86/urequest/-/urequest-1.3.7.tgz -> @coolaj86-urequest-1.3.7.tgz
	https://registry.yarnpkg.com/copy-concurrently/-/copy-concurrently-1.0.5.tgz
	https://registry.yarnpkg.com/copy-descriptor/-/copy-descriptor-0.1.1.tgz
	https://registry.yarnpkg.com/copy-props/-/copy-props-2.0.4.tgz
	https://registry.yarnpkg.com/copy-webpack-plugin/-/copy-webpack-plugin-11.0.0.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.38.1.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-1.2.7.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.6.12.tgz
	https://registry.yarnpkg.com/core-js-pure/-/core-js-pure-3.21.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/cors/-/cors-2.8.5.tgz
	https://registry.yarnpkg.com/corser/-/corser-2.0.1.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-7.0.0.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-7.0.1.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-8.3.6.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-9.0.0.tgz
	https://registry.yarnpkg.com/cosmiconfig-toml-loader/-/cosmiconfig-toml-loader-1.0.0.tgz
	https://registry.yarnpkg.com/cp-file/-/cp-file-6.2.0.tgz
	https://registry.yarnpkg.com/cpr/-/cpr-3.0.1.tgz
	https://registry.yarnpkg.com/cpu-features/-/cpu-features-0.0.9.tgz
	https://registry.yarnpkg.com/crc/-/crc-3.8.0.tgz
	https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.4.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.2.0.tgz
	https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.7.tgz
	https://registry.yarnpkg.com/create-react-class/-/create-react-class-15.7.0.tgz
	https://registry.yarnpkg.com/create-require/-/create-require-1.1.1.tgz
	https://registry.yarnpkg.com/create-thenable/-/create-thenable-1.0.2.tgz
	https://registry.yarnpkg.com/cross-dirname/-/cross-dirname-0.1.0.tgz
	https://registry.yarnpkg.com/cross-env/-/cross-env-6.0.3.tgz
	https://registry.yarnpkg.com/cross-env/-/cross-env-7.0.3.tgz
	https://registry.yarnpkg.com/cross-fetch/-/cross-fetch-3.1.4.tgz
	https://registry.yarnpkg.com/cross-fetch/-/cross-fetch-3.1.8.tgz
	https://registry.yarnpkg.com/cross-fetch/-/cross-fetch-4.0.0.tgz
	https://registry.yarnpkg.com/cross-fetch/-/cross-fetch-4.1.0.tgz
	https://registry.yarnpkg.com/cross-spawn-async/-/cross-spawn-async-2.2.5.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-5.1.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.5.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/crypt/-/crypt-0.0.2.tgz
	https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.12.0.tgz
	https://registry.yarnpkg.com/crypto-js/-/crypto-js-4.2.0.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-2.0.0.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.8.1.tgz -> @cspotcode-source-map-support-0.8.1.tgz
	https://registry.yarnpkg.com/css-element-queries/-/css-element-queries-1.2.3.tgz
	https://registry.yarnpkg.com/css.escape/-/css.escape-1.5.1.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-3.0.0.tgz
	https://registry.yarnpkg.com/css-loader/-/css-loader-6.8.1.tgz
	https://registry.yarnpkg.com/css-modules-typescript-loader/-/css-modules-typescript-loader-4.0.1.tgz
	https://registry.yarnpkg.com/css-node-extract/-/css-node-extract-2.1.3.tgz
	https://registry.yarnpkg.com/csso/-/csso-5.0.5.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-2.1.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-4.3.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-5.1.0.tgz
	https://registry.yarnpkg.com/css-selector-extract/-/css-selector-extract-3.3.6.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-4.2.1.tgz
	https://registry.yarnpkg.com/@csstools/color-helpers/-/color-helpers-5.0.1.tgz -> @csstools-color-helpers-5.0.1.tgz
	https://registry.yarnpkg.com/@csstools/css-calc/-/css-calc-2.1.1.tgz -> @csstools-css-calc-2.1.1.tgz
	https://registry.yarnpkg.com/@csstools/css-color-parser/-/css-color-parser-3.0.7.tgz -> @csstools-css-color-parser-3.0.7.tgz
	https://registry.yarnpkg.com/@csstools/css-parser-algorithms/-/css-parser-algorithms-3.0.4.tgz -> @csstools-css-parser-algorithms-3.0.4.tgz
	https://registry.yarnpkg.com/@csstools/css-tokenizer/-/css-tokenizer-3.0.3.tgz -> @csstools-css-tokenizer-3.0.3.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.2.1.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.3.1.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-2.6.17.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-3.1.3.tgz
	https://registry.yarnpkg.com/css-unit-converter/-/css-unit-converter-1.1.2.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-3.4.2.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-6.1.0.tgz
	https://registry.yarnpkg.com/cyclist/-/cyclist-1.0.1.tgz
	https://registry.yarnpkg.com/@cypress/commit-info/-/commit-info-2.2.0.tgz -> @cypress-commit-info-2.2.0.tgz
	https://registry.yarnpkg.com/@cypress/debugging-proxy/-/debugging-proxy-2.0.1.tgz -> @cypress-debugging-proxy-2.0.1.tgz
	https://registry.yarnpkg.com/@cypress-design/color-constants/-/color-constants-1.0.0.tgz -> @cypress-design-color-constants-1.0.0.tgz
	https://registry.yarnpkg.com/@cypress-design/constants-statusicon/-/constants-statusicon-1.0.1.tgz -> @cypress-design-constants-statusicon-1.0.1.tgz
	https://registry.yarnpkg.com/@cypress-design/constants-tabs/-/constants-tabs-1.2.2.tgz -> @cypress-design-constants-tabs-1.2.2.tgz
	https://registry.yarnpkg.com/@cypress-design/css/-/css-1.0.0.tgz -> @cypress-design-css-1.0.0.tgz
	https://registry.yarnpkg.com/@cypress-design/icon-registry/-/icon-registry-1.6.0.tgz -> @cypress-design-icon-registry-1.6.0.tgz
	https://registry.yarnpkg.com/@cypress-design/vue-button/-/vue-button-1.3.0.tgz -> @cypress-design-vue-button-1.3.0.tgz
	https://registry.yarnpkg.com/@cypress-design/vue-icon/-/vue-icon-1.6.0.tgz -> @cypress-design-vue-icon-1.6.0.tgz
	https://registry.yarnpkg.com/@cypress-design/vue-statusicon/-/vue-statusicon-1.0.0.tgz -> @cypress-design-vue-statusicon-1.0.0.tgz
	https://registry.yarnpkg.com/@cypress-design/vue-tabs/-/vue-tabs-1.2.2.tgz -> @cypress-design-vue-tabs-1.2.2.tgz
	https://registry.yarnpkg.com/@cypress-design/vue-tag/-/vue-tag-1.0.1.tgz -> @cypress-design-vue-tag-1.0.1.tgz
	https://registry.yarnpkg.com/cypress-each/-/cypress-each-1.11.0.tgz
	https://registry.yarnpkg.com/cypress-example-kitchensink/-/cypress-example-kitchensink-3.1.2.tgz
	https://registry.yarnpkg.com/cypress-expect/-/cypress-expect-2.5.3.tgz
	https://registry.yarnpkg.com/@cypress/get-windows-proxy/-/get-windows-proxy-1.6.2.tgz -> @cypress-get-windows-proxy-1.6.2.tgz
	https://registry.yarnpkg.com/cypress-multi-reporters/-/cypress-multi-reporters-1.4.0.tgz
	https://registry.yarnpkg.com/@cypress/parse-domain/-/parse-domain-2.4.0.tgz -> @cypress-parse-domain-2.4.0.tgz
	https://registry.yarnpkg.com/cypress-plugin-tab/-/cypress-plugin-tab-1.0.5.tgz
	https://registry.yarnpkg.com/@cypress/react-tooltip/-/react-tooltip-0.5.3.tgz -> @cypress-react-tooltip-0.5.3.tgz
	https://registry.yarnpkg.com/cypress-real-events/-/cypress-real-events-1.14.0.tgz
	https://registry.yarnpkg.com/@cypress/request-promise/-/request-promise-5.0.0.tgz -> @cypress-request-promise-5.0.0.tgz
	https://registry.yarnpkg.com/@cypress/request/-/request-3.0.8.tgz -> @cypress-request-3.0.8.tgz
	https://registry.yarnpkg.com/@cypress/sinon-chai/-/sinon-chai-2.9.1.tgz -> @cypress-sinon-chai-2.9.1.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-android-arm64/-/snapbuild-android-arm64-1.0.3.tgz -> @cypress-snapbuild-android-arm64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-darwin-64/-/snapbuild-darwin-64-1.0.3.tgz -> @cypress-snapbuild-darwin-64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-darwin-arm64/-/snapbuild-darwin-arm64-1.0.3.tgz -> @cypress-snapbuild-darwin-arm64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-freebsd-64/-/snapbuild-freebsd-64-1.0.3.tgz -> @cypress-snapbuild-freebsd-64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-freebsd-arm64/-/snapbuild-freebsd-arm64-1.0.3.tgz -> @cypress-snapbuild-freebsd-arm64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-32/-/snapbuild-linux-32-1.0.3.tgz -> @cypress-snapbuild-linux-32-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-64/-/snapbuild-linux-64-1.0.3.tgz -> @cypress-snapbuild-linux-64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-arm64/-/snapbuild-linux-arm64-1.0.3.tgz -> @cypress-snapbuild-linux-arm64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-arm/-/snapbuild-linux-arm-1.0.3.tgz -> @cypress-snapbuild-linux-arm-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-mips64le/-/snapbuild-linux-mips64le-1.0.3.tgz -> @cypress-snapbuild-linux-mips64le-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-linux-ppc64le/-/snapbuild-linux-ppc64le-1.0.3.tgz -> @cypress-snapbuild-linux-ppc64le-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-windows-32/-/snapbuild-windows-32-1.0.3.tgz -> @cypress-snapbuild-windows-32-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/snapbuild-windows-64/-/snapbuild-windows-64-1.0.3.tgz -> @cypress-snapbuild-windows-64-1.0.3.tgz
	https://registry.yarnpkg.com/@cypress/unique-selector/-/unique-selector-0.0.5.tgz -> @cypress-unique-selector-0.0.5.tgz
	https://registry.yarnpkg.com/@cypress/xvfb/-/xvfb-1.2.4.tgz -> @cypress-xvfb-1.2.4.tgz
	https://registry.yarnpkg.com/dargs/-/dargs-7.0.0.tgz
	https://registry.yarnpkg.com/dashdash/-/dashdash-1.14.1.tgz
	https://registry.yarnpkg.com/dataloader/-/dataloader-2.0.0.tgz
	https://registry.yarnpkg.com/dataloader/-/dataloader-2.1.0.tgz
	https://registry.yarnpkg.com/data-uri-to-buffer/-/data-uri-to-buffer-2.0.1.tgz
	https://registry.yarnpkg.com/data-uri-to-buffer/-/data-uri-to-buffer-5.0.1.tgz
	https://registry.yarnpkg.com/data-urls/-/data-urls-5.0.0.tgz
	https://registry.yarnpkg.com/data-view-buffer/-/data-view-buffer-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-byte-length/-/data-view-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-byte-offset/-/data-view-byte-offset-1.0.0.tgz
	https://registry.yarnpkg.com/date-fns/-/date-fns-1.30.1.tgz
	https://registry.yarnpkg.com/date-fns/-/date-fns-2.23.0.tgz
	https://registry.yarnpkg.com/dateformat/-/dateformat-2.2.0.tgz
	https://registry.yarnpkg.com/dateformat/-/dateformat-3.0.3.tgz
	https://registry.yarnpkg.com/dayjs/-/dayjs-1.10.4.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.1.tgz
	https://registry.yarnpkg.com/debounce/-/debounce-1.2.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.8.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.1.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.6.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.1.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.3.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.4.0.tgz
	https://registry.yarnpkg.com/decache/-/decache-4.6.2.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-4.0.0.tgz
	https://registry.yarnpkg.com/decamelize-keys/-/decamelize-keys-1.1.0.tgz
	https://registry.yarnpkg.com/decimal.js/-/decimal.js-10.4.3.tgz
	https://registry.yarnpkg.com/decode-uri-component/-/decode-uri-component-0.2.2.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-3.3.0.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-4.2.1.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-0.7.0.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-1.5.3.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-0.1.3.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-3.0.1.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-4.1.4.tgz
	https://registry.yarnpkg.com/deep-equal/-/deep-equal-2.2.3.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.1.tgz
	https://registry.yarnpkg.com/default-browser/-/default-browser-5.2.1.tgz
	https://registry.yarnpkg.com/default-browser-id/-/default-browser-id-5.0.0.tgz
	https://registry.yarnpkg.com/default-compare/-/default-compare-1.0.0.tgz
	https://registry.yarnpkg.com/default-resolution/-/default-resolution-2.0.0.tgz
	https://registry.yarnpkg.com/defaults/-/defaults-1.0.3.tgz
	https://registry.yarnpkg.com/default-shell/-/default-shell-1.0.1.tgz
	https://registry.yarnpkg.com/deferred-leveldown/-/deferred-leveldown-0.2.0.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-1.1.3.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-data-property/-/define-data-property-1.1.4.tgz
	https://registry.yarnpkg.com/defined/-/defined-1.0.0.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-3.0.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.1.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-0.2.5.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-1.0.0.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-2.0.2.tgz
	https://registry.yarnpkg.com/@definitelytyped/header-parser/-/header-parser-0.0.71.tgz -> @definitelytyped-header-parser-0.0.71.tgz
	https://registry.yarnpkg.com/@definitelytyped/typescript-versions/-/typescript-versions-0.0.71.tgz -> @definitelytyped-typescript-versions-0.0.71.tgz
	https://registry.yarnpkg.com/@definitelytyped/utils/-/utils-0.0.71.tgz -> @definitelytyped-utils-0.0.71.tgz
	https://registry.yarnpkg.com/degenerator/-/degenerator-5.0.1.tgz
	https://registry.yarnpkg.com/de-indent/-/de-indent-1.0.2.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/del/-/del-3.0.0.tgz
	https://registry.yarnpkg.com/del/-/del-4.1.1.tgz
	https://registry.yarnpkg.com/del/-/del-6.1.1.tgz
	https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/depd/-/depd-2.0.0.tgz
	https://registry.yarnpkg.com/dependency-check/-/dependency-check-4.1.0.tgz
	https://registry.yarnpkg.com/dependency-graph/-/dependency-graph-0.11.0.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/dequal/-/dequal-2.0.3.tgz
	https://registry.yarnpkg.com/des.js/-/des.js-1.0.1.tgz
	https://registry.yarnpkg.com/destroy/-/destroy-1.2.0.tgz
	https://registry.yarnpkg.com/detect-file/-/detect-file-1.0.0.tgz
	https://registry.yarnpkg.com/detect-indent/-/detect-indent-5.0.0.tgz
	https://registry.yarnpkg.com/detect-indent/-/detect-indent-6.0.0.tgz
	https://registry.yarnpkg.com/detective/-/detective-5.2.0.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-1.0.3.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-2.0.2.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/detect-node-es/-/detect-node-es-1.0.0.tgz
	https://registry.yarnpkg.com/detect-port/-/detect-port-1.6.1.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/devtools-protocol/-/devtools-protocol-0.0.1413303.tgz
	https://registry.yarnpkg.com/dicer/-/dicer-0.2.5.tgz
	https://registry.yarnpkg.com/didyoumean/-/didyoumean-1.2.2.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.2.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.5.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/diff/-/diff-5.0.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-5.2.0.tgz
	https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.3.tgz
	https://registry.yarnpkg.com/diff-match-patch/-/diff-match-patch-1.0.5.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-29.6.3.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-4.2.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-2.2.2.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dirt-simple-file-cache/-/dirt-simple-file-cache-0.4.0.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/disparity/-/disparity-3.0.0.tgz
	https://registry.yarnpkg.com/disparity/-/disparity-3.2.0.tgz
	https://registry.yarnpkg.com/dlv/-/dlv-1.1.3.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-25.1.8.tgz
	https://registry.yarnpkg.com/dmg-license/-/dmg-license-1.0.11.tgz
	https://registry.yarnpkg.com/dns-packet/-/dns-packet-5.3.1.tgz
	https://registry.yarnpkg.com/docker-modem/-/docker-modem-3.0.8.tgz
	https://registry.yarnpkg.com/dockerode/-/dockerode-3.3.1.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dom-accessibility-api/-/dom-accessibility-api-0.5.16.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-1.2.0.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-4.22.0.tgz
	https://registry.yarnpkg.com/dom-converter/-/dom-converter-0.2.0.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-1.3.1.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-2.3.0.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-2.4.2.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-4.3.1.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-5.0.3.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-0.2.2.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-1.2.0.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-2.0.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-1.7.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-2.8.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-3.0.1.tgz
	https://registry.yarnpkg.com/dom-walk/-/dom-walk-0.1.2.tgz
	https://registry.yarnpkg.com/dot-case/-/dot-case-2.1.1.tgz
	https://registry.yarnpkg.com/dot-case/-/dot-case-3.0.4.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-10.0.0.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-16.4.5.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-11.0.6.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-5.3.0.tgz
	https://registry.yarnpkg.com/drange/-/drange-1.1.1.tgz
	https://registry.yarnpkg.com/dts-critic/-/dts-critic-3.3.4.tgz
	https://registry.yarnpkg.com/dtslint/-/dtslint-4.2.1.tgz
	https://registry.yarnpkg.com/dunder-proto/-/dunder-proto-1.0.1.tgz
	https://registry.yarnpkg.com/duplexer2/-/duplexer2-0.1.4.tgz
	https://registry.yarnpkg.com/duplexer3/-/duplexer3-0.1.4.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.2.tgz
	https://registry.yarnpkg.com/duplexify/-/duplexify-3.7.1.tgz
	https://registry.yarnpkg.com/duplexify/-/duplexify-4.1.3.tgz
	https://registry.yarnpkg.com/each-props/-/each-props-1.3.2.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz
	https://registry.yarnpkg.com/ecdsa-sig-formatter/-/ecdsa-sig-formatter-1.0.11.tgz
	https://registry.yarnpkg.com/ecstatic/-/ecstatic-3.3.2.tgz
	https://registry.yarnpkg.com/ee-first/-/ee-first-1.1.1.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.10.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.2.10.tgz -> @electron-asar-3.2.10.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-25.1.8.tgz
	https://registry.yarnpkg.com/electron-context-menu/-/electron-context-menu-3.6.1.tgz
	https://registry.yarnpkg.com/electron-dl/-/electron-dl-3.2.1.tgz
	https://registry.yarnpkg.com/electron/-/electron-33.2.1.tgz
	https://registry.yarnpkg.com/@electron/fuses/-/fuses-1.8.0.tgz -> @electron-fuses-1.8.0.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-2.0.2.tgz -> @electron-get-2.0.2.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-3.1.0.tgz -> @electron-get-3.1.0.tgz
	https://registry.yarnpkg.com/electron-is-dev/-/electron-is-dev-2.0.0.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-2.5.0.tgz -> @electron-notarize-2.5.0.tgz
	https://registry.yarnpkg.com/@electron/osx-sign/-/osx-sign-1.3.1.tgz -> @electron-osx-sign-1.3.1.tgz
	https://registry.yarnpkg.com/@electron/packager/-/packager-18.3.4.tgz -> @electron-packager-18.3.4.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-25.1.7.tgz
	https://registry.yarnpkg.com/@electron/rebuild/-/rebuild-3.6.1.tgz -> @electron-rebuild-3.6.1.tgz
	https://registry.yarnpkg.com/@electron/rebuild/-/rebuild-3.7.1.tgz -> @electron-rebuild-3.7.1.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-2.0.1.tgz -> @electron-universal-2.0.1.tgz
	https://registry.yarnpkg.com/@electron/windows-sign/-/windows-sign-1.1.3.tgz -> @electron-windows-sign-1.1.3.tgz
	https://registry.yarnpkg.com/elegant-spinner/-/elegant-spinner-1.0.1.tgz
	https://registry.yarnpkg.com/elliptic/-/elliptic-6.6.1.tgz
	https://registry.yarnpkg.com/email-addresses/-/email-addresses-5.0.0.tgz
	https://registry.yarnpkg.com/email-validator/-/email-validator-2.0.4.tgz
	https://registry.yarnpkg.com/@emnapi/core/-/core-1.3.1.tgz -> @emnapi-core-1.3.1.tgz
	https://registry.yarnpkg.com/@emnapi/runtime/-/runtime-1.3.1.tgz -> @emnapi-runtime-1.3.1.tgz
	https://registry.yarnpkg.com/@emnapi/wasi-threads/-/wasi-threads-1.0.1.tgz -> @emnapi-wasi-threads-1.0.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-7.0.3.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-2.0.0.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.13.tgz
	https://registry.yarnpkg.com/@endemolshinegroup/cosmiconfig-typescript-loader/-/cosmiconfig-typescript-loader-3.0.2.tgz -> @endemolshinegroup-cosmiconfig-typescript-loader-3.0.2.tgz
	https://registry.yarnpkg.com/endent/-/endent-2.0.1.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/engine.io-client/-/engine.io-client-3.5.2.tgz
	https://registry.yarnpkg.com/engine.io-client/-/engine.io-client-5.0.1.tgz
	https://registry.yarnpkg.com/engine.io/-/engine.io-5.0.0.tgz
	https://registry.yarnpkg.com/engine.io/-/engine.io-6.4.2.tgz
	https://registry.yarnpkg.com/engine.io-parser/-/engine.io-parser-2.2.1.tgz
	https://registry.yarnpkg.com/engine.io-parser/-/engine.io-parser-4.0.2.tgz
	https://registry.yarnpkg.com/engine.io-parser/-/engine.io-parser-5.0.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-4.5.0.tgz
	https://registry.yarnpkg.com/enquirer/-/enquirer-2.3.6.tgz
	https://registry.yarnpkg.com/enquirer/-/enquirer-2.4.1.tgz
	https://registry.yarnpkg.com/entities/-/entities-1.1.2.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.2.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-3.0.1.tgz
	https://registry.yarnpkg.com/entities/-/entities-4.5.0.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.13.0.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/enzyme-adapter-react-16/-/enzyme-adapter-react-16-1.12.1.tgz
	https://registry.yarnpkg.com/enzyme-adapter-utils/-/enzyme-adapter-utils-1.14.0.tgz
	https://registry.yarnpkg.com/eol/-/eol-0.9.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/errno/-/errno-0.1.8.tgz
	https://registry.yarnpkg.com/error/-/error-7.2.1.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/errorhandler/-/errorhandler-1.5.1.tgz
	https://registry.yarnpkg.com/error-stack-parser/-/error-stack-parser-2.0.6.tgz
	https://registry.yarnpkg.com/error-stack-parser-es/-/error-stack-parser-es-0.1.1.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.53.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.3.tgz
	https://registry.yarnpkg.com/es6-object-assign/-/es6-object-assign-1.1.0.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-3.3.1.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.2.8.tgz
	https://registry.yarnpkg.com/es6-promisify/-/es6-promisify-5.0.0.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.3.tgz
	https://registry.yarnpkg.com/es6-weak-map/-/es6-weak-map-2.0.3.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.23.3.tgz
	https://registry.yarnpkg.com/@esbuild/aix-ppc64/-/aix-ppc64-0.20.2.tgz -> @esbuild-aix-ppc64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-android-64/-/esbuild-android-64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm64/-/android-arm64-0.18.20.tgz -> @esbuild-android-arm64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm64/-/android-arm64-0.20.2.tgz -> @esbuild-android-arm64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-android-arm64/-/esbuild-android-arm64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm/-/android-arm-0.18.20.tgz -> @esbuild-android-arm-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm/-/android-arm-0.20.2.tgz -> @esbuild-android-arm-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/android-x64/-/android-x64-0.18.20.tgz -> @esbuild-android-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/android-x64/-/android-x64-0.20.2.tgz -> @esbuild-android-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-darwin-64/-/esbuild-darwin-64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-arm64/-/darwin-arm64-0.18.20.tgz -> @esbuild-darwin-arm64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-arm64/-/darwin-arm64-0.20.2.tgz -> @esbuild-darwin-arm64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-darwin-arm64/-/esbuild-darwin-arm64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-x64/-/darwin-x64-0.18.20.tgz -> @esbuild-darwin-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-x64/-/darwin-x64-0.20.2.tgz -> @esbuild-darwin-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.18.20.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-freebsd-64/-/esbuild-freebsd-64-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-freebsd-arm64/-/esbuild-freebsd-arm64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-arm64/-/freebsd-arm64-0.18.20.tgz -> @esbuild-freebsd-arm64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-arm64/-/freebsd-arm64-0.20.2.tgz -> @esbuild-freebsd-arm64-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-x64/-/freebsd-x64-0.18.20.tgz -> @esbuild-freebsd-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-x64/-/freebsd-x64-0.20.2.tgz -> @esbuild-freebsd-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-linux-32/-/esbuild-linux-32-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-linux-64/-/esbuild-linux-64-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-linux-arm64/-/esbuild-linux-arm64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm64/-/linux-arm64-0.18.20.tgz -> @esbuild-linux-arm64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm64/-/linux-arm64-0.20.2.tgz -> @esbuild-linux-arm64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-linux-arm/-/esbuild-linux-arm-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm/-/linux-arm-0.18.20.tgz -> @esbuild-linux-arm-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm/-/linux-arm-0.20.2.tgz -> @esbuild-linux-arm-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ia32/-/linux-ia32-0.18.20.tgz -> @esbuild-linux-ia32-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ia32/-/linux-ia32-0.20.2.tgz -> @esbuild-linux-ia32-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.15.7.tgz -> @esbuild-linux-loong64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.18.20.tgz -> @esbuild-linux-loong64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.20.2.tgz -> @esbuild-linux-loong64-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/linux-mips64el/-/linux-mips64el-0.18.20.tgz -> @esbuild-linux-mips64el-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-mips64el/-/linux-mips64el-0.20.2.tgz -> @esbuild-linux-mips64el-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-linux-mips64le/-/esbuild-linux-mips64le-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-linux-ppc64le/-/esbuild-linux-ppc64le-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ppc64/-/linux-ppc64-0.18.20.tgz -> @esbuild-linux-ppc64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ppc64/-/linux-ppc64-0.20.2.tgz -> @esbuild-linux-ppc64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-linux-riscv64/-/esbuild-linux-riscv64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-riscv64/-/linux-riscv64-0.18.20.tgz -> @esbuild-linux-riscv64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-riscv64/-/linux-riscv64-0.20.2.tgz -> @esbuild-linux-riscv64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-linux-s390x/-/esbuild-linux-s390x-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/linux-s390x/-/linux-s390x-0.18.20.tgz -> @esbuild-linux-s390x-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-s390x/-/linux-s390x-0.20.2.tgz -> @esbuild-linux-s390x-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/linux-x64/-/linux-x64-0.18.20.tgz -> @esbuild-linux-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/linux-x64/-/linux-x64-0.20.2.tgz -> @esbuild-linux-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-netbsd-64/-/esbuild-netbsd-64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-x64/-/netbsd-x64-0.18.20.tgz -> @esbuild-netbsd-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-x64/-/netbsd-x64-0.20.2.tgz -> @esbuild-netbsd-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-openbsd-64/-/esbuild-openbsd-64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-x64/-/openbsd-x64-0.18.20.tgz -> @esbuild-openbsd-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-x64/-/openbsd-x64-0.20.2.tgz -> @esbuild-openbsd-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-sunos-64/-/esbuild-sunos-64-0.15.7.tgz
	https://registry.yarnpkg.com/@esbuild/sunos-x64/-/sunos-x64-0.18.20.tgz -> @esbuild-sunos-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/sunos-x64/-/sunos-x64-0.20.2.tgz -> @esbuild-sunos-x64-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/win32-arm64/-/win32-arm64-0.18.20.tgz -> @esbuild-win32-arm64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/win32-arm64/-/win32-arm64-0.20.2.tgz -> @esbuild-win32-arm64-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/win32-ia32/-/win32-ia32-0.18.20.tgz -> @esbuild-win32-ia32-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/win32-ia32/-/win32-ia32-0.20.2.tgz -> @esbuild-win32-ia32-0.20.2.tgz
	https://registry.yarnpkg.com/@esbuild/win32-x64/-/win32-x64-0.18.20.tgz -> @esbuild-win32-x64-0.18.20.tgz
	https://registry.yarnpkg.com/@esbuild/win32-x64/-/win32-x64-0.20.2.tgz -> @esbuild-win32-x64-0.20.2.tgz
	https://registry.yarnpkg.com/esbuild-windows-32/-/esbuild-windows-32-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-windows-64/-/esbuild-windows-64-0.15.7.tgz
	https://registry.yarnpkg.com/esbuild-windows-arm64/-/esbuild-windows-arm64-0.15.7.tgz
	https://registry.yarnpkg.com/escape-goat/-/escape-goat-2.1.1.tgz
	https://registry.yarnpkg.com/escape-html/-/escape-html-1.0.3.tgz
	https://registry.yarnpkg.com/escape-quotes/-/escape-quotes-1.0.2.tgz
	https://registry.yarnpkg.com/escape-string-applescript/-/escape-string-applescript-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-2.1.0.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.1.tgz
	https://registry.yarnpkg.com/es-errors/-/es-errors-1.3.0.tgz
	https://registry.yarnpkg.com/es-get-iterator/-/es-get-iterator-1.1.3.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.10.0.tgz -> @eslint-community-regexpp-4.10.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.57.0.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.4.tgz -> @eslint-eslintrc-2.1.4.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.57.0.tgz -> @eslint-js-8.57.0.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.8.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-cypress/-/eslint-plugin-cypress-3.5.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-graphql/-/eslint-plugin-graphql-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.25.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.29.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-json-format/-/eslint-plugin-json-format-2.0.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-mocha/-/eslint-plugin-mocha-8.2.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-promise/-/eslint-plugin-promise-4.3.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.22.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-4.2.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-vue/-/eslint-plugin-vue-7.18.0.tgz
	https://registry.yarnpkg.com/eslint-rule-composer/-/eslint-rule-composer-0.3.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-4.0.3.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.3.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-0.9.3.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-1.6.0.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.1.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-6.2.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esprima-extract-comments/-/esprima-extract-comments-1.1.0.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.5.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.3.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.2.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-1.0.1.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-2.0.2.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.1.tgz
	https://registry.yarnpkg.com/eventemitter2/-/eventemitter2-6.4.7.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-3.1.2.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-4.0.7.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/eventsource/-/eventsource-2.0.2.tgz
	https://registry.yarnpkg.com/event-target-shim/-/event-target-shim-5.0.1.tgz
	https://registry.yarnpkg.com/evil-dns/-/evil-dns-0.2.0.tgz
	https://registry.yarnpkg.com/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.10.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.11.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.2.2.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.7.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-1.0.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-4.0.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-4.1.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.0.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.1.1.tgz
	https://registry.yarnpkg.com/execa-wrap/-/execa-wrap-1.4.0.tgz
	https://registry.yarnpkg.com/executable/-/executable-4.1.1.tgz
	https://registry.yarnpkg.com/exif-parser/-/exif-parser-0.1.12.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-2.1.4.tgz
	https://registry.yarnpkg.com/expand-template/-/expand-template-2.0.3.tgz
	https://registry.yarnpkg.com/expand-tilde/-/expand-tilde-2.0.2.tgz
	https://registry.yarnpkg.com/express/-/express-4.21.0.tgz
	https://registry.yarnpkg.com/express-graphql/-/express-graphql-0.12.0.tgz
	https://registry.yarnpkg.com/express-session/-/express-session-1.16.1.tgz
	https://registry.yarnpkg.com/express-useragent/-/express-useragent-1.0.15.tgz
	https://registry.yarnpkg.com/exsolve/-/exsolve-1.0.4.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-1.1.4.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-2.0.1.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-3.0.2.tgz
	https://registry.yarnpkg.com/external-editor/-/external-editor-3.1.0.tgz
	https://registry.yarnpkg.com/ext/-/ext-1.4.0.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-2.0.4.tgz
	https://registry.yarnpkg.com/ext-list/-/ext-list-2.2.2.tgz
	https://registry.yarnpkg.com/ext-name/-/ext-name-5.0.0.tgz
	https://registry.yarnpkg.com/extract-comments/-/extract-comments-1.1.0.tgz
	https://registry.yarnpkg.com/extract-files/-/extract-files-11.0.0.tgz
	https://registry.yarnpkg.com/extract-files/-/extract-files-9.0.0.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-2.0.1.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.3.0.tgz
	https://registry.yarnpkg.com/@faker-js/faker/-/faker-9.6.0.tgz -> @faker-js-faker-9.6.0.tgz
	https://registry.yarnpkg.com/fake-uuid/-/fake-uuid-1.0.0.tgz
	https://registry.yarnpkg.com/fancy-log/-/fancy-log-1.3.3.tgz
	https://registry.yarnpkg.com/fancy-log/-/fancy-log-2.0.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-fifo/-/fast-fifo-1.3.2.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.2.tgz
	https://registry.yarnpkg.com/fast-json-parse/-/fast-json-parse-1.0.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-1.1.4.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.11.0.tgz
	https://registry.yarnpkg.com/fast-safe-stringify/-/fast-safe-stringify-2.0.7.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-3.19.0.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-4.2.5.tgz
	https://registry.yarnpkg.com/fast-xml-parser/-/fast-xml-parser-4.5.1.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.10.0.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.11.3.tgz
	https://registry.yarnpkg.com/fbjs-css-vars/-/fbjs-css-vars-1.0.2.tgz
	https://registry.yarnpkg.com/fbjs/-/fbjs-0.8.17.tgz
	https://registry.yarnpkg.com/fbjs/-/fbjs-3.0.0.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.1.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/@fellow/coffeelint2/-/coffeelint2-2.2.6.tgz -> @fellow-coffeelint2-2.2.6.tgz
	https://registry.yarnpkg.com/@fellow/eslint-plugin-coffee/-/eslint-plugin-coffee-0.4.13.tgz -> @fellow-eslint-plugin-coffee-0.4.13.tgz
	https://registry.yarnpkg.com/fetch-retry-ts/-/fetch-retry-ts-1.3.1.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/darwin-arm64/-/darwin-arm64-4.1.5.tgz -> @ffmpeg-installer-darwin-arm64-4.1.5.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/darwin-x64/-/darwin-x64-4.1.0.tgz -> @ffmpeg-installer-darwin-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/ffmpeg/-/ffmpeg-1.1.0.tgz -> @ffmpeg-installer-ffmpeg-1.1.0.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/linux-arm64/-/linux-arm64-4.1.4.tgz -> @ffmpeg-installer-linux-arm64-4.1.4.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/linux-arm/-/linux-arm-4.1.3.tgz -> @ffmpeg-installer-linux-arm-4.1.3.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/linux-ia32/-/linux-ia32-4.1.0.tgz -> @ffmpeg-installer-linux-ia32-4.1.0.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/linux-x64/-/linux-x64-4.1.0.tgz -> @ffmpeg-installer-linux-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/win32-ia32/-/win32-ia32-4.1.0.tgz -> @ffmpeg-installer-win32-ia32-4.1.0.tgz
	https://registry.yarnpkg.com/@ffmpeg-installer/win32-x64/-/win32-x64-4.1.0.tgz -> @ffmpeg-installer-win32-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/darwin-arm64/-/darwin-arm64-5.0.1.tgz -> @ffprobe-installer-darwin-arm64-5.0.1.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/darwin-x64/-/darwin-x64-4.1.0.tgz -> @ffprobe-installer-darwin-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/darwin-x64/-/darwin-x64-5.1.0.tgz -> @ffprobe-installer-darwin-x64-5.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/ffprobe/-/ffprobe-1.1.0.tgz -> @ffprobe-installer-ffprobe-1.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/ffprobe/-/ffprobe-2.1.2.tgz -> @ffprobe-installer-ffprobe-2.1.2.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-arm64/-/linux-arm64-4.3.2.tgz -> @ffprobe-installer-linux-arm64-4.3.2.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-arm64/-/linux-arm64-5.2.0.tgz -> @ffprobe-installer-linux-arm64-5.2.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-arm/-/linux-arm-4.3.2.tgz -> @ffprobe-installer-linux-arm-4.3.2.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-arm/-/linux-arm-5.2.0.tgz -> @ffprobe-installer-linux-arm-5.2.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-ia32/-/linux-ia32-4.1.0.tgz -> @ffprobe-installer-linux-ia32-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-ia32/-/linux-ia32-5.2.0.tgz -> @ffprobe-installer-linux-ia32-5.2.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-x64/-/linux-x64-4.1.0.tgz -> @ffprobe-installer-linux-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/linux-x64/-/linux-x64-5.2.0.tgz -> @ffprobe-installer-linux-x64-5.2.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/win32-ia32/-/win32-ia32-4.1.0.tgz -> @ffprobe-installer-win32-ia32-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/win32-ia32/-/win32-ia32-5.1.0.tgz -> @ffprobe-installer-win32-ia32-5.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/win32-x64/-/win32-x64-4.1.0.tgz -> @ffprobe-installer-win32-x64-4.1.0.tgz
	https://registry.yarnpkg.com/@ffprobe-installer/win32-x64/-/win32-x64-5.1.0.tgz -> @ffprobe-installer-win32-x64-5.1.0.tgz
	https://registry.yarnpkg.com/figgy-pudding/-/figgy-pudding-3.5.2.tgz
	https://registry.yarnpkg.com/figures/-/figures-1.7.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-2.0.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-3.2.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.2.tgz
	https://registry.yarnpkg.com/filename-reserved-regex/-/filename-reserved-regex-2.0.0.tgz
	https://registry.yarnpkg.com/filenamify/-/filenamify-4.3.0.tgz
	https://registry.yarnpkg.com/filesize/-/filesize-10.1.1.tgz
	https://registry.yarnpkg.com/file-type/-/file-type-16.5.4.tgz
	https://registry.yarnpkg.com/file-type/-/file-type-3.9.0.tgz
	https://registry.yarnpkg.com/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz
	https://registry.yarnpkg.com/file-url/-/file-url-3.0.0.tgz
	https://registry.yarnpkg.com/fill-keys/-/fill-keys-1.0.2.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-4.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.1.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.3.1.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-2.1.0.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-3.3.1.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-4.0.0.tgz
	https://registry.yarnpkg.com/find-process/-/find-process-1.4.7.tgz
	https://registry.yarnpkg.com/find-remove/-/find-remove-1.2.2.tgz
	https://registry.yarnpkg.com/find-test-names/-/find-test-names-1.28.18.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-1.1.2.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-2.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-6.3.0.tgz
	https://registry.yarnpkg.com/findup-sync/-/findup-sync-2.0.0.tgz
	https://registry.yarnpkg.com/findup-sync/-/findup-sync-3.0.0.tgz
	https://registry.yarnpkg.com/findup-sync/-/findup-sync-4.0.0.tgz
	https://registry.yarnpkg.com/find-yarn-workspace-root/-/find-yarn-workspace-root-2.0.0.tgz
	https://registry.yarnpkg.com/fined/-/fined-1.2.0.tgz
	https://registry.yarnpkg.com/flagged-respawn/-/flagged-respawn-1.0.1.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flat/-/flat-4.1.1.tgz
	https://registry.yarnpkg.com/flat/-/flat-5.0.2.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.9.tgz
	https://registry.yarnpkg.com/@floating-ui/core/-/core-0.3.1.tgz -> @floating-ui-core-0.3.1.tgz
	https://registry.yarnpkg.com/@floating-ui/dom/-/dom-0.1.10.tgz -> @floating-ui-dom-0.1.10.tgz
	https://registry.yarnpkg.com/floating-vue/-/floating-vue-2.0.0-beta.17.tgz
	https://registry.yarnpkg.com/flora-colossus/-/flora-colossus-2.0.0.tgz
	https://registry.yarnpkg.com/fluent-ffmpeg/-/fluent-ffmpeg-2.1.2.tgz
	https://registry.yarnpkg.com/flush-write-stream/-/flush-write-stream-1.1.1.tgz
	https://registry.yarnpkg.com/fmerge/-/fmerge-1.2.0.tgz
	https://registry.yarnpkg.com/focus-lock/-/focus-lock-0.8.1.tgz
	https://registry.yarnpkg.com/folktale/-/folktale-2.3.2.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.15.6.tgz
	https://registry.yarnpkg.com/@fontsource/mulish/-/mulish-4.3.0.tgz -> @fontsource-mulish-4.3.0.tgz
	https://registry.yarnpkg.com/@fontsource/open-sans/-/open-sans-4.3.0.tgz -> @fontsource-open-sans-4.3.0.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/foreach/-/foreach-2.0.5.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.1.1.tgz
	https://registry.yarnpkg.com/forever-agent/-/forever-agent-0.6.1.tgz
	https://registry.yarnpkg.com/for-in/-/for-in-1.0.2.tgz
	https://registry.yarnpkg.com/formatio/-/formatio-1.1.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.3.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.5.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-3.0.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.1.tgz
	https://registry.yarnpkg.com/formidable/-/formidable-1.2.2.tgz
	https://registry.yarnpkg.com/for-own/-/for-own-0.1.5.tgz
	https://registry.yarnpkg.com/for-own/-/for-own-1.0.0.tgz
	https://registry.yarnpkg.com/@fortawesome/fontawesome-free/-/fontawesome-free-6.0.0.tgz -> @fortawesome-fontawesome-free-6.0.0.tgz
	https://registry.yarnpkg.com/forwarded/-/forwarded-0.2.0.tgz
	https://registry.yarnpkg.com/fraction.js/-/fraction.js-4.3.7.tgz
	https://registry.yarnpkg.com/fragment-cache/-/fragment-cache-0.2.1.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.2.tgz
	https://registry.yarnpkg.com/from2/-/from2-2.3.0.tgz
	https://registry.yarnpkg.com/front-matter/-/front-matter-4.0.2.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.13.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.1.2.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-11.2.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-3.0.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-4.0.3.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-6.0.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs-mkdirp-stream/-/fs-mkdirp-stream-1.0.0.tgz
	https://registry.yarnpkg.com/fs-monkey/-/fs-monkey-1.0.6.tgz
	https://registry.yarnpkg.com/fs-readdir-recursive/-/fs-readdir-recursive-1.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fstream/-/fstream-1.0.12.tgz
	https://registry.yarnpkg.com/fsu/-/fsu-1.1.1.tgz
	https://registry.yarnpkg.com/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.6.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/fuzzysort/-/fuzzysort-1.1.4.tgz
	https://registry.yarnpkg.com/fwd-stream/-/fwd-stream-1.0.4.tgz
	https://registry.yarnpkg.com/galactus/-/galactus-1.0.0.tgz
	https://registry.yarnpkg.com/@gar/promisify/-/promisify-1.1.3.tgz -> @gar-promisify-1.1.3.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-4.0.4.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-1.0.3.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/getenv/-/getenv-1.0.0.tgz
	https://registry.yarnpkg.com/get-func-name/-/get-func-name-2.0.2.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.3.0.tgz
	https://registry.yarnpkg.com/get-nonce/-/get-nonce-1.0.1.tgz
	https://registry.yarnpkg.com/getos/-/getos-3.2.1.tgz
	https://registry.yarnpkg.com/get-own-enumerable-property-symbols/-/get-own-enumerable-property-symbols-3.0.2.tgz
	https://registry.yarnpkg.com/get-package-info/-/get-package-info-1.0.0.tgz
	https://registry.yarnpkg.com/getpass/-/getpass-0.1.7.tgz
	https://registry.yarnpkg.com/get-pkg-repo/-/get-pkg-repo-4.2.1.tgz
	https://registry.yarnpkg.com/get-port/-/get-port-5.1.1.tgz
	https://registry.yarnpkg.com/get-proto/-/get-proto-1.0.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-2.3.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-3.0.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-6.0.0.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.2.tgz
	https://registry.yarnpkg.com/get-uri/-/get-uri-6.0.1.tgz
	https://registry.yarnpkg.com/get-value/-/get-value-2.0.6.tgz
	https://registry.yarnpkg.com/gh-pages/-/gh-pages-5.0.0.tgz
	https://registry.yarnpkg.com/gifwrap/-/gifwrap-0.10.1.tgz
	https://registry.yarnpkg.com/gitconfiglocal/-/gitconfiglocal-1.0.0.tgz
	https://registry.yarnpkg.com/git-hooks-list/-/git-hooks-list-1.0.3.tgz
	https://registry.yarnpkg.com/github-from-package/-/github-from-package-0.0.0.tgz
	https://registry.yarnpkg.com/git-log-parser/-/git-log-parser-1.2.0.tgz
	https://registry.yarnpkg.com/git-raw-commits/-/git-raw-commits-2.0.10.tgz
	https://registry.yarnpkg.com/git-raw-commits/-/git-raw-commits-3.0.0.tgz
	https://registry.yarnpkg.com/git-remote-origin-url/-/git-remote-origin-url-2.0.0.tgz
	https://registry.yarnpkg.com/git-semver-tags/-/git-semver-tags-4.1.1.tgz
	https://registry.yarnpkg.com/git-semver-tags/-/git-semver-tags-5.0.1.tgz
	https://registry.yarnpkg.com/git-up/-/git-up-7.0.0.tgz
	https://registry.yarnpkg.com/git-url-parse/-/git-url-parse-14.0.0.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/global-dirs/-/global-dirs-3.0.0.tgz
	https://registry.yarnpkg.com/global/-/global-4.4.0.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-1.0.0.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-1.0.2.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.24.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-15.15.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-9.18.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/glob-base/-/glob-base-0.3.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-10.0.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-10.0.1.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.0.3.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-13.2.2.tgz
	https://registry.yarnpkg.com/globby/-/globby-6.1.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-7.1.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.4.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.6.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-8.1.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-9.3.5.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-2.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-3.1.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-stream/-/glob-stream-6.1.0.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob-watcher/-/glob-watcher-5.0.5.tgz
	https://registry.yarnpkg.com/glogg/-/glogg-1.0.2.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.2.0.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.6.tgz
	https://registry.yarnpkg.com/got/-/got-8.3.2.tgz
	https://registry.yarnpkg.com/got/-/got-9.6.0.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.10.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.9.tgz
	https://registry.yarnpkg.com/graceful-readlink/-/graceful-readlink-1.0.1.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/grapheme-splitter/-/grapheme-splitter-1.0.4.tgz
	https://registry.yarnpkg.com/@graphql-codegen/add/-/add-3.1.0.tgz -> @graphql-codegen-add-3.1.0.tgz
	https://registry.yarnpkg.com/@graphql-codegen/cli/-/cli-2.2.0.tgz -> @graphql-codegen-cli-2.2.0.tgz
	https://registry.yarnpkg.com/@graphql-codegen/core/-/core-2.1.0.tgz -> @graphql-codegen-core-2.1.0.tgz
	https://registry.yarnpkg.com/@graphql-codegen/plugin-helpers/-/plugin-helpers-2.3.2.tgz -> @graphql-codegen-plugin-helpers-2.3.2.tgz
	https://registry.yarnpkg.com/@graphql-codegen/plugin-helpers/-/plugin-helpers-2.4.2.tgz -> @graphql-codegen-plugin-helpers-2.4.2.tgz
	https://registry.yarnpkg.com/@graphql-codegen/schema-ast/-/schema-ast-2.4.1.tgz -> @graphql-codegen-schema-ast-2.4.1.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typed-document-node/-/typed-document-node-2.2.8.tgz -> @graphql-codegen-typed-document-node-2.2.8.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typescript-operations/-/typescript-operations-2.2.3.tgz -> @graphql-codegen-typescript-operations-2.2.3.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typescript-resolvers/-/typescript-resolvers-2.6.4.tgz -> @graphql-codegen-typescript-resolvers-2.6.4.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typescript/-/typescript-2.4.11.tgz -> @graphql-codegen-typescript-2.4.11.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typescript/-/typescript-2.4.2.tgz -> @graphql-codegen-typescript-2.4.2.tgz
	https://registry.yarnpkg.com/@graphql-codegen/typescript-urql-graphcache/-/typescript-urql-graphcache-2.2.3.tgz -> @graphql-codegen-typescript-urql-graphcache-2.2.3.tgz
	https://registry.yarnpkg.com/@graphql-codegen/visitor-plugin-common/-/visitor-plugin-common-2.5.2.tgz -> @graphql-codegen-visitor-plugin-common-2.5.2.tgz
	https://registry.yarnpkg.com/@graphql-codegen/visitor-plugin-common/-/visitor-plugin-common-2.7.4.tgz -> @graphql-codegen-visitor-plugin-common-2.7.4.tgz
	https://registry.yarnpkg.com/@graphql-codegen/visitor-plugin-common/-/visitor-plugin-common-2.8.0.tgz -> @graphql-codegen-visitor-plugin-common-2.8.0.tgz
	https://registry.yarnpkg.com/graphql-config/-/graphql-config-3.4.1.tgz
	https://registry.yarnpkg.com/graphql-config/-/graphql-config-4.0.1.tgz
	https://registry.yarnpkg.com/graphql-executor/-/graphql-executor-0.0.23.tgz
	https://registry.yarnpkg.com/graphql/-/graphql-15.5.1.tgz
	https://registry.yarnpkg.com/graphql-relay/-/graphql-relay-0.9.0.tgz
	https://registry.yarnpkg.com/graphql-request/-/graphql-request-3.4.0.tgz
	https://registry.yarnpkg.com/graphql-resolve-batch/-/graphql-resolve-batch-1.0.3.tgz
	https://registry.yarnpkg.com/graphql-scalars/-/graphql-scalars-1.10.0.tgz
	https://registry.yarnpkg.com/graphql-sse/-/graphql-sse-1.0.4.tgz
	https://registry.yarnpkg.com/graphql-tag/-/graphql-tag-2.12.5.tgz
	https://registry.yarnpkg.com/@graphql-tools/apollo-engine-loader/-/apollo-engine-loader-7.1.0.tgz -> @graphql-tools-apollo-engine-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/batch-execute/-/batch-execute-7.1.2.tgz -> @graphql-tools-batch-execute-7.1.2.tgz
	https://registry.yarnpkg.com/@graphql-tools/batch-execute/-/batch-execute-8.4.6.tgz -> @graphql-tools-batch-execute-8.4.6.tgz
	https://registry.yarnpkg.com/@graphql-tools/code-file-loader/-/code-file-loader-7.1.0.tgz -> @graphql-tools-code-file-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/delegate/-/delegate-7.1.5.tgz -> @graphql-tools-delegate-7.1.5.tgz
	https://registry.yarnpkg.com/@graphql-tools/delegate/-/delegate-8.2.1.tgz -> @graphql-tools-delegate-8.2.1.tgz
	https://registry.yarnpkg.com/@graphql-tools/github-loader/-/github-loader-7.1.0.tgz -> @graphql-tools-github-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/git-loader/-/git-loader-7.1.0.tgz -> @graphql-tools-git-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/graphql-file-loader/-/graphql-file-loader-6.2.7.tgz -> @graphql-tools-graphql-file-loader-6.2.7.tgz
	https://registry.yarnpkg.com/@graphql-tools/graphql-file-loader/-/graphql-file-loader-7.1.0.tgz -> @graphql-tools-graphql-file-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/graphql-tag-pluck/-/graphql-tag-pluck-7.1.1.tgz -> @graphql-tools-graphql-tag-pluck-7.1.1.tgz
	https://registry.yarnpkg.com/@graphql-tools/import/-/import-6.6.1.tgz -> @graphql-tools-import-6.6.1.tgz
	https://registry.yarnpkg.com/@graphql-tools/json-file-loader/-/json-file-loader-6.2.6.tgz -> @graphql-tools-json-file-loader-6.2.6.tgz
	https://registry.yarnpkg.com/@graphql-tools/json-file-loader/-/json-file-loader-7.2.0.tgz -> @graphql-tools-json-file-loader-7.2.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/load/-/load-6.2.8.tgz -> @graphql-tools-load-6.2.8.tgz
	https://registry.yarnpkg.com/@graphql-tools/load/-/load-7.3.2.tgz -> @graphql-tools-load-7.3.2.tgz
	https://registry.yarnpkg.com/@graphql-tools/merge/-/merge-6.2.14.tgz -> @graphql-tools-merge-6.2.14.tgz
	https://registry.yarnpkg.com/@graphql-tools/merge/-/merge-6.2.17.tgz -> @graphql-tools-merge-6.2.17.tgz
	https://registry.yarnpkg.com/@graphql-tools/merge/-/merge-8.1.2.tgz -> @graphql-tools-merge-8.1.2.tgz
	https://registry.yarnpkg.com/@graphql-tools/optimize/-/optimize-1.0.1.tgz -> @graphql-tools-optimize-1.0.1.tgz
	https://registry.yarnpkg.com/@graphql-tools/prisma-loader/-/prisma-loader-7.1.0.tgz -> @graphql-tools-prisma-loader-7.1.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/relay-operation-optimizer/-/relay-operation-optimizer-6.4.0.tgz -> @graphql-tools-relay-operation-optimizer-6.4.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/schema/-/schema-7.1.5.tgz -> @graphql-tools-schema-7.1.5.tgz
	https://registry.yarnpkg.com/@graphql-tools/schema/-/schema-8.2.0.tgz -> @graphql-tools-schema-8.2.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/url-loader/-/url-loader-6.10.1.tgz -> @graphql-tools-url-loader-6.10.1.tgz
	https://registry.yarnpkg.com/@graphql-tools/url-loader/-/url-loader-7.2.0.tgz -> @graphql-tools-url-loader-7.2.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/utils/-/utils-7.10.0.tgz -> @graphql-tools-utils-7.10.0.tgz
	https://registry.yarnpkg.com/@graphql-tools/utils/-/utils-8.0.2.tgz -> @graphql-tools-utils-8.0.2.tgz
	https://registry.yarnpkg.com/@graphql-tools/utils/-/utils-8.2.3.tgz -> @graphql-tools-utils-8.2.3.tgz
	https://registry.yarnpkg.com/@graphql-tools/utils/-/utils-8.5.3.tgz -> @graphql-tools-utils-8.5.3.tgz
	https://registry.yarnpkg.com/@graphql-tools/utils/-/utils-8.6.9.tgz -> @graphql-tools-utils-8.6.9.tgz
	https://registry.yarnpkg.com/@graphql-tools/wrap/-/wrap-7.0.8.tgz -> @graphql-tools-wrap-7.0.8.tgz
	https://registry.yarnpkg.com/@graphql-tools/wrap/-/wrap-8.1.1.tgz -> @graphql-tools-wrap-8.1.1.tgz
	https://registry.yarnpkg.com/@graphql-typed-document-node/core/-/core-3.1.1.tgz -> @graphql-typed-document-node-core-3.1.1.tgz
	https://registry.yarnpkg.com/graphql-ws/-/graphql-ws-4.9.0.tgz
	https://registry.yarnpkg.com/graphql-ws/-/graphql-ws-5.5.5.tgz
	https://registry.yarnpkg.com/gravatar/-/gravatar-1.8.0.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.10.5.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.9.2.tgz
	https://registry.yarnpkg.com/gulp-awspublish/-/gulp-awspublish-8.0.0.tgz
	https://registry.yarnpkg.com/gulp-clean/-/gulp-clean-0.4.0.tgz
	https://registry.yarnpkg.com/gulp-cli/-/gulp-cli-2.3.0.tgz
	https://registry.yarnpkg.com/gulp-debug/-/gulp-debug-4.0.0.tgz
	https://registry.yarnpkg.com/gulp/-/gulp-4.0.2.tgz
	https://registry.yarnpkg.com/gulplog/-/gulplog-1.0.0.tgz
	https://registry.yarnpkg.com/gulp-rename/-/gulp-rename-1.4.0.tgz
	https://registry.yarnpkg.com/gulp-rev-all/-/gulp-rev-all-2.0.2.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-3.0.8.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.7.7.tgz
	https://registry.yarnpkg.com/handle-thing/-/handle-thing-2.0.1.tgz
	https://registry.yarnpkg.com/hard-rejection/-/hard-rejection-2.1.0.tgz
	https://registry.yarnpkg.com/har-schema/-/har-schema-2.0.0.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.1.5.tgz
	https://registry.yarnpkg.com/has-ansi/-/has-ansi-2.0.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-binary2/-/has-binary2-1.0.3.tgz
	https://registry.yarnpkg.com/has-cors/-/has-cors-1.1.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-1.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/hasha/-/hasha-5.0.0.tgz
	https://registry.yarnpkg.com/hasha/-/hasha-5.2.2.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-3.1.0.tgz
	https://registry.yarnpkg.com/hash.js/-/hash.js-1.1.7.tgz
	https://registry.yarnpkg.com/has-only/-/has-only-1.1.1.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.2.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.1.0.tgz
	https://registry.yarnpkg.com/has-symbol-support-x/-/has-symbol-support-x-1.4.2.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.2.tgz
	https://registry.yarnpkg.com/has-to-string-tag-x/-/has-to-string-tag-x-1.4.1.tgz
	https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-0.3.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-1.0.0.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-0.1.4.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-1.0.0.tgz
	https://registry.yarnpkg.com/header-case/-/header-case-1.0.1.tgz
	https://registry.yarnpkg.com/header-case/-/header-case-2.0.4.tgz
	https://registry.yarnpkg.com/@headlessui/vue/-/vue-1.4.0.tgz -> @headlessui-vue-1.4.0.tgz
	https://registry.yarnpkg.com/he/-/he-1.1.1.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz
	https://registry.yarnpkg.com/highlight.js/-/highlight.js-8.9.1.tgz
	https://registry.yarnpkg.com/hmac-drbg/-/hmac-drbg-1.0.1.tgz
	https://registry.yarnpkg.com/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.8.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-8.0.0.tgz
	https://registry.yarnpkg.com/hpack.js/-/hpack.js-2.1.6.tgz
	https://registry.yarnpkg.com/html-encoding-sniffer/-/html-encoding-sniffer-4.0.0.tgz
	https://registry.yarnpkg.com/html-entities/-/html-entities-2.5.2.tgz
	https://registry.yarnpkg.com/html-minifier-terser/-/html-minifier-terser-5.1.1.tgz
	https://registry.yarnpkg.com/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-3.10.1.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-6.1.0.tgz
	https://registry.yarnpkg.com/html-tags/-/html-tags-3.3.1.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-4.5.2.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-5.5.0.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-5.5.3.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-3.8.1.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-deceiver/-/http-deceiver-1.2.7.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.3.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.8.0.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-2.0.0.tgz
	https://registry.yarnpkg.com/http-parser-js/-/http-parser-js-0.5.3.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-4.0.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.18.1.tgz
	https://registry.yarnpkg.com/http-proxy-middleware/-/http-proxy-middleware-2.0.6.tgz
	https://registry.yarnpkg.com/https-browserify/-/https-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/http-server/-/http-server-0.12.3.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.2.0.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.4.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-3.0.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.6.tgz
	https://registry.yarnpkg.com/human-interval/-/human-interval-1.0.0.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-1.1.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-2.1.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.11.14.tgz -> @humanwhocodes-config-array-0.11.14.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-2.0.3.tgz -> @humanwhocodes-object-schema-2.0.3.tgz
	https://registry.yarnpkg.com/husky/-/husky-7.0.2.tgz
	https://registry.yarnpkg.com/@hutson/parse-repository-url/-/parse-repository-url-3.0.2.tgz -> @hutson-parse-repository-url-3.0.2.tgz
	https://registry.yarnpkg.com/@iarna/toml/-/toml-2.2.5.tgz -> @iarna-toml-2.2.5.tgz
	https://registry.yarnpkg.com/@iconify/iconify/-/iconify-2.1.2.tgz -> @iconify-iconify-2.1.2.tgz
	https://registry.yarnpkg.com/@iconify-json/logos/-/logos-1.2.4.tgz -> @iconify-json-logos-1.2.4.tgz
	https://registry.yarnpkg.com/@iconify-json/mdi/-/mdi-1.2.3.tgz -> @iconify-json-mdi-1.2.3.tgz
	https://registry.yarnpkg.com/@iconify/types/-/types-2.0.0.tgz -> @iconify-types-2.0.0.tgz
	https://registry.yarnpkg.com/@iconify/utils/-/utils-2.3.0.tgz -> @iconify-utils-2.3.0.tgz
	https://registry.yarnpkg.com/iconv-corefoundation/-/iconv-corefoundation-1.1.7.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.2.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/icss-utils/-/icss-utils-5.1.0.tgz
	https://registry.yarnpkg.com/idb-wrapper/-/idb-wrapper-1.7.2.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-0.1.5.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-3.3.10.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.4.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-7.0.0.tgz
	https://registry.yarnpkg.com/image-q/-/image-q-4.0.0.tgz
	https://registry.yarnpkg.com/image-size/-/image-size-0.5.5.tgz
	https://registry.yarnpkg.com/image-size/-/image-size-1.1.1.tgz
	https://registry.yarnpkg.com/immutable/-/immutable-3.7.6.tgz
	https://registry.yarnpkg.com/immutable/-/immutable-4.0.0.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-from/-/import-from-3.0.0.tgz
	https://registry.yarnpkg.com/import-from/-/import-from-4.0.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-3.2.0.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.1.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/ini/-/ini-2.0.0.tgz
	https://registry.yarnpkg.com/ini/-/ini-5.0.0.tgz
	https://registry.yarnpkg.com/init-package-json/-/init-package-json-6.0.3.tgz
	https://registry.yarnpkg.com/inquirer-confirm/-/inquirer-confirm-2.0.3.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-6.3.1.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-7.3.3.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-8.2.4.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-8.2.5.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.7.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.4.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-3.1.1.tgz
	https://registry.yarnpkg.com/@intlify/bundle-utils/-/bundle-utils-8.0.0.tgz -> @intlify-bundle-utils-8.0.0.tgz
	https://registry.yarnpkg.com/@intlify/core-base/-/core-base-9.13.1.tgz -> @intlify-core-base-9.13.1.tgz
	https://registry.yarnpkg.com/@intlify/message-compiler/-/message-compiler-9.13.1.tgz -> @intlify-message-compiler-9.13.1.tgz
	https://registry.yarnpkg.com/@intlify/shared/-/shared-9.13.1.tgz -> @intlify-shared-9.13.1.tgz
	https://registry.yarnpkg.com/@intlify/unplugin-vue-i18n/-/unplugin-vue-i18n-4.0.0.tgz -> @intlify-unplugin-vue-i18n-4.0.0.tgz
	https://registry.yarnpkg.com/into-stream/-/into-stream-3.1.0.tgz
	https://registry.yarnpkg.com/invariant/-/invariant-2.2.4.tgz
	https://registry.yarnpkg.com/invert-kv/-/invert-kv-1.0.0.tgz
	https://registry.yarnpkg.com/invert-kv/-/invert-kv-2.0.0.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-1.9.1.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.8.tgz
	https://registry.yarnpkg.com/ip-regex/-/ip-regex-1.0.3.tgz
	https://registry.yarnpkg.com/irregular-plurals/-/irregular-plurals-2.0.0.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz -> @isaacs-fs-minipass-4.0.1.tgz
	https://registry.yarnpkg.com/@isaacs/string-locale-compare/-/string-locale-compare-1.1.0.tgz -> @isaacs-string-locale-compare-1.1.0.tgz
	https://registry.yarnpkg.com/is-absolute/-/is-absolute-1.0.0.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-arguments/-/is-arguments-1.1.1.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.4.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-0.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.3.2.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.1.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.10.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-5.0.4.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-1.0.1.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.0.tgz
	https://registry.yarnpkg.com/isbuffer/-/isbuffer-0.0.0.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.6.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-2.0.5.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-2.0.0.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-3.0.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.16.1.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-data-view/-/is-data-view-1.0.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-1.0.2.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-2.2.1.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-3.0.0.tgz
	https://registry.yarnpkg.com/is-dotfile/-/is-dotfile-1.0.3.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-0.1.1.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-1.0.1.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-1.0.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fork-pr/-/is-fork-pr-2.5.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-function/-/is-function-1.0.2.tgz
	https://registry.yarnpkg.com/is-generator-function/-/is-generator-function-1.0.10.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-2.0.1.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.1.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-html/-/is-html-2.0.0.tgz
	https://registry.yarnpkg.com/is-inside-container/-/is-inside-container-1.0.0.tgz
	https://registry.yarnpkg.com/is-installed-globally/-/is-installed-globally-0.4.0.tgz
	https://registry.yarnpkg.com/is-interactive/-/is-interactive-1.0.0.tgz
	https://registry.yarnpkg.com/is/-/is-0.2.7.tgz
	https://registry.yarnpkg.com/is-lambda/-/is-lambda-1.0.1.tgz
	https://registry.yarnpkg.com/is-lower-case/-/is-lower-case-1.1.3.tgz
	https://registry.yarnpkg.com/is-lower-case/-/is-lower-case-2.0.2.tgz
	https://registry.yarnpkg.com/is-map/-/is-map-2.0.2.tgz
	https://registry.yarnpkg.com/is-module/-/is-module-1.0.0.tgz
	https://registry.yarnpkg.com/is-nan/-/is-nan-1.3.2.tgz
	https://registry.yarnpkg.com/is-negated-glob/-/is-negated-glob-1.0.0.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.3.tgz
	https://registry.yarnpkg.com/is-network-error/-/is-network-error-1.1.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-3.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-4.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.4.tgz
	https://registry.yarnpkg.com/is-object/-/is-object-0.1.2.tgz
	https://registry.yarnpkg.com/is-object/-/is-object-1.0.2.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-2.1.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-1.0.1.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-2.0.0.tgz
	https://registry.yarnpkg.com/is-observable/-/is-observable-1.1.0.tgz
	https://registry.yarnpkg.com/isomorphic-fetch/-/isomorphic-fetch-2.2.1.tgz
	https://registry.yarnpkg.com/isomorphic-fetch/-/isomorphic-fetch-3.0.0.tgz
	https://registry.yarnpkg.com/isomorphic-rslog/-/isomorphic-rslog-0.0.7.tgz
	https://registry.yarnpkg.com/isomorphic-ws/-/isomorphic-ws-4.0.1.tgz
	https://registry.yarnpkg.com/is-path-cwd/-/is-path-cwd-1.0.0.tgz
	https://registry.yarnpkg.com/is-path-cwd/-/is-path-cwd-2.2.0.tgz
	https://registry.yarnpkg.com/is-path-in-cwd/-/is-path-in-cwd-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-in-cwd/-/is-path-in-cwd-2.1.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-2.1.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-3.0.1.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-1.1.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-2.1.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-3.0.0.tgz
	https://registry.yarnpkg.com/is-port-reachable/-/is-port-reachable-4.0.0.tgz
	https://registry.yarnpkg.com/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.2.2.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-4.0.0.tgz
	https://registry.yarnpkg.com/is-reference/-/is-reference-1.2.1.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-regexp/-/is-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/is-relative/-/is-relative-1.0.0.tgz
	https://registry.yarnpkg.com/is-retry-allowed/-/is-retry-allowed-1.2.0.tgz
	https://registry.yarnpkg.com/is-set/-/is-set-2.0.2.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.3.tgz
	https://registry.yarnpkg.com/is-ssh/-/is-ssh-1.4.0.tgz
	https://registry.yarnpkg.com/isstream/-/isstream-0.1.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/issue-parser/-/issue-parser-6.0.0.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.3.tgz
	https://registry.yarnpkg.com/istextorbinary/-/istextorbinary-6.0.0.tgz
	https://registry.yarnpkg.com/is-text-path/-/is-text-path-1.0.1.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.13.tgz
	https://registry.yarnpkg.com/is-unc-path/-/is-unc-path-1.0.0.tgz
	https://registry.yarnpkg.com/is-unicode-supported/-/is-unicode-supported-0.1.0.tgz
	https://registry.yarnpkg.com/is-upper-case/-/is-upper-case-1.1.2.tgz
	https://registry.yarnpkg.com/is-upper-case/-/is-upper-case-2.0.2.tgz
	https://registry.yarnpkg.com/isurl/-/isurl-1.0.0.tgz
	https://registry.yarnpkg.com/is-utf8/-/is-utf8-0.2.1.tgz
	https://registry.yarnpkg.com/is-valid-domain/-/is-valid-domain-0.0.20.tgz
	https://registry.yarnpkg.com/is-valid-glob/-/is-valid-glob-1.0.0.tgz
	https://registry.yarnpkg.com/is-valid-hostname/-/is-valid-hostname-1.0.1.tgz
	https://registry.yarnpkg.com/is-weakmap/-/is-weakmap-2.0.1.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/is-weakset/-/is-weakset-2.0.1.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-1.1.0.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-2.2.0.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-3.1.0.tgz
	https://registry.yarnpkg.com/iterall/-/iterall-1.3.0.tgz
	https://registry.yarnpkg.com/its-name/-/its-name-1.0.0.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.5.tgz
	https://registry.yarnpkg.com/javascript-time-ago/-/javascript-time-ago-2.3.8.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-29.7.0.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-26.6.2.tgz -> @jest-types-26.6.2.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/@jimp/bmp/-/bmp-0.22.12.tgz -> @jimp-bmp-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/core/-/core-0.22.12.tgz -> @jimp-core-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/custom/-/custom-0.22.12.tgz -> @jimp-custom-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/gif/-/gif-0.22.12.tgz -> @jimp-gif-0.22.12.tgz
	https://registry.yarnpkg.com/jimp/-/jimp-0.22.12.tgz
	https://registry.yarnpkg.com/jimp/-/jimp-0.2.28.tgz
	https://registry.yarnpkg.com/@jimp/jpeg/-/jpeg-0.22.12.tgz -> @jimp-jpeg-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-blit/-/plugin-blit-0.22.12.tgz -> @jimp-plugin-blit-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-blur/-/plugin-blur-0.22.12.tgz -> @jimp-plugin-blur-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-circle/-/plugin-circle-0.22.12.tgz -> @jimp-plugin-circle-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-color/-/plugin-color-0.22.12.tgz -> @jimp-plugin-color-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-contain/-/plugin-contain-0.22.12.tgz -> @jimp-plugin-contain-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-cover/-/plugin-cover-0.22.12.tgz -> @jimp-plugin-cover-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-crop/-/plugin-crop-0.22.12.tgz -> @jimp-plugin-crop-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-displace/-/plugin-displace-0.22.12.tgz -> @jimp-plugin-displace-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-dither/-/plugin-dither-0.22.12.tgz -> @jimp-plugin-dither-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-fisheye/-/plugin-fisheye-0.22.12.tgz -> @jimp-plugin-fisheye-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-flip/-/plugin-flip-0.22.12.tgz -> @jimp-plugin-flip-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-gaussian/-/plugin-gaussian-0.22.12.tgz -> @jimp-plugin-gaussian-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-invert/-/plugin-invert-0.22.12.tgz -> @jimp-plugin-invert-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-mask/-/plugin-mask-0.22.12.tgz -> @jimp-plugin-mask-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-normalize/-/plugin-normalize-0.22.12.tgz -> @jimp-plugin-normalize-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-print/-/plugin-print-0.22.12.tgz -> @jimp-plugin-print-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-resize/-/plugin-resize-0.22.12.tgz -> @jimp-plugin-resize-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-rotate/-/plugin-rotate-0.22.12.tgz -> @jimp-plugin-rotate-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-scale/-/plugin-scale-0.22.12.tgz -> @jimp-plugin-scale-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-shadow/-/plugin-shadow-0.22.12.tgz -> @jimp-plugin-shadow-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugins/-/plugins-0.22.12.tgz -> @jimp-plugins-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/plugin-threshold/-/plugin-threshold-0.22.12.tgz -> @jimp-plugin-threshold-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/png/-/png-0.22.12.tgz -> @jimp-png-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/tiff/-/tiff-0.22.12.tgz -> @jimp-tiff-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/types/-/types-0.22.12.tgz -> @jimp-types-0.22.12.tgz
	https://registry.yarnpkg.com/@jimp/utils/-/utils-0.22.12.tgz -> @jimp-utils-0.22.12.tgz
	https://registry.yarnpkg.com/jiti/-/jiti-1.21.7.tgz
	https://registry.yarnpkg.com/jose/-/jose-4.15.5.tgz
	https://registry.yarnpkg.com/jpeg-js/-/jpeg-js-0.1.2.tgz
	https://registry.yarnpkg.com/jpeg-js/-/jpeg-js-0.2.0.tgz
	https://registry.yarnpkg.com/jpeg-js/-/jpeg-js-0.4.4.tgz
	https://registry.yarnpkg.com/jquery/-/jquery-3.7.1.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.5.tgz -> @jridgewell-gen-mapping-0.3.5.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> @jridgewell-resolve-uri-3.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.2.1.tgz -> @jridgewell-set-array-1.2.1.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.5.tgz -> @jridgewell-source-map-0.3.5.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.25.tgz -> @jridgewell-trace-mapping-0.3.25.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.9.tgz -> @jridgewell-trace-mapping-0.3.9.tgz
	https://registry.yarnpkg.com/jsbn/-/jsbn-0.1.1.tgz
	https://registry.yarnpkg.com/js-cookie/-/js-cookie-3.0.5.tgz
	https://registry.yarnpkg.com/@jsdevtools/ez-spawn/-/ez-spawn-3.0.4.tgz -> @jsdevtools-ez-spawn-3.0.4.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-26.0.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/json3/-/json3-3.3.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/jsonc-eslint-parser/-/jsonc-eslint-parser-2.4.0.tgz
	https://registry.yarnpkg.com/jsonc-parser/-/jsonc-parser-3.2.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-3.0.1.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/json-fixer/-/json-fixer-1.6.15.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-3.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-4.0.0.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.2.3.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.4.0.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify/-/json-stable-stringify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/JSONStream/-/JSONStream-1.3.5.tgz
	https://registry.yarnpkg.com/json-stringify-nice/-/json-stringify-nice-1.1.4.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json-to-pretty-yaml/-/json-to-pretty-yaml-1.2.2.tgz
	https://registry.yarnpkg.com/jsonwebtoken/-/jsonwebtoken-8.5.1.tgz
	https://registry.yarnpkg.com/jsonwebtoken/-/jsonwebtoken-9.0.2.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-1.4.1.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-2.0.2.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-3.0.2.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.2.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.13.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/junk/-/junk-3.1.0.tgz
	https://registry.yarnpkg.com/just-debounce/-/just-debounce-1.1.0.tgz
	https://registry.yarnpkg.com/just-diff-apply/-/just-diff-apply-5.3.1.tgz
	https://registry.yarnpkg.com/just-diff/-/just-diff-6.0.2.tgz
	https://registry.yarnpkg.com/just-extend/-/just-extend-4.1.1.tgz
	https://registry.yarnpkg.com/just-extend/-/just-extend-6.2.0.tgz
	https://registry.yarnpkg.com/just-my-luck/-/just-my-luck-3.0.0.tgz
	https://registry.yarnpkg.com/jwa/-/jwa-1.4.1.tgz
	https://registry.yarnpkg.com/jws/-/jws-3.2.2.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-3.0.0.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.0.3.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-1.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-3.2.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-4.0.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-5.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/klaw-sync/-/klaw-sync-6.0.0.tgz
	https://registry.yarnpkg.com/klona/-/klona-2.0.6.tgz
	https://registry.yarnpkg.com/kolorist/-/kolorist-1.8.0.tgz
	https://registry.yarnpkg.com/@kwsites/file-exists/-/file-exists-1.1.1.tgz -> @kwsites-file-exists-1.1.1.tgz
	https://registry.yarnpkg.com/@kwsites/promise-deferred/-/promise-deferred-1.1.1.tgz -> @kwsites-promise-deferred-1.1.1.tgz
	https://registry.yarnpkg.com/last-run/-/last-run-1.1.1.tgz
	https://registry.yarnpkg.com/latest-version/-/latest-version-5.1.0.tgz
	https://registry.yarnpkg.com/launch-editor/-/launch-editor-2.9.1.tgz
	https://registry.yarnpkg.com/lazy-ass/-/lazy-ass-1.6.0.tgz
	https://registry.yarnpkg.com/lazy-cache/-/lazy-cache-1.0.4.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-1.0.0.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/lcid/-/lcid-1.0.0.tgz
	https://registry.yarnpkg.com/lcid/-/lcid-2.0.0.tgz
	https://registry.yarnpkg.com/lead/-/lead-1.0.0.tgz
	https://registry.yarnpkg.com/@leichtgewicht/ip-codec/-/ip-codec-2.0.3.tgz -> @leichtgewicht-ip-codec-2.0.3.tgz
	https://registry.yarnpkg.com/@lerna/create/-/create-8.1.9.tgz -> @lerna-create-8.1.9.tgz
	https://registry.yarnpkg.com/lerna/-/lerna-8.1.9.tgz
	https://registry.yarnpkg.com/levdist/-/levdist-1.0.0.tgz
	https://registry.yarnpkg.com/level-blobs/-/level-blobs-0.1.7.tgz
	https://registry.yarnpkg.com/level-filesystem/-/level-filesystem-1.2.0.tgz
	https://registry.yarnpkg.com/level-fix-range/-/level-fix-range-1.0.2.tgz
	https://registry.yarnpkg.com/level-fix-range/-/level-fix-range-2.0.0.tgz
	https://registry.yarnpkg.com/level-hooks/-/level-hooks-4.5.0.tgz
	https://registry.yarnpkg.com/level-js/-/level-js-2.2.4.tgz
	https://registry.yarnpkg.com/level-peek/-/level-peek-1.0.6.tgz
	https://registry.yarnpkg.com/level-sublevel/-/level-sublevel-5.2.3.tgz
	https://registry.yarnpkg.com/levelup/-/levelup-0.18.6.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/libnpmaccess/-/libnpmaccess-8.0.6.tgz
	https://registry.yarnpkg.com/libnpmpublish/-/libnpmpublish-9.0.9.tgz
	https://registry.yarnpkg.com/liftoff/-/liftoff-3.1.0.tgz
	https://registry.yarnpkg.com/lilconfig/-/lilconfig-3.1.3.tgz
	https://registry.yarnpkg.com/line-column/-/line-column-1.0.2.tgz
	https://registry.yarnpkg.com/line-diff/-/line-diff-2.1.1.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.1.6.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-2.0.3.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-4.0.1.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-5.0.0.tgz
	https://registry.yarnpkg.com/lint-staged/-/lint-staged-11.1.2.tgz
	https://registry.yarnpkg.com/listr2/-/listr2-3.8.3.tgz
	https://registry.yarnpkg.com/@listr2/prompt-adapter-inquirer/-/prompt-adapter-inquirer-2.0.15.tgz -> @listr2-prompt-adapter-inquirer-2.0.15.tgz
	https://registry.yarnpkg.com/listr/-/listr-0.14.3.tgz
	https://registry.yarnpkg.com/listr-silent-renderer/-/listr-silent-renderer-1.1.1.tgz
	https://registry.yarnpkg.com/listr-update-renderer/-/listr-update-renderer-0.5.0.tgz
	https://registry.yarnpkg.com/listr-verbose-renderer/-/listr-verbose-renderer-0.5.0.tgz
	https://registry.yarnpkg.com/livereload-js/-/livereload-js-2.4.0.tgz
	https://registry.yarnpkg.com/load-bmfont/-/load-bmfont-1.4.1.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-2.4.0.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.3.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-1.4.2.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.3.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-1.1.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-2.0.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-4.0.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-6.2.0.tgz
	https://registry.yarnpkg.com/load-tsconfig/-/load-tsconfig-0.2.3.tgz
	https://registry.yarnpkg.com/local-pkg/-/local-pkg-0.4.1.tgz
	https://registry.yarnpkg.com/local-pkg/-/local-pkg-0.5.0.tgz
	https://registry.yarnpkg.com/local-pkg/-/local-pkg-1.1.1.tgz
	https://registry.yarnpkg.com/locate-character/-/locate-character-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-2.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-7.1.0.tgz
	https://registry.yarnpkg.com/lockfile/-/lockfile-1.0.4.tgz
	https://registry.yarnpkg.com/lodash._baseassign/-/lodash._baseassign-3.2.0.tgz
	https://registry.yarnpkg.com/lodash._basecopy/-/lodash._basecopy-3.0.1.tgz
	https://registry.yarnpkg.com/lodash._basecreate/-/lodash._basecreate-3.0.3.tgz
	https://registry.yarnpkg.com/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz
	https://registry.yarnpkg.com/lodash.capitalize/-/lodash.capitalize-4.2.1.tgz
	https://registry.yarnpkg.com/lodash.chunk/-/lodash.chunk-4.2.0.tgz
	https://registry.yarnpkg.com/lodash.create/-/lodash.create-3.1.1.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.escaperegexp/-/lodash.escaperegexp-4.1.2.tgz
	https://registry.yarnpkg.com/lodash-es/-/lodash-es-4.17.21.tgz
	https://registry.yarnpkg.com/lodash.flatten/-/lodash.flatten-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.get/-/lodash.get-4.4.2.tgz
	https://registry.yarnpkg.com/lodash._getnative/-/lodash._getnative-3.9.1.tgz
	https://registry.yarnpkg.com/lodash.includes/-/lodash.includes-4.3.0.tgz
	https://registry.yarnpkg.com/lodash.isarguments/-/lodash.isarguments-3.1.0.tgz
	https://registry.yarnpkg.com/lodash.isarray/-/lodash.isarray-3.0.4.tgz
	https://registry.yarnpkg.com/lodash.isboolean/-/lodash.isboolean-3.0.3.tgz
	https://registry.yarnpkg.com/lodash.isfunction/-/lodash.isfunction-3.0.9.tgz
	https://registry.yarnpkg.com/lodash.isinteger/-/lodash.isinteger-4.0.4.tgz
	https://registry.yarnpkg.com/lodash._isiterateecall/-/lodash._isiterateecall-3.0.9.tgz
	https://registry.yarnpkg.com/lodash.ismatch/-/lodash.ismatch-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.isnumber/-/lodash.isnumber-3.0.3.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz
	https://registry.yarnpkg.com/lodash.isstring/-/lodash.isstring-4.0.1.tgz
	https://registry.yarnpkg.com/lodash.keys/-/lodash.keys-3.1.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-3.10.1.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.mergewith/-/lodash.mergewith-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.once/-/lodash.once-4.1.1.tgz
	https://registry.yarnpkg.com/lodash.range/-/lodash.range-3.2.0.tgz
	https://registry.yarnpkg.com/lodash.sortby/-/lodash.sortby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.throttle/-/lodash.throttle-4.1.1.tgz
	https://registry.yarnpkg.com/lodash.uniqby/-/lodash.uniqby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.without/-/lodash.without-4.4.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-1.0.2.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-2.2.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-3.0.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-4.0.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-4.1.0.tgz
	https://registry.yarnpkg.com/log-update/-/log-update-2.3.0.tgz
	https://registry.yarnpkg.com/log-update/-/log-update-4.0.0.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-1.3.2.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-2.7.5.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-3.1.0.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-4.2.0.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-5.1.2.tgz
	https://registry.yarnpkg.com/longest/-/longest-1.0.1.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/loupe/-/loupe-2.3.7.tgz
	https://registry.yarnpkg.com/lower-case-first/-/lower-case-first-1.0.2.tgz
	https://registry.yarnpkg.com/lower-case-first/-/lower-case-first-2.0.2.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-1.0.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-1.0.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lower-case/-/lower-case-1.1.4.tgz
	https://registry.yarnpkg.com/lower-case/-/lower-case-2.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-11.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.5.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-7.18.3.tgz
	https://registry.yarnpkg.com/ltgt/-/ltgt-2.2.1.tgz
	https://registry.yarnpkg.com/lz-string/-/lz-string-1.5.0.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.25.9.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.26.7.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.30.11.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-1.3.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-2.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-4.0.0.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.6.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-10.2.1.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-14.0.2.tgz
	https://registry.yarnpkg.com/make-iterator/-/make-iterator-1.0.1.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-2.0.0.tgz -> @malept-cross-spawn-promise-2.0.0.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/map-age-cleaner/-/map-age-cleaner-0.1.3.tgz
	https://registry.yarnpkg.com/map-cache/-/map-cache-0.2.2.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-1.0.1.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-4.1.0.tgz
	https://registry.yarnpkg.com/map-visit/-/map-visit-1.0.0.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-13.0.1.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-14.0.0.tgz
	https://registry.yarnpkg.com/matchdep/-/matchdep-2.0.0.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/math-intrinsics/-/math-intrinsics-1.1.0.tgz
	https://registry.yarnpkg.com/md5.js/-/md5.js-1.3.5.tgz
	https://registry.yarnpkg.com/md5/-/md5-2.3.0.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.28.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.30.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-1.0.1.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-2.0.0.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-0.3.0.tgz
	https://registry.yarnpkg.com/memfs/-/memfs-3.5.3.tgz
	https://registry.yarnpkg.com/memfs/-/memfs-4.8.1.tgz
	https://registry.yarnpkg.com/mem/-/mem-1.1.0.tgz
	https://registry.yarnpkg.com/mem/-/mem-4.3.0.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.4.1.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.5.0.tgz
	https://registry.yarnpkg.com/memorystream/-/memorystream-0.3.1.tgz
	https://registry.yarnpkg.com/meow/-/meow-13.2.0.tgz
	https://registry.yarnpkg.com/meow/-/meow-8.1.2.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-1.0.3.tgz
	https://registry.yarnpkg.com/merge/-/merge-1.2.1.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/meros/-/meros-1.1.4.tgz
	https://registry.yarnpkg.com/method-override/-/method-override-3.0.0.tgz
	https://registry.yarnpkg.com/methods/-/methods-1.1.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-3.1.10.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.8.tgz
	https://registry.yarnpkg.com/@microsoft/fetch-event-source/-/fetch-event-source-2.0.1.tgz -> @microsoft-fetch-event-source-2.0.1.tgz
	https://registry.yarnpkg.com/miller-rabin/-/miller-rabin-4.0.1.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.33.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.45.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-4.0.6.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.18.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-1.2.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/min-document/-/min-document-2.19.0.tgz
	https://registry.yarnpkg.com/mini-css-extract-plugin/-/mini-css-extract-plugin-2.9.1.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
	https://registry.yarnpkg.com/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-10.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.5.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-4.2.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-8.0.4.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.3.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-0.0.8.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-0.2.1.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minimist-options/-/minimist-options-4.1.0.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-2.1.0.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-3.0.3.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-4.0.0.tgz
	https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.1.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.4.tgz
	https://registry.yarnpkg.com/minipass-sized/-/minipass-sized-1.0.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-3.0.1.tgz
	https://registry.yarnpkg.com/mississippi/-/mississippi-3.0.0.tgz
	https://registry.yarnpkg.com/mitt/-/mitt-3.0.1.tgz
	https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.2.tgz
	https://registry.yarnpkg.com/mkdirp-classic/-/mkdirp-classic-0.5.3.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.1.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.5.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-3.0.1.tgz
	https://registry.yarnpkg.com/mlly/-/mlly-1.7.4.tgz
	https://registry.yarnpkg.com/mobx/-/mobx-6.13.6.tgz
	https://registry.yarnpkg.com/mocha-banner/-/mocha-banner-1.1.2.tgz
	https://registry.yarnpkg.com/mocha-junit-reporter/-/mocha-junit-reporter-2.2.0.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-3.5.3.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-6.2.2.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.0.1.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.1.0.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.1.2.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.2.0.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-8.3.1.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-9.2.2.tgz
	https://registry.yarnpkg.com/mocha-multi-reporters/-/mocha-multi-reporters-1.1.7.tgz
	https://registry.yarnpkg.com/mocha-multi-reporters/-/mocha-multi-reporters-1.5.1.tgz
	https://registry.yarnpkg.com/mocha-teamcity-reporter/-/mocha-teamcity-reporter-3.0.0.tgz
	https://registry.yarnpkg.com/mochawesome/-/mochawesome-1.5.2.tgz
	https://registry.yarnpkg.com/mochawesome/-/mochawesome-2.3.1.tgz
	https://registry.yarnpkg.com/mochawesome/-/mochawesome-3.0.1.tgz
	https://registry.yarnpkg.com/mochawesome-report-generator/-/mochawesome-report-generator-2.3.2.tgz
	https://registry.yarnpkg.com/mochawesome-report-generator/-/mochawesome-report-generator-3.1.5.tgz
	https://registry.yarnpkg.com/mocked-env/-/mocked-env-1.2.4.tgz
	https://registry.yarnpkg.com/mocked-env/-/mocked-env-1.3.2.tgz
	https://registry.yarnpkg.com/mockery/-/mockery-2.1.0.tgz
	https://registry.yarnpkg.com/mock-fs/-/mock-fs-5.4.0.tgz
	https://registry.yarnpkg.com/mock-require/-/mock-require-3.0.3.tgz
	https://registry.yarnpkg.com/modern-normalize/-/modern-normalize-1.1.0.tgz
	https://registry.yarnpkg.com/modify-filename/-/modify-filename-1.1.0.tgz
	https://registry.yarnpkg.com/modify-values/-/modify-values-1.0.1.tgz
	https://registry.yarnpkg.com/@module-federation/error-codes/-/error-codes-0.8.11.tgz -> @module-federation-error-codes-0.8.11.tgz
	https://registry.yarnpkg.com/@module-federation/runtime-core/-/runtime-core-0.6.19.tgz -> @module-federation-runtime-core-0.6.19.tgz
	https://registry.yarnpkg.com/@module-federation/runtime/-/runtime-0.8.11.tgz -> @module-federation-runtime-0.8.11.tgz
	https://registry.yarnpkg.com/@module-federation/sdk/-/sdk-0.8.11.tgz -> @module-federation-sdk-0.8.11.tgz
	https://registry.yarnpkg.com/module-not-found-error/-/module-not-found-error-1.0.1.tgz
	https://registry.yarnpkg.com/moment/-/moment-2.29.1.tgz
	https://registry.yarnpkg.com/morgan/-/morgan-1.9.1.tgz
	https://registry.yarnpkg.com/mount-point/-/mount-point-3.0.0.tgz
	https://registry.yarnpkg.com/mout/-/mout-1.2.2.tgz
	https://registry.yarnpkg.com/move-concurrently/-/move-concurrently-1.0.1.tgz
	https://registry.yarnpkg.com/move-file/-/move-file-1.2.0.tgz
	https://registry.yarnpkg.com/mrmime/-/mrmime-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/muggle-string/-/muggle-string-0.4.1.tgz
	https://registry.yarnpkg.com/multer/-/multer-1.4.4.tgz
	https://registry.yarnpkg.com/multicast-dns/-/multicast-dns-7.2.5.tgz
	https://registry.yarnpkg.com/multimatch/-/multimatch-5.0.0.tgz
	https://registry.yarnpkg.com/mute-stdout/-/mute-stdout-1.0.1.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.7.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.8.tgz
	https://registry.yarnpkg.com/@n1ru4l/graphql-live-query/-/graphql-live-query-0.8.1.tgz -> @n1ru4l-graphql-live-query-0.8.1.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.19.0.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.1.20.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.1.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.7.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-5.1.3.tgz
	https://registry.yarnpkg.com/nanomatch/-/nanomatch-1.2.13.tgz
	https://registry.yarnpkg.com/napi-build-utils/-/napi-build-utils-1.0.2.tgz
	https://registry.yarnpkg.com/napi-macros/-/napi-macros-2.0.0.tgz
	https://registry.yarnpkg.com/@napi-rs/wasm-runtime/-/wasm-runtime-0.2.4.tgz -> @napi-rs-wasm-runtime-0.2.4.tgz
	https://registry.yarnpkg.com/native-promise-only/-/native-promise-only-0.8.1.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/ncp/-/ncp-1.0.1.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.3.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.4.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/nerf-dart/-/nerf-dart-1.0.0.tgz
	https://registry.yarnpkg.com/nested-error-stacks/-/nested-error-stacks-2.1.0.tgz
	https://registry.yarnpkg.com/netmask/-/netmask-2.0.2.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.0.0.tgz
	https://registry.yarnpkg.com/nexus/-/nexus-1.2.0-next.15.tgz
	https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.5.tgz
	https://registry.yarnpkg.com/@nicolo-ribaudo/chokidar-2/-/chokidar-2-2.1.8-no-fsevents.3.tgz -> @nicolo-ribaudo-chokidar-2-2.1.8-no-fsevents.3.tgz
	https://registry.yarnpkg.com/@nicolo-ribaudo/eslint-scope-5-internals/-/eslint-scope-5-internals-5.1.1-v1.tgz -> @nicolo-ribaudo-eslint-scope-5-internals-5.1.1-v1.tgz
	https://registry.yarnpkg.com/nise/-/nise-1.5.3.tgz
	https://registry.yarnpkg.com/nise/-/nise-3.0.1.tgz
	https://registry.yarnpkg.com/nise/-/nise-4.1.0.tgz
	https://registry.yarnpkg.com/nise/-/nise-5.1.9.tgz
	https://registry.yarnpkg.com/nise/-/nise-6.0.0.tgz
	https://registry.yarnpkg.com/no-case/-/no-case-2.3.2.tgz
	https://registry.yarnpkg.com/no-case/-/no-case-3.0.4.tgz
	https://registry.yarnpkg.com/nock/-/nock-13.2.9.tgz
	https://registry.yarnpkg.com/node-abi/-/node-abi-2.30.1.tgz
	https://registry.yarnpkg.com/node-abi/-/node-abi-3.68.0.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-1.7.2.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-3.2.1.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-4.3.0.tgz
	https://registry.yarnpkg.com/node-api-version/-/node-api-version-0.2.0.tgz
	https://registry.yarnpkg.com/node-emoji/-/node-emoji-1.11.0.tgz
	https://registry.yarnpkg.com/node-environment-flags/-/node-environment-flags-1.0.5.tgz
	https://registry.yarnpkg.com/node-environment-flags/-/node-environment-flags-1.0.6.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-1.7.3.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.1.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.7.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.7.0.tgz
	https://registry.yarnpkg.com/node-forge/-/node-forge-1.3.0.tgz
	https://registry.yarnpkg.com/node-forge/-/node-forge-1.3.1.tgz
	https://registry.yarnpkg.com/node-gyp-build/-/node-gyp-build-4.6.1.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-9.4.1.tgz
	https://registry.yarnpkg.com/node-html-parser/-/node-html-parser-5.3.3.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/node-libs-browser/-/node-libs-browser-2.2.1.tgz
	https://registry.yarnpkg.com/node-machine-id/-/node-machine-id-1.1.12.tgz
	https://registry.yarnpkg.com/node-sass-glob-importer/-/node-sass-glob-importer-5.3.3.tgz
	https://registry.yarnpkg.com/node-sass-magic-importer/-/node-sass-magic-importer-5.3.3.tgz
	https://registry.yarnpkg.com/node-uuid/-/node-uuid-1.4.8.tgz
	https://registry.yarnpkg.com/noop-logger/-/noop-logger-0.1.1.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-6.0.0.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-8.0.0.tgz
	https://registry.yarnpkg.com/normalize.css/-/normalize.css-8.0.1.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-3.0.3.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-7.0.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-2.1.1.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-range/-/normalize-range-0.1.2.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-2.0.1.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-4.5.1.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/now-and-later/-/now-and-later-2.0.1.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-3.0.0.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/agent/-/agent-3.0.0.tgz -> @npmcli-agent-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/arborist/-/arborist-7.5.4.tgz -> @npmcli-arborist-7.5.4.tgz
	https://registry.yarnpkg.com/@npmcli/arborist/-/arborist-8.0.0.tgz -> @npmcli-arborist-8.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-2.1.0.tgz -> @npmcli-fs-2.1.0.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-4.0.0.tgz -> @npmcli-fs-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-6.0.1.tgz -> @npmcli-git-6.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/installed-package-contents/-/installed-package-contents-3.0.0.tgz -> @npmcli-installed-package-contents-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/map-workspaces/-/map-workspaces-4.0.1.tgz -> @npmcli-map-workspaces-4.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/metavuln-calculator/-/metavuln-calculator-8.0.1.tgz -> @npmcli-metavuln-calculator-8.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/move-file/-/move-file-2.0.0.tgz -> @npmcli-move-file-2.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/name-from-folder/-/name-from-folder-2.0.0.tgz -> @npmcli-name-from-folder-2.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/name-from-folder/-/name-from-folder-3.0.0.tgz -> @npmcli-name-from-folder-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/node-gyp/-/node-gyp-3.0.0.tgz -> @npmcli-node-gyp-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/node-gyp/-/node-gyp-4.0.0.tgz -> @npmcli-node-gyp-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/package-json/-/package-json-6.0.1.tgz -> @npmcli-package-json-6.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-8.0.2.tgz -> @npmcli-promise-spawn-8.0.2.tgz
	https://registry.yarnpkg.com/@npmcli/query/-/query-4.0.0.tgz -> @npmcli-query-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/redact/-/redact-3.0.0.tgz -> @npmcli-redact-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/run-script/-/run-script-9.0.1.tgz -> @npmcli-run-script-9.0.1.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-7.1.0.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-6.0.2.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-3.0.1.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-4.0.0.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-11.0.2.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-12.0.0.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-6.1.1.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-9.0.0.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-10.0.0.tgz
	https://registry.yarnpkg.com/npm-registry-client/-/npm-registry-client-8.6.0.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-18.0.2.tgz
	https://registry.yarnpkg.com/npm-run-all2/-/npm-run-all2-7.0.1.tgz
	https://registry.yarnpkg.com/npm-run-all/-/npm-run-all-4.1.5.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-1.0.0.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-1.0.2.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-2.0.1.tgz
	https://registry.yarnpkg.com/nullthrows/-/nullthrows-1.1.1.tgz
	https://registry.yarnpkg.com/num2fraction/-/num2fraction-1.2.2.tgz
	https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz
	https://registry.yarnpkg.com/nwsapi/-/nwsapi-2.2.16.tgz
	https://registry.yarnpkg.com/@nx/devkit/-/devkit-20.4.0.tgz -> @nx-devkit-20.4.0.tgz
	https://registry.yarnpkg.com/nx/-/nx-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-darwin-arm64/-/nx-darwin-arm64-20.4.0.tgz -> @nx-nx-darwin-arm64-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-darwin-x64/-/nx-darwin-x64-20.4.0.tgz -> @nx-nx-darwin-x64-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-freebsd-x64/-/nx-freebsd-x64-20.4.0.tgz -> @nx-nx-freebsd-x64-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-linux-arm64-gnu/-/nx-linux-arm64-gnu-20.4.0.tgz -> @nx-nx-linux-arm64-gnu-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-linux-arm64-musl/-/nx-linux-arm64-musl-20.4.0.tgz -> @nx-nx-linux-arm64-musl-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-linux-arm-gnueabihf/-/nx-linux-arm-gnueabihf-20.4.0.tgz -> @nx-nx-linux-arm-gnueabihf-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-linux-x64-gnu/-/nx-linux-x64-gnu-20.4.0.tgz -> @nx-nx-linux-x64-gnu-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-linux-x64-musl/-/nx-linux-x64-musl-20.4.0.tgz -> @nx-nx-linux-x64-musl-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-win32-arm64-msvc/-/nx-win32-arm64-msvc-20.4.0.tgz -> @nx-nx-win32-arm64-msvc-20.4.0.tgz
	https://registry.yarnpkg.com/@nx/nx-win32-x64-msvc/-/nx-win32-x64-msvc-20.4.0.tgz -> @nx-nx-win32-x64-msvc-20.4.0.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.9.0.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.5.tgz
	https://registry.yarnpkg.com/object-copy/-/object-copy-0.1.0.tgz
	https://registry.yarnpkg.com/object.defaults/-/object.defaults-1.1.0.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.8.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.8.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.2.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.3.tgz
	https://registry.yarnpkg.com/object-hash/-/object-hash-2.2.0.tgz
	https://registry.yarnpkg.com/object-hash/-/object-hash-3.0.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.4.tgz
	https://registry.yarnpkg.com/object-is/-/object-is-1.1.5.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-0.2.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-0.4.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.map/-/object.map-1.0.1.tgz
	https://registry.yarnpkg.com/object.omit/-/object.omit-2.0.1.tgz
	https://registry.yarnpkg.com/objectorarray/-/objectorarray-1.0.4.tgz
	https://registry.yarnpkg.com/object.pick/-/object.pick-1.3.0.tgz
	https://registry.yarnpkg.com/object.reduce/-/object.reduce-1.0.1.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.2.0.tgz
	https://registry.yarnpkg.com/object-visit/-/object-visit-1.0.1.tgz
	https://registry.yarnpkg.com/obuf/-/obuf-1.1.2.tgz
	https://registry.yarnpkg.com/octal/-/octal-1.0.0.tgz
	https://registry.yarnpkg.com/@octokit/auth-app/-/auth-app-6.0.3.tgz -> @octokit-auth-app-6.0.3.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-app/-/auth-oauth-app-7.0.1.tgz -> @octokit-auth-oauth-app-7.0.1.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-device/-/auth-oauth-device-6.0.1.tgz -> @octokit-auth-oauth-device-6.0.1.tgz
	https://registry.yarnpkg.com/@octokit/auth-oauth-user/-/auth-oauth-user-4.0.1.tgz -> @octokit-auth-oauth-user-4.0.1.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-3.0.3.tgz -> @octokit-auth-token-3.0.3.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-4.0.0.tgz -> @octokit-auth-token-4.0.0.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-4.2.4.tgz -> @octokit-core-4.2.4.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-5.0.2.tgz -> @octokit-core-5.0.2.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-7.0.5.tgz -> @octokit-endpoint-7.0.5.tgz
	https://registry.yarnpkg.com/@octokit/graphql/-/graphql-5.0.5.tgz -> @octokit-graphql-5.0.5.tgz
	https://registry.yarnpkg.com/@octokit/oauth-authorization-url/-/oauth-authorization-url-6.0.2.tgz -> @octokit-oauth-authorization-url-6.0.2.tgz
	https://registry.yarnpkg.com/@octokit/oauth-methods/-/oauth-methods-4.0.1.tgz -> @octokit-oauth-methods-4.0.1.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-18.1.1.tgz -> @octokit-openapi-types-18.1.1.tgz
	https://registry.yarnpkg.com/@octokit/plugin-enterprise-rest/-/plugin-enterprise-rest-6.0.1.tgz -> @octokit-plugin-enterprise-rest-6.0.1.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-6.1.2.tgz -> @octokit-plugin-paginate-rest-6.1.2.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.4.tgz -> @octokit-plugin-request-log-1.0.4.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-7.2.3.tgz -> @octokit-plugin-rest-endpoint-methods-7.2.3.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-3.0.3.tgz -> @octokit-request-error-3.0.3.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-6.2.3.tgz -> @octokit-request-6.2.3.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-19.0.11.tgz -> @octokit-rest-19.0.11.tgz
	https://registry.yarnpkg.com/@octokit/tsconfig/-/tsconfig-1.0.2.tgz -> @octokit-tsconfig-1.0.2.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-10.0.0.tgz -> @octokit-types-10.0.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-9.3.2.tgz -> @octokit-types-9.3.2.tgz
	https://registry.yarnpkg.com/omggif/-/omggif-1.0.10.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-2.0.1.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.3.0.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.4.1.tgz
	https://registry.yarnpkg.com/on-headers/-/on-headers-1.0.2.tgz
	https://registry.yarnpkg.com/onigasm/-/onigasm-2.2.5.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.5.2.tgz
	https://registry.yarnpkg.com/open/-/open-10.1.0.tgz
	https://registry.yarnpkg.com/open/-/open-7.4.2.tgz
	https://registry.yarnpkg.com/open/-/open-8.4.2.tgz
	https://registry.yarnpkg.com/@opentelemetry/api/-/api-1.4.1.tgz -> @opentelemetry-api-1.4.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/context-async-hooks/-/context-async-hooks-1.12.0.tgz -> @opentelemetry-context-async-hooks-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/core/-/core-1.12.0.tgz -> @opentelemetry-core-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/exporter-trace-otlp-http/-/exporter-trace-otlp-http-0.38.0.tgz -> @opentelemetry-exporter-trace-otlp-http-0.38.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/otlp-exporter-base/-/otlp-exporter-base-0.38.0.tgz -> @opentelemetry-otlp-exporter-base-0.38.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/otlp-transformer/-/otlp-transformer-0.38.0.tgz -> @opentelemetry-otlp-transformer-0.38.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/propagator-b3/-/propagator-b3-1.12.0.tgz -> @opentelemetry-propagator-b3-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/propagator-jaeger/-/propagator-jaeger-1.12.0.tgz -> @opentelemetry-propagator-jaeger-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/resources/-/resources-1.12.0.tgz -> @opentelemetry-resources-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/sdk-metrics/-/sdk-metrics-1.12.0.tgz -> @opentelemetry-sdk-metrics-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/sdk-trace-base/-/sdk-trace-base-1.12.0.tgz -> @opentelemetry-sdk-trace-base-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/sdk-trace-node/-/sdk-trace-node-1.12.0.tgz -> @opentelemetry-sdk-trace-node-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/sdk-trace-web/-/sdk-trace-web-1.12.0.tgz -> @opentelemetry-sdk-trace-web-1.12.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/semantic-conventions/-/semantic-conventions-1.12.0.tgz -> @opentelemetry-semantic-conventions-1.12.0.tgz
	https://registry.yarnpkg.com/optimist/-/optimist-0.6.1.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.3.tgz
	https://registry.yarnpkg.com/ora/-/ora-5.3.0.tgz
	https://registry.yarnpkg.com/ora/-/ora-5.4.1.tgz
	https://registry.yarnpkg.com/ordered-read-streams/-/ordered-read-streams-1.0.1.tgz
	https://registry.yarnpkg.com/ordinal/-/ordinal-1.0.3.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.3.0.tgz
	https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-1.4.0.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-2.1.0.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-3.1.0.tgz
	https://registry.yarnpkg.com/ospath/-/ospath-1.2.2.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/package-json/-/package-json-6.5.0.tgz
	https://registry.yarnpkg.com/package-manager-detector/-/package-manager-detector-0.2.11.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-19.0.1.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-20.0.0.tgz
	https://registry.yarnpkg.com/pac-proxy-agent/-/pac-proxy-agent-7.0.1.tgz
	https://registry.yarnpkg.com/pac-resolver/-/pac-resolver-7.0.0.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/parallel-transform/-/parallel-transform-1.2.0.tgz
	https://registry.yarnpkg.com/param-case/-/param-case-2.1.1.tgz
	https://registry.yarnpkg.com/param-case/-/param-case-3.0.4.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse5-html-rewriting-stream/-/parse5-html-rewriting-stream-5.1.1.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-5.1.1.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-7.2.1.tgz
	https://registry.yarnpkg.com/parse5-sax-parser/-/parse5-sax-parser-5.1.1.tgz
	https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.6.tgz
	https://registry.yarnpkg.com/parse-author/-/parse-author-2.0.0.tgz
	https://registry.yarnpkg.com/parse-bmfont-ascii/-/parse-bmfont-ascii-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-binary/-/parse-bmfont-binary-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-xml/-/parse-bmfont-xml-1.1.4.tgz
	https://registry.yarnpkg.com/parse-code-context/-/parse-code-context-1.0.0.tgz
	https://registry.yarnpkg.com/parse-conflict-json/-/parse-conflict-json-3.0.1.tgz
	https://registry.yarnpkg.com/parse-conflict-json/-/parse-conflict-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-filepath/-/parse-filepath-1.0.2.tgz
	https://registry.yarnpkg.com/parse-glob/-/parse-glob-3.0.4.tgz
	https://registry.yarnpkg.com/parse-headers/-/parse-headers-2.0.3.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-2.2.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/parse-node-version/-/parse-node-version-1.0.1.tgz
	https://registry.yarnpkg.com/parse-passwd/-/parse-passwd-1.0.0.tgz
	https://registry.yarnpkg.com/parse-path/-/parse-path-7.0.0.tgz
	https://registry.yarnpkg.com/parse-png/-/parse-png-1.1.2.tgz
	https://registry.yarnpkg.com/parseqs/-/parseqs-0.0.6.tgz
	https://registry.yarnpkg.com/parseuri/-/parseuri-0.0.6.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.3.tgz
	https://registry.yarnpkg.com/parse-url/-/parse-url-8.1.0.tgz
	https://registry.yarnpkg.com/parsimmon/-/parsimmon-1.16.0.tgz
	https://registry.yarnpkg.com/pascalcase/-/pascalcase-0.1.1.tgz
	https://registry.yarnpkg.com/pascal-case/-/pascal-case-2.0.1.tgz
	https://registry.yarnpkg.com/pascal-case/-/pascal-case-3.1.2.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-1.0.1.tgz
	https://registry.yarnpkg.com/path-case/-/path-case-2.1.1.tgz
	https://registry.yarnpkg.com/path-case/-/path-case-3.0.4.tgz
	https://registry.yarnpkg.com/path-dirname/-/path-dirname-1.0.2.tgz
	https://registry.yarnpkg.com/pathe/-/pathe-1.1.2.tgz
	https://registry.yarnpkg.com/pathe/-/pathe-2.0.3.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-2.1.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-5.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-is-inside/-/path-is-inside-1.0.2.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-1.0.0.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-root/-/path-root-0.1.1.tgz
	https://registry.yarnpkg.com/path-root-regex/-/path-root-regex-0.1.2.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-0.1.10.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-1.8.0.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-3.3.0.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-6.2.1.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-1.1.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-2.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-3.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/pathval/-/pathval-1.1.1.tgz
	https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.1.1.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-0.4.1.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-1.1.0.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.0.0.tgz
	https://registry.yarnpkg.com/p-defer/-/p-defer-1.0.0.tgz
	https://registry.yarnpkg.com/p-defer/-/p-defer-3.0.0.tgz
	https://registry.yarnpkg.com/peek-readable/-/peek-readable-4.1.0.tgz
	https://registry.yarnpkg.com/pegjs/-/pegjs-0.10.0.tgz
	https://registry.yarnpkg.com/pe-library/-/pe-library-0.4.1.tgz
	https://registry.yarnpkg.com/pe-library/-/pe-library-1.0.1.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/@percy/cli-app/-/cli-app-1.27.4.tgz -> @percy-cli-app-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli-build/-/cli-build-1.27.4.tgz -> @percy-cli-build-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli/-/cli-1.27.4.tgz -> @percy-cli-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli-command/-/cli-command-1.27.4.tgz -> @percy-cli-command-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli-config/-/cli-config-1.27.4.tgz -> @percy-cli-config-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/client/-/client-1.27.4.tgz -> @percy-client-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/client/-/client-1.27.6.tgz -> @percy-client-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/cli-exec/-/cli-exec-1.27.4.tgz -> @percy-cli-exec-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli-snapshot/-/cli-snapshot-1.27.4.tgz -> @percy-cli-snapshot-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/cli-upload/-/cli-upload-1.27.4.tgz -> @percy-cli-upload-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/config/-/config-1.27.4.tgz -> @percy-config-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/config/-/config-1.27.6.tgz -> @percy-config-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/core/-/core-1.27.4.tgz -> @percy-core-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/core/-/core-1.27.6.tgz -> @percy-core-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/cypress/-/cypress-3.1.3.tgz -> @percy-cypress-3.1.3.tgz
	https://registry.yarnpkg.com/@percy/dom/-/dom-1.27.4.tgz -> @percy-dom-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/dom/-/dom-1.27.6.tgz -> @percy-dom-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/env/-/env-1.27.4.tgz -> @percy-env-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/env/-/env-1.27.6.tgz -> @percy-env-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/logger/-/logger-1.27.4.tgz -> @percy-logger-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/logger/-/logger-1.27.6.tgz -> @percy-logger-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/sdk-utils/-/sdk-utils-1.27.4.tgz -> @percy-sdk-utils-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/sdk-utils/-/sdk-utils-1.27.6.tgz -> @percy-sdk-utils-1.27.6.tgz
	https://registry.yarnpkg.com/@percy/webdriver-utils/-/webdriver-utils-1.27.4.tgz -> @percy-webdriver-utils-1.27.4.tgz
	https://registry.yarnpkg.com/@percy/webdriver-utils/-/webdriver-utils-1.27.6.tgz -> @percy-webdriver-utils-1.27.6.tgz
	https://registry.yarnpkg.com/perfect-debounce/-/perfect-debounce-1.0.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-2.1.0.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz
	https://registry.yarnpkg.com/phin/-/phin-2.9.3.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-0.2.1.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-4.0.2.tgz
	https://registry.yarnpkg.com/pidtree/-/pidtree-0.3.1.tgz
	https://registry.yarnpkg.com/pidtree/-/pidtree-0.6.0.tgz
	https://registry.yarnpkg.com/pidusage/-/pidusage-3.0.2.tgz
	https://registry.yarnpkg.com/pify/-/pify-2.3.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz
	https://registry.yarnpkg.com/pify/-/pify-5.0.0.tgz
	https://registry.yarnpkg.com/pinia/-/pinia-2.0.0-rc.14.tgz
	https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz
	https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.6.tgz
	https://registry.yarnpkg.com/p-is-promise/-/p-is-promise-1.1.0.tgz
	https://registry.yarnpkg.com/p-is-promise/-/p-is-promise-2.1.0.tgz
	https://registry.yarnpkg.com/p-is-promise/-/p-is-promise-3.0.0.tgz
	https://registry.yarnpkg.com/pixelmatch/-/pixelmatch-4.0.2.tgz
	https://registry.yarnpkg.com/pkg-conf/-/pkg-conf-2.1.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-3.0.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-7.0.0.tgz
	https://registry.yarnpkg.com/@pkgjs/parseargs/-/parseargs-0.11.0.tgz -> @pkgjs-parseargs-0.11.0.tgz
	https://registry.yarnpkg.com/pkg-types/-/pkg-types-1.3.1.tgz
	https://registry.yarnpkg.com/pkg-types/-/pkg-types-2.1.0.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-3.1.0.tgz
	https://registry.yarnpkg.com/platform/-/platform-1.3.3.tgz
	https://registry.yarnpkg.com/please-upgrade-node/-/please-upgrade-node-3.2.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-4.0.0.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-2.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-6.0.0.tgz
	https://registry.yarnpkg.com/plugin-error/-/plugin-error-0.1.2.tgz
	https://registry.yarnpkg.com/plugin-error/-/plugin-error-1.0.1.tgz
	https://registry.yarnpkg.com/plugin-error/-/plugin-error-2.0.1.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/plur/-/plur-3.1.1.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-1.2.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-2.1.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-7.0.2.tgz
	https://registry.yarnpkg.com/p-map-series/-/p-map-series-2.1.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-3.4.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-6.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-7.0.0.tgz
	https://registry.yarnpkg.com/@polka/url/-/url-1.0.0-next.25.tgz -> @polka-url-1.0.0-next.25.tgz
	https://registry.yarnpkg.com/@popperjs/core/-/core-2.11.6.tgz -> @popperjs-core-2.11.6.tgz
	https://registry.yarnpkg.com/popper.js/-/popper.js-1.16.1.tgz
	https://registry.yarnpkg.com/posix-character-classes/-/posix-character-classes-0.1.1.tgz
	https://registry.yarnpkg.com/possible-typed-array-names/-/possible-typed-array-names-1.0.0.tgz
	https://registry.yarnpkg.com/postcss-functions/-/postcss-functions-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-import/-/postcss-import-15.1.0.tgz
	https://registry.yarnpkg.com/postcss-js/-/postcss-js-2.0.3.tgz
	https://registry.yarnpkg.com/postcss-js/-/postcss-js-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-load-config/-/postcss-load-config-4.0.2.tgz
	https://registry.yarnpkg.com/postcss-loader/-/postcss-loader-7.3.2.tgz
	https://registry.yarnpkg.com/postcss-modules-extract-imports/-/postcss-modules-extract-imports-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-local-by-default/-/postcss-modules-local-by-default-4.0.3.tgz
	https://registry.yarnpkg.com/postcss-modules-scope/-/postcss-modules-scope-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-values/-/postcss-modules-values-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-nested/-/postcss-nested-4.2.3.tgz
	https://registry.yarnpkg.com/postcss-nested/-/postcss-nested-6.2.0.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-6.0.23.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-7.0.39.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.49.tgz
	https://registry.yarnpkg.com/postcss-scss/-/postcss-scss-3.0.5.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-6.1.2.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-3.3.1.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
	https://registry.yarnpkg.com/postject/-/postject-1.0.0-alpha.6.tgz
	https://registry.yarnpkg.com/p-pipe/-/p-pipe-3.1.0.tgz
	https://registry.yarnpkg.com/p-queue/-/p-queue-6.1.0.tgz
	https://registry.yarnpkg.com/p-queue/-/p-queue-6.6.2.tgz
	https://registry.yarnpkg.com/prebuild-install/-/prebuild-install-5.3.6.tgz
	https://registry.yarnpkg.com/prebuild-install/-/prebuild-install-7.1.1.tgz
	https://registry.yarnpkg.com/p-reduce/-/p-reduce-2.1.0.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prepend-http/-/prepend-http-2.0.0.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-6.2.0.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.8.8.tgz
	https://registry.yarnpkg.com/pretty-bytes/-/pretty-bytes-5.6.0.tgz
	https://registry.yarnpkg.com/pretty-error/-/pretty-error-2.1.2.tgz
	https://registry.yarnpkg.com/pretty-error/-/pretty-error-4.0.0.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-26.4.0.tgz
	https://registry.yarnpkg.com/pretty-hrtime/-/pretty-hrtime-1.0.3.tgz
	https://registry.yarnpkg.com/print-arch/-/print-arch-1.0.0.tgz
	https://registry.yarnpkg.com/prismjs/-/prismjs-1.27.0.tgz
	https://registry.yarnpkg.com/process-es6/-/process-es6-0.11.6.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-2.0.1.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-5.0.0.tgz
	https://registry.yarnpkg.com/proggy/-/proggy-3.0.0.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-all-reject-late/-/promise-all-reject-late-1.0.1.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise/-/promise-7.3.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/propagate/-/propagate-2.0.1.tgz
	https://registry.yarnpkg.com/prop-types-exact/-/prop-types-exact-1.2.0.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.7.2.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/protocols/-/protocols-2.0.1.tgz
	https://registry.yarnpkg.com/proto-list/-/proto-list-1.2.4.tgz
	https://registry.yarnpkg.com/proxy-addr/-/proxy-addr-2.0.7.tgz
	https://registry.yarnpkg.com/proxy-agent/-/proxy-agent-6.3.1.tgz
	https://registry.yarnpkg.com/proxy-from-env/-/proxy-from-env-1.0.0.tgz
	https://registry.yarnpkg.com/proxy-from-env/-/proxy-from-env-1.1.0.tgz
	https://registry.yarnpkg.com/proxyquire/-/proxyquire-2.1.3.tgz
	https://registry.yarnpkg.com/prr/-/prr-0.0.0.tgz
	https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz
	https://registry.yarnpkg.com/pseudomap/-/pseudomap-1.0.2.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.8.0.tgz
	https://registry.yarnpkg.com/p-timeout/-/p-timeout-2.0.1.tgz
	https://registry.yarnpkg.com/p-timeout/-/p-timeout-3.2.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-1.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.3.tgz
	https://registry.yarnpkg.com/pumpify/-/pumpify-1.5.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-2.0.1.tgz
	https://registry.yarnpkg.com/punycode.js/-/punycode.js-2.3.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.1.tgz
	https://registry.yarnpkg.com/pupa/-/pupa-2.1.1.tgz
	https://registry.yarnpkg.com/@puppeteer/browsers/-/browsers-1.7.1.tgz -> @puppeteer-browsers-1.7.1.tgz
	https://registry.yarnpkg.com/puppeteer-core/-/puppeteer-core-21.2.1.tgz
	https://registry.yarnpkg.com/@purge-icons/generated/-/generated-0.8.1.tgz -> @purge-icons-generated-0.8.1.tgz
	https://registry.yarnpkg.com/p-waterfall/-/p-waterfall-2.1.1.tgz
	https://registry.yarnpkg.com/q/-/q-1.5.1.tgz
	https://registry.yarnpkg.com/qrcode-terminal/-/qrcode-terminal-0.12.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.10.3.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.11.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.13.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.14.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.5.2.tgz
	https://registry.yarnpkg.com/quansync/-/quansync-0.2.8.tgz
	https://registry.yarnpkg.com/querystring-es3/-/querystring-es3-0.2.1.tgz
	https://registry.yarnpkg.com/querystringify/-/querystringify-2.2.0.tgz
	https://registry.yarnpkg.com/querystring/-/querystring-0.2.0.tgz
	https://registry.yarnpkg.com/query-string/-/query-string-5.1.1.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.2.tgz
	https://registry.yarnpkg.com/queue/-/queue-6.0.2.tgz
	https://registry.yarnpkg.com/queue-tick/-/queue-tick-1.0.1.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-4.0.1.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/quote/-/quote-0.4.0.tgz
	https://registry.yarnpkg.com/ramda/-/ramda-0.25.0.tgz
	https://registry.yarnpkg.com/ramda/-/ramda-0.26.1.tgz
	https://registry.yarnpkg.com/ramda/-/ramda-0.27.0.tgz
	https://registry.yarnpkg.com/ramda/-/ramda-0.27.1.tgz
	https://registry.yarnpkg.com/ramda/-/ramda-0.28.0.tgz
	https://registry.yarnpkg.com/randexp/-/randexp-0.5.3.tgz
	https://registry.yarnpkg.com/random-bytes/-/random-bytes-1.0.0.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.0.3.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.4.tgz
	https://registry.yarnpkg.com/randomstring/-/randomstring-1.3.0.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.0.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.1.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-1.1.7.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.5.1.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.5.2.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz
	https://registry.yarnpkg.com/@reach/dialog/-/dialog-0.10.5.tgz -> @reach-dialog-0.10.5.tgz
	https://registry.yarnpkg.com/@reach/portal/-/portal-0.10.5.tgz -> @reach-portal-0.10.5.tgz
	https://registry.yarnpkg.com/@reach/utils/-/utils-0.10.5.tgz -> @reach-utils-0.10.5.tgz
	https://registry.yarnpkg.com/react-clientside-effect/-/react-clientside-effect-1.2.5.tgz
	https://registry.yarnpkg.com/react-docgen/-/react-docgen-6.0.4.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-15.6.1.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-15.7.0.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-16.0.0.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-16.14.0.tgz
	https://registry.yarnpkg.com/react-focus-lock/-/react-focus-lock-2.5.0.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/react/-/react-15.6.1.tgz
	https://registry.yarnpkg.com/react/-/react-15.7.0.tgz
	https://registry.yarnpkg.com/react/-/react-16.0.0.tgz
	https://registry.yarnpkg.com/react/-/react-16.14.0.tgz
	https://registry.yarnpkg.com/react-refresh/-/react-refresh-0.14.2.tgz
	https://registry.yarnpkg.com/react-remove-scroll-bar/-/react-remove-scroll-bar-2.2.0.tgz
	https://registry.yarnpkg.com/react-remove-scroll/-/react-remove-scroll-2.4.1.tgz
	https://registry.yarnpkg.com/react-style-singleton/-/react-style-singleton-2.1.1.tgz
	https://registry.yarnpkg.com/react-test-renderer/-/react-test-renderer-16.14.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-1.0.34.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-1.1.14.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.2.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-4.4.0.tgz
	https://registry.yarnpkg.com/readable-web-to-node-stream/-/readable-web-to-node-stream-3.0.2.tgz
	https://registry.yarnpkg.com/read-binary-file-arch/-/read-binary-file-arch-1.0.6.tgz
	https://registry.yarnpkg.com/read-cache/-/read-cache-1.0.0.tgz
	https://registry.yarnpkg.com/read-chunk/-/read-chunk-1.0.1.tgz
	https://registry.yarnpkg.com/read-cmd-shim/-/read-cmd-shim-4.0.0.tgz
	https://registry.yarnpkg.com/read-cmd-shim/-/read-cmd-shim-5.0.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-2.2.1.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.2.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.5.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/read-package-json-fast/-/read-package-json-fast-3.0.2.tgz
	https://registry.yarnpkg.com/read-package-json-fast/-/read-package-json-fast-4.0.0.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-2.1.2.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-1.1.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-3.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-1.0.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-3.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/recast/-/recast-0.20.4.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.6.2.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.8.0.tgz
	https://registry.yarnpkg.com/redent/-/redent-3.0.0.tgz
	https://registry.yarnpkg.com/reduce-css-calc/-/reduce-css-calc-2.1.8.tgz
	https://registry.yarnpkg.com/reflect.ownkeys/-/reflect.ownkeys-0.2.0.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.1.0.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.11.1.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.13.11.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.14.1.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.15.2.tgz
	https://registry.yarnpkg.com/regex-not/-/regex-not-1.0.2.tgz
	https://registry.yarnpkg.com/regex-parser/-/regex-parser-2.2.11.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.2.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-5.3.2.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-3.3.2.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-4.2.1.tgz
	https://registry.yarnpkg.com/registry-js/-/registry-js-1.15.0.tgz
	https://registry.yarnpkg.com/registry-js/-/registry-js-1.8.0.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-3.1.0.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-5.1.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.9.1.tgz
	https://registry.yarnpkg.com/relateurl/-/relateurl-0.2.7.tgz
	https://registry.yarnpkg.com/relative-time-format/-/relative-time-format-1.0.5.tgz
	https://registry.yarnpkg.com/relay-compiler/-/relay-compiler-11.0.2.tgz
	https://registry.yarnpkg.com/relay-runtime/-/relay-runtime-11.0.2.tgz
	https://registry.yarnpkg.com/remedial/-/remedial-1.0.8.tgz
	https://registry.yarnpkg.com/remove-bom-buffer/-/remove-bom-buffer-3.0.0.tgz
	https://registry.yarnpkg.com/remove-bom-stream/-/remove-bom-stream-1.2.0.tgz
	https://registry.yarnpkg.com/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz
	https://registry.yarnpkg.com/remove-trailing-spaces/-/remove-trailing-spaces-1.0.8.tgz
	https://registry.yarnpkg.com/renderkid/-/renderkid-2.0.5.tgz
	https://registry.yarnpkg.com/renderkid/-/renderkid-3.0.0.tgz
	https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.3.tgz
	https://registry.yarnpkg.com/repeat-string/-/repeat-string-1.6.1.tgz
	https://registry.yarnpkg.com/replaceall/-/replaceall-0.1.6.tgz
	https://registry.yarnpkg.com/replace-ext/-/replace-ext-1.0.1.tgz
	https://registry.yarnpkg.com/replace-ext/-/replace-ext-2.0.0.tgz
	https://registry.yarnpkg.com/replace-homedir/-/replace-homedir-1.0.0.tgz
	https://registry.yarnpkg.com/repl.history/-/repl.history-0.1.4.tgz
	https://registry.yarnpkg.com/request-progress/-/request-progress-3.0.0.tgz
	https://registry.yarnpkg.com/request-promise-core/-/request-promise-core-1.1.3.tgz
	https://registry.yarnpkg.com/request-promise-core/-/request-promise-core-1.1.4.tgz
	https://registry.yarnpkg.com/request-promise/-/request-promise-4.2.6.tgz
	https://registry.yarnpkg.com/request/-/request-2.88.2.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-1.0.1.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz
	https://registry.yarnpkg.com/requires-port/-/requires-port-1.0.0.tgz
	https://registry.yarnpkg.com/resedit/-/resedit-1.7.2.tgz
	https://registry.yarnpkg.com/resedit/-/resedit-2.0.2.tgz
	https://registry.yarnpkg.com/resize-img/-/resize-img-1.1.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.0.0.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-dir/-/resolve-dir-1.0.1.tgz
	https://registry.yarnpkg.com/resolve.exports/-/resolve.exports-2.0.3.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-options/-/resolve-options-1.1.0.tgz
	https://registry.yarnpkg.com/resolve-package-path/-/resolve-package-path-4.0.3.tgz
	https://registry.yarnpkg.com/resolve-pkg/-/resolve-pkg-2.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-0.6.3.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.17.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.10.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/resolve-url-loader/-/resolve-url-loader-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-url/-/resolve-url-0.2.1.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-1.0.2.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-2.0.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/ret/-/ret-0.1.15.tgz
	https://registry.yarnpkg.com/ret/-/ret-0.2.2.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.10.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.13.1.tgz
	https://registry.yarnpkg.com/return-deep-diff/-/return-deep-diff-0.4.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/right-align/-/right-align-0.1.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-4.4.1.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.2.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/@rollup/plugin-commonjs/-/plugin-commonjs-17.1.0.tgz -> @rollup-plugin-commonjs-17.1.0.tgz
	https://registry.yarnpkg.com/rollup-plugin-copy/-/rollup-plugin-copy-3.4.0.tgz
	https://registry.yarnpkg.com/rollup-plugin-dts/-/rollup-plugin-dts-5.0.0.tgz
	https://registry.yarnpkg.com/@rollup/plugin-inject/-/plugin-inject-4.0.2.tgz -> @rollup-plugin-inject-4.0.2.tgz
	https://registry.yarnpkg.com/rollup-plugin-node-builtins/-/rollup-plugin-node-builtins-2.1.2.tgz
	https://registry.yarnpkg.com/@rollup/plugin-node-resolve/-/plugin-node-resolve-11.2.1.tgz -> @rollup-plugin-node-resolve-11.2.1.tgz
	https://registry.yarnpkg.com/rollup-plugin-polyfill-node/-/rollup-plugin-polyfill-node-0.7.0.tgz
	https://registry.yarnpkg.com/rollup-plugin-typescript2/-/rollup-plugin-typescript2-0.29.0.tgz
	https://registry.yarnpkg.com/@rollup/pluginutils/-/pluginutils-3.1.0.tgz -> @rollup-pluginutils-3.1.0.tgz
	https://registry.yarnpkg.com/@rollup/pluginutils/-/pluginutils-5.1.0.tgz -> @rollup-pluginutils-5.1.0.tgz
	https://registry.yarnpkg.com/rollup/-/rollup-3.29.4.tgz
	https://registry.yarnpkg.com/rollup/-/rollup-3.7.3.tgz
	https://registry.yarnpkg.com/rrweb-cssom/-/rrweb-cssom-0.8.0.tgz
	https://registry.yarnpkg.com/run-applescript/-/run-applescript-3.2.0.tgz
	https://registry.yarnpkg.com/run-applescript/-/run-applescript-7.0.0.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-2.4.1.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/run-queue/-/run-queue-1.0.3.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.6.7.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-json-parse/-/safe-json-parse-1.0.1.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/safe-regex/-/safe-regex-1.1.0.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.3.tgz
	https://registry.yarnpkg.com/samsam/-/samsam-1.1.2.tgz
	https://registry.yarnpkg.com/samsam/-/samsam-1.3.0.tgz
	https://registry.yarnpkg.com/@samverschueren/stream-to-observable/-/stream-to-observable-0.3.1.tgz -> @samverschueren-stream-to-observable-0.3.1.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sass-loader/-/sass-loader-13.3.2.tgz
	https://registry.yarnpkg.com/sass/-/sass-1.64.1.tgz
	https://registry.yarnpkg.com/saxes/-/saxes-6.0.0.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/scheduler/-/scheduler-0.19.1.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-1.0.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.3.0.tgz
	https://registry.yarnpkg.com/scuid/-/scuid-1.1.0.tgz
	https://registry.yarnpkg.com/secure-compare/-/secure-compare-3.0.1.tgz
	https://registry.yarnpkg.com/select-hose/-/select-hose-2.0.0.tgz
	https://registry.yarnpkg.com/self-signed-cert/-/self-signed-cert-1.0.1.tgz
	https://registry.yarnpkg.com/selfsigned/-/selfsigned-2.4.1.tgz
	https://registry.yarnpkg.com/@semantic-release/error/-/error-3.0.0.tgz -> @semantic-release-error-3.0.0.tgz
	https://registry.yarnpkg.com/@semantic-release/git/-/git-10.0.1.tgz -> @semantic-release-git-10.0.1.tgz
	https://registry.yarnpkg.com/semaphore/-/semaphore-1.1.0.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver-greatest-satisfied-range/-/semver-greatest-satisfied-range-1.1.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-2.3.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.7.1.tgz
	https://registry.yarnpkg.com/send/-/send-0.19.0.tgz
	https://registry.yarnpkg.com/sentence-case/-/sentence-case-2.1.1.tgz
	https://registry.yarnpkg.com/sentence-case/-/sentence-case-3.0.4.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-4.0.0.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-5.0.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.0.tgz
	https://registry.yarnpkg.com/serve-handler/-/serve-handler-6.1.6.tgz
	https://registry.yarnpkg.com/serve-index/-/serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/server-destroy/-/server-destroy-1.0.1.tgz
	https://registry.yarnpkg.com/serve/-/serve-14.2.4.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.16.2.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/set-function-length/-/set-function-length-1.2.2.tgz
	https://registry.yarnpkg.com/set-function-name/-/set-function-name-2.0.2.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.1.0.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.2.0.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-2.0.1.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.11.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/sharp/-/sharp-0.29.3.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-1.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-env/-/shell-env-3.0.1.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.8.5.tgz
	https://registry.yarnpkg.com/shell-quote/-/shell-quote-1.8.1.tgz
	https://registry.yarnpkg.com/shiki/-/shiki-0.9.12.tgz
	https://registry.yarnpkg.com/side-channel-list/-/side-channel-list-1.0.0.tgz
	https://registry.yarnpkg.com/side-channel-map/-/side-channel-map-1.0.1.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.1.0.tgz
	https://registry.yarnpkg.com/side-channel-weakmap/-/side-channel-weakmap-1.0.2.tgz
	https://registry.yarnpkg.com/signale/-/signale-1.4.0.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signedsource/-/signedsource-1.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/bundle/-/bundle-3.0.0.tgz -> @sigstore-bundle-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/core/-/core-2.0.0.tgz -> @sigstore-core-2.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/sign/-/sign-3.0.0.tgz -> @sigstore-sign-3.0.0.tgz
	https://registry.yarnpkg.com/sigstore/-/sigstore-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/tuf/-/tuf-3.0.0.tgz -> @sigstore-tuf-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/verify/-/verify-2.0.0.tgz -> @sigstore-verify-2.0.0.tgz
	https://registry.yarnpkg.com/simple-bin-help/-/simple-bin-help-1.8.0.tgz
	https://registry.yarnpkg.com/simple-concat/-/simple-concat-1.0.1.tgz
	https://registry.yarnpkg.com/simple-get/-/simple-get-3.1.0.tgz
	https://registry.yarnpkg.com/simple-get/-/simple-get-4.0.1.tgz
	https://registry.yarnpkg.com/simple-git/-/simple-git-3.27.0.tgz
	https://registry.yarnpkg.com/simple-swizzle/-/simple-swizzle-0.2.2.tgz
	https://registry.yarnpkg.com/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/df/-/df-1.0.1.tgz -> @sindresorhus-df-1.0.1.tgz
	https://registry.yarnpkg.com/@sindresorhus/df/-/df-2.1.0.tgz -> @sindresorhus-df-2.1.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz -> @sindresorhus-is-0.14.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.7.0.tgz -> @sindresorhus-is-0.7.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/sinon-as-promised/-/sinon-as-promised-4.0.3.tgz
	https://registry.yarnpkg.com/sinon-chai/-/sinon-chai-3.3.0.tgz
	https://registry.yarnpkg.com/sinon-chai/-/sinon-chai-3.4.0.tgz
	https://registry.yarnpkg.com/sinon-chai/-/sinon-chai-3.5.0.tgz
	https://registry.yarnpkg.com/sinon-chai/-/sinon-chai-3.7.0.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-1.8.3.tgz -> @sinonjs-commons-1.8.3.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-2.0.0.tgz -> @sinonjs-commons-2.0.0.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-3.0.1.tgz -> @sinonjs-commons-3.0.1.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-11.2.2.tgz -> @sinonjs-fake-timers-11.2.2.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-6.0.1.tgz -> @sinonjs-fake-timers-6.0.1.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-8.1.0.tgz -> @sinonjs-fake-timers-8.1.0.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-9.1.2.tgz -> @sinonjs-fake-timers-9.1.2.tgz
	https://registry.yarnpkg.com/@sinonjs/formatio/-/formatio-2.0.0.tgz -> @sinonjs-formatio-2.0.0.tgz
	https://registry.yarnpkg.com/@sinonjs/formatio/-/formatio-3.2.2.tgz -> @sinonjs-formatio-3.2.2.tgz
	https://registry.yarnpkg.com/@sinonjs/formatio/-/formatio-4.0.1.tgz -> @sinonjs-formatio-4.0.1.tgz
	https://registry.yarnpkg.com/@sinonjs/formatio/-/formatio-5.0.1.tgz -> @sinonjs-formatio-5.0.1.tgz
	https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-3.3.3.tgz -> @sinonjs-samsam-3.3.3.tgz
	https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-4.2.2.tgz -> @sinonjs-samsam-4.2.2.tgz
	https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-5.3.1.tgz -> @sinonjs-samsam-5.3.1.tgz
	https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-6.1.1.tgz -> @sinonjs-samsam-6.1.1.tgz
	https://registry.yarnpkg.com/@sinonjs/samsam/-/samsam-8.0.0.tgz -> @sinonjs-samsam-8.0.0.tgz
	https://registry.yarnpkg.com/@sinonjs/text-encoding/-/text-encoding-0.7.2.tgz -> @sinonjs-text-encoding-0.7.2.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-10.0.0.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-1.17.7.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-13.0.2.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-14.0.0.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-17.0.1.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-18.0.0.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-5.1.1.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-7.2.2.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-7.3.1.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-7.3.2.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-7.5.0.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-8.1.1.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-9.0.2.tgz
	https://registry.yarnpkg.com/sirv/-/sirv-2.0.4.tgz
	https://registry.yarnpkg.com/slash/-/slash-1.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-2.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-4.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-0.0.4.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/slide/-/slide-1.1.6.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/@smithy/abort-controller/-/abort-controller-2.0.16.tgz -> @smithy-abort-controller-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/chunked-blob-reader/-/chunked-blob-reader-2.0.0.tgz -> @smithy-chunked-blob-reader-2.0.0.tgz
	https://registry.yarnpkg.com/@smithy/chunked-blob-reader-native/-/chunked-blob-reader-native-2.0.1.tgz -> @smithy-chunked-blob-reader-native-2.0.1.tgz
	https://registry.yarnpkg.com/@smithy/config-resolver/-/config-resolver-2.0.23.tgz -> @smithy-config-resolver-2.0.23.tgz
	https://registry.yarnpkg.com/@smithy/core/-/core-1.2.2.tgz -> @smithy-core-1.2.2.tgz
	https://registry.yarnpkg.com/@smithy/credential-provider-imds/-/credential-provider-imds-2.1.5.tgz -> @smithy-credential-provider-imds-2.1.5.tgz
	https://registry.yarnpkg.com/@smithy/eventstream-codec/-/eventstream-codec-2.0.16.tgz -> @smithy-eventstream-codec-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/eventstream-serde-browser/-/eventstream-serde-browser-2.0.16.tgz -> @smithy-eventstream-serde-browser-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/eventstream-serde-config-resolver/-/eventstream-serde-config-resolver-2.0.16.tgz -> @smithy-eventstream-serde-config-resolver-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/eventstream-serde-node/-/eventstream-serde-node-2.0.16.tgz -> @smithy-eventstream-serde-node-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/eventstream-serde-universal/-/eventstream-serde-universal-2.0.16.tgz -> @smithy-eventstream-serde-universal-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/fetch-http-handler/-/fetch-http-handler-2.3.2.tgz -> @smithy-fetch-http-handler-2.3.2.tgz
	https://registry.yarnpkg.com/@smithy/hash-blob-browser/-/hash-blob-browser-2.0.17.tgz -> @smithy-hash-blob-browser-2.0.17.tgz
	https://registry.yarnpkg.com/@smithy/hash-node/-/hash-node-2.0.18.tgz -> @smithy-hash-node-2.0.18.tgz
	https://registry.yarnpkg.com/@smithy/hash-stream-node/-/hash-stream-node-2.0.18.tgz -> @smithy-hash-stream-node-2.0.18.tgz
	https://registry.yarnpkg.com/@smithy/invalid-dependency/-/invalid-dependency-2.0.16.tgz -> @smithy-invalid-dependency-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/is-array-buffer/-/is-array-buffer-2.0.0.tgz -> @smithy-is-array-buffer-2.0.0.tgz
	https://registry.yarnpkg.com/@smithy/md5-js/-/md5-js-2.0.18.tgz -> @smithy-md5-js-2.0.18.tgz
	https://registry.yarnpkg.com/@smithy/middleware-content-length/-/middleware-content-length-2.0.18.tgz -> @smithy-middleware-content-length-2.0.18.tgz
	https://registry.yarnpkg.com/@smithy/middleware-endpoint/-/middleware-endpoint-2.3.0.tgz -> @smithy-middleware-endpoint-2.3.0.tgz
	https://registry.yarnpkg.com/@smithy/middleware-retry/-/middleware-retry-2.0.26.tgz -> @smithy-middleware-retry-2.0.26.tgz
	https://registry.yarnpkg.com/@smithy/middleware-serde/-/middleware-serde-2.0.16.tgz -> @smithy-middleware-serde-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/middleware-stack/-/middleware-stack-2.0.10.tgz -> @smithy-middleware-stack-2.0.10.tgz
	https://registry.yarnpkg.com/@smithy/node-config-provider/-/node-config-provider-2.1.9.tgz -> @smithy-node-config-provider-2.1.9.tgz
	https://registry.yarnpkg.com/@smithy/node-http-handler/-/node-http-handler-2.2.2.tgz -> @smithy-node-http-handler-2.2.2.tgz
	https://registry.yarnpkg.com/@smithy/property-provider/-/property-provider-2.0.17.tgz -> @smithy-property-provider-2.0.17.tgz
	https://registry.yarnpkg.com/@smithy/protocol-http/-/protocol-http-3.0.12.tgz -> @smithy-protocol-http-3.0.12.tgz
	https://registry.yarnpkg.com/@smithy/querystring-builder/-/querystring-builder-2.0.16.tgz -> @smithy-querystring-builder-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/querystring-parser/-/querystring-parser-2.0.16.tgz -> @smithy-querystring-parser-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/service-error-classification/-/service-error-classification-2.0.9.tgz -> @smithy-service-error-classification-2.0.9.tgz
	https://registry.yarnpkg.com/@smithy/shared-ini-file-loader/-/shared-ini-file-loader-2.2.8.tgz -> @smithy-shared-ini-file-loader-2.2.8.tgz
	https://registry.yarnpkg.com/@smithy/signature-v4/-/signature-v4-2.0.19.tgz -> @smithy-signature-v4-2.0.19.tgz
	https://registry.yarnpkg.com/@smithy/smithy-client/-/smithy-client-2.2.1.tgz -> @smithy-smithy-client-2.2.1.tgz
	https://registry.yarnpkg.com/@smithy/types/-/types-2.8.0.tgz -> @smithy-types-2.8.0.tgz
	https://registry.yarnpkg.com/@smithy/url-parser/-/url-parser-2.0.16.tgz -> @smithy-url-parser-2.0.16.tgz
	https://registry.yarnpkg.com/@smithy/util-base64/-/util-base64-2.0.1.tgz -> @smithy-util-base64-2.0.1.tgz
	https://registry.yarnpkg.com/@smithy/util-body-length-browser/-/util-body-length-browser-2.0.1.tgz -> @smithy-util-body-length-browser-2.0.1.tgz
	https://registry.yarnpkg.com/@smithy/util-body-length-node/-/util-body-length-node-2.1.0.tgz -> @smithy-util-body-length-node-2.1.0.tgz
	https://registry.yarnpkg.com/@smithy/util-buffer-from/-/util-buffer-from-2.0.0.tgz -> @smithy-util-buffer-from-2.0.0.tgz
	https://registry.yarnpkg.com/@smithy/util-config-provider/-/util-config-provider-2.1.0.tgz -> @smithy-util-config-provider-2.1.0.tgz
	https://registry.yarnpkg.com/@smithy/util-defaults-mode-browser/-/util-defaults-mode-browser-2.0.24.tgz -> @smithy-util-defaults-mode-browser-2.0.24.tgz
	https://registry.yarnpkg.com/@smithy/util-defaults-mode-node/-/util-defaults-mode-node-2.0.32.tgz -> @smithy-util-defaults-mode-node-2.0.32.tgz
	https://registry.yarnpkg.com/@smithy/util-endpoints/-/util-endpoints-1.0.8.tgz -> @smithy-util-endpoints-1.0.8.tgz
	https://registry.yarnpkg.com/@smithy/util-hex-encoding/-/util-hex-encoding-2.0.0.tgz -> @smithy-util-hex-encoding-2.0.0.tgz
	https://registry.yarnpkg.com/@smithy/util-middleware/-/util-middleware-2.0.9.tgz -> @smithy-util-middleware-2.0.9.tgz
	https://registry.yarnpkg.com/@smithy/util-retry/-/util-retry-2.0.9.tgz -> @smithy-util-retry-2.0.9.tgz
	https://registry.yarnpkg.com/@smithy/util-stream/-/util-stream-2.0.24.tgz -> @smithy-util-stream-2.0.24.tgz
	https://registry.yarnpkg.com/@smithy/util-uri-escape/-/util-uri-escape-2.0.0.tgz -> @smithy-util-uri-escape-2.0.0.tgz
	https://registry.yarnpkg.com/@smithy/util-utf8/-/util-utf8-2.0.2.tgz -> @smithy-util-utf8-2.0.2.tgz
	https://registry.yarnpkg.com/@smithy/util-waiter/-/util-waiter-2.0.16.tgz -> @smithy-util-waiter-2.0.16.tgz
	https://registry.yarnpkg.com/snake-case/-/snake-case-2.1.0.tgz
	https://registry.yarnpkg.com/snake-case/-/snake-case-3.0.4.tgz
	https://registry.yarnpkg.com/snapdragon-node/-/snapdragon-node-2.1.1.tgz
	https://registry.yarnpkg.com/snapdragon/-/snapdragon-0.8.2.tgz
	https://registry.yarnpkg.com/snapdragon-util/-/snapdragon-util-3.0.1.tgz
	https://registry.yarnpkg.com/snap-shot-compare/-/snap-shot-compare-3.0.0.tgz
	https://registry.yarnpkg.com/snap-shot-core/-/snap-shot-core-10.2.0.tgz
	https://registry.yarnpkg.com/snap-shot-core/-/snap-shot-core-10.2.4.tgz
	https://registry.yarnpkg.com/snap-shot-it/-/snap-shot-it-7.9.10.tgz
	https://registry.yarnpkg.com/snap-shot-it/-/snap-shot-it-7.9.2.tgz
	https://registry.yarnpkg.com/snap-shot-it/-/snap-shot-it-7.9.3.tgz
	https://registry.yarnpkg.com/snap-shot-it/-/snap-shot-it-7.9.6.tgz
	https://registry.yarnpkg.com/socket.io-adapter/-/socket.io-adapter-2.2.0.tgz
	https://registry.yarnpkg.com/socket.io-client/-/socket.io-client-4.0.1.tgz
	https://registry.yarnpkg.com/socket.io-parser/-/socket.io-parser-4.0.5.tgz
	https://registry.yarnpkg.com/socket.io/-/socket.io-4.0.1.tgz
	https://registry.yarnpkg.com/sockjs/-/sockjs-0.3.24.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-7.0.0.tgz
	https://registry.yarnpkg.com/sort-keys-length/-/sort-keys-length-1.0.1.tgz
	https://registry.yarnpkg.com/sort-keys/-/sort-keys-1.1.2.tgz
	https://registry.yarnpkg.com/sort-keys/-/sort-keys-2.0.0.tgz
	https://registry.yarnpkg.com/sort-object-keys/-/sort-object-keys-1.1.3.tgz
	https://registry.yarnpkg.com/sort-package-json/-/sort-package-json-1.57.0.tgz
	https://registry.yarnpkg.com/source-list-map/-/source-list-map-2.0.1.tgz
	https://registry.yarnpkg.com/sourcemap-codec/-/sourcemap-codec-1.4.8.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-0.6.2.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.2.1.tgz
	https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.3.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.1.43.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.7.4.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.8.0-beta.0.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.1.tgz
	https://registry.yarnpkg.com/sparkles/-/sparkles-1.0.1.tgz
	https://registry.yarnpkg.com/spawn-command/-/spawn-command-0.0.2-1.tgz
	https://registry.yarnpkg.com/spawn-error-forwarder/-/spawn-error-forwarder-1.0.0.tgz
	https://registry.yarnpkg.com/spawn-mock/-/spawn-mock-1.0.0.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.1.1.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.7.tgz
	https://registry.yarnpkg.com/spdy/-/spdy-4.0.2.tgz
	https://registry.yarnpkg.com/spdy-transport/-/spdy-transport-3.0.0.tgz
	https://registry.yarnpkg.com/speed-measure-webpack-plugin/-/speed-measure-webpack-plugin-1.4.2.tgz
	https://registry.yarnpkg.com/split2/-/split2-1.0.0.tgz
	https://registry.yarnpkg.com/split2/-/split2-3.2.2.tgz
	https://registry.yarnpkg.com/split-ca/-/split-ca-1.0.1.tgz
	https://registry.yarnpkg.com/split/-/split-1.0.1.tgz
	https://registry.yarnpkg.com/split-string/-/split-string-3.1.0.tgz
	https://registry.yarnpkg.com/sponge-case/-/sponge-case-1.0.1.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/squirrelly/-/squirrelly-7.9.2.tgz
	https://registry.yarnpkg.com/ssestream/-/ssestream-1.0.1.tgz
	https://registry.yarnpkg.com/ssh2/-/ssh2-1.15.0.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.18.0.tgz
	https://registry.yarnpkg.com/ssl-root-cas/-/ssl-root-cas-1.3.1.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-12.0.0.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-5.3.0.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-6.0.2.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-9.0.1.tgz
	https://registry.yarnpkg.com/stackframe/-/stackframe-1.2.0.tgz
	https://registry.yarnpkg.com/stack-trace/-/stack-trace-0.0.10.tgz
	https://registry.yarnpkg.com/static-extend/-/static-extend-0.1.2.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.5.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-2.0.1.tgz
	https://registry.yarnpkg.com/std-env/-/std-env-3.8.0.tgz
	https://registry.yarnpkg.com/stdio-mock/-/stdio-mock-1.1.0.tgz
	https://registry.yarnpkg.com/stealthy-require/-/stealthy-require-1.1.1.tgz
	https://registry.yarnpkg.com/stop-iteration-iterator/-/stop-iteration-iterator-1.0.0.tgz
	https://registry.yarnpkg.com/stop-only/-/stop-only-3.4.1.tgz
	https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-2.0.2.tgz
	https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-3.0.0.tgz
	https://registry.yarnpkg.com/stream-combiner2/-/stream-combiner2-1.1.1.tgz
	https://registry.yarnpkg.com/stream-each/-/stream-each-1.2.3.tgz
	https://registry.yarnpkg.com/stream-exhaust/-/stream-exhaust-1.0.2.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-2.8.3.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-3.2.0.tgz
	https://registry.yarnpkg.com/stream-parser/-/stream-parser-0.3.1.tgz
	https://registry.yarnpkg.com/streamsearch/-/streamsearch-0.1.2.tgz
	https://registry.yarnpkg.com/stream-shift/-/stream-shift-1.0.3.tgz
	https://registry.yarnpkg.com/stream-to-buffer/-/stream-to-buffer-0.1.0.tgz
	https://registry.yarnpkg.com/stream-to/-/stream-to-0.2.2.tgz
	https://registry.yarnpkg.com/strict-uri-encode/-/strict-uri-encode-1.1.0.tgz
	https://registry.yarnpkg.com/string-argv/-/string-argv-0.3.1.tgz
	https://registry.yarnpkg.com/string-argv/-/string-argv-0.3.2.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-0.10.31.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/string-env-interpolation/-/string-env-interpolation-1.0.1.tgz
	https://registry.yarnpkg.com/stringify-object/-/stringify-object-3.3.0.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.11.tgz
	https://registry.yarnpkg.com/string.prototype.padend/-/string.prototype.padend-3.1.2.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.9.tgz
	https://registry.yarnpkg.com/string-range/-/string-range-1.2.2.tgz
	https://registry.yarnpkg.com/string-template/-/string-template-0.2.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-2.1.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-3.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-5.2.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-2.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-4.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-1.0.4.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/strip-outer/-/strip-outer-1.0.1.tgz
	https://registry.yarnpkg.com/strnum/-/strnum-1.0.5.tgz
	https://registry.yarnpkg.com/strong-log-transformer/-/strong-log-transformer-2.1.0.tgz
	https://registry.yarnpkg.com/strtok3/-/strtok3-6.3.0.tgz
	https://registry.yarnpkg.com/subscriptions-transport-ws/-/subscriptions-transport-ws-0.10.0.tgz
	https://registry.yarnpkg.com/subscriptions-transport-ws/-/subscriptions-transport-ws-0.9.19.tgz
	https://registry.yarnpkg.com/sucrase/-/sucrase-3.35.0.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/superagent/-/superagent-3.8.3.tgz
	https://registry.yarnpkg.com/superagent/-/superagent-6.1.0.tgz
	https://registry.yarnpkg.com/supertest-session/-/supertest-session-4.0.0.tgz
	https://registry.yarnpkg.com/supertest/-/supertest-4.0.2.tgz
	https://registry.yarnpkg.com/supertest/-/supertest-6.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-2.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-3.1.2.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-6.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/sver-compat/-/sver-compat-1.5.0.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-3.0.2.tgz
	https://registry.yarnpkg.com/svg-parser/-/svg-parser-2.0.4.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-8.0.0.tgz -> @svgr-babel-plugin-add-jsx-attribute-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-8.0.0.tgz -> @svgr-babel-plugin-remove-jsx-attribute-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-8.0.0.tgz -> @svgr-babel-plugin-remove-jsx-empty-expression-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-8.0.0.tgz -> @svgr-babel-plugin-replace-jsx-attribute-value-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-8.0.0.tgz -> @svgr-babel-plugin-svg-dynamic-title-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-8.0.0.tgz -> @svgr-babel-plugin-svg-em-dimensions-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-8.0.0.tgz -> @svgr-babel-plugin-transform-react-native-svg-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-8.0.0.tgz -> @svgr-babel-plugin-transform-svg-component-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-8.0.0.tgz -> @svgr-babel-preset-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/core/-/core-8.0.0.tgz -> @svgr-core-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-8.0.0.tgz -> @svgr-hast-util-to-babel-ast-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-8.0.1.tgz -> @svgr-plugin-jsx-8.0.1.tgz
	https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-8.0.1.tgz -> @svgr-plugin-svgo-8.0.1.tgz
	https://registry.yarnpkg.com/@svgr/webpack/-/webpack-8.0.1.tgz -> @svgr-webpack-8.0.1.tgz
	https://registry.yarnpkg.com/svg-tags/-/svg-tags-1.0.0.tgz
	https://registry.yarnpkg.com/swap-case/-/swap-case-1.1.2.tgz
	https://registry.yarnpkg.com/swap-case/-/swap-case-2.0.2.tgz
	https://registry.yarnpkg.com/symbol-observable/-/symbol-observable-1.2.0.tgz
	https://registry.yarnpkg.com/symbol-observable/-/symbol-observable-4.0.0.tgz
	https://registry.yarnpkg.com/symbol-tree/-/symbol-tree-3.2.4.tgz
	https://registry.yarnpkg.com/sync-fetch/-/sync-fetch-0.3.0.tgz
	https://registry.yarnpkg.com/syntax-error/-/syntax-error-1.4.0.tgz
	https://registry.yarnpkg.com/systeminformation/-/systeminformation-5.22.8.tgz
	https://registry.yarnpkg.com/systemjs/-/systemjs-6.15.1.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz -> @szmarczak-http-timer-1.1.2.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@tailwindcss/container-queries/-/container-queries-0.1.1.tgz -> @tailwindcss-container-queries-0.1.1.tgz
	https://registry.yarnpkg.com/tailwindcss-hocus/-/tailwindcss-hocus-0.0.7.tgz
	https://registry.yarnpkg.com/tailwindcss/-/tailwindcss-1.1.4.tgz
	https://registry.yarnpkg.com/tailwindcss/-/tailwindcss-3.4.17.tgz
	https://registry.yarnpkg.com/@tanstack/query-core/-/query-core-4.36.1.tgz -> @tanstack-query-core-4.36.1.tgz
	https://registry.yarnpkg.com/@tanstack/react-query/-/react-query-4.36.1.tgz -> @tanstack-react-query-4.36.1.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-1.1.3.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-2.0.1.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-2.1.1.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-3.0.4.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-3.1.6.tgz
	https://registry.yarnpkg.com/tar/-/tar-2.2.2.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.1.15.tgz
	https://registry.yarnpkg.com/tar/-/tar-7.4.3.tgz
	https://registry.yarnpkg.com/tcomb/-/tcomb-3.2.29.tgz
	https://registry.yarnpkg.com/tcomb-validation/-/tcomb-validation-3.4.1.tgz
	https://registry.yarnpkg.com/teex/-/teex-1.0.1.tgz
	https://registry.yarnpkg.com/temp-dir/-/temp-dir-1.0.0.tgz
	https://registry.yarnpkg.com/temp-dir/-/temp-dir-2.0.0.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/terminal-banner/-/terminal-banner-1.1.0.tgz
	https://registry.yarnpkg.com/term-size/-/term-size-2.1.0.tgz
	https://registry.yarnpkg.com/term-to-html/-/term-to-html-1.2.0.tgz
	https://registry.yarnpkg.com/terser/-/terser-4.8.0.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.39.0.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-1.4.5.tgz
	https://registry.yarnpkg.com/@testing-library/cypress/-/cypress-10.0.3.tgz -> @testing-library-cypress-10.0.3.tgz
	https://registry.yarnpkg.com/@testing-library/dom/-/dom-10.4.0.tgz -> @testing-library-dom-10.4.0.tgz
	https://registry.yarnpkg.com/text-extensions/-/text-extensions-1.9.0.tgz
	https://registry.yarnpkg.com/textextensions/-/textextensions-5.14.0.tgz
	https://registry.yarnpkg.com/text-mask-addons/-/text-mask-addons-3.8.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/thenify-all/-/thenify-all-1.6.0.tgz
	https://registry.yarnpkg.com/thenify/-/thenify-3.3.1.tgz
	https://registry.yarnpkg.com/throttleit/-/throttleit-1.0.0.tgz
	https://registry.yarnpkg.com/throttle/-/throttle-1.0.3.tgz
	https://registry.yarnpkg.com/through2-filter/-/through2-filter-3.0.0.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz
	https://registry.yarnpkg.com/through2/-/through2-3.0.2.tgz
	https://registry.yarnpkg.com/through2/-/through2-4.0.2.tgz
	https://registry.yarnpkg.com/through/-/through-2.3.8.tgz
	https://registry.yarnpkg.com/thunky/-/thunky-1.1.0.tgz
	https://registry.yarnpkg.com/tildify/-/tildify-1.2.0.tgz
	https://registry.yarnpkg.com/timed-out/-/timed-out-4.0.1.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-2.0.12.tgz
	https://registry.yarnpkg.com/time-stamp/-/time-stamp-1.1.0.tgz
	https://registry.yarnpkg.com/timm/-/timm-1.7.1.tgz
	https://registry.yarnpkg.com/tinycolor2/-/tinycolor2-1.6.0.tgz
	https://registry.yarnpkg.com/tinyexec/-/tinyexec-0.3.2.tgz
	https://registry.yarnpkg.com/tiny-lr/-/tiny-lr-1.1.1.tgz
	https://registry.yarnpkg.com/tiny-relative-date/-/tiny-relative-date-1.3.0.tgz
	https://registry.yarnpkg.com/title-case/-/title-case-2.1.1.tgz
	https://registry.yarnpkg.com/title-case/-/title-case-3.0.3.tgz
	https://registry.yarnpkg.com/tldts-core/-/tldts-core-6.1.57.tgz
	https://registry.yarnpkg.com/tldts/-/tldts-6.1.57.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.0.33.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.3.tgz
	https://registry.yarnpkg.com/to-absolute-glob/-/to-absolute-glob-2.0.2.tgz
	https://registry.yarnpkg.com/to-arraybuffer/-/to-arraybuffer-1.0.1.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-1.0.3.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-ico/-/to-ico-1.1.5.tgz
	https://registry.yarnpkg.com/toidentifier/-/toidentifier-1.0.0.tgz
	https://registry.yarnpkg.com/toidentifier/-/toidentifier-1.0.1.tgz
	https://registry.yarnpkg.com/@tokenizer/token/-/token-0.3.0.tgz -> @tokenizer-token-0.3.0.tgz
	https://registry.yarnpkg.com/token-types/-/token-types-4.2.1.tgz
	https://registry.yarnpkg.com/to-object-path/-/to-object-path-0.3.0.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-1.1.2.tgz -> @tootallnate-once-1.1.2.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@tootallnate/quickjs-emscripten/-/quickjs-emscripten-0.23.0.tgz -> @tootallnate-quickjs-emscripten-0.23.0.tgz
	https://registry.yarnpkg.com/to-readable-stream/-/to-readable-stream-1.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-2.1.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/to-regex/-/to-regex-3.0.2.tgz
	https://registry.yarnpkg.com/totalist/-/totalist-3.0.0.tgz
	https://registry.yarnpkg.com/to-through/-/to-through-2.0.0.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.5.0.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-4.1.3.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-5.0.0.tgz
	https://registry.yarnpkg.com/@toycode/markdown-it-class/-/markdown-it-class-1.2.3.tgz -> @toycode-markdown-it-class-1.2.3.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-1.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-5.0.0.tgz
	https://registry.yarnpkg.com/trash/-/trash-5.2.0.tgz
	https://registry.yarnpkg.com/traverse/-/traverse-0.6.6.tgz
	https://registry.yarnpkg.com/tree-kill/-/tree-kill-1.2.2.tgz
	https://registry.yarnpkg.com/treeverse/-/treeverse-3.0.0.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-3.0.0.tgz
	https://registry.yarnpkg.com/trim-repeated/-/trim-repeated-1.0.0.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/@trysound/sax/-/sax-0.2.0.tgz -> @trysound-sax-0.2.0.tgz
	https://registry.yarnpkg.com/ts-api-utils/-/ts-api-utils-1.3.0.tgz
	https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.8.tgz -> @tsconfig-node10-1.0.8.tgz
	https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.9.tgz -> @tsconfig-node12-1.0.9.tgz
	https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.1.tgz -> @tsconfig-node14-1.0.1.tgz
	https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.2.tgz -> @tsconfig-node16-1.0.2.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.10.1.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.15.0.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-4.2.0.tgz
	https://registry.yarnpkg.com/ts-interface-checker/-/ts-interface-checker-0.1.13.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.0.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.0.3.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.1.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.2.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.3.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.4.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.6.2.tgz
	https://registry.yarnpkg.com/tslint/-/tslint-5.14.0.tgz
	https://registry.yarnpkg.com/tslint/-/tslint-6.1.3.tgz
	https://registry.yarnpkg.com/ts-log/-/ts-log-2.2.3.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-10.9.2.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-9.1.1.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-2.29.0.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.0.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/@tufjs/models/-/models-3.0.1.tgz -> @tufjs-models-3.0.1.tgz
	https://registry.yarnpkg.com/tuf-js/-/tuf-js-3.0.1.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.6.0.tgz
	https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz
	https://registry.yarnpkg.com/@tybys/wasm-util/-/wasm-util-0.9.0.tgz -> @tybys-wasm-util-0.9.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.6.tgz
	https://registry.yarnpkg.com/typedarray-to-buffer/-/typedarray-to-buffer-1.0.4.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-0.1.1.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-1.0.0.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.1.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.16.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.18.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.21.3.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.3.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.4.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-1.6.18.tgz
	https://registry.yarnpkg.com/@types/aria-query/-/aria-query-5.0.4.tgz -> @types-aria-query-5.0.4.tgz
	https://registry.yarnpkg.com/@types/babel__code-frame/-/babel__code-frame-7.0.3.tgz -> @types-babel__code-frame-7.0.3.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.20.5.tgz -> @types-babel__core-7.20.5.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.2.tgz -> @types-babel__generator-7.6.2.tgz
	https://registry.yarnpkg.com/@types/babel-plugin-tester/-/babel-plugin-tester-9.0.4.tgz -> @types-babel-plugin-tester-9.0.4.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.0.tgz -> @types-babel__template-7.4.0.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.20.2.tgz -> @types-babel__traverse-7.20.2.tgz
	https://registry.yarnpkg.com/@types/better-sqlite3/-/better-sqlite3-7.6.4.tgz -> @types-better-sqlite3-7.6.4.tgz
	https://registry.yarnpkg.com/@types/bluebird/-/bluebird-3.5.29.tgz -> @types-bluebird-3.5.29.tgz
	https://registry.yarnpkg.com/@types/bluebird/-/bluebird-3.5.33.tgz -> @types-bluebird-3.5.33.tgz
	https://registry.yarnpkg.com/@types/body-parser/-/body-parser-1.19.0.tgz -> @types-body-parser-1.19.0.tgz
	https://registry.yarnpkg.com/@types/bonjour/-/bonjour-3.5.13.tgz -> @types-bonjour-3.5.13.tgz
	https://registry.yarnpkg.com/@types/braces/-/braces-3.0.1.tgz -> @types-braces-3.0.1.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.1.tgz -> @types-cacheable-request-6.0.1.tgz
	https://registry.yarnpkg.com/@types/caseless/-/caseless-0.12.2.tgz -> @types-caseless-0.12.2.tgz
	https://registry.yarnpkg.com/@types/chai-as-promised/-/chai-as-promised-7.1.2.tgz -> @types-chai-as-promised-7.1.2.tgz
	https://registry.yarnpkg.com/@types/chai/-/chai-4.2.15.tgz -> @types-chai-4.2.15.tgz
	https://registry.yarnpkg.com/@types/chai/-/chai-5.0.1.tgz -> @types-chai-5.0.1.tgz
	https://registry.yarnpkg.com/@types/chai-enzyme/-/chai-enzyme-0.6.7.tgz -> @types-chai-enzyme-0.6.7.tgz
	https://registry.yarnpkg.com/@types/chai-jquery/-/chai-jquery-1.1.40.tgz -> @types-chai-jquery-1.1.40.tgz
	https://registry.yarnpkg.com/@types/chai-subset/-/chai-subset-1.3.5.tgz -> @types-chai-subset-1.3.5.tgz
	https://registry.yarnpkg.com/@types/cheerio/-/cheerio-0.22.21.tgz -> @types-cheerio-0.22.21.tgz
	https://registry.yarnpkg.com/@types/chrome/-/chrome-0.0.101.tgz -> @types-chrome-0.0.101.tgz
	https://registry.yarnpkg.com/@types/chrome-remote-interface/-/chrome-remote-interface-0.31.14.tgz -> @types-chrome-remote-interface-0.31.14.tgz
	https://registry.yarnpkg.com/@types/common-tags/-/common-tags-1.8.0.tgz -> @types-common-tags-1.8.0.tgz
	https://registry.yarnpkg.com/@types/component-emitter/-/component-emitter-1.2.10.tgz -> @types-component-emitter-1.2.10.tgz
	https://registry.yarnpkg.com/@types/concat-stream/-/concat-stream-1.6.0.tgz -> @types-concat-stream-1.6.0.tgz
	https://registry.yarnpkg.com/@types/connect/-/connect-3.4.35.tgz -> @types-connect-3.4.35.tgz
	https://registry.yarnpkg.com/@types/connect-history-api-fallback/-/connect-history-api-fallback-1.5.4.tgz -> @types-connect-history-api-fallback-1.5.4.tgz
	https://registry.yarnpkg.com/@types/cookie/-/cookie-0.4.1.tgz -> @types-cookie-0.4.1.tgz
	https://registry.yarnpkg.com/@types/cookiejar/-/cookiejar-2.1.2.tgz -> @types-cookiejar-2.1.2.tgz
	https://registry.yarnpkg.com/@types/cors/-/cors-2.8.12.tgz -> @types-cors-2.8.12.tgz
	https://registry.yarnpkg.com/typescript-cached-transpile/-/typescript-cached-transpile-0.0.6.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-7.2.0.tgz -> @typescript-eslint-eslint-plugin-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-7.2.0.tgz -> @typescript-eslint-parser-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-7.2.0.tgz -> @typescript-eslint-scope-manager-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-7.2.0.tgz -> @typescript-eslint-typescript-estree-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-7.2.0.tgz -> @typescript-eslint-types-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-7.2.0.tgz -> @typescript-eslint-type-utils-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-7.2.0.tgz -> @typescript-eslint-utils-7.2.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-7.2.0.tgz -> @typescript-eslint-visitor-keys-7.2.0.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.3.3.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.4.5.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.6.3.tgz
	https://registry.yarnpkg.com/@types/crypto-js/-/crypto-js-4.1.1.tgz -> @types-crypto-js-4.1.1.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.12.tgz -> @types-debug-4.1.12.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.7.tgz -> @types-debug-4.1.7.tgz
	https://registry.yarnpkg.com/@types/dedent/-/dedent-0.7.0.tgz -> @types-dedent-0.7.0.tgz
	https://registry.yarnpkg.com/@types/deep-eql/-/deep-eql-4.0.2.tgz -> @types-deep-eql-4.0.2.tgz
	https://registry.yarnpkg.com/@types/detect-port/-/detect-port-1.3.5.tgz -> @types-detect-port-1.3.5.tgz
	https://registry.yarnpkg.com/@types/doctrine/-/doctrine-0.0.6.tgz -> @types-doctrine-0.0.6.tgz
	https://registry.yarnpkg.com/@types/ejs/-/ejs-3.1.2.tgz -> @types-ejs-3.1.2.tgz
	https://registry.yarnpkg.com/@types/enzyme-adapter-react-16/-/enzyme-adapter-react-16-1.0.5.tgz -> @types-enzyme-adapter-react-16-1.0.5.tgz
	https://registry.yarnpkg.com/@types/enzyme/-/enzyme-3.10.5.tgz -> @types-enzyme-3.10.5.tgz
	https://registry.yarnpkg.com/@types/eslint/-/eslint-7.29.0.tgz -> @types-eslint-7.29.0.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-0.0.39.tgz -> @types-estree-0.0.39.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-0.0.51.tgz -> @types-estree-0.0.51.tgz
	https://registry.yarnpkg.com/@types/events/-/events-3.0.0.tgz -> @types-events-3.0.0.tgz
	https://registry.yarnpkg.com/@types/expect/-/expect-1.20.4.tgz -> @types-expect-1.20.4.tgz
	https://registry.yarnpkg.com/@types/express/-/express-4.17.21.tgz -> @types-express-4.17.21.tgz
	https://registry.yarnpkg.com/@types/express/-/express-4.17.2.tgz -> @types-express-4.17.2.tgz
	https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-4.19.0.tgz -> @types-express-serve-static-core-4.19.0.tgz
	https://registry.yarnpkg.com/@types/filesystem/-/filesystem-0.0.32.tgz -> @types-filesystem-0.0.32.tgz
	https://registry.yarnpkg.com/@types/filewriter/-/filewriter-0.0.28.tgz -> @types-filewriter-0.0.28.tgz
	https://registry.yarnpkg.com/@types/fluent-ffmpeg/-/fluent-ffmpeg-2.1.18.tgz -> @types-fluent-ffmpeg-2.1.18.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-8.1.1.tgz -> @types-fs-extra-8.1.1.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/getenv/-/getenv-1.0.0.tgz -> @types-getenv-1.0.0.tgz
	https://registry.yarnpkg.com/@types/glob/-/glob-7.1.1.tgz -> @types-glob-7.1.1.tgz
	https://registry.yarnpkg.com/@types/glob-stream/-/glob-stream-6.1.1.tgz -> @types-glob-stream-6.1.1.tgz
	https://registry.yarnpkg.com/@types/graphql-resolve-batch/-/graphql-resolve-batch-1.1.6.tgz -> @types-graphql-resolve-batch-1.1.6.tgz
	https://registry.yarnpkg.com/@types/gulp/-/gulp-4.0.9.tgz -> @types-gulp-4.0.9.tgz
	https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-5.1.1.tgz -> @types-html-minifier-terser-5.1.1.tgz
	https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz -> @types-html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.0.tgz -> @types-http-cache-semantics-4.0.0.tgz
	https://registry.yarnpkg.com/@types/http-errors/-/http-errors-2.0.1.tgz -> @types-http-errors-2.0.1.tgz
	https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.4.tgz -> @types-http-proxy-1.17.4.tgz
	https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.8.tgz -> @types-http-proxy-1.17.8.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.3.tgz -> @types-istanbul-lib-coverage-2.0.3.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz -> @types-istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.1.tgz -> @types-istanbul-reports-3.0.1.tgz
	https://registry.yarnpkg.com/@types/jquery/-/jquery-3.3.31.tgz -> @types-jquery-3.3.31.tgz
	https://registry.yarnpkg.com/@types/jquery.scrollto/-/jquery.scrollto-1.4.29.tgz -> @types-jquery.scrollto-1.4.29.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.15.tgz -> @types-json-schema-7.0.15.tgz
	https://registry.yarnpkg.com/@types/json-stable-stringify/-/json-stable-stringify-1.0.33.tgz -> @types-json-stable-stringify-1.0.33.tgz
	https://registry.yarnpkg.com/@types/jsonwebtoken/-/jsonwebtoken-9.0.5.tgz -> @types-jsonwebtoken-9.0.5.tgz
	https://registry.yarnpkg.com/@types/js-yaml/-/js-yaml-4.0.2.tgz -> @types-js-yaml-4.0.2.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.1.tgz -> @types-keyv-3.1.1.tgz
	https://registry.yarnpkg.com/@types/linkify-it/-/linkify-it-3.0.0.tgz -> @types-linkify-it-3.0.0.tgz
	https://registry.yarnpkg.com/@types/lodash/-/lodash-4.14.168.tgz -> @types-lodash-4.14.168.tgz
	https://registry.yarnpkg.com/@types/markdown-it/-/markdown-it-12.2.3.tgz -> @types-markdown-it-12.2.3.tgz
	https://registry.yarnpkg.com/@types/mdurl/-/mdurl-1.0.2.tgz -> @types-mdurl-1.0.2.tgz
	https://registry.yarnpkg.com/@types/micromatch/-/micromatch-4.0.9.tgz -> @types-micromatch-4.0.9.tgz
	https://registry.yarnpkg.com/@types/mime/-/mime-1.3.2.tgz -> @types-mime-1.3.2.tgz
	https://registry.yarnpkg.com/@types/minimatch/-/minimatch-3.0.5.tgz -> @types-minimatch-3.0.5.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.1.tgz -> @types-minimist-1.2.1.tgz
	https://registry.yarnpkg.com/@types/mocha/-/mocha-8.0.3.tgz -> @types-mocha-8.0.3.tgz
	https://registry.yarnpkg.com/@types/mocha/-/mocha-8.2.2.tgz -> @types-mocha-8.2.2.tgz
	https://registry.yarnpkg.com/@types/mocha/-/mocha-9.0.0.tgz -> @types-mocha-9.0.0.tgz
	https://registry.yarnpkg.com/@types/mocha/-/mocha-9.1.0.tgz -> @types-mocha-9.1.0.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node-forge/-/node-forge-1.3.11.tgz -> @types-node-forge-1.3.11.tgz
	https://registry.yarnpkg.com/@types/node/-/node-12.20.55.tgz -> @types-node-12.20.55.tgz
	https://registry.yarnpkg.com/@types/node/-/node-16.9.1.tgz -> @types-node-16.9.1.tgz
	https://registry.yarnpkg.com/@types/node/-/node-20.16.0.tgz -> @types-node-20.16.0.tgz
	https://registry.yarnpkg.com/@types/node/-/node-20.16.12.tgz -> @types-node-20.16.12.tgz
	https://registry.yarnpkg.com/@types/node/-/node-22.10.1.tgz -> @types-node-22.10.1.tgz
	https://registry.yarnpkg.com/@types/node/-/node-8.10.66.tgz -> @types-node-8.10.66.tgz
	https://registry.yarnpkg.com/@types/parse5-html-rewriting-stream/-/parse5-html-rewriting-stream-5.1.1.tgz -> @types-parse5-html-rewriting-stream-5.1.1.tgz
	https://registry.yarnpkg.com/@types/parse5/-/parse5-5.0.3.tgz -> @types-parse5-5.0.3.tgz
	https://registry.yarnpkg.com/@types/parse5-sax-parser/-/parse5-sax-parser-5.0.1.tgz -> @types-parse5-sax-parser-5.0.1.tgz
	https://registry.yarnpkg.com/@types/parse-glob/-/parse-glob-3.0.29.tgz -> @types-parse-glob-3.0.29.tgz
	https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz -> @types-parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/@types/parsimmon/-/parsimmon-1.10.6.tgz -> @types-parsimmon-1.10.6.tgz
	https://registry.yarnpkg.com/@types/picomatch/-/picomatch-2.3.0.tgz -> @types-picomatch-2.3.0.tgz
	https://registry.yarnpkg.com/@types/plist/-/plist-3.0.2.tgz -> @types-plist-3.0.2.tgz
	https://registry.yarnpkg.com/@types/pngjs/-/pngjs-6.0.1.tgz -> @types-pngjs-6.0.1.tgz
	https://registry.yarnpkg.com/@types/prettier/-/prettier-2.4.3.tgz -> @types-prettier-2.4.3.tgz
	https://registry.yarnpkg.com/@types/prettier/-/prettier-2.6.0.tgz -> @types-prettier-2.6.0.tgz
	https://registry.yarnpkg.com/@types/prismjs/-/prismjs-1.16.0.tgz -> @types-prismjs-1.16.0.tgz
	https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.3.tgz -> @types-prop-types-15.7.3.tgz
	https://registry.yarnpkg.com/@types/proxyquire/-/proxyquire-1.3.28.tgz -> @types-proxyquire-1.3.28.tgz
	https://registry.yarnpkg.com/@types/qs/-/qs-6.9.6.tgz -> @types-qs-6.9.6.tgz
	https://registry.yarnpkg.com/@types/range-parser/-/range-parser-1.2.3.tgz -> @types-range-parser-1.2.3.tgz
	https://registry.yarnpkg.com/@types/react/-/react-18.3.12.tgz -> @types-react-18.3.12.tgz
	https://registry.yarnpkg.com/@types/request-promise/-/request-promise-4.1.45.tgz -> @types-request-promise-4.1.45.tgz
	https://registry.yarnpkg.com/@types/request-promise/-/request-promise-4.1.48.tgz -> @types-request-promise-4.1.48.tgz
	https://registry.yarnpkg.com/@types/request/-/request-2.48.5.tgz -> @types-request-2.48.5.tgz
	https://registry.yarnpkg.com/@types/resolve/-/resolve-1.17.1.tgz -> @types-resolve-1.17.1.tgz
	https://registry.yarnpkg.com/@types/resolve/-/resolve-1.20.3.tgz -> @types-resolve-1.20.3.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.0.tgz -> @types-responselike-1.0.0.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.2.tgz -> @types-retry-0.12.2.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.5.8.tgz -> @types-semver-7.5.8.tgz
	https://registry.yarnpkg.com/@types/send/-/send-0.17.4.tgz -> @types-send-0.17.4.tgz
	https://registry.yarnpkg.com/@types/serve-index/-/serve-index-1.9.4.tgz -> @types-serve-index-1.9.4.tgz
	https://registry.yarnpkg.com/@types/server-destroy/-/server-destroy-1.0.1.tgz -> @types-server-destroy-1.0.1.tgz
	https://registry.yarnpkg.com/@types/serve-static/-/serve-static-1.15.7.tgz -> @types-serve-static-1.15.7.tgz
	https://registry.yarnpkg.com/@types/sinon-chai/-/sinon-chai-3.2.3.tgz -> @types-sinon-chai-3.2.3.tgz
	https://registry.yarnpkg.com/@types/sinon-chai/-/sinon-chai-3.2.5.tgz -> @types-sinon-chai-3.2.5.tgz
	https://registry.yarnpkg.com/@types/sinon-chai/-/sinon-chai-3.2.8.tgz -> @types-sinon-chai-3.2.8.tgz
	https://registry.yarnpkg.com/@types/sinonjs__fake-timers/-/sinonjs__fake-timers-8.1.1.tgz -> @types-sinonjs__fake-timers-8.1.1.tgz
	https://registry.yarnpkg.com/@types/sinon/-/sinon-10.0.11.tgz -> @types-sinon-10.0.11.tgz
	https://registry.yarnpkg.com/@types/sinon/-/sinon-9.0.9.tgz -> @types-sinon-9.0.9.tgz
	https://registry.yarnpkg.com/@types/sizzle/-/sizzle-2.3.2.tgz -> @types-sizzle-2.3.2.tgz
	https://registry.yarnpkg.com/@types/sockjs/-/sockjs-0.3.36.tgz -> @types-sockjs-0.3.36.tgz
	https://registry.yarnpkg.com/@types/source-list-map/-/source-list-map-0.1.2.tgz -> @types-source-list-map-0.1.2.tgz
	https://registry.yarnpkg.com/@types/speed-measure-webpack-plugin/-/speed-measure-webpack-plugin-1.3.4.tgz -> @types-speed-measure-webpack-plugin-1.3.4.tgz
	https://registry.yarnpkg.com/@types/stringify-object/-/stringify-object-3.3.1.tgz -> @types-stringify-object-3.3.1.tgz
	https://registry.yarnpkg.com/@types/superagent/-/superagent-4.1.10.tgz -> @types-superagent-4.1.10.tgz
	https://registry.yarnpkg.com/@types/supertest/-/supertest-2.0.10.tgz -> @types-supertest-2.0.10.tgz
	https://registry.yarnpkg.com/@types/tapable/-/tapable-1.0.7.tgz -> @types-tapable-1.0.7.tgz
	https://registry.yarnpkg.com/@types/tar/-/tar-6.1.13.tgz -> @types-tar-6.1.13.tgz
	https://registry.yarnpkg.com/@types/through2/-/through2-2.0.36.tgz -> @types-through2-2.0.36.tgz
	https://registry.yarnpkg.com/@types/to-ico/-/to-ico-1.1.1.tgz -> @types-to-ico-1.1.1.tgz
	https://registry.yarnpkg.com/@types/tough-cookie/-/tough-cookie-4.0.0.tgz -> @types-tough-cookie-4.0.0.tgz
	https://registry.yarnpkg.com/@types/uglify-js/-/uglify-js-3.12.0.tgz -> @types-uglify-js-3.12.0.tgz
	https://registry.yarnpkg.com/@types/underscore.string/-/underscore.string-0.0.38.tgz -> @types-underscore.string-0.0.38.tgz
	https://registry.yarnpkg.com/@types/underscore/-/underscore-1.11.3.tgz -> @types-underscore-1.11.3.tgz
	https://registry.yarnpkg.com/@types/undertaker-registry/-/undertaker-registry-1.0.1.tgz -> @types-undertaker-registry-1.0.1.tgz
	https://registry.yarnpkg.com/@types/undertaker/-/undertaker-1.2.7.tgz -> @types-undertaker-1.2.7.tgz
	https://registry.yarnpkg.com/@types/uuid/-/uuid-8.3.2.tgz -> @types-uuid-8.3.2.tgz
	https://registry.yarnpkg.com/@types/verror/-/verror-1.10.5.tgz -> @types-verror-1.10.5.tgz
	https://registry.yarnpkg.com/@types/vinyl-fs/-/vinyl-fs-2.4.12.tgz -> @types-vinyl-fs-2.4.12.tgz
	https://registry.yarnpkg.com/@types/vinyl/-/vinyl-2.0.6.tgz -> @types-vinyl-2.0.6.tgz
	https://registry.yarnpkg.com/@types/warning/-/warning-3.0.0.tgz -> @types-warning-3.0.0.tgz
	https://registry.yarnpkg.com/@types/webpack-sources/-/webpack-sources-2.1.0.tgz -> @types-webpack-sources-2.1.0.tgz
	https://registry.yarnpkg.com/@types/webpack/-/webpack-4.41.38.tgz -> @types-webpack-4.41.38.tgz
	https://registry.yarnpkg.com/@types/webpack/-/webpack-5.28.1.tgz -> @types-webpack-5.28.1.tgz
	https://registry.yarnpkg.com/@types/websocket/-/websocket-1.0.2.tgz -> @types-websocket-1.0.2.tgz
	https://registry.yarnpkg.com/@types/websocket/-/websocket-1.0.4.tgz -> @types-websocket-1.0.4.tgz
	https://registry.yarnpkg.com/@types/ws/-/ws-7.4.7.tgz -> @types-ws-7.4.7.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-20.2.0.tgz -> @types-yargs-parser-20.2.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-15.0.14.tgz -> @types-yargs-15.0.14.tgz
	https://registry.yarnpkg.com/@types/yauzl/-/yauzl-2.9.1.tgz -> @types-yauzl-2.9.1.tgz
	https://registry.yarnpkg.com/type/-/type-1.2.0.tgz
	https://registry.yarnpkg.com/type/-/type-2.3.0.tgz
	https://registry.yarnpkg.com/ua-parser-js/-/ua-parser-js-0.7.33.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-1.0.6.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-2.0.0.tgz
	https://registry.yarnpkg.com/ufo/-/ufo-1.5.4.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.8.29.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.4.10.tgz
	https://registry.yarnpkg.com/uglify-to-browserify/-/uglify-to-browserify-1.0.2.tgz
	https://registry.yarnpkg.com/uid-safe/-/uid-safe-2.1.5.tgz
	https://registry.yarnpkg.com/ultron/-/ultron-1.1.1.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/unbzip2-stream/-/unbzip2-stream-1.4.3.tgz
	https://registry.yarnpkg.com/unc-path-regex/-/unc-path-regex-0.1.2.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-3.3.6.tgz
	https://registry.yarnpkg.com/undertaker-registry/-/undertaker-registry-1.0.1.tgz
	https://registry.yarnpkg.com/undertaker/-/undertaker-1.3.0.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-6.19.8.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-6.20.0.tgz
	https://registry.yarnpkg.com/@ungap/promise-all-settled/-/promise-all-settled-1.1.2.tgz -> @ungap-promise-all-settled-1.1.2.tgz
	https://registry.yarnpkg.com/@ungap/structured-clone/-/structured-clone-1.2.0.tgz -> @ungap-structured-clone-1.2.0.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/union/-/union-0.5.0.tgz
	https://registry.yarnpkg.com/union-value/-/union-value-1.0.1.tgz
	https://registry.yarnpkg.com/unique-concat/-/unique-concat-0.2.2.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-3.0.0.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-4.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.2.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-4.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-5.0.0.tgz
	https://registry.yarnpkg.com/unique-stream/-/unique-stream-2.3.1.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-2.0.0.tgz
	https://registry.yarnpkg.com/universal-github-app-jwt/-/universal-github-app-jwt-1.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.2.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-6.0.0.tgz
	https://registry.yarnpkg.com/unixify/-/unixify-1.0.0.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unplugin-icons/-/unplugin-icons-0.19.0.tgz
	https://registry.yarnpkg.com/unplugin-icons/-/unplugin-icons-22.1.0.tgz
	https://registry.yarnpkg.com/unplugin/-/unplugin-1.10.1.tgz
	https://registry.yarnpkg.com/unplugin/-/unplugin-2.2.0.tgz
	https://registry.yarnpkg.com/unplugin-vue-components/-/unplugin-vue-components-0.27.0.tgz
	https://registry.yarnpkg.com/unset-value/-/unset-value-1.0.0.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-2.1.0.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-4.0.0.tgz
	https://registry.yarnpkg.com/unused-filename/-/unused-filename-2.1.0.tgz
	https://registry.yarnpkg.com/upath/-/upath-1.2.0.tgz
	https://registry.yarnpkg.com/upath/-/upath-2.0.1.tgz
	https://registry.yarnpkg.com/update-check/-/update-check-1.5.4.tgz
	https://registry.yarnpkg.com/upper-case-first/-/upper-case-first-1.1.2.tgz
	https://registry.yarnpkg.com/upper-case-first/-/upper-case-first-2.0.2.tgz
	https://registry.yarnpkg.com/upper-case/-/upper-case-1.1.3.tgz
	https://registry.yarnpkg.com/upper-case/-/upper-case-2.0.2.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/urix/-/urix-0.1.0.tgz
	https://registry.yarnpkg.com/url-join/-/url-join-2.0.5.tgz
	https://registry.yarnpkg.com/url-parse-lax/-/url-parse-lax-3.0.0.tgz
	https://registry.yarnpkg.com/url-parse/-/url-parse-1.5.10.tgz
	https://registry.yarnpkg.com/url-regex/-/url-regex-3.2.0.tgz
	https://registry.yarnpkg.com/url-to-options/-/url-to-options-1.0.1.tgz
	https://registry.yarnpkg.com/url/-/url-0.11.1.tgz
	https://registry.yarnpkg.com/@urql/core/-/core-2.4.4.tgz -> @urql-core-2.4.4.tgz
	https://registry.yarnpkg.com/@urql/devtools/-/devtools-2.0.3.tgz -> @urql-devtools-2.0.3.tgz
	https://registry.yarnpkg.com/@urql/exchange-execute/-/exchange-execute-1.1.0.tgz -> @urql-exchange-execute-1.1.0.tgz
	https://registry.yarnpkg.com/@urql/exchange-graphcache/-/exchange-graphcache-4.3.6.tgz -> @urql-exchange-graphcache-4.3.6.tgz
	https://registry.yarnpkg.com/@urql/introspection/-/introspection-0.3.0.tgz -> @urql-introspection-0.3.0.tgz
	https://registry.yarnpkg.com/@urql/vue/-/vue-0.6.2.tgz -> @urql-vue-0.6.2.tgz
	https://registry.yarnpkg.com/use-callback-ref/-/use-callback-ref-1.2.5.tgz
	https://registry.yarnpkg.com/user-home/-/user-home-2.0.0.tgz
	https://registry.yarnpkg.com/use-sidecar/-/use-sidecar-1.0.4.tgz
	https://registry.yarnpkg.com/use-sync-external-store/-/use-sync-external-store-1.2.2.tgz
	https://registry.yarnpkg.com/use/-/use-3.1.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/utf8-stream/-/utf8-stream-0.0.0.tgz
	https://registry.yarnpkg.com/utif2/-/utif2-4.1.0.tgz
	https://registry.yarnpkg.com/utila/-/utila-0.4.0.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.1.tgz
	https://registry.yarnpkg.com/util/-/util-0.10.3.tgz
	https://registry.yarnpkg.com/util/-/util-0.11.1.tgz
	https://registry.yarnpkg.com/util/-/util-0.12.5.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-10.0.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.4.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-8.3.2.tgz
	https://registry.yarnpkg.com/v8-compile-cache-lib/-/v8-compile-cache-lib-3.0.1.tgz
	https://registry.yarnpkg.com/v8flags/-/v8flags-3.2.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-3.0.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-6.0.0.tgz
	https://registry.yarnpkg.com/validator/-/validator-7.2.0.tgz
	https://registry.yarnpkg.com/validator/-/validator-9.4.1.tgz
	https://registry.yarnpkg.com/valid-url/-/valid-url-1.0.9.tgz
	https://registry.yarnpkg.com/value-or-function/-/value-or-function-3.0.0.tgz
	https://registry.yarnpkg.com/value-or-promise/-/value-or-promise-1.0.10.tgz
	https://registry.yarnpkg.com/value-or-promise/-/value-or-promise-1.0.11.tgz
	https://registry.yarnpkg.com/value-or-promise/-/value-or-promise-1.0.6.tgz
	https://registry.yarnpkg.com/vanilla-text-mask/-/vanilla-text-mask-5.1.1.tgz
	https://registry.yarnpkg.com/variable-diff/-/variable-diff-1.1.0.tgz
	https://registry.yarnpkg.com/vary/-/vary-1.1.2.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.1.tgz
	https://registry.yarnpkg.com/vinyl-fs/-/vinyl-fs-3.0.3.tgz
	https://registry.yarnpkg.com/vinyl-sourcemap/-/vinyl-sourcemap-1.1.0.tgz
	https://registry.yarnpkg.com/vinyl/-/vinyl-2.2.1.tgz
	https://registry.yarnpkg.com/vinyl/-/vinyl-3.0.0.tgz
	https://registry.yarnpkg.com/@vitejs/plugin-legacy/-/plugin-legacy-5.4.0.tgz -> @vitejs-plugin-legacy-5.4.0.tgz
	https://registry.yarnpkg.com/@vitejs/plugin-vue-jsx/-/plugin-vue-jsx-3.1.0.tgz -> @vitejs-plugin-vue-jsx-3.1.0.tgz
	https://registry.yarnpkg.com/@vitejs/plugin-vue/-/plugin-vue-5.0.4.tgz -> @vitejs-plugin-vue-5.0.4.tgz
	https://registry.yarnpkg.com/vite-node/-/vite-node-2.1.8.tgz
	https://registry.yarnpkg.com/vite-plugin-inspect/-/vite-plugin-inspect-0.8.4.tgz
	https://registry.yarnpkg.com/vite-plugin-optimize-persist/-/vite-plugin-optimize-persist-0.1.2.tgz
	https://registry.yarnpkg.com/vite-plugin-package-config/-/vite-plugin-package-config-0.1.1.tgz
	https://registry.yarnpkg.com/vite-plugin-pages/-/vite-plugin-pages-0.32.1.tgz
	https://registry.yarnpkg.com/vite-plugin-require-transform/-/vite-plugin-require-transform-1.0.12.tgz
	https://registry.yarnpkg.com/vite-plugin-vue-layouts/-/vite-plugin-vue-layouts-0.11.0.tgz
	https://registry.yarnpkg.com/@vitest/expect/-/expect-2.1.8.tgz -> @vitest-expect-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/mocker/-/mocker-2.1.8.tgz -> @vitest-mocker-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/pretty-format/-/pretty-format-2.1.8.tgz -> @vitest-pretty-format-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/runner/-/runner-2.1.8.tgz -> @vitest-runner-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/snapshot/-/snapshot-2.1.8.tgz -> @vitest-snapshot-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/spy/-/spy-2.1.8.tgz -> @vitest-spy-2.1.8.tgz
	https://registry.yarnpkg.com/@vitest/utils/-/utils-2.1.8.tgz -> @vitest-utils-2.1.8.tgz
	https://registry.yarnpkg.com/vitest/-/vitest-2.1.8.tgz
	https://registry.yarnpkg.com/vite-svg-loader/-/vite-svg-loader-5.1.0.tgz
	https://registry.yarnpkg.com/vite/-/vite-4.5.3.tgz
	https://registry.yarnpkg.com/vite/-/vite-5.2.11.tgz
	https://registry.yarnpkg.com/vite/-/vite-5.2.8.tgz
	https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-1.1.2.tgz
	https://registry.yarnpkg.com/@volar/language-core/-/language-core-2.2.4.tgz -> @volar-language-core-2.2.4.tgz
	https://registry.yarnpkg.com/@volar/source-map/-/source-map-2.2.4.tgz -> @volar-source-map-2.2.4.tgz
	https://registry.yarnpkg.com/@volar/typescript/-/typescript-2.2.4.tgz -> @volar-typescript-2.2.4.tgz
	https://registry.yarnpkg.com/vscode-textmate/-/vscode-textmate-5.2.0.tgz
	https://registry.yarnpkg.com/vue3-file-selector/-/vue3-file-selector-1.0.1.tgz
	https://registry.yarnpkg.com/@vue/babel-helper-vue-transform-on/-/babel-helper-vue-transform-on-1.2.2.tgz -> @vue-babel-helper-vue-transform-on-1.2.2.tgz
	https://registry.yarnpkg.com/@vue/babel-plugin-jsx/-/babel-plugin-jsx-1.2.2.tgz -> @vue-babel-plugin-jsx-1.2.2.tgz
	https://registry.yarnpkg.com/@vue/babel-plugin-resolve-type/-/babel-plugin-resolve-type-1.2.2.tgz -> @vue-babel-plugin-resolve-type-1.2.2.tgz
	https://registry.yarnpkg.com/@vue/compiler-core/-/compiler-core-3.2.47.tgz -> @vue-compiler-core-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/compiler-core/-/compiler-core-3.4.27.tgz -> @vue-compiler-core-3.4.27.tgz
	https://registry.yarnpkg.com/@vue/compiler-dom/-/compiler-dom-3.2.47.tgz -> @vue-compiler-dom-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/compiler-dom/-/compiler-dom-3.4.27.tgz -> @vue-compiler-dom-3.4.27.tgz
	https://registry.yarnpkg.com/@vue/compiler-sfc/-/compiler-sfc-3.2.47.tgz -> @vue-compiler-sfc-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/compiler-sfc/-/compiler-sfc-3.4.27.tgz -> @vue-compiler-sfc-3.4.27.tgz
	https://registry.yarnpkg.com/@vue/compiler-ssr/-/compiler-ssr-3.2.47.tgz -> @vue-compiler-ssr-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/compiler-ssr/-/compiler-ssr-3.4.27.tgz -> @vue-compiler-ssr-3.4.27.tgz
	https://registry.yarnpkg.com/vue-demi/-/vue-demi-0.11.2.tgz
	https://registry.yarnpkg.com/@vue/devtools-api/-/devtools-api-6.6.1.tgz -> @vue-devtools-api-6.6.1.tgz
	https://registry.yarnpkg.com/vue-eslint-parser/-/vue-eslint-parser-7.11.0.tgz
	https://registry.yarnpkg.com/vue-i18n/-/vue-i18n-9.13.1.tgz
	https://registry.yarnpkg.com/@vue/language-core/-/language-core-2.0.19.tgz -> @vue-language-core-2.0.19.tgz
	https://registry.yarnpkg.com/@vue/reactivity/-/reactivity-3.2.47.tgz -> @vue-reactivity-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/reactivity-transform/-/reactivity-transform-3.2.47.tgz -> @vue-reactivity-transform-3.2.47.tgz
	https://registry.yarnpkg.com/vue-resize/-/vue-resize-2.0.0-alpha.1.tgz
	https://registry.yarnpkg.com/vue-router/-/vue-router-4.0.11.tgz
	https://registry.yarnpkg.com/@vue/runtime-core/-/runtime-core-3.2.47.tgz -> @vue-runtime-core-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/runtime-dom/-/runtime-dom-3.2.47.tgz -> @vue-runtime-dom-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/server-renderer/-/server-renderer-3.2.47.tgz -> @vue-server-renderer-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/shared/-/shared-3.2.47.tgz -> @vue-shared-3.2.47.tgz
	https://registry.yarnpkg.com/@vue/shared/-/shared-3.4.27.tgz -> @vue-shared-3.4.27.tgz
	https://registry.yarnpkg.com/vue-template-compiler/-/vue-template-compiler-2.6.12.tgz
	https://registry.yarnpkg.com/vue-toastification/-/vue-toastification-2.0.0-rc.1.tgz
	https://registry.yarnpkg.com/vue-tsc/-/vue-tsc-2.0.19.tgz
	https://registry.yarnpkg.com/@vueuse/core/-/core-7.7.1.tgz -> @vueuse-core-7.7.1.tgz
	https://registry.yarnpkg.com/@vueuse/shared/-/shared-7.7.1.tgz -> @vueuse-shared-7.7.1.tgz
	https://registry.yarnpkg.com/vue/-/vue-3.2.47.tgz
	https://registry.yarnpkg.com/vuex/-/vuex-4.0.0.tgz
	https://registry.yarnpkg.com/w3c-xmlserializer/-/w3c-xmlserializer-5.0.0.tgz
	https://registry.yarnpkg.com/warning/-/warning-4.0.3.tgz
	https://registry.yarnpkg.com/watchpack-chokidar2/-/watchpack-chokidar2-2.0.1.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-1.7.5.tgz
	https://registry.yarnpkg.com/wbuf/-/wbuf-1.7.3.tgz
	https://registry.yarnpkg.com/wcwidth/-/wcwidth-1.0.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.11.1.tgz -> @webassemblyjs-ast-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.9.0.tgz -> @webassemblyjs-ast-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.11.1.tgz -> @webassemblyjs-floating-point-hex-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz -> @webassemblyjs-floating-point-hex-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.11.1.tgz -> @webassemblyjs-helper-api-error-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz -> @webassemblyjs-helper-api-error-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.11.1.tgz -> @webassemblyjs-helper-buffer-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz -> @webassemblyjs-helper-buffer-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz -> @webassemblyjs-helper-code-frame-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz -> @webassemblyjs-helper-fsm-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz -> @webassemblyjs-helper-module-context-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.11.1.tgz -> @webassemblyjs-helper-numbers-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.11.1.tgz -> @webassemblyjs-helper-wasm-bytecode-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz -> @webassemblyjs-helper-wasm-bytecode-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.11.1.tgz -> @webassemblyjs-helper-wasm-section-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz -> @webassemblyjs-helper-wasm-section-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.11.1.tgz -> @webassemblyjs-ieee754-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz -> @webassemblyjs-ieee754-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.11.1.tgz -> @webassemblyjs-leb128-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.9.0.tgz -> @webassemblyjs-leb128-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.11.1.tgz -> @webassemblyjs-utf8-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.9.0.tgz -> @webassemblyjs-utf8-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.11.1.tgz -> @webassemblyjs-wasm-edit-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz -> @webassemblyjs-wasm-edit-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.11.1.tgz -> @webassemblyjs-wasm-gen-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz -> @webassemblyjs-wasm-gen-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.11.1.tgz -> @webassemblyjs-wasm-opt-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz -> @webassemblyjs-wasm-opt-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.11.1.tgz -> @webassemblyjs-wasm-parser-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz -> @webassemblyjs-wasm-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz -> @webassemblyjs-wast-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.11.1.tgz -> @webassemblyjs-wast-printer-1.11.1.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz -> @webassemblyjs-wast-printer-1.9.0.tgz
	https://registry.yarnpkg.com/webextension-polyfill/-/webextension-polyfill-0.4.0.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-4.0.2.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-7.0.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-2.1.1.tgz -> @webpack-cli-configtest-2.1.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-2.0.2.tgz -> @webpack-cli-info-2.0.2.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-2.0.5.tgz -> @webpack-cli-serve-2.0.5.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-5.1.4.tgz
	https://registry.yarnpkg.com/webpack-livereload-plugin/-/webpack-livereload-plugin-3.0.2.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-5.9.0.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-1.4.3.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.2.3.tgz
	https://registry.yarnpkg.com/webpack-virtual-modules/-/webpack-virtual-modules-0.5.0.tgz
	https://registry.yarnpkg.com/webpack-virtual-modules/-/webpack-virtual-modules-0.6.2.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-4.46.0.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.70.0.tgz
	https://registry.yarnpkg.com/websocket-driver/-/websocket-driver-0.7.4.tgz
	https://registry.yarnpkg.com/websocket-extensions/-/websocket-extensions-0.1.4.tgz
	https://registry.yarnpkg.com/whatwg-encoding/-/whatwg-encoding-3.1.1.tgz
	https://registry.yarnpkg.com/whatwg-fetch/-/whatwg-fetch-3.6.2.tgz
	https://registry.yarnpkg.com/whatwg-mimetype/-/whatwg-mimetype-4.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-14.1.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-7.1.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-collection/-/which-collection-1.0.1.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-1.0.0.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-2.0.0.tgz
	https://registry.yarnpkg.com/which-pm-runs/-/which-pm-runs-1.0.0.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-5.0.0.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.3.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.5.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-3.1.0.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-4.0.1.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.0.tgz
	https://registry.yarnpkg.com/window-size/-/window-size-0.1.0.tgz
	https://registry.yarnpkg.com/win-version-info/-/win-version-info-5.0.1.tgz
	https://registry.yarnpkg.com/wonka/-/wonka-4.0.15.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-0.0.2.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-0.0.3.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-1.0.0.tgz
	https://registry.yarnpkg.com/worker-farm/-/worker-farm-1.7.0.tgz
	https://registry.yarnpkg.com/worker-nodes/-/worker-nodes-2.4.0.tgz
	https://registry.yarnpkg.com/workerpool/-/workerpool-6.1.0.tgz
	https://registry.yarnpkg.com/workerpool/-/workerpool-6.2.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-2.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-5.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-6.2.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-2.4.3.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-5.0.1.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-6.0.0.tgz
	https://registry.yarnpkg.com/write-json-file/-/write-json-file-3.2.0.tgz
	https://registry.yarnpkg.com/write-pkg/-/write-pkg-4.0.0.tgz
	https://registry.yarnpkg.com/ws/-/ws-3.3.3.tgz
	https://registry.yarnpkg.com/ws/-/ws-5.2.4.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.4.5.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.5.7.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.11.0.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.14.1.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.2.2.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-2.0.0.tgz
	https://registry.yarnpkg.com/xdg-trashdir/-/xdg-trashdir-2.1.1.tgz
	https://registry.yarnpkg.com/xhr/-/xhr-2.6.0.tgz
	https://registry.yarnpkg.com/xml2js/-/xml2js-0.4.23.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-11.0.1.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/xmlchars/-/xmlchars-2.2.0.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.8.10.tgz -> @xmldom-xmldom-0.8.10.tgz
	https://registry.yarnpkg.com/xmlhttprequest-ssl/-/xmlhttprequest-ssl-1.6.3.tgz
	https://registry.yarnpkg.com/xml-name-validator/-/xml-name-validator-5.0.0.tgz
	https://registry.yarnpkg.com/xml-parse-from-string/-/xml-parse-from-string-1.0.1.tgz
	https://registry.yarnpkg.com/xml/-/xml-1.0.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-2.0.6.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-2.1.2.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-2.2.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-3.0.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/xvfb-maybe/-/xvfb-maybe-0.2.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-3.2.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.5.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-2.1.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-5.0.0.tgz
	https://registry.yarnpkg.com/yaml-ast-parser/-/yaml-ast-parser-0.0.43.tgz
	https://registry.yarnpkg.com/yaml-eslint-parser/-/yaml-eslint-parser-1.2.2.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-1.10.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.1.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-18.1.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.4.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.9.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-5.0.0-security.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-8.1.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-9.0.2.tgz
	https://registry.yarnpkg.com/yargs-unparser/-/yargs-unparser-1.6.0.tgz
	https://registry.yarnpkg.com/yargs-unparser/-/yargs-unparser-2.0.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-10.1.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-11.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-13.3.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-13.3.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-15.4.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-16.2.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-3.10.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-7.1.1.tgz
	https://registry.yarnpkg.com/yarn-deduplicate/-/yarn-deduplicate-3.1.0.tgz
	https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.1.0.tgz -> @yarnpkg-lockfile-1.1.0.tgz
	https://registry.yarnpkg.com/@yarnpkg/parsers/-/parsers-3.0.2.tgz -> @yarnpkg-parsers-3.0.2.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yeast/-/yeast-0.1.2.tgz
	https://registry.yarnpkg.com/yn/-/yn-3.1.1.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-1.0.0.tgz
	https://registry.yarnpkg.com/@zeit/schemas/-/schemas-2.36.0.tgz -> @zeit-schemas-2.36.0.tgz
	https://registry.yarnpkg.com/@zkochan/js-yaml/-/js-yaml-0.0.7.tgz -> @zkochan-js-yaml-0.0.7.tgz
	https://registry.yarnpkg.com/zod/-/zod-3.22.5.tgz
	https://registry.yarnpkg.com/zone.js/-/zone.js-0.14.6.tgz
	https://registry.yarnpkg.com/zone.js/-/zone.js-0.9.0.tgz
) "

REPO="https://github.com/cypress-io/cypress"
#CODE_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="electron-27 electron-28 electron-29 electron-30 electron-31 electron-32 electron-34 electron-35"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	IUSE+=" +build-online"
	ELECTRON_SLOT_DEFAULT="33"
else
	IUSE+=" build-online"
	ELECTRON_SLOT_DEFAULT="33"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
	DOWNLOAD="${REPO}/archive/"
	if [ -z "$CODE_COMMIT_ID" ]; then
		DOWNLOAD+="v${PV}.tar.gz -> ${P}.tar.gz"
	else
		DOWNLOAD+="${CODE_COMMIT_ID}.tar.gz -> ${PN}-${CODE_COMMIT_ID}.tar.gz"
		S="${WORKDIR}/${PN}-${CODE_COMMIT_ID}"
	fi
fi

SRC_URI+="${DOWNLOAD}"

RESTRICT="mirror build-online? ( network-sandbox )"

REQUIRED_USE=""

COMMON_DEPEND="
	>=app-crypt/libsecret-0.18.8:=
	>=x11-libs/libX11-1.6.9:=
	>=x11-libs/libxkbfile-1.1.0:=
	virtual/krb5
	sys-apps/ripgrep
	electron-27? ( dev-util/electron:27 )
	electron-28? ( dev-util/electron:28 )
	electron-29? ( dev-util/electron:29 )
	electron-30? ( dev-util/electron:30 )
	electron-31? ( dev-util/electron:31 )
	electron-32? ( dev-util/electron:32 )
	electron-34? ( dev-util/electron:34 )
	electron-35? ( dev-util/electron:35 )
	!electron-27? (
	!electron-28? (
	!electron-29? (
	!electron-30? (
	!electron-31? (
	!electron-32? (
	!electron-34? (
	!electron-35? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) ) )
"


RDEPEND="${COMMON_DEPEND}
"

DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
	sys-apps/yarn
"

python_check_deps() {
        python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

src_unpack() {
	if use electron-27; then
		export ELECTRON_SLOT=27
	elif use electron-28; then
		export ELECTRON_SLOT=28
	elif use electron-29; then
		export ELECTRON_SLOT=29
	elif use electron-30; then
		export ELECTRON_SLOT=30
	elif use electron-31; then
		export ELECTRON_SLOT=31
	elif use electron-32; then
		export ELECTRON_SLOT=32
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
			# if use electron-29 || use electron-30; then
			# 	EGIT_BRANCH="electron-29.x.y"
			# fi
			git-r3_src_unpack
		fi
	else
		unpack "${PN}-${CODE_COMMIT_ID}.tar.gz" || die
	fi
}

src_prepare() {
	default
	sed -i 's$"resolutions": {$"resolutions": {"@electron/node-gyp": "10.2.0-electron.1",$' package.json || die;
}

src_configure() {

	local myarch="$(tc-arch)"

	if [[ $myarch = amd64 ]]; then
		VSCODE_ARCH="x64"
	elif [[ $myarch = x86 ]]; then
		VSCODE_ARCH="ia32"
	elif [[ $myarch = arm64 ]]; then
		VSCODE_ARCH="arm64"
	elif [[ $myarch = arm ]]; then
		VSCODE_ARCH="armhf"
	elif [[ $myarch = ppc64 ]]; then
		VSCODE_ARCH="ppc64"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi
	#TODO: exported but unavailable if emerge/ebuild restarted
	export VSCODE_ARCH

	# #TODO: should work starting with electron-22
	# if use electron-20 || use electron-21 || use electron-23 || use electron-24; then
	# 	CPPFLAGS="${CPPFLAGS} -std=c++17";
	# 	use build-online || eerror "build-online should be enabled for nan substitution to work" || die;
	# 	sed -i 's$"resolutions": {$"resolutions": {"nan": "^2.17.0",$' package.json || die;
	# fi

	# #TODO: temp fix
	# if use electron-32 || use electron-33 || use electron-34 || use electron-35; then
	# 	# CPPFLAGS="${CPPFLAGS} -std=c++20";
	# 	use build-online || eerror "build-online should be enabled for node-addon-api substitution to work" || die;
	# 	sed -i 's$"resolutions": {$"resolutions": {"node-addon-api": "^7.1.0",$' package.json || die;
	# fi

	# if use build-online; then
	# 	sed -i 's$"dependencies":$"resolutions": {"nan": "^2.18.0"},"dependencies":$' package.json || die;
	# else
	# 	ewarn "If have enabled electron-28/29 and the build fails, try enabling build-online"
	# fi

	ebegin "Installing node_modules"
	# yarn config set yarn-offline-mirror ${T}/yarn_cache || die
	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_SLOT}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
	# echo "$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	if ! use build-online; then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	yarn install --frozen-lockfile ${ONLINE_OFFLINE} \
		--arch=${VSCODE_ARCH} --no-progress || die
	# --ignore-optional
	# --ignore-engines
	# --production=true
	# --no-progress
	# --skip-integrity-check
	# --verbose

	export PATH=${OLD_PATH}
}

# src_compile() {
# }

src_install() {
	OLD_PATH=$PATH
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin/node-gyp-bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/node_modules/npm/bin:$PATH"
	PATH="/usr/$(get_libdir)/electron-${ELECTRON_SLOT}:$PATH"
	export PATH

	local CYPRESS_HOME="/usr/$(get_libdir)/cypress"

	exeinto "${CYPRESS_HOME}"
	sed -i '/^ELECTRON/,+3d' "${WORKDIR}"/V*/bin/code-oss || die

	awk -i inplace -v text="$(cat ${FILESDIR}/read_flags_file)" '!/^#/ && !p {print text; p=1} 1' "${WORKDIR}"/V*/bin/code-oss
	sed -i "s|@ELECTRON@|code-oss|" "${WORKDIR}"/V*/bin/code-oss

	echo "VSCODE_PATH=\"/usr/$(get_libdir)/vscode\"
	ELECTRON_PATH=\"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}\"
	CLI=\"\${VSCODE_PATH}/out/cli.js\"
	exec /usr/bin/env ELECTRON_RUN_AS_NODE=1 \
	NPM_CONFIG_NODEDIR=\"\${ELECTRON_PATH}/node/\" \
	\"\${ELECTRON_PATH}/electron\" \"\${CLI}\" --app=\"\${VSCODE_PATH}\" \"\${flags[@]}\" \"\$@\"" >> "${WORKDIR}"/V*/bin/code-oss
	doexe "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/bin/code-oss
	dosym "${CYPRESS_HOME}/code-oss" /usr/bin/code-oss

	insinto "${CYPRESS_HOME}"
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/extensions
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/out
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/resources
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/*.json
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar.unpacked
	fperms +x ${CYPRESS_HOME}/out/vs/base/node/cpuUsage.sh
	# fperms +x ${CYPRESS_HOME}/node_modules.asar.unpacked/node-pty/build/Release/spawn-helper

	if use reh; then
		tar cf vscode-server-linux-x64.tar.gz -C "${WORKDIR}/vscode-reh-linux-x64/" .
		doins vscode-server-linux-x64.tar.gz
	fi
	if use reh-web; then
		tar cf vscode-server-linux-x64-web.tar.gz -C "${WORKDIR}/vscode-reh-web-linux-x64/" .
		doins vscode-server-linux-x64-web.tar.gz
	fi

	pushd .build/linux/deb/*/code-oss-*/usr/share/ > /dev/null || die

	insinto /usr/share/
	sed -i 's$x-scheme-handler/code-oss$x-scheme-handler/code-oss;x-scheme-handler/vscode$' \
		applications/*handler.desktop || die
	sed -i 's$/usr/share/code-oss/code-oss$/usr/bin/code-oss$' applications/*.desktop || die
	doins -r applications bash-completion pixmaps zsh

	insinto /usr/share/metainfo/
	doins appdata/*

	popd > /dev/null || die
	export PATH=${OLD_PATH}
}


pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
