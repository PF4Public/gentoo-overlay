# Copyright 2009-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

inherit desktop flag-o-matic multilib python-any-r1 xdg-utils

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.2.0.tgz
	https://registry.yarnpkg.com/@action-validator/cli/-/cli-0.6.0.tgz -> @action-validator-cli-0.6.0.tgz
	https://registry.yarnpkg.com/@action-validator/core/-/core-0.6.0.tgz -> @action-validator-core-0.6.0.tgz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.3.0.tgz -> @ampproject-remapping-2.3.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.24.7.tgz -> @babel-code-frame-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.26.2.tgz -> @babel-code-frame-7.26.2.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.26.8.tgz -> @babel-compat-data-7.26.8.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.26.9.tgz -> @babel-core-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.25.4.tgz -> @babel-generator-7.25.4.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.26.9.tgz -> @babel-generator-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.25.9.tgz -> @babel-helper-annotate-as-pure-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.26.5.tgz -> @babel-helper-compilation-targets-7.26.5.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.26.9.tgz -> @babel-helper-create-class-features-plugin-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.26.3.tgz -> @babel-helper-create-regexp-features-plugin-7.26.3.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.6.3.tgz -> @babel-helper-define-polyfill-provider-0.6.3.tgz
	https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.24.7.tgz -> @babel-helper-environment-visitor-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.24.7.tgz -> @babel-helper-function-name-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.24.7.tgz -> @babel-helper-hoist-variables-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.25.9.tgz -> @babel-helper-member-expression-to-functions-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.25.9.tgz -> @babel-helper-module-imports-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.26.0.tgz -> @babel-helper-module-transforms-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.25.9.tgz -> @babel-helper-optimise-call-expression-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.26.5.tgz -> @babel-helper-plugin-utils-7.26.5.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.25.9.tgz -> @babel-helper-remap-async-to-generator-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.26.5.tgz -> @babel-helper-replace-supers-7.26.5.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.25.9.tgz -> @babel-helper-simple-access-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.25.9.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.24.7.tgz -> @babel-helper-split-export-declaration-7.24.7.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.25.7.tgz -> @babel-helper-string-parser-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.25.9.tgz -> @babel-helper-string-parser-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.25.9.tgz -> @babel-helper-validator-identifier-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.25.9.tgz -> @babel-helper-validator-option-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.25.9.tgz -> @babel-helper-wrap-function-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.26.9.tgz -> @babel-helpers-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.25.9.tgz -> @babel-highlight-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.24.8.tgz -> @babel-parser-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.25.4.tgz -> @babel-parser-7.25.4.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.26.9.tgz -> @babel-parser-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-firefox-class-in-computed-class-key/-/plugin-bugfix-firefox-class-in-computed-class-key-7.25.9.tgz -> @babel-plugin-bugfix-firefox-class-in-computed-class-key-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-class-field-initializer-scope/-/plugin-bugfix-safari-class-field-initializer-scope-7.25.9.tgz -> @babel-plugin-bugfix-safari-class-field-initializer-scope-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.25.9.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.25.9.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-static-class-fields-redefine-readonly/-/plugin-bugfix-v8-static-class-fields-redefine-readonly-7.25.9.tgz -> @babel-plugin-bugfix-v8-static-class-fields-redefine-readonly-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz -> @babel-plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-assertions/-/plugin-syntax-import-assertions-7.26.0.tgz -> @babel-plugin-syntax-import-assertions-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.26.0.tgz -> @babel-plugin-syntax-import-attributes-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.25.9.tgz -> @babel-plugin-syntax-jsx-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.25.9.tgz -> @babel-plugin-syntax-typescript-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-unicode-sets-regex/-/plugin-syntax-unicode-sets-regex-7.18.6.tgz -> @babel-plugin-syntax-unicode-sets-regex-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.25.9.tgz -> @babel-plugin-transform-arrow-functions-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-generator-functions/-/plugin-transform-async-generator-functions-7.26.8.tgz -> @babel-plugin-transform-async-generator-functions-7.26.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.25.9.tgz -> @babel-plugin-transform-async-to-generator-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.26.5.tgz -> @babel-plugin-transform-block-scoped-functions-7.26.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.25.9.tgz -> @babel-plugin-transform-block-scoping-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-properties/-/plugin-transform-class-properties-7.25.9.tgz -> @babel-plugin-transform-class-properties-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-static-block/-/plugin-transform-class-static-block-7.26.0.tgz -> @babel-plugin-transform-class-static-block-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.25.9.tgz -> @babel-plugin-transform-classes-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.25.9.tgz -> @babel-plugin-transform-computed-properties-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.25.9.tgz -> @babel-plugin-transform-destructuring-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.25.9.tgz -> @babel-plugin-transform-dotall-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.25.9.tgz -> @babel-plugin-transform-duplicate-keys-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-named-capturing-groups-regex/-/plugin-transform-duplicate-named-capturing-groups-regex-7.25.9.tgz -> @babel-plugin-transform-duplicate-named-capturing-groups-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dynamic-import/-/plugin-transform-dynamic-import-7.25.9.tgz -> @babel-plugin-transform-dynamic-import-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.26.3.tgz -> @babel-plugin-transform-exponentiation-operator-7.26.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-export-namespace-from/-/plugin-transform-export-namespace-from-7.25.9.tgz -> @babel-plugin-transform-export-namespace-from-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.26.9.tgz -> @babel-plugin-transform-for-of-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.25.9.tgz -> @babel-plugin-transform-function-name-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-json-strings/-/plugin-transform-json-strings-7.25.9.tgz -> @babel-plugin-transform-json-strings-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.25.9.tgz -> @babel-plugin-transform-literals-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-logical-assignment-operators/-/plugin-transform-logical-assignment-operators-7.25.9.tgz -> @babel-plugin-transform-logical-assignment-operators-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.25.9.tgz -> @babel-plugin-transform-member-expression-literals-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.25.9.tgz -> @babel-plugin-transform-modules-amd-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.25.9.tgz -> @babel-plugin-transform-modules-commonjs-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.26.3.tgz -> @babel-plugin-transform-modules-commonjs-7.26.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.25.9.tgz -> @babel-plugin-transform-modules-systemjs-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.25.9.tgz -> @babel-plugin-transform-modules-umd-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.25.9.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.25.9.tgz -> @babel-plugin-transform-new-target-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-nullish-coalescing-operator/-/plugin-transform-nullish-coalescing-operator-7.26.6.tgz -> @babel-plugin-transform-nullish-coalescing-operator-7.26.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-numeric-separator/-/plugin-transform-numeric-separator-7.25.9.tgz -> @babel-plugin-transform-numeric-separator-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-rest-spread/-/plugin-transform-object-rest-spread-7.25.9.tgz -> @babel-plugin-transform-object-rest-spread-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.25.9.tgz -> @babel-plugin-transform-object-super-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-catch-binding/-/plugin-transform-optional-catch-binding-7.25.9.tgz -> @babel-plugin-transform-optional-catch-binding-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-chaining/-/plugin-transform-optional-chaining-7.25.9.tgz -> @babel-plugin-transform-optional-chaining-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.25.9.tgz -> @babel-plugin-transform-parameters-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-methods/-/plugin-transform-private-methods-7.25.9.tgz -> @babel-plugin-transform-private-methods-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-property-in-object/-/plugin-transform-private-property-in-object-7.25.9.tgz -> @babel-plugin-transform-private-property-in-object-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.25.9.tgz -> @babel-plugin-transform-property-literals-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.25.9.tgz -> @babel-plugin-transform-regenerator-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regexp-modifiers/-/plugin-transform-regexp-modifiers-7.26.0.tgz -> @babel-plugin-transform-regexp-modifiers-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.25.9.tgz -> @babel-plugin-transform-reserved-words-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.25.9.tgz -> @babel-plugin-transform-shorthand-properties-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.25.9.tgz -> @babel-plugin-transform-spread-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.25.9.tgz -> @babel-plugin-transform-sticky-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.26.8.tgz -> @babel-plugin-transform-template-literals-7.26.8.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.26.7.tgz -> @babel-plugin-transform-typeof-symbol-7.26.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.25.9.tgz -> @babel-plugin-transform-typescript-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.25.9.tgz -> @babel-plugin-transform-unicode-escapes-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-property-regex/-/plugin-transform-unicode-property-regex-7.25.9.tgz -> @babel-plugin-transform-unicode-property-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.25.9.tgz -> @babel-plugin-transform-unicode-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-sets-regex/-/plugin-transform-unicode-sets-regex-7.25.9.tgz -> @babel-plugin-transform-unicode-sets-regex-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.26.9.tgz -> @babel-preset-env-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.6-no-external-plugins.tgz -> @babel-preset-modules-0.1.6-no-external-plugins.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.26.0.tgz -> @babel-preset-typescript-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.26.9.tgz -> @babel-runtime-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.25.0.tgz -> @babel-template-7.25.0.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.26.9.tgz -> @babel-template-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.24.8.tgz -> @babel-traverse-7.24.8.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.26.9.tgz -> @babel-traverse-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.25.4.tgz -> @babel-types-7.25.4.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.25.8.tgz -> @babel-types-7.25.8.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.26.9.tgz -> @babel-types-7.26.9.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.2.18.tgz -> @electron-asar-3.2.18.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.3.1.tgz -> @electron-asar-3.3.1.tgz
	https://registry.yarnpkg.com/@electron/fuses/-/fuses-1.8.0.tgz -> @electron-fuses-1.8.0.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-2.0.3.tgz -> @electron-get-2.0.3.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-2.5.0.tgz -> @electron-notarize-2.5.0.tgz
	https://registry.yarnpkg.com/@electron/osx-sign/-/osx-sign-1.3.1.tgz -> @electron-osx-sign-1.3.1.tgz
	https://registry.yarnpkg.com/@electron/rebuild/-/rebuild-3.7.0.tgz -> @electron-rebuild-3.7.0.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-2.0.1.tgz -> @electron-universal-2.0.1.tgz
	https://registry.yarnpkg.com/@electron/windows-sign/-/windows-sign-1.2.1.tgz -> @electron-windows-sign-1.2.1.tgz
	https://registry.yarnpkg.com/@esbuild/aix-ppc64/-/aix-ppc64-0.25.0.tgz -> @esbuild-aix-ppc64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm/-/android-arm-0.25.0.tgz -> @esbuild-android-arm-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm64/-/android-arm64-0.25.0.tgz -> @esbuild-android-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/android-x64/-/android-x64-0.25.0.tgz -> @esbuild-android-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-arm64/-/darwin-arm64-0.25.0.tgz -> @esbuild-darwin-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-x64/-/darwin-x64-0.25.0.tgz -> @esbuild-darwin-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-arm64/-/freebsd-arm64-0.25.0.tgz -> @esbuild-freebsd-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-x64/-/freebsd-x64-0.25.0.tgz -> @esbuild-freebsd-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm/-/linux-arm-0.25.0.tgz -> @esbuild-linux-arm-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm64/-/linux-arm64-0.25.0.tgz -> @esbuild-linux-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ia32/-/linux-ia32-0.25.0.tgz -> @esbuild-linux-ia32-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.25.0.tgz -> @esbuild-linux-loong64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-mips64el/-/linux-mips64el-0.25.0.tgz -> @esbuild-linux-mips64el-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ppc64/-/linux-ppc64-0.25.0.tgz -> @esbuild-linux-ppc64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-riscv64/-/linux-riscv64-0.25.0.tgz -> @esbuild-linux-riscv64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-s390x/-/linux-s390x-0.25.0.tgz -> @esbuild-linux-s390x-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/linux-x64/-/linux-x64-0.25.0.tgz -> @esbuild-linux-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-arm64/-/netbsd-arm64-0.25.0.tgz -> @esbuild-netbsd-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-x64/-/netbsd-x64-0.25.0.tgz -> @esbuild-netbsd-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-arm64/-/openbsd-arm64-0.25.0.tgz -> @esbuild-openbsd-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-x64/-/openbsd-x64-0.25.0.tgz -> @esbuild-openbsd-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/sunos-x64/-/sunos-x64-0.25.0.tgz -> @esbuild-sunos-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/win32-arm64/-/win32-arm64-0.25.0.tgz -> @esbuild-win32-arm64-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/win32-ia32/-/win32-ia32-0.25.0.tgz -> @esbuild-win32-ia32-0.25.0.tgz
	https://registry.yarnpkg.com/@esbuild/win32-x64/-/win32-x64-0.25.0.tgz -> @esbuild-win32-x64-0.25.0.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.1.tgz -> @eslint-community-eslint-utils-4.4.1.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.11.1.tgz -> @eslint-community-regexpp-4.11.1.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.12.1.tgz -> @eslint-community-regexpp-4.12.1.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.4.tgz -> @eslint-eslintrc-2.1.4.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.57.1.tgz -> @eslint-js-8.57.1.tgz
	https://registry.yarnpkg.com/@gar/promisify/-/promisify-1.1.3.tgz -> @gar-promisify-1.1.3.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.13.0.tgz -> @humanwhocodes-config-array-0.13.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-2.0.3.tgz -> @humanwhocodes-object-schema-2.0.3.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@isaacs/fs-minipass/-/fs-minipass-4.0.1.tgz -> @isaacs-fs-minipass-4.0.1.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.8.tgz -> @jridgewell-gen-mapping-0.3.8.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> @jridgewell-resolve-uri-3.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.2.1.tgz -> @jridgewell-set-array-1.2.1.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.0.tgz -> @jridgewell-sourcemap-codec-1.5.0.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.25.tgz -> @jridgewell-trace-mapping-0.3.25.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-2.0.0.tgz -> @malept-cross-spawn-promise-2.0.0.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-4.0.1.tgz -> @nodelib-fs.scandir-4.0.1.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-4.0.0.tgz -> @nodelib-fs.stat-4.0.0.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-3.0.1.tgz -> @nodelib-fs.walk-3.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/agent/-/agent-2.2.2.tgz -> @npmcli-agent-2.2.2.tgz
	https://registry.yarnpkg.com/@npmcli/agent/-/agent-3.0.0.tgz -> @npmcli-agent-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-2.1.2.tgz -> @npmcli-fs-2.1.2.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-3.1.1.tgz -> @npmcli-fs-3.1.1.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-4.0.0.tgz -> @npmcli-fs-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-5.0.8.tgz -> @npmcli-git-5.0.8.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-6.0.0.tgz -> @npmcli-git-6.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/installed-package-contents/-/installed-package-contents-3.0.0.tgz -> @npmcli-installed-package-contents-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/move-file/-/move-file-2.0.1.tgz -> @npmcli-move-file-2.0.1.tgz
	https://registry.yarnpkg.com/@npmcli/node-gyp/-/node-gyp-4.0.0.tgz -> @npmcli-node-gyp-4.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/package-json/-/package-json-5.2.0.tgz -> @npmcli-package-json-5.2.0.tgz
	https://registry.yarnpkg.com/@npmcli/package-json/-/package-json-6.0.0.tgz -> @npmcli-package-json-6.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-7.0.2.tgz -> @npmcli-promise-spawn-7.0.2.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-8.0.0.tgz -> @npmcli-promise-spawn-8.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/redact/-/redact-3.0.0.tgz -> @npmcli-redact-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/run-script/-/run-script-9.0.0.tgz -> @npmcli-run-script-9.0.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/api-logs/-/api-logs-0.56.0.tgz -> @opentelemetry-api-logs-0.56.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/api-logs/-/api-logs-0.57.1.tgz -> @opentelemetry-api-logs-0.57.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/api-logs/-/api-logs-0.57.2.tgz -> @opentelemetry-api-logs-0.57.2.tgz
	https://registry.yarnpkg.com/@opentelemetry/api/-/api-1.9.0.tgz -> @opentelemetry-api-1.9.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/context-async-hooks/-/context-async-hooks-1.30.1.tgz -> @opentelemetry-context-async-hooks-1.30.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/core/-/core-1.30.1.tgz -> @opentelemetry-core-1.30.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-amqplib/-/instrumentation-amqplib-0.46.1.tgz -> @opentelemetry-instrumentation-amqplib-0.46.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-connect/-/instrumentation-connect-0.43.0.tgz -> @opentelemetry-instrumentation-connect-0.43.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-dataloader/-/instrumentation-dataloader-0.16.0.tgz -> @opentelemetry-instrumentation-dataloader-0.16.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-express/-/instrumentation-express-0.47.0.tgz -> @opentelemetry-instrumentation-express-0.47.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-fastify/-/instrumentation-fastify-0.44.1.tgz -> @opentelemetry-instrumentation-fastify-0.44.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-fs/-/instrumentation-fs-0.19.0.tgz -> @opentelemetry-instrumentation-fs-0.19.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-generic-pool/-/instrumentation-generic-pool-0.43.0.tgz -> @opentelemetry-instrumentation-generic-pool-0.43.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-graphql/-/instrumentation-graphql-0.47.0.tgz -> @opentelemetry-instrumentation-graphql-0.47.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-hapi/-/instrumentation-hapi-0.45.1.tgz -> @opentelemetry-instrumentation-hapi-0.45.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-http/-/instrumentation-http-0.57.1.tgz -> @opentelemetry-instrumentation-http-0.57.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-ioredis/-/instrumentation-ioredis-0.47.0.tgz -> @opentelemetry-instrumentation-ioredis-0.47.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-kafkajs/-/instrumentation-kafkajs-0.7.0.tgz -> @opentelemetry-instrumentation-kafkajs-0.7.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-knex/-/instrumentation-knex-0.44.0.tgz -> @opentelemetry-instrumentation-knex-0.44.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-koa/-/instrumentation-koa-0.47.0.tgz -> @opentelemetry-instrumentation-koa-0.47.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-lru-memoizer/-/instrumentation-lru-memoizer-0.44.0.tgz -> @opentelemetry-instrumentation-lru-memoizer-0.44.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-mongodb/-/instrumentation-mongodb-0.51.0.tgz -> @opentelemetry-instrumentation-mongodb-0.51.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-mongoose/-/instrumentation-mongoose-0.46.0.tgz -> @opentelemetry-instrumentation-mongoose-0.46.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-mysql/-/instrumentation-mysql-0.45.0.tgz -> @opentelemetry-instrumentation-mysql-0.45.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-mysql2/-/instrumentation-mysql2-0.45.0.tgz -> @opentelemetry-instrumentation-mysql2-0.45.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-pg/-/instrumentation-pg-0.51.0.tgz -> @opentelemetry-instrumentation-pg-0.51.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-redis-4/-/instrumentation-redis-4-0.46.0.tgz -> @opentelemetry-instrumentation-redis-4-0.46.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-tedious/-/instrumentation-tedious-0.18.0.tgz -> @opentelemetry-instrumentation-tedious-0.18.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation-undici/-/instrumentation-undici-0.10.0.tgz -> @opentelemetry-instrumentation-undici-0.10.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation/-/instrumentation-0.56.0.tgz -> @opentelemetry-instrumentation-0.56.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation/-/instrumentation-0.57.1.tgz -> @opentelemetry-instrumentation-0.57.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/instrumentation/-/instrumentation-0.57.2.tgz -> @opentelemetry-instrumentation-0.57.2.tgz
	https://registry.yarnpkg.com/@opentelemetry/redis-common/-/redis-common-0.36.2.tgz -> @opentelemetry-redis-common-0.36.2.tgz
	https://registry.yarnpkg.com/@opentelemetry/resources/-/resources-1.30.1.tgz -> @opentelemetry-resources-1.30.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/sdk-trace-base/-/sdk-trace-base-1.30.1.tgz -> @opentelemetry-sdk-trace-base-1.30.1.tgz
	https://registry.yarnpkg.com/@opentelemetry/semantic-conventions/-/semantic-conventions-1.28.0.tgz -> @opentelemetry-semantic-conventions-1.28.0.tgz
	https://registry.yarnpkg.com/@opentelemetry/sql-common/-/sql-common-0.40.1.tgz -> @opentelemetry-sql-common-0.40.1.tgz
	https://registry.yarnpkg.com/@pkgjs/parseargs/-/parseargs-0.11.0.tgz -> @pkgjs-parseargs-0.11.0.tgz
	https://registry.yarnpkg.com/@playwright/test/-/test-1.51.0.tgz -> @playwright-test-1.51.0.tgz
	https://registry.yarnpkg.com/@prisma/instrumentation/-/instrumentation-6.2.1.tgz -> @prisma-instrumentation-6.2.1.tgz
	https://registry.yarnpkg.com/@rtsao/scc/-/scc-1.1.0.tgz -> @rtsao-scc-1.1.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/browser-utils/-/browser-utils-9.1.0.tgz -> @sentry-internal-browser-utils-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/feedback/-/feedback-9.1.0.tgz -> @sentry-internal-feedback-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/replay-canvas/-/replay-canvas-9.1.0.tgz -> @sentry-internal-replay-canvas-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/replay/-/replay-9.1.0.tgz -> @sentry-internal-replay-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry/browser/-/browser-9.1.0.tgz -> @sentry-browser-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry/core/-/core-9.1.0.tgz -> @sentry-core-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry/electron/-/electron-6.1.0.tgz -> @sentry-electron-6.1.0.tgz
	https://registry.yarnpkg.com/@sentry/node/-/node-9.1.0.tgz -> @sentry-node-9.1.0.tgz
	https://registry.yarnpkg.com/@sentry/opentelemetry/-/opentelemetry-9.1.0.tgz -> @sentry-opentelemetry-9.1.0.tgz
	https://registry.yarnpkg.com/@sigstore/bundle/-/bundle-3.0.0.tgz -> @sigstore-bundle-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/core/-/core-2.0.0.tgz -> @sigstore-core-2.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/protobuf-specs/-/protobuf-specs-0.3.2.tgz -> @sigstore-protobuf-specs-0.3.2.tgz
	https://registry.yarnpkg.com/@sigstore/sign/-/sign-3.0.0.tgz -> @sigstore-sign-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/tuf/-/tuf-3.0.0.tgz -> @sigstore-tuf-3.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/verify/-/verify-2.0.0.tgz -> @sigstore-verify-2.0.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/@snyk/github-codeowners/-/github-codeowners-1.1.0.tgz -> @snyk-github-codeowners-1.1.0.tgz
	https://registry.yarnpkg.com/@standardnotes/electron-clear-data/-/electron-clear-data-1.1.1.tgz -> @standardnotes-electron-clear-data-1.1.1.tgz
	https://registry.yarnpkg.com/@stylistic/eslint-plugin/-/eslint-plugin-3.1.0.tgz -> @stylistic-eslint-plugin-3.1.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@tufjs/canonical-json/-/canonical-json-2.0.0.tgz -> @tufjs-canonical-json-2.0.0.tgz
	https://registry.yarnpkg.com/@tufjs/models/-/models-3.0.1.tgz -> @tufjs-models-3.0.1.tgz
	https://registry.yarnpkg.com/@types/auto-launch/-/auto-launch-5.0.5.tgz -> @types-auto-launch-5.0.5.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.3.tgz -> @types-cacheable-request-6.0.3.tgz
	https://registry.yarnpkg.com/@types/connect/-/connect-3.4.36.tgz -> @types-connect-3.4.36.tgz
	https://registry.yarnpkg.com/@types/counterpart/-/counterpart-0.18.4.tgz -> @types-counterpart-0.18.4.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.12.tgz -> @types-debug-4.1.12.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.4.tgz -> @types-http-cache-semantics-4.0.4.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.4.tgz -> @types-keyv-3.1.4.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.5.tgz -> @types-minimist-1.2.5.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-2.1.0.tgz -> @types-ms-2.1.0.tgz
	https://registry.yarnpkg.com/@types/mysql/-/mysql-2.15.26.tgz -> @types-mysql-2.15.26.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.6.11.tgz -> @types-node-fetch-2.6.11.tgz
	https://registry.yarnpkg.com/@types/node/-/node-18.19.79.tgz -> @types-node-18.19.79.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.4.tgz -> @types-normalize-package-data-2.4.4.tgz
	https://registry.yarnpkg.com/@types/npm-package-arg/-/npm-package-arg-6.1.4.tgz -> @types-npm-package-arg-6.1.4.tgz
	https://registry.yarnpkg.com/@types/npm-registry-fetch/-/npm-registry-fetch-8.0.7.tgz -> @types-npm-registry-fetch-8.0.7.tgz
	https://registry.yarnpkg.com/@types/npmlog/-/npmlog-7.0.0.tgz -> @types-npmlog-7.0.0.tgz
	https://registry.yarnpkg.com/@types/pacote/-/pacote-11.1.8.tgz -> @types-pacote-11.1.8.tgz
	https://registry.yarnpkg.com/@types/pg-pool/-/pg-pool-2.0.6.tgz -> @types-pg-pool-2.0.6.tgz
	https://registry.yarnpkg.com/@types/pg/-/pg-8.11.11.tgz -> @types-pg-8.11.11.tgz
	https://registry.yarnpkg.com/@types/pg/-/pg-8.6.1.tgz -> @types-pg-8.6.1.tgz
	https://registry.yarnpkg.com/@types/plist/-/plist-3.0.5.tgz -> @types-plist-3.0.5.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.3.tgz -> @types-responselike-1.0.3.tgz
	https://registry.yarnpkg.com/@types/shimmer/-/shimmer-1.2.0.tgz -> @types-shimmer-1.2.0.tgz
	https://registry.yarnpkg.com/@types/ssri/-/ssri-7.1.5.tgz -> @types-ssri-7.1.5.tgz
	https://registry.yarnpkg.com/@types/tedious/-/tedious-4.0.14.tgz -> @types-tedious-4.0.14.tgz
	https://registry.yarnpkg.com/@types/verror/-/verror-1.10.10.tgz -> @types-verror-1.10.10.tgz
	https://registry.yarnpkg.com/@types/yauzl/-/yauzl-2.10.3.tgz -> @types-yauzl-2.10.3.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.26.0.tgz -> @typescript-eslint-eslint-plugin-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-8.26.0.tgz -> @typescript-eslint-parser-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.24.1.tgz -> @typescript-eslint-scope-manager-8.24.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.26.0.tgz -> @typescript-eslint-scope-manager-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-8.26.0.tgz -> @typescript-eslint-type-utils-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.24.1.tgz -> @typescript-eslint-types-8.24.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.26.0.tgz -> @typescript-eslint-types-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.24.1.tgz -> @typescript-eslint-typescript-estree-8.24.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.26.0.tgz -> @typescript-eslint-typescript-estree-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.24.1.tgz -> @typescript-eslint-utils-8.24.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.26.0.tgz -> @typescript-eslint-utils-8.26.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.24.1.tgz -> @typescript-eslint-visitor-keys-8.24.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.26.0.tgz -> @typescript-eslint-visitor-keys-8.26.0.tgz
	https://registry.yarnpkg.com/@ungap/structured-clone/-/structured-clone-1.2.0.tgz -> @ungap-structured-clone-1.2.0.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.8.10.tgz -> @xmldom-xmldom-0.8.10.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-2.0.0.tgz
	https://registry.yarnpkg.com/acorn-import-attributes/-/acorn-import-attributes-1.9.5.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.12.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.14.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.1.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.3.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-4.6.0.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-3.0.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.17.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-7.0.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.1.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-5.0.0-alpha.12.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-26.0.11.tgz
	https://registry.yarnpkg.com/applescript/-/applescript-1.0.0.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.8.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.5.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.2.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.3.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.6.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/atomically/-/atomically-2.0.3.tgz
	https://registry.yarnpkg.com/auto-launch/-/auto-launch-5.0.6.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.4.12.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.11.1.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.6.3.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.3.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.24.4.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-9.3.1.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-26.0.11.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.3.0.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-16.1.3.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-18.0.4.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-19.0.1.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.4.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.1.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.7.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.8.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001700.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.2.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.4.1.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-4.0.3.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-3.0.0.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.9.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.1.0.tgz
	https://registry.yarnpkg.com/cjs-module-lexer/-/cjs-module-lexer-1.4.3.tgz
	https://registry.yarnpkg.com/clean-regexp/-/clean-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-5.0.0.tgz
	https://registry.yarnpkg.com/cli-spinners/-/cli-spinners-2.9.2.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-4.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.3.tgz
	https://registry.yarnpkg.com/clone/-/clone-1.0.4.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.20.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-13.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-4.1.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-9.5.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/conf/-/conf-13.1.0.tgz
	https://registry.yarnpkg.com/config-file-ts/-/config-file-ts-0.2.8-rc1.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.40.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/counterpart/-/counterpart-0.18.6.tgz
	https://registry.yarnpkg.com/crc/-/crc-3.8.0.tgz
	https://registry.yarnpkg.com/cross-dirname/-/cross-dirname-0.1.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.6.tgz
	https://registry.yarnpkg.com/data-view-buffer/-/data-view-buffer-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-byte-length/-/data-view-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/data-view-byte-offset/-/data-view-byte-offset-1.0.0.tgz
	https://registry.yarnpkg.com/date-names/-/date-names-0.1.13.tgz
	https://registry.yarnpkg.com/debounce-fn/-/debounce-fn-6.0.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.4.0.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.1.tgz
	https://registry.yarnpkg.com/defaults/-/defaults-1.0.4.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-data-property/-/define-data-property-1.1.4.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.1.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-2.0.3.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-4.2.0.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-26.0.11.tgz
	https://registry.yarnpkg.com/dmg-license/-/dmg-license-1.0.11.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-9.0.0.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-11.0.7.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-16.4.7.tgz
	https://registry.yarnpkg.com/dunder-proto/-/dunder-proto-1.0.1.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/easy-table/-/easy-table-1.2.0.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.10.tgz
	https://registry.yarnpkg.com/electron-builder-squirrel-windows/-/electron-builder-squirrel-windows-26.0.11.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-26.0.11.tgz
	https://registry.yarnpkg.com/electron-devtools-installer/-/electron-devtools-installer-4.0.0.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-26.0.11.tgz
	https://registry.yarnpkg.com/electron-store/-/electron-store-10.0.1.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.5.102.tgz
	https://registry.yarnpkg.com/electron-window-state/-/electron-window-state-5.0.3.tgz
	https://registry.yarnpkg.com/electron-winstaller/-/electron-winstaller-5.4.0.tgz
	https://registry.yarnpkg.com/electron/-/electron-34.3.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-10.4.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.13.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.18.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-3.0.0.tgz
	https://registry.yarnpkg.com/environment/-/environment-1.1.0.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.23.3.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.1.tgz
	https://registry.yarnpkg.com/es-errors/-/es-errors-1.3.0.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.0.0.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.3.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.2.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.25.0.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.2.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-compat-utils/-/eslint-compat-utils-0.5.1.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-10.0.2.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.12.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-es-x/-/eslint-plugin-es-x-7.8.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.31.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-matrix-org/-/eslint-plugin-matrix-org-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-n/-/eslint-plugin-n-17.16.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-unicorn/-/eslint-plugin-unicorn-56.0.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-4.2.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.57.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-10.3.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.6.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-5.0.1.tgz
	https://registry.yarnpkg.com/except/-/except-0.1.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-8.0.1.tgz
	https://registry.yarnpkg.com/expand-template/-/expand-template-2.0.3.tgz
	https://registry.yarnpkg.com/exponential-backoff/-/exponential-backoff-3.1.2.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-2.0.1.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.4.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fast-uri/-/fast-uri-3.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.19.1.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.1.1.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.2.0.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.3.1.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/foreachasync/-/foreachasync-3.0.0.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.3.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.1.tgz
	https://registry.yarnpkg.com/forwarded-parse/-/forwarded-parse-2.1.2.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-11.3.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-7.0.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-3.0.3.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.6.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-east-asian-width/-/get-east-asian-width-1.3.0.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.4.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.7.tgz
	https://registry.yarnpkg.com/get-proto/-/get-proto-1.0.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-8.0.1.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.2.tgz
	https://registry.yarnpkg.com/get-tsconfig/-/get-tsconfig-4.10.0.tgz
	https://registry.yarnpkg.com/github-from-package/-/github-from-package-0.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.4.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-11.0.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-8.1.0.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.24.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-15.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-15.15.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.4.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.2.0.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.6.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.3.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.2.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.1.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.2.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.2.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-7.0.2.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-8.0.0.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-7.0.2.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.5.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.6.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-5.0.0.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/husky/-/husky-9.1.7.tgz
	https://registry.yarnpkg.com/iconv-corefoundation/-/iconv-corefoundation-1.1.7.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-7.0.0.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.3.2.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-in-the-middle/-/import-in-the-middle-1.12.0.tgz
	https://registry.yarnpkg.com/import-in-the-middle/-/import-in-the-middle-1.13.1.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/ini/-/ini-4.1.3.tgz
	https://registry.yarnpkg.com/ini/-/ini-5.0.0.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.7.tgz
	https://registry.yarnpkg.com/ip-address/-/ip-address-9.0.5.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.4.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-3.2.1.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-3.0.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.15.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.16.1.tgz
	https://registry.yarnpkg.com/is-data-view/-/is-data-view-1.0.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-4.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-5.0.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-interactive/-/is-interactive-1.0.0.tgz
	https://registry.yarnpkg.com/is-lambda/-/is-lambda-1.0.1.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.3.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.3.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-3.0.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.13.tgz
	https://registry.yarnpkg.com/is-unicode-supported/-/is-unicode-supported-0.1.0.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.10.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-5.0.4.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-3.1.1.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-3.4.3.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-4.0.2.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.9.2.tgz
	https://registry.yarnpkg.com/jiti/-/jiti-2.4.2.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jsbn/-/jsbn-1.1.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.0.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.1.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-3.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-4.0.0.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-schema-typed/-/json-schema-typed-8.0.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.10.1.tgz
	https://registry.yarnpkg.com/keytar-forked/-/keytar-forked-7.10.0.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.4.tgz
	https://registry.yarnpkg.com/knip/-/knip-5.45.0.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/lilconfig/-/lilconfig-3.1.3.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/lint-staged/-/lint-staged-15.4.3.tgz
	https://registry.yarnpkg.com/listr2/-/listr2-8.2.5.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-4.1.0.tgz
	https://registry.yarnpkg.com/log-update/-/log-update-6.1.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.4.3.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-11.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-7.18.3.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-10.2.1.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-13.0.1.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-14.0.3.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/math-intrinsics/-/math-intrinsics-1.1.0.tgz
	https://registry.yarnpkg.com/matrix-web-i18n/-/matrix-web-i18n-3.3.0.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.8.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-4.0.0.tgz
	https://registry.yarnpkg.com/mimic-function/-/mimic-function-5.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-10.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.5.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-2.0.1.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-2.1.2.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-3.0.5.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-4.0.0.tgz
	https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz
	https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.4.tgz
	https://registry.yarnpkg.com/minipass-sized/-/minipass-sized-1.0.3.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.3.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.1.2.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-3.0.1.tgz
	https://registry.yarnpkg.com/mkdirp-classic/-/mkdirp-classic-0.5.3.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-3.0.1.tgz
	https://registry.yarnpkg.com/module-details-from-path/-/module-details-from-path-1.0.3.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/napi-build-utils/-/napi-build-utils-2.0.0.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.4.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-1.0.0.tgz
	https://registry.yarnpkg.com/node-abi/-/node-abi-3.74.0.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-1.7.2.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-8.3.1.tgz
	https://registry.yarnpkg.com/node-api-version/-/node-api-version-0.2.0.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-10.2.0.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.19.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-6.0.0.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-7.2.1.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-6.0.2.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-7.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-4.0.0.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-6.3.0.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-7.1.0.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-3.0.1.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-4.0.0.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-11.0.3.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-12.0.0.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-10.0.0.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-10.0.0.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-9.1.0.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-18.0.0.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-5.3.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.2.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.5.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.8.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.3.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.2.0.tgz
	https://registry.yarnpkg.com/obuf/-/obuf-1.1.2.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-6.0.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-7.0.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.4.tgz
	https://registry.yarnpkg.com/ora/-/ora-5.4.1.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.1.1.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-7.0.2.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/package-json-from-dist/-/package-json-from-dist-1.0.1.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-21.0.0.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/parse-ms/-/parse-ms-4.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-4.0.0.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.11.1.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-2.0.0.tgz
	https://registry.yarnpkg.com/pe-library/-/pe-library-0.4.1.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/pg-int8/-/pg-int8-1.0.1.tgz
	https://registry.yarnpkg.com/pg-numeric/-/pg-numeric-1.0.2.tgz
	https://registry.yarnpkg.com/pg-protocol/-/pg-protocol-1.7.0.tgz
	https://registry.yarnpkg.com/pg-types/-/pg-types-2.2.0.tgz
	https://registry.yarnpkg.com/pg-types/-/pg-types-4.0.2.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-4.0.2.tgz
	https://registry.yarnpkg.com/pidtree/-/pidtree-0.6.0.tgz
	https://registry.yarnpkg.com/playwright-core/-/playwright-core-1.51.0.tgz
	https://registry.yarnpkg.com/playwright/-/playwright-1.51.0.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.0.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/pluralizers/-/pluralizers-0.1.7.tgz
	https://registry.yarnpkg.com/png-to-ico/-/png-to-ico-2.1.8.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-6.0.0.tgz
	https://registry.yarnpkg.com/possible-typed-array-names/-/possible-typed-array-names-1.0.0.tgz
	https://registry.yarnpkg.com/postgres-array/-/postgres-array-2.0.0.tgz
	https://registry.yarnpkg.com/postgres-array/-/postgres-array-3.0.2.tgz
	https://registry.yarnpkg.com/postgres-bytea/-/postgres-bytea-1.0.0.tgz
	https://registry.yarnpkg.com/postgres-bytea/-/postgres-bytea-3.0.0.tgz
	https://registry.yarnpkg.com/postgres-date/-/postgres-date-1.0.7.tgz
	https://registry.yarnpkg.com/postgres-date/-/postgres-date-2.1.0.tgz
	https://registry.yarnpkg.com/postgres-interval/-/postgres-interval-1.2.0.tgz
	https://registry.yarnpkg.com/postgres-interval/-/postgres-interval-3.0.0.tgz
	https://registry.yarnpkg.com/postgres-range/-/postgres-range-1.1.4.tgz
	https://registry.yarnpkg.com/postject/-/postject-1.0.0-alpha.6.tgz
	https://registry.yarnpkg.com/prebuild-install/-/prebuild-install-7.1.3.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-3.5.3.tgz
	https://registry.yarnpkg.com/pretty-ms/-/pretty-ms-9.2.0.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-2.0.1.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-4.2.0.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-5.0.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.2.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.1.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz
	https://registry.yarnpkg.com/read-binary-file-arch/-/read-binary-file-arch-1.0.6.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.8.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.2.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-4.1.1.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.2.0.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.14.1.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.15.2.tgz
	https://registry.yarnpkg.com/regexp-tree/-/regexp-tree-0.1.27.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.3.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-6.2.0.tgz
	https://registry.yarnpkg.com/regjsgen/-/regjsgen-0.8.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.10.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.12.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/require-in-the-middle/-/require-in-the-middle-7.5.0.tgz
	https://registry.yarnpkg.com/resedit/-/resedit-1.7.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.2.1.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-pkg-maps/-/resolve-pkg-maps-1.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.10.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.1.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-5.1.0.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.1.0.tgz
	https://registry.yarnpkg.com/rfdc/-/rfdc-1.4.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-5.0.10.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-6.0.1.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.3.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.4.1.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.6.3.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.7.1.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/set-function-length/-/set-function-length-1.2.2.tgz
	https://registry.yarnpkg.com/set-function-name/-/set-function-name-2.0.2.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shimmer/-/shimmer-1.2.1.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.6.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.yarnpkg.com/sigstore/-/sigstore-3.0.0.tgz
	https://registry.yarnpkg.com/simple-concat/-/simple-concat-1.0.1.tgz
	https://registry.yarnpkg.com/simple-get/-/simple-get-4.0.1.tgz
	https://registry.yarnpkg.com/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-5.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/smol-toml/-/smol-toml-1.3.1.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-7.0.0.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-8.0.4.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.8.3.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.5.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.20.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.3.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-10.0.6.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-12.0.0.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-9.0.1.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/string-argv/-/string-argv-0.3.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-7.2.0.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.9.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.8.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.8.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-3.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-5.0.1.tgz
	https://registry.yarnpkg.com/stubborn-fs/-/stubborn-fs-1.2.5.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/summary/-/summary-2.1.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-2.1.2.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.2.1.tgz
	https://registry.yarnpkg.com/tar/-/tar-7.4.3.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/temp/-/temp-0.9.4.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/tiny-async-pool/-/tiny-async-pool-1.3.0.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.3.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/ts-api-utils/-/ts-api-utils-2.0.1.tgz
	https://registry.yarnpkg.com/ts-declaration-location/-/ts-declaration-location-1.0.5.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.15.0.tgz
	https://registry.yarnpkg.com/tsx/-/tsx-4.19.3.tgz
	https://registry.yarnpkg.com/tuf-js/-/tuf-js-3.0.1.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.6.0.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-4.33.0.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.1.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.2.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.6.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.5.4.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.8.2.tgz
	https://registry.yarnpkg.com/uint8array-extras/-/uint8array-extras-1.4.0.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-5.26.5.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.1.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.2.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-2.0.1.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-3.0.0.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-4.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-3.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-4.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-5.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.1.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-3.0.3.tgz
	https://registry.yarnpkg.com/unzip-crx-3/-/unzip-crx-3-0.2.0.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.1.2.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.5.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-11.1.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-5.0.1.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-6.0.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.1.tgz
	https://registry.yarnpkg.com/walk/-/walk-2.3.15.tgz
	https://registry.yarnpkg.com/wcwidth/-/wcwidth-1.0.1.tgz
	https://registry.yarnpkg.com/when-exit/-/when-exit-2.1.4.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-4.0.0.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.4.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.5.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-9.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yaku/-/yaku-0.16.7.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-5.0.0.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-2.7.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/zod-validation-error/-/zod-validation-error-3.4.0.tgz
	https://registry.yarnpkg.com/zod/-/zod-3.24.2.tgz
) "

