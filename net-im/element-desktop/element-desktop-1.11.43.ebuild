# Copyright 2009-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )

inherit desktop flag-o-matic multilib python-any-r1 xdg-utils

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.1.1.tgz
	https://registry.yarnpkg.com/@aashutoshrathi/word-wrap/-/word-wrap-1.2.6.tgz -> @aashutoshrathi-word-wrap-1.2.6.tgz
	https://registry.yarnpkg.com/@actions/core/-/core-1.10.0.tgz -> @actions-core-1.10.0.tgz
	https://registry.yarnpkg.com/@actions/github/-/github-5.1.1.tgz -> @actions-github-5.1.1.tgz
	https://registry.yarnpkg.com/@actions/http-client/-/http-client-2.1.1.tgz -> @actions-http-client-2.1.1.tgz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.2.1.tgz -> @ampproject-remapping-2.2.1.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.22.10.tgz -> @babel-code-frame-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.22.9.tgz -> @babel-compat-data-7.22.9.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.22.10.tgz -> @babel-core-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.22.10.tgz -> @babel-generator-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.22.5.tgz -> @babel-helper-annotate-as-pure-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.22.10.tgz -> @babel-helper-builder-binary-assignment-operator-visitor-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.22.10.tgz -> @babel-helper-compilation-targets-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.22.10.tgz -> @babel-helper-create-class-features-plugin-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.22.9.tgz -> @babel-helper-create-regexp-features-plugin-7.22.9.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.4.2.tgz -> @babel-helper-define-polyfill-provider-0.4.2.tgz
	https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.22.5.tgz -> @babel-helper-environment-visitor-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.22.5.tgz -> @babel-helper-function-name-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.22.5.tgz -> @babel-helper-hoist-variables-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.22.5.tgz -> @babel-helper-member-expression-to-functions-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.22.5.tgz -> @babel-helper-module-imports-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.22.9.tgz -> @babel-helper-module-transforms-7.22.9.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.22.5.tgz -> @babel-helper-optimise-call-expression-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.22.5.tgz -> @babel-helper-plugin-utils-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.22.9.tgz -> @babel-helper-remap-async-to-generator-7.22.9.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.22.9.tgz -> @babel-helper-replace-supers-7.22.9.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.22.5.tgz -> @babel-helper-simple-access-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.22.5.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.22.6.tgz -> @babel-helper-split-export-declaration-7.22.6.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.22.5.tgz -> @babel-helper-string-parser-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.22.5.tgz -> @babel-helper-validator-identifier-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.22.5.tgz -> @babel-helper-validator-option-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.22.10.tgz -> @babel-helper-wrap-function-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.22.10.tgz -> @babel-helpers-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.22.10.tgz -> @babel-highlight-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.22.10.tgz -> @babel-parser-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.22.5.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.22.5.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz -> @babel-plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz -> @babel-plugin-syntax-bigint-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz -> @babel-plugin-syntax-class-properties-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz -> @babel-plugin-syntax-class-static-block-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz -> @babel-plugin-syntax-dynamic-import-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz -> @babel-plugin-syntax-export-namespace-from-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-assertions/-/plugin-syntax-import-assertions-7.22.5.tgz -> @babel-plugin-syntax-import-assertions-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.22.5.tgz -> @babel-plugin-syntax-import-attributes-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz -> @babel-plugin-syntax-import-meta-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz -> @babel-plugin-syntax-json-strings-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.22.5.tgz -> @babel-plugin-syntax-jsx-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz -> @babel-plugin-syntax-logical-assignment-operators-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz -> @babel-plugin-syntax-nullish-coalescing-operator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz -> @babel-plugin-syntax-numeric-separator-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz -> @babel-plugin-syntax-object-rest-spread-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz -> @babel-plugin-syntax-optional-catch-binding-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz -> @babel-plugin-syntax-optional-chaining-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-private-property-in-object/-/plugin-syntax-private-property-in-object-7.14.5.tgz -> @babel-plugin-syntax-private-property-in-object-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz -> @babel-plugin-syntax-top-level-await-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.22.5.tgz -> @babel-plugin-syntax-typescript-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-unicode-sets-regex/-/plugin-syntax-unicode-sets-regex-7.18.6.tgz -> @babel-plugin-syntax-unicode-sets-regex-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.22.5.tgz -> @babel-plugin-transform-arrow-functions-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-generator-functions/-/plugin-transform-async-generator-functions-7.22.10.tgz -> @babel-plugin-transform-async-generator-functions-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.22.5.tgz -> @babel-plugin-transform-async-to-generator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.22.5.tgz -> @babel-plugin-transform-block-scoped-functions-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.22.10.tgz -> @babel-plugin-transform-block-scoping-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-properties/-/plugin-transform-class-properties-7.22.5.tgz -> @babel-plugin-transform-class-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-static-block/-/plugin-transform-class-static-block-7.22.5.tgz -> @babel-plugin-transform-class-static-block-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.22.6.tgz -> @babel-plugin-transform-classes-7.22.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.22.5.tgz -> @babel-plugin-transform-computed-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.22.10.tgz -> @babel-plugin-transform-destructuring-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.22.5.tgz -> @babel-plugin-transform-dotall-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.22.5.tgz -> @babel-plugin-transform-duplicate-keys-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dynamic-import/-/plugin-transform-dynamic-import-7.22.5.tgz -> @babel-plugin-transform-dynamic-import-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.22.5.tgz -> @babel-plugin-transform-exponentiation-operator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-export-namespace-from/-/plugin-transform-export-namespace-from-7.22.5.tgz -> @babel-plugin-transform-export-namespace-from-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.22.5.tgz -> @babel-plugin-transform-for-of-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.22.5.tgz -> @babel-plugin-transform-function-name-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-json-strings/-/plugin-transform-json-strings-7.22.5.tgz -> @babel-plugin-transform-json-strings-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.22.5.tgz -> @babel-plugin-transform-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-logical-assignment-operators/-/plugin-transform-logical-assignment-operators-7.22.5.tgz -> @babel-plugin-transform-logical-assignment-operators-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.22.5.tgz -> @babel-plugin-transform-member-expression-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.22.5.tgz -> @babel-plugin-transform-modules-amd-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.22.5.tgz -> @babel-plugin-transform-modules-commonjs-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.22.5.tgz -> @babel-plugin-transform-modules-systemjs-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.22.5.tgz -> @babel-plugin-transform-modules-umd-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.22.5.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.22.5.tgz -> @babel-plugin-transform-new-target-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-nullish-coalescing-operator/-/plugin-transform-nullish-coalescing-operator-7.22.5.tgz -> @babel-plugin-transform-nullish-coalescing-operator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-numeric-separator/-/plugin-transform-numeric-separator-7.22.5.tgz -> @babel-plugin-transform-numeric-separator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-rest-spread/-/plugin-transform-object-rest-spread-7.22.5.tgz -> @babel-plugin-transform-object-rest-spread-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.22.5.tgz -> @babel-plugin-transform-object-super-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-catch-binding/-/plugin-transform-optional-catch-binding-7.22.5.tgz -> @babel-plugin-transform-optional-catch-binding-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-chaining/-/plugin-transform-optional-chaining-7.22.10.tgz -> @babel-plugin-transform-optional-chaining-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.22.5.tgz -> @babel-plugin-transform-parameters-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-methods/-/plugin-transform-private-methods-7.22.5.tgz -> @babel-plugin-transform-private-methods-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-property-in-object/-/plugin-transform-private-property-in-object-7.22.5.tgz -> @babel-plugin-transform-private-property-in-object-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.22.5.tgz -> @babel-plugin-transform-property-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.22.10.tgz -> @babel-plugin-transform-regenerator-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.22.5.tgz -> @babel-plugin-transform-reserved-words-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.22.5.tgz -> @babel-plugin-transform-shorthand-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.22.5.tgz -> @babel-plugin-transform-spread-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.22.5.tgz -> @babel-plugin-transform-sticky-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.22.5.tgz -> @babel-plugin-transform-template-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.22.5.tgz -> @babel-plugin-transform-typeof-symbol-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.22.10.tgz -> @babel-plugin-transform-typescript-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.22.10.tgz -> @babel-plugin-transform-unicode-escapes-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-property-regex/-/plugin-transform-unicode-property-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-property-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-sets-regex/-/plugin-transform-unicode-sets-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-sets-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.22.10.tgz -> @babel-preset-env-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.6-no-external-plugins.tgz -> @babel-preset-modules-0.1.6-no-external-plugins.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.22.5.tgz -> @babel-preset-typescript-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/regjsgen/-/regjsgen-0.8.0.tgz -> @babel-regjsgen-0.8.0.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.22.10.tgz -> @babel-runtime-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.22.5.tgz -> @babel-template-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.22.10.tgz -> @babel-traverse-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.22.10.tgz -> @babel-types-7.22.10.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz -> @bcoe-v8-coverage-0.2.3.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.8.1.tgz -> @cspotcode-source-map-support-0.8.1.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/@electron/asar/-/asar-3.2.4.tgz -> @electron-asar-3.2.4.tgz
	https://registry.yarnpkg.com/@electron/get/-/get-2.0.2.tgz -> @electron-get-2.0.2.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-1.2.4.tgz -> @electron-notarize-1.2.4.tgz
	https://registry.yarnpkg.com/@electron/notarize/-/notarize-2.1.0.tgz -> @electron-notarize-2.1.0.tgz
	https://registry.yarnpkg.com/@electron/osx-sign/-/osx-sign-1.0.5.tgz -> @electron-osx-sign-1.0.5.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-1.3.4.tgz -> @electron-universal-1.3.4.tgz
	https://registry.yarnpkg.com/@electron/universal/-/universal-1.4.1.tgz -> @electron-universal-1.4.1.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.7.0.tgz -> @eslint-community-regexpp-4.7.0.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.2.tgz -> @eslint-eslintrc-2.1.2.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.47.0.tgz -> @eslint-js-8.47.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.11.10.tgz -> @humanwhocodes-config-array-0.11.10.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz -> @humanwhocodes-object-schema-1.2.1.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz -> @istanbuljs-load-nyc-config-1.1.0.tgz
	https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.3.tgz -> @istanbuljs-schema-0.1.3.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-29.6.3.tgz -> @jest-console-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-29.6.3.tgz -> @jest-core-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-29.6.3.tgz -> @jest-environment-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/expect-utils/-/expect-utils-29.6.3.tgz -> @jest-expect-utils-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/expect/-/expect-29.6.3.tgz -> @jest-expect-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-29.6.3.tgz -> @jest-fake-timers-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/globals/-/globals-29.6.3.tgz -> @jest-globals-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-29.6.3.tgz -> @jest-reporters-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/schemas/-/schemas-29.6.3.tgz -> @jest-schemas-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-29.6.3.tgz -> @jest-source-map-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-29.6.3.tgz -> @jest-test-result-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-29.6.3.tgz -> @jest-test-sequencer-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-29.6.3.tgz -> @jest-transform-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-29.6.3.tgz -> @jest-types-29.6.3.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.3.tgz -> @jridgewell-gen-mapping-0.3.3.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.1.tgz -> @jridgewell-resolve-uri-3.1.1.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.1.2.tgz -> @jridgewell-set-array-1.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.15.tgz -> @jridgewell-sourcemap-codec-1.4.15.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.19.tgz -> @jridgewell-trace-mapping-0.3.19.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.9.tgz -> @jridgewell-trace-mapping-0.3.9.tgz
	https://registry.yarnpkg.com/@malept/cross-spawn-promise/-/cross-spawn-promise-1.1.1.tgz -> @malept-cross-spawn-promise-1.1.1.tgz
	https://registry.yarnpkg.com/@malept/flatpak-bundler/-/flatpak-bundler-0.4.0.tgz -> @malept-flatpak-bundler-0.4.0.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-3.1.0.tgz -> @npmcli-fs-3.1.0.tgz
	https://registry.yarnpkg.com/@npmcli/git/-/git-4.1.0.tgz -> @npmcli-git-4.1.0.tgz
	https://registry.yarnpkg.com/@npmcli/installed-package-contents/-/installed-package-contents-2.0.2.tgz -> @npmcli-installed-package-contents-2.0.2.tgz
	https://registry.yarnpkg.com/@npmcli/node-gyp/-/node-gyp-3.0.0.tgz -> @npmcli-node-gyp-3.0.0.tgz
	https://registry.yarnpkg.com/@npmcli/promise-spawn/-/promise-spawn-6.0.2.tgz -> @npmcli-promise-spawn-6.0.2.tgz
	https://registry.yarnpkg.com/@npmcli/run-script/-/run-script-6.0.2.tgz -> @npmcli-run-script-6.0.2.tgz
	https://registry.yarnpkg.com/@octokit/auth-token/-/auth-token-2.5.0.tgz -> @octokit-auth-token-2.5.0.tgz
	https://registry.yarnpkg.com/@octokit/core/-/core-3.6.0.tgz -> @octokit-core-3.6.0.tgz
	https://registry.yarnpkg.com/@octokit/endpoint/-/endpoint-6.0.12.tgz -> @octokit-endpoint-6.0.12.tgz
	https://registry.yarnpkg.com/@octokit/graphql/-/graphql-4.8.0.tgz -> @octokit-graphql-4.8.0.tgz
	https://registry.yarnpkg.com/@octokit/openapi-types/-/openapi-types-12.11.0.tgz -> @octokit-openapi-types-12.11.0.tgz
	https://registry.yarnpkg.com/@octokit/plugin-paginate-rest/-/plugin-paginate-rest-2.21.3.tgz -> @octokit-plugin-paginate-rest-2.21.3.tgz
	https://registry.yarnpkg.com/@octokit/plugin-request-log/-/plugin-request-log-1.0.4.tgz -> @octokit-plugin-request-log-1.0.4.tgz
	https://registry.yarnpkg.com/@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-5.16.2.tgz -> @octokit-plugin-rest-endpoint-methods-5.16.2.tgz
	https://registry.yarnpkg.com/@octokit/request-error/-/request-error-2.1.0.tgz -> @octokit-request-error-2.1.0.tgz
	https://registry.yarnpkg.com/@octokit/request/-/request-5.6.3.tgz -> @octokit-request-5.6.3.tgz
	https://registry.yarnpkg.com/@octokit/rest/-/rest-18.12.0.tgz -> @octokit-rest-18.12.0.tgz
	https://registry.yarnpkg.com/@octokit/types/-/types-6.41.0.tgz -> @octokit-types-6.41.0.tgz
	https://registry.yarnpkg.com/@pkgjs/parseargs/-/parseargs-0.11.0.tgz -> @pkgjs-parseargs-0.11.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/tracing/-/tracing-7.63.0.tgz -> @sentry-internal-tracing-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/browser/-/browser-7.63.0.tgz -> @sentry-browser-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/core/-/core-7.63.0.tgz -> @sentry-core-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/electron/-/electron-4.10.0.tgz -> @sentry-electron-4.10.0.tgz
	https://registry.yarnpkg.com/@sentry/node/-/node-7.63.0.tgz -> @sentry-node-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/replay/-/replay-7.63.0.tgz -> @sentry-replay-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/types/-/types-7.63.0.tgz -> @sentry-types-7.63.0.tgz
	https://registry.yarnpkg.com/@sentry/utils/-/utils-7.63.0.tgz -> @sentry-utils-7.63.0.tgz
	https://registry.yarnpkg.com/@sigstore/bundle/-/bundle-1.1.0.tgz -> @sigstore-bundle-1.1.0.tgz
	https://registry.yarnpkg.com/@sigstore/protobuf-specs/-/protobuf-specs-0.2.1.tgz -> @sigstore-protobuf-specs-0.2.1.tgz
	https://registry.yarnpkg.com/@sigstore/sign/-/sign-1.0.0.tgz -> @sigstore-sign-1.0.0.tgz
	https://registry.yarnpkg.com/@sigstore/tuf/-/tuf-1.0.3.tgz -> @sigstore-tuf-1.0.3.tgz
	https://registry.yarnpkg.com/@sinclair/typebox/-/typebox-0.27.8.tgz -> @sinclair-typebox-0.27.8.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-4.6.0.tgz -> @sindresorhus-is-4.6.0.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-3.0.0.tgz -> @sinonjs-commons-3.0.0.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-10.3.0.tgz -> @sinonjs-fake-timers-10.3.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-4.0.6.tgz -> @szmarczak-http-timer-4.0.6.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.9.tgz -> @tsconfig-node10-1.0.9.tgz
	https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.11.tgz -> @tsconfig-node12-1.0.11.tgz
	https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.3.tgz -> @tsconfig-node14-1.0.3.tgz
	https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.4.tgz -> @tsconfig-node16-1.0.4.tgz
	https://registry.yarnpkg.com/@tufjs/canonical-json/-/canonical-json-1.0.0.tgz -> @tufjs-canonical-json-1.0.0.tgz
	https://registry.yarnpkg.com/@tufjs/models/-/models-1.0.4.tgz -> @tufjs-models-1.0.4.tgz
	https://registry.yarnpkg.com/@types/auto-launch/-/auto-launch-5.0.2.tgz -> @types-auto-launch-5.0.2.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.20.1.tgz -> @types-babel__core-7.20.1.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.4.tgz -> @types-babel__generator-7.6.4.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.1.tgz -> @types-babel__template-7.4.1.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.20.1.tgz -> @types-babel__traverse-7.20.1.tgz
	https://registry.yarnpkg.com/@types/cacheable-request/-/cacheable-request-6.0.3.tgz -> @types-cacheable-request-6.0.3.tgz
	https://registry.yarnpkg.com/@types/counterpart/-/counterpart-0.18.1.tgz -> @types-counterpart-0.18.1.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.8.tgz -> @types-debug-4.1.8.tgz
	https://registry.yarnpkg.com/@types/detect-libc/-/detect-libc-1.0.0.tgz -> @types-detect-libc-1.0.0.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.13.tgz -> @types-fs-extra-9.0.13.tgz
	https://registry.yarnpkg.com/@types/graceful-fs/-/graceful-fs-4.1.6.tgz -> @types-graceful-fs-4.1.6.tgz
	https://registry.yarnpkg.com/@types/http-cache-semantics/-/http-cache-semantics-4.0.1.tgz -> @types-http-cache-semantics-4.0.1.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.4.tgz -> @types-istanbul-lib-coverage-2.0.4.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz -> @types-istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.1.tgz -> @types-istanbul-reports-3.0.1.tgz
	https://registry.yarnpkg.com/@types/jest/-/jest-29.5.4.tgz -> @types-jest-29.5.4.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.12.tgz -> @types-json-schema-7.0.12.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/keyv/-/keyv-3.1.4.tgz -> @types-keyv-3.1.4.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.2.tgz -> @types-minimist-1.2.2.tgz
	https://registry.yarnpkg.com/@types/mkdirp/-/mkdirp-1.0.2.tgz -> @types-mkdirp-1.0.2.tgz
	https://registry.yarnpkg.com/@types/ms/-/ms-0.7.31.tgz -> @types-ms-0.7.31.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.6.4.tgz -> @types-node-fetch-2.6.4.tgz
	https://registry.yarnpkg.com/@types/node/-/node-16.18.41.tgz -> @types-node-16.18.41.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.1.tgz -> @types-normalize-package-data-2.4.1.tgz
	https://registry.yarnpkg.com/@types/npm-package-arg/-/npm-package-arg-6.1.1.tgz -> @types-npm-package-arg-6.1.1.tgz
	https://registry.yarnpkg.com/@types/npm-registry-fetch/-/npm-registry-fetch-8.0.4.tgz -> @types-npm-registry-fetch-8.0.4.tgz
	https://registry.yarnpkg.com/@types/npmlog/-/npmlog-4.1.4.tgz -> @types-npmlog-4.1.4.tgz
	https://registry.yarnpkg.com/@types/pacote/-/pacote-11.1.5.tgz -> @types-pacote-11.1.5.tgz
	https://registry.yarnpkg.com/@types/plist/-/plist-3.0.2.tgz -> @types-plist-3.0.2.tgz
	https://registry.yarnpkg.com/@types/responselike/-/responselike-1.0.0.tgz -> @types-responselike-1.0.0.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.5.0.tgz -> @types-semver-7.5.0.tgz
	https://registry.yarnpkg.com/@types/ssri/-/ssri-7.1.1.tgz -> @types-ssri-7.1.1.tgz
	https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-2.0.1.tgz -> @types-stack-utils-2.0.1.tgz
	https://registry.yarnpkg.com/@types/tar/-/tar-6.1.5.tgz -> @types-tar-6.1.5.tgz
	https://registry.yarnpkg.com/@types/uuid/-/uuid-9.0.2.tgz -> @types-uuid-9.0.2.tgz
	https://registry.yarnpkg.com/@types/verror/-/verror-1.10.6.tgz -> @types-verror-1.10.6.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.0.tgz -> @types-yargs-parser-21.0.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.24.tgz -> @types-yargs-17.0.24.tgz
	https://registry.yarnpkg.com/@types/yauzl/-/yauzl-2.10.0.tgz -> @types-yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.62.0.tgz -> @typescript-eslint-eslint-plugin-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.62.0.tgz -> @typescript-eslint-parser-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.62.0.tgz -> @typescript-eslint-scope-manager-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.62.0.tgz -> @typescript-eslint-type-utils-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.62.0.tgz -> @typescript-eslint-types-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.62.0.tgz -> @typescript-eslint-typescript-estree-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.62.0.tgz -> @typescript-eslint-utils-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.62.0.tgz -> @typescript-eslint-visitor-keys-5.62.0.tgz
	https://registry.yarnpkg.com/@xmldom/xmldom/-/xmldom-0.8.10.tgz -> @xmldom-xmldom-0.8.10.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-8.2.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.10.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-4.5.0.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.12.0.tgz
	https://registry.yarnpkg.com/allchange/-/allchange-1.1.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.2.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-5.2.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.3.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-4.0.0.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-24.6.3.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-24.6.4.tgz
	https://registry.yarnpkg.com/applescript/-/applescript-1.0.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-2.0.0.tgz
	https://registry.yarnpkg.com/archiver-utils/-/archiver-utils-2.1.0.tgz
	https://registry.yarnpkg.com/archiver/-/archiver-5.3.2.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.7.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-3.0.1.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.3.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.0.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.6.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.2.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.1.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.1.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.1.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.4.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/atomically/-/atomically-1.7.0.tgz
	https://registry.yarnpkg.com/auto-launch/-/auto-launch-5.0.6.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-29.6.3.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-29.6.3.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.4.5.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.8.3.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.5.2.tgz
	https://registry.yarnpkg.com/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-1.0.1.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-29.6.3.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.2.3.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.2.0.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/bluebird-lst/-/bluebird-lst-1.0.9.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/boolean/-/boolean-3.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.21.10.tgz
	https://registry.yarnpkg.com/bs-logger/-/bs-logger-0.2.6.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-1.0.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-9.2.1.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-24.5.0.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.3.0.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-5.0.1.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-17.1.4.tgz
	https://registry.yarnpkg.com/cacheable-lookup/-/cacheable-lookup-5.0.4.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-7.0.4.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001522.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-1.0.2.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.3.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.8.0.tgz
	https://registry.yarnpkg.com/cjs-module-lexer/-/cjs-module-lexer-1.2.3.tgz
	https://registry.yarnpkg.com/clean-regexp/-/clean-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-color/-/cli-color-2.0.3.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.3.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz
	https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz
	https://registry.yarnpkg.com/collect-v8-coverage/-/collect-v8-coverage-1.0.2.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/color-support/-/color-support-1.1.3.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-5.1.0.tgz
	https://registry.yarnpkg.com/compare-version/-/compare-version-0.1.2.tgz
	https://registry.yarnpkg.com/compress-commons/-/compress-commons-4.1.1.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/conf/-/conf-10.2.0.tgz
	https://registry.yarnpkg.com/config-file-ts/-/config-file-ts-0.2.4.tgz
	https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.9.0.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.4.2.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.32.1.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/counterpart/-/counterpart-0.18.6.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-1.2.2.tgz
	https://registry.yarnpkg.com/crc/-/crc-3.8.0.tgz
	https://registry.yarnpkg.com/crc32-stream/-/crc32-stream-4.0.2.tgz
	https://registry.yarnpkg.com/create-require/-/create-require-1.1.1.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.1.tgz
	https://registry.yarnpkg.com/date-names/-/date-names-0.1.13.tgz
	https://registry.yarnpkg.com/debounce-fn/-/debounce-fn-4.0.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-6.0.0.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-1.5.1.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.0.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.1.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-2.0.1.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.0.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-1.0.3.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-29.6.3.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/dir-compare/-/dir-compare-3.3.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-24.6.4.tgz
	https://registry.yarnpkg.com/dmg-license/-/dmg-license-1.0.11.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-6.0.1.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-5.1.0.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-9.0.2.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.9.tgz
	https://registry.yarnpkg.com/electron-builder-squirrel-windows/-/electron-builder-squirrel-windows-24.6.4.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-24.6.4.tgz
	https://registry.yarnpkg.com/electron-clear-data/-/electron-clear-data-1.0.5.tgz
	https://registry.yarnpkg.com/electron-devtools-installer/-/electron-devtools-installer-3.2.0.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-24.5.0.tgz
	https://registry.yarnpkg.com/electron-store/-/electron-store-8.1.0.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.4.499.tgz
	https://registry.yarnpkg.com/electron-window-state/-/electron-window-state-5.0.3.tgz
	https://registry.yarnpkg.com/electron/-/electron-26.2.1.tgz
	https://registry.yarnpkg.com/emittery/-/emittery-0.13.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.13.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-2.0.3.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.22.1.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.1.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.62.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.3.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.3.tgz
	https://registry.yarnpkg.com/es6-weak-map/-/es6-weak-map-2.0.3.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-9.0.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.8.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.28.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-matrix-org/-/eslint-plugin-matrix-org-1.2.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-unicorn/-/eslint-plugin-unicorn-48.0.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.47.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.5.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/event-emitter/-/event-emitter-0.3.5.tgz
	https://registry.yarnpkg.com/except/-/except-0.1.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.1.1.tgz
	https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz
	https://registry.yarnpkg.com/expect-playwright/-/expect-playwright-0.8.0.tgz
	https://registry.yarnpkg.com/expect/-/expect-29.6.3.tgz
	https://registry.yarnpkg.com/exponential-backoff/-/exponential-backoff-3.1.1.tgz
	https://registry.yarnpkg.com/ext/-/ext-1.7.0.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-2.0.1.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.4.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.1.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.15.0.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.2.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.1.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/find-npm-prefix/-/find-npm-prefix-1.0.2.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.0.4.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.7.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/foreachasync/-/foreachasync-3.0.0.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.1.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-3.0.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.0.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-10.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-11.1.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.7.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-3.0.3.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.5.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-4.0.4.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.1.tgz
	https://registry.yarnpkg.com/get-package-type/-/get-package-type-0.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.2.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-6.0.1.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.3.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/global-agent/-/global-agent-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.21.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.0.1.tgz
	https://registry.yarnpkg.com/got/-/got-11.8.6.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.1.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-6.1.1.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.1.1.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http2-wrapper/-/http2-wrapper-1.0.3.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-2.1.0.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/iconv-corefoundation/-/iconv-corefoundation-1.1.7.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.4.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-6.0.3.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.4.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.5.tgz
	https://registry.yarnpkg.com/ip/-/ip-2.0.0.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.2.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-3.2.1.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-3.0.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.13.0.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-generator-fn/-/is-generator-fn-2.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-lambda/-/is-lambda-1.0.1.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-2.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.2.2.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.1.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.12.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.10.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-5.0.0.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-5.2.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-6.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.1.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.1.6.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-2.3.0.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.7.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-29.6.3.tgz
	https://registry.yarnpkg.com/jest-circus/-/jest-circus-29.6.3.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-29.6.3.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-29.6.3.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-29.6.3.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-29.6.3.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-29.6.3.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-29.6.3.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-29.6.3.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-29.6.3.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-29.6.3.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-29.6.3.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-29.6.3.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-29.6.3.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.3.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-29.6.3.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-29.6.3.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-29.6.3.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-29.6.3.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-29.6.3.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-29.6.3.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-29.6.3.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-29.6.3.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-29.6.3.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-29.6.3.tgz
	https://registry.yarnpkg.com/jest/-/jest-29.6.3.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.0.2.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-3.0.0.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-schema-typed/-/json-schema-typed-7.0.3.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.10.1.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.3.tgz
	https://registry.yarnpkg.com/kleur/-/kleur-3.0.3.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.5.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-1.0.1.tgz
	https://registry.yarnpkg.com/leven/-/leven-3.1.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.defaults/-/lodash.defaults-4.2.0.tgz
	https://registry.yarnpkg.com/lodash.difference/-/lodash.difference-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.flatten/-/lodash.flatten-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz
	https://registry.yarnpkg.com/lodash.memoize/-/lodash.memoize-4.1.2.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.union/-/lodash.union-4.6.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/loglevel/-/loglevel-1.8.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.0.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-7.18.3.tgz
	https://registry.yarnpkg.com/lru-queue/-/lru-queue-0.1.0.tgz
	https://registry.yarnpkg.com/lru_map/-/lru_map-0.3.3.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-4.0.0.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.6.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-11.1.1.tgz
	https://registry.yarnpkg.com/makeerror/-/makeerror-1.0.12.tgz
	https://registry.yarnpkg.com/matcher/-/matcher-3.0.0.tgz
	https://registry.yarnpkg.com/matrix-web-i18n/-/matrix-web-i18n-2.1.0.tgz
	https://registry.yarnpkg.com/memoizee/-/memoizee-0.4.15.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.5.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.6.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-3.1.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-3.1.0.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.3.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz
	https://registry.yarnpkg.com/minipass-fetch/-/minipass-fetch-3.0.4.tgz
	https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz
	https://registry.yarnpkg.com/minipass-json-stream/-/minipass-json-stream-1.0.1.tgz
	https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.4.tgz
	https://registry.yarnpkg.com/minipass-sized/-/minipass-sized-1.0.3.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.9.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.3.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.0.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-1.3.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-3.0.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/natural-compare-lite/-/natural-compare-lite-1.4.0.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/needle/-/needle-2.9.1.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.3.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.1.0.tgz
	https://registry.yarnpkg.com/node-addon-api/-/node-addon-api-1.7.2.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.6.13.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-9.4.0.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.17.0.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.13.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-4.0.3.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-6.0.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-5.0.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.1.2.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-3.0.0.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-6.2.0.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-3.0.1.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-10.1.0.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.4.8.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-7.0.4.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-8.0.2.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-14.0.5.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-6.0.2.tgz
	https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.12.3.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.4.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.6.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.0.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.6.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.3.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-2.1.1.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-15.2.0.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.10.1.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.0.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.6.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-3.1.0.tgz
	https://registry.yarnpkg.com/playwright-core/-/playwright-core-1.37.1.tgz
	https://registry.yarnpkg.com/playwright/-/playwright-1.37.1.tgz
	https://registry.yarnpkg.com/plist/-/plist-3.1.0.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/pluralizers/-/pluralizers-0.1.7.tgz
	https://registry.yarnpkg.com/png-to-ico/-/png-to-ico-2.1.8.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-6.0.0.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.8.8.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-29.6.3.tgz
	https://registry.yarnpkg.com/proc-log/-/proc-log-3.0.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-2.0.1.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.4.2.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.0.tgz
	https://registry.yarnpkg.com/pure-rand/-/pure-rand-6.0.2.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-18.2.0.tgz
	https://registry.yarnpkg.com/read-config-file/-/read-config-file-6.3.2.tgz
	https://registry.yarnpkg.com/read-package-json-fast/-/read-package-json-fast-3.0.2.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-6.0.4.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.8.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.2.tgz
	https://registry.yarnpkg.com/readdir-glob/-/readdir-glob-1.1.3.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.1.0.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.14.0.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.15.2.tgz
	https://registry.yarnpkg.com/regexp-tree/-/regexp-tree-0.1.27.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.0.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-5.3.2.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.10.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.9.1.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/resolve-alpn/-/resolve-alpn-1.2.1.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve.exports/-/resolve.exports-2.0.2.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.4.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-2.0.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-5.0.1.tgz
	https://registry.yarnpkg.com/roarr/-/roarr-2.15.4.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.0.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.0.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/semver-compare/-/semver-compare-1.0.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.5.4.tgz
	https://registry.yarnpkg.com/serialize-error/-/serialize-error-7.0.1.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.yarnpkg.com/sigstore/-/sigstore-1.9.0.tgz
	https://registry.yarnpkg.com/simple-update-notifier/-/simple-update-notifier-2.0.0.tgz
	https://registry.yarnpkg.com/sisteransi/-/sisteransi-1.0.5.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-3.0.0.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-7.0.0.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.7.1.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.13.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.13.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.2.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-10.0.5.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-2.0.6.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-4.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.7.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.6.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.6.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/sumchecker/-/sumchecker-3.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar/-/tar-4.4.19.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.1.15.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.4.0.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-6.0.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/timers-ext/-/timers-ext-0.1.7.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-3.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.1.tgz
	https://registry.yarnpkg.com/tmpl/-/tmpl-1.0.5.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/ts-jest/-/ts-jest-29.1.1.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-10.9.1.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.14.2.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.6.2.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.21.0.tgz
	https://registry.yarnpkg.com/tuf-js/-/tuf-js-1.1.7.tgz
	https://registry.yarnpkg.com/tunnel/-/tunnel-0.0.6.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.13.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.21.3.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-2.19.0.tgz
	https://registry.yarnpkg.com/type/-/type-1.2.0.tgz
	https://registry.yarnpkg.com/type/-/type-2.7.2.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.4.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-4.9.5.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.1.6.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-3.0.0.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-4.0.0.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-6.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-3.0.3.tgz
	https://registry.yarnpkg.com/unzip-crx-3/-/unzip-crx-3-0.2.0.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.0.11.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-8.3.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-9.0.0.tgz
	https://registry.yarnpkg.com/v8-compile-cache-lib/-/v8-compile-cache-lib-3.0.1.tgz
	https://registry.yarnpkg.com/v8-to-istanbul/-/v8-to-istanbul-9.1.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-5.0.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.1.tgz
	https://registry.yarnpkg.com/walk/-/walk-2.3.15.tgz
	https://registry.yarnpkg.com/walker/-/walker-1.0.8.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.11.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/which/-/which-3.0.1.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.5.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.4.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-4.0.2.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-15.1.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yaku/-/yaku-0.16.7.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.10.0.tgz
	https://registry.yarnpkg.com/yn/-/yn-3.1.1.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/zip-stream/-/zip-stream-4.1.0.tgz
) "

REPO="https://github.com/vector-im/element-desktop"
ELECTRON_SLOT_DEFAULT="26"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"
IUSE="electron-19 electron-20 electron-21 electron-22 electron-23 electron-24 electron-25 native-modules"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE+=" +build-online"
else
	IUSE+=" build-online"
	KEYWORDS="amd64 ~arm64 ~ppc64 ~x86"
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
	electron-19? ( dev-util/electron:19 )
	electron-20? ( dev-util/electron:20 )
	electron-21? ( dev-util/electron:21 )
	electron-22? ( dev-util/electron:22 )
	electron-23? ( dev-util/electron:23 )
	electron-24? ( dev-util/electron:24 )
	electron-25? ( dev-util/electron:25 )
	!electron-19? (
	!electron-20? (
	!electron-21? (
	!electron-22? (
	!electron-23? (
	!electron-24? (
	!electron-25? (
		dev-util/electron:${ELECTRON_SLOT_DEFAULT}
	) ) ) ) ) ) )
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
	if use electron-19; then
		export ELECTRON_SLOT=19
	elif use electron-20; then
		export ELECTRON_SLOT=20
	elif use electron-21; then
		export ELECTRON_SLOT=21
	elif use electron-22; then
		export ELECTRON_SLOT=22
	elif use electron-23; then
		export ELECTRON_SLOT=23
	elif use electron-24; then
		export ELECTRON_SLOT=24
	elif use electron-25; then
		export ELECTRON_SLOT=25
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
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress || die

	node node_modules/.bin/tsc || die
	node node_modules/.bin/ts-node scripts/copy-res.ts || die

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
			--unpack-dir '{**/*.node}' || die
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