REPO="https://github.com/vector-im/element-desktop"
ELECTRON_SLOT_DEFAULT="33"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="electron-27 electron-28 electron-29 electron-30 electron-31 electron-32 electron-34 native-modules"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE+=" +build-online"
else
	IUSE+=" build-online"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
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
REQUIRED_USE="
	native-modules? ( build-online )
"

COMMON_DEPEND="
	~net-im/element-web-${PV}
	native-modules? ( dev-db/sqlcipher )
	electron-27? ( dev-util/electron:27 )
	electron-28? ( dev-util/electron:28 )
	electron-29? ( dev-util/electron:29 )
	electron-30? ( dev-util/electron:30 )
	electron-31? ( dev-util/electron:31 )
	electron-32? ( dev-util/electron:32 )
	electron-34? ( dev-util/electron:34 )
	!electron-27? (
	!electron-28? (
	!electron-29? (
	!electron-30? (
	!electron-31? (
	!electron-32? (
	!electron-34? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) )
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
	native-modules? ( || ( dev-lang/rust dev-lang/rust-bin )  )
	net-libs/nodejs
	sys-apps/yarn
"

python_check_deps() {
	python_has_version "dev-python/setuptools[${PYTHON_USEDEP}]"
}

#TODO: net-im/element-web -> runtime/buildtime dep

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
	else
		export ELECTRON_SLOT=$ELECTRON_SLOT_DEFAULT
	fi
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
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_SLOT}/node || die
	# #! Until electron-builder >=22.11.5
	# yarn config set ignore-engines true || die

	if ! use build-online; then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Removing playwright from dependencies"
	sed -i '/playwright":/d' package.json || die

	einfo "Installing node_modules"
	node /usr/bin/yarn install --ignore-scripts ${ONLINE_OFFLINE} --no-progress || die

	node node_modules/.bin/tsc || die
	node node_modules/.bin/tsx scripts/copy-res.ts || die

	if use native-modules
	then
		node /usr/bin/yarn run build:native || die
	fi

	# # Electron-Builder doesn't support ppc64 due to using precompiled binaries
	# if ! use ppc64; then
	# 	einfo "Editing ElectronFramework.js"
	# 	sed -i 's/return unpack(options, createDownloadOpts.*$/return true;/' \
	# 		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die
	# 	sed -i 's/return beforeCopyExtraFiles(options);$/return true;/' \
	# 		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die

	# 	#!Error: With electron's node: "Unknown argument" electron/electron#25379
	# 	#!Error: With electron's node: "Invalid package app.asar"
	# 	/usr/bin/node node_modules/.bin/electron-builder --dir || die
	# else
		einfo "Manually preparing app.asar"
		local distdir="dist/linux-unpacked/resources"
		mkdir -p ${distdir}/node_modules || die
		cp -r lib ${distdir} || die
		# Copying yarn.lock allows freezing versions to the build versions
		cp package.json yarn.lock ${distdir} || die
		pushd ${distdir} &> /dev/null || die
		node /usr/bin/yarn install ${ONLINE_OFFLINE} --production \
			--no-progress --frozen-lockfile || die
		popd &> /dev/null || die
		rm ${distdir}/yarn.lock || die
		if use native-modules; then
			cp -r .hak/hakModules/keytar .hak/hakModules/matrix-seshat ${distdir}/node_modules/ || die
		fi

		einfo "Creating archive"
		/usr/bin/node node_modules/@electron/asar/bin/asar.js pack ${distdir} ${distdir}/app.asar \
			--unpack-dir '{**/Release,**/matrix-seshat}' || die
		# Remove unarchived copies of files (they are still in app.asar)
		rm -r ${distdir}/node_modules || die
		rm -r ${distdir}/lib || die

		cp -r res/img ${distdir} || die
	# fi

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

	exeinto "/usr/$(get_libdir)/element-desktop"
	cp "${FILESDIR}/read_flags_file" dist/linux-unpacked/resources/element-desktop
	sed -i "s|@ELECTRON@|element-desktop|" dist/linux-unpacked/resources/element-desktop

	echo "\"/usr/$(get_libdir)/electron-${ELECTRON_SLOT}/electron\" \
/usr/$(get_libdir)/element-desktop/app.asar \"\${flags[@]}\" \"\$@\"" >> dist/linux-unpacked/resources/element-desktop
	doexe dist/linux-unpacked/resources/element-desktop
	dosym "/usr/$(get_libdir)/element-desktop/element-desktop" /usr/bin/element-desktop

	# Install icons
	local branding size
	for size in 16 24 48 64 96 128 256 512 ; do
		newicon -s ${size} "build/icons/${size}x${size}.png" \
			element-desktop.png
	done

	make_desktop_entry "/usr/bin/element-desktop" Element \
		"element-desktop" "Network;Chat"
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
