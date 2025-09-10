# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A glossy Matrix collaboration client for the web"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/@action-validator/cli/-/cli-0.6.0.tgz -> @action-validator-cli-0.6.0.tgz
	https://registry.yarnpkg.com/@action-validator/core/-/core-0.6.0.tgz -> @action-validator-core-0.6.0.tgz
	https://registry.yarnpkg.com/@adobe/css-tools/-/css-tools-4.4.4.tgz -> @adobe-css-tools-4.4.4.tgz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.3.0.tgz -> @ampproject-remapping-2.3.0.tgz
	https://registry.yarnpkg.com/@axe-core/playwright/-/playwright-4.10.2.tgz -> @axe-core-playwright-4.10.2.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.25.7.tgz -> @babel-code-frame-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.26.2.tgz -> @babel-code-frame-7.26.2.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.27.1.tgz -> @babel-code-frame-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.28.0.tgz -> @babel-compat-data-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.28.3.tgz -> @babel-core-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/eslint-parser/-/eslint-parser-7.28.0.tgz -> @babel-eslint-parser-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/eslint-plugin/-/eslint-plugin-7.27.1.tgz -> @babel-eslint-plugin-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.25.7.tgz -> @babel-generator-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.27.0.tgz -> @babel-generator-7.27.0.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.28.0.tgz -> @babel-generator-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.28.3.tgz -> @babel-generator-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.27.1.tgz -> @babel-helper-annotate-as-pure-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.27.3.tgz -> @babel-helper-annotate-as-pure-7.27.3.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.27.2.tgz -> @babel-helper-compilation-targets-7.27.2.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.26.9.tgz -> @babel-helper-create-class-features-plugin-7.26.9.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.28.3.tgz -> @babel-helper-create-class-features-plugin-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.27.1.tgz -> @babel-helper-create-regexp-features-plugin-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.6.5.tgz -> @babel-helper-define-polyfill-provider-0.6.5.tgz
	https://registry.yarnpkg.com/@babel/helper-globals/-/helper-globals-7.28.0.tgz -> @babel-helper-globals-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.25.9.tgz -> @babel-helper-member-expression-to-functions-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.27.1.tgz -> @babel-helper-member-expression-to-functions-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.27.1.tgz -> @babel-helper-module-imports-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.28.3.tgz -> @babel-helper-module-transforms-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.25.9.tgz -> @babel-helper-optimise-call-expression-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.27.1.tgz -> @babel-helper-optimise-call-expression-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.25.7.tgz -> @babel-helper-plugin-utils-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.27.1.tgz -> @babel-helper-plugin-utils-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.27.1.tgz -> @babel-helper-remap-async-to-generator-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.26.5.tgz -> @babel-helper-replace-supers-7.26.5.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.27.1.tgz -> @babel-helper-replace-supers-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.25.9.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.27.1.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.27.1.tgz -> @babel-helper-string-parser-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.25.9.tgz -> @babel-helper-validator-identifier-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.27.1.tgz -> @babel-helper-validator-identifier-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.27.1.tgz -> @babel-helper-validator-option-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.28.3.tgz -> @babel-helper-wrap-function-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.28.3.tgz -> @babel-helpers-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.25.9.tgz -> @babel-highlight-7.25.9.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.25.8.tgz -> @babel-parser-7.25.8.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.26.10.tgz -> @babel-parser-7.26.10.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.27.0.tgz -> @babel-parser-7.27.0.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.28.0.tgz -> @babel-parser-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.28.3.tgz -> @babel-parser-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-firefox-class-in-computed-class-key/-/plugin-bugfix-firefox-class-in-computed-class-key-7.27.1.tgz -> @babel-plugin-bugfix-firefox-class-in-computed-class-key-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-class-field-initializer-scope/-/plugin-bugfix-safari-class-field-initializer-scope-7.27.1.tgz -> @babel-plugin-bugfix-safari-class-field-initializer-scope-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.27.1.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.27.1.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-static-class-fields-redefine-readonly/-/plugin-bugfix-v8-static-class-fields-redefine-readonly-7.28.3.tgz -> @babel-plugin-bugfix-v8-static-class-fields-redefine-readonly-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-decorators/-/plugin-proposal-decorators-7.28.0.tgz -> @babel-plugin-proposal-decorators-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-export-default-from/-/plugin-proposal-export-default-from-7.27.1.tgz -> @babel-plugin-proposal-export-default-from-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.18.6.tgz -> @babel-plugin-proposal-private-methods-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz -> @babel-plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz -> @babel-plugin-syntax-bigint-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz -> @babel-plugin-syntax-class-properties-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz -> @babel-plugin-syntax-class-static-block-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-decorators/-/plugin-syntax-decorators-7.27.1.tgz -> @babel-plugin-syntax-decorators-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz -> @babel-plugin-syntax-dynamic-import-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-assertions/-/plugin-syntax-import-assertions-7.27.1.tgz -> @babel-plugin-syntax-import-assertions-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.25.7.tgz -> @babel-plugin-syntax-import-attributes-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.27.1.tgz -> @babel-plugin-syntax-import-attributes-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz -> @babel-plugin-syntax-import-meta-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz -> @babel-plugin-syntax-json-strings-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.25.7.tgz -> @babel-plugin-syntax-jsx-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.27.1.tgz -> @babel-plugin-syntax-jsx-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz -> @babel-plugin-syntax-logical-assignment-operators-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz -> @babel-plugin-syntax-nullish-coalescing-operator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz -> @babel-plugin-syntax-numeric-separator-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz -> @babel-plugin-syntax-object-rest-spread-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz -> @babel-plugin-syntax-optional-catch-binding-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz -> @babel-plugin-syntax-optional-chaining-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-private-property-in-object/-/plugin-syntax-private-property-in-object-7.14.5.tgz -> @babel-plugin-syntax-private-property-in-object-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz -> @babel-plugin-syntax-top-level-await-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.25.7.tgz -> @babel-plugin-syntax-typescript-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.27.1.tgz -> @babel-plugin-syntax-typescript-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-unicode-sets-regex/-/plugin-syntax-unicode-sets-regex-7.18.6.tgz -> @babel-plugin-syntax-unicode-sets-regex-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.27.1.tgz -> @babel-plugin-transform-arrow-functions-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-generator-functions/-/plugin-transform-async-generator-functions-7.28.0.tgz -> @babel-plugin-transform-async-generator-functions-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.27.1.tgz -> @babel-plugin-transform-async-to-generator-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.27.1.tgz -> @babel-plugin-transform-block-scoped-functions-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.28.0.tgz -> @babel-plugin-transform-block-scoping-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-properties/-/plugin-transform-class-properties-7.27.1.tgz -> @babel-plugin-transform-class-properties-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-static-block/-/plugin-transform-class-static-block-7.28.3.tgz -> @babel-plugin-transform-class-static-block-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.28.3.tgz -> @babel-plugin-transform-classes-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.27.1.tgz -> @babel-plugin-transform-computed-properties-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.28.0.tgz -> @babel-plugin-transform-destructuring-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.27.1.tgz -> @babel-plugin-transform-dotall-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.27.1.tgz -> @babel-plugin-transform-duplicate-keys-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-named-capturing-groups-regex/-/plugin-transform-duplicate-named-capturing-groups-regex-7.27.1.tgz -> @babel-plugin-transform-duplicate-named-capturing-groups-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dynamic-import/-/plugin-transform-dynamic-import-7.27.1.tgz -> @babel-plugin-transform-dynamic-import-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-explicit-resource-management/-/plugin-transform-explicit-resource-management-7.28.0.tgz -> @babel-plugin-transform-explicit-resource-management-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.27.1.tgz -> @babel-plugin-transform-exponentiation-operator-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-export-namespace-from/-/plugin-transform-export-namespace-from-7.27.1.tgz -> @babel-plugin-transform-export-namespace-from-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.27.1.tgz -> @babel-plugin-transform-for-of-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.27.1.tgz -> @babel-plugin-transform-function-name-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-json-strings/-/plugin-transform-json-strings-7.27.1.tgz -> @babel-plugin-transform-json-strings-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.27.1.tgz -> @babel-plugin-transform-literals-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-logical-assignment-operators/-/plugin-transform-logical-assignment-operators-7.27.1.tgz -> @babel-plugin-transform-logical-assignment-operators-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.27.1.tgz -> @babel-plugin-transform-member-expression-literals-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.27.1.tgz -> @babel-plugin-transform-modules-amd-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.27.1.tgz -> @babel-plugin-transform-modules-commonjs-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.27.1.tgz -> @babel-plugin-transform-modules-systemjs-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.27.1.tgz -> @babel-plugin-transform-modules-umd-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.27.1.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.27.1.tgz -> @babel-plugin-transform-new-target-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-nullish-coalescing-operator/-/plugin-transform-nullish-coalescing-operator-7.27.1.tgz -> @babel-plugin-transform-nullish-coalescing-operator-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-numeric-separator/-/plugin-transform-numeric-separator-7.27.1.tgz -> @babel-plugin-transform-numeric-separator-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-rest-spread/-/plugin-transform-object-rest-spread-7.28.0.tgz -> @babel-plugin-transform-object-rest-spread-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.27.1.tgz -> @babel-plugin-transform-object-super-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-catch-binding/-/plugin-transform-optional-catch-binding-7.27.1.tgz -> @babel-plugin-transform-optional-catch-binding-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-chaining/-/plugin-transform-optional-chaining-7.27.1.tgz -> @babel-plugin-transform-optional-chaining-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.27.7.tgz -> @babel-plugin-transform-parameters-7.27.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-methods/-/plugin-transform-private-methods-7.27.1.tgz -> @babel-plugin-transform-private-methods-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-property-in-object/-/plugin-transform-private-property-in-object-7.27.1.tgz -> @babel-plugin-transform-private-property-in-object-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.27.1.tgz -> @babel-plugin-transform-property-literals-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-constant-elements/-/plugin-transform-react-constant-elements-7.25.7.tgz -> @babel-plugin-transform-react-constant-elements-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.27.1.tgz -> @babel-plugin-transform-react-display-name-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.27.1.tgz -> @babel-plugin-transform-react-jsx-development-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.27.1.tgz -> @babel-plugin-transform-react-jsx-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-pure-annotations/-/plugin-transform-react-pure-annotations-7.27.1.tgz -> @babel-plugin-transform-react-pure-annotations-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.28.3.tgz -> @babel-plugin-transform-regenerator-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regexp-modifiers/-/plugin-transform-regexp-modifiers-7.27.1.tgz -> @babel-plugin-transform-regexp-modifiers-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.27.1.tgz -> @babel-plugin-transform-reserved-words-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-runtime/-/plugin-transform-runtime-7.28.3.tgz -> @babel-plugin-transform-runtime-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.27.1.tgz -> @babel-plugin-transform-shorthand-properties-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.27.1.tgz -> @babel-plugin-transform-spread-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.27.1.tgz -> @babel-plugin-transform-sticky-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.27.1.tgz -> @babel-plugin-transform-template-literals-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.27.1.tgz -> @babel-plugin-transform-typeof-symbol-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.27.1.tgz -> @babel-plugin-transform-typescript-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.27.1.tgz -> @babel-plugin-transform-unicode-escapes-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-property-regex/-/plugin-transform-unicode-property-regex-7.27.1.tgz -> @babel-plugin-transform-unicode-property-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.27.1.tgz -> @babel-plugin-transform-unicode-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-sets-regex/-/plugin-transform-unicode-sets-regex-7.27.1.tgz -> @babel-plugin-transform-unicode-sets-regex-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.28.3.tgz -> @babel-preset-env-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.6-no-external-plugins.tgz -> @babel-preset-modules-0.1.6-no-external-plugins.tgz
	https://registry.yarnpkg.com/@babel/preset-react/-/preset-react-7.27.1.tgz -> @babel-preset-react-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.27.1.tgz -> @babel-preset-typescript-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.28.3.tgz -> @babel-runtime-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.27.0.tgz -> @babel-template-7.27.0.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.27.2.tgz -> @babel-template-7.27.2.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.25.7.tgz -> @babel-traverse-7.25.7.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.26.10.tgz -> @babel-traverse-7.26.10.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.27.0.tgz -> @babel-traverse-7.27.0.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.28.0.tgz -> @babel-traverse-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.28.3.tgz -> @babel-traverse-7.28.3.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.25.8.tgz -> @babel-types-7.25.8.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.26.0.tgz -> @babel-types-7.26.0.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.27.0.tgz -> @babel-types-7.27.0.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.27.1.tgz -> @babel-types-7.27.1.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.28.0.tgz -> @babel-types-7.28.0.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.28.1.tgz -> @babel-types-7.28.1.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.28.2.tgz -> @babel-types-7.28.2.tgz
	https://registry.yarnpkg.com/@balena/dockerignore/-/dockerignore-1.0.2.tgz -> @balena-dockerignore-1.0.2.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz -> @bcoe-v8-coverage-0.2.3.tgz
	https://registry.yarnpkg.com/@casualbot/jest-sonar-reporter/-/jest-sonar-reporter-2.2.7.tgz -> @casualbot-jest-sonar-reporter-2.2.7.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.8.1.tgz -> @cspotcode-source-map-support-0.8.1.tgz
	https://registry.yarnpkg.com/@csstools/cascade-layer-name-parser/-/cascade-layer-name-parser-2.0.4.tgz -> @csstools-cascade-layer-name-parser-2.0.4.tgz
	https://registry.yarnpkg.com/@csstools/color-helpers/-/color-helpers-5.0.1.tgz -> @csstools-color-helpers-5.0.1.tgz
	https://registry.yarnpkg.com/@csstools/css-calc/-/css-calc-2.1.1.tgz -> @csstools-css-calc-2.1.1.tgz
	https://registry.yarnpkg.com/@csstools/css-color-parser/-/css-color-parser-3.0.7.tgz -> @csstools-css-color-parser-3.0.7.tgz
	https://registry.yarnpkg.com/@csstools/css-parser-algorithms/-/css-parser-algorithms-3.0.5.tgz -> @csstools-css-parser-algorithms-3.0.5.tgz
	https://registry.yarnpkg.com/@csstools/css-tokenizer/-/css-tokenizer-3.0.4.tgz -> @csstools-css-tokenizer-3.0.4.tgz
	https://registry.yarnpkg.com/@csstools/media-query-list-parser/-/media-query-list-parser-4.0.3.tgz -> @csstools-media-query-list-parser-4.0.3.tgz
	https://registry.yarnpkg.com/@csstools/postcss-cascade-layers/-/postcss-cascade-layers-5.0.1.tgz -> @csstools-postcss-cascade-layers-5.0.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-color-function/-/postcss-color-function-4.0.7.tgz -> @csstools-postcss-color-function-4.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-color-mix-function/-/postcss-color-mix-function-3.0.7.tgz -> @csstools-postcss-color-mix-function-3.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-content-alt-text/-/postcss-content-alt-text-2.0.4.tgz -> @csstools-postcss-content-alt-text-2.0.4.tgz
	https://registry.yarnpkg.com/@csstools/postcss-exponential-functions/-/postcss-exponential-functions-2.0.6.tgz -> @csstools-postcss-exponential-functions-2.0.6.tgz
	https://registry.yarnpkg.com/@csstools/postcss-font-format-keywords/-/postcss-font-format-keywords-4.0.0.tgz -> @csstools-postcss-font-format-keywords-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-gamut-mapping/-/postcss-gamut-mapping-2.0.7.tgz -> @csstools-postcss-gamut-mapping-2.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-gradients-interpolation-method/-/postcss-gradients-interpolation-method-5.0.7.tgz -> @csstools-postcss-gradients-interpolation-method-5.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-hwb-function/-/postcss-hwb-function-4.0.7.tgz -> @csstools-postcss-hwb-function-4.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-ic-unit/-/postcss-ic-unit-4.0.0.tgz -> @csstools-postcss-ic-unit-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-initial/-/postcss-initial-2.0.0.tgz -> @csstools-postcss-initial-2.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-is-pseudo-class/-/postcss-is-pseudo-class-5.0.1.tgz -> @csstools-postcss-is-pseudo-class-5.0.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-light-dark-function/-/postcss-light-dark-function-2.0.7.tgz -> @csstools-postcss-light-dark-function-2.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-logical-float-and-clear/-/postcss-logical-float-and-clear-3.0.0.tgz -> @csstools-postcss-logical-float-and-clear-3.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-logical-overflow/-/postcss-logical-overflow-2.0.0.tgz -> @csstools-postcss-logical-overflow-2.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-logical-overscroll-behavior/-/postcss-logical-overscroll-behavior-2.0.0.tgz -> @csstools-postcss-logical-overscroll-behavior-2.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-logical-resize/-/postcss-logical-resize-3.0.0.tgz -> @csstools-postcss-logical-resize-3.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-logical-viewport-units/-/postcss-logical-viewport-units-3.0.3.tgz -> @csstools-postcss-logical-viewport-units-3.0.3.tgz
	https://registry.yarnpkg.com/@csstools/postcss-media-minmax/-/postcss-media-minmax-2.0.6.tgz -> @csstools-postcss-media-minmax-2.0.6.tgz
	https://registry.yarnpkg.com/@csstools/postcss-media-queries-aspect-ratio-number-values/-/postcss-media-queries-aspect-ratio-number-values-3.0.4.tgz -> @csstools-postcss-media-queries-aspect-ratio-number-values-3.0.4.tgz
	https://registry.yarnpkg.com/@csstools/postcss-nested-calc/-/postcss-nested-calc-4.0.0.tgz -> @csstools-postcss-nested-calc-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-normalize-display-values/-/postcss-normalize-display-values-4.0.0.tgz -> @csstools-postcss-normalize-display-values-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-oklab-function/-/postcss-oklab-function-4.0.7.tgz -> @csstools-postcss-oklab-function-4.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-progressive-custom-properties/-/postcss-progressive-custom-properties-4.0.0.tgz -> @csstools-postcss-progressive-custom-properties-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/postcss-random-function/-/postcss-random-function-1.0.2.tgz -> @csstools-postcss-random-function-1.0.2.tgz
	https://registry.yarnpkg.com/@csstools/postcss-relative-color-syntax/-/postcss-relative-color-syntax-3.0.7.tgz -> @csstools-postcss-relative-color-syntax-3.0.7.tgz
	https://registry.yarnpkg.com/@csstools/postcss-scope-pseudo-class/-/postcss-scope-pseudo-class-4.0.1.tgz -> @csstools-postcss-scope-pseudo-class-4.0.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-sign-functions/-/postcss-sign-functions-1.1.1.tgz -> @csstools-postcss-sign-functions-1.1.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-stepped-value-functions/-/postcss-stepped-value-functions-4.0.6.tgz -> @csstools-postcss-stepped-value-functions-4.0.6.tgz
	https://registry.yarnpkg.com/@csstools/postcss-text-decoration-shorthand/-/postcss-text-decoration-shorthand-4.0.1.tgz -> @csstools-postcss-text-decoration-shorthand-4.0.1.tgz
	https://registry.yarnpkg.com/@csstools/postcss-trigonometric-functions/-/postcss-trigonometric-functions-4.0.6.tgz -> @csstools-postcss-trigonometric-functions-4.0.6.tgz
	https://registry.yarnpkg.com/@csstools/postcss-unset-value/-/postcss-unset-value-4.0.0.tgz -> @csstools-postcss-unset-value-4.0.0.tgz
	https://registry.yarnpkg.com/@csstools/selector-resolve-nested/-/selector-resolve-nested-3.0.0.tgz -> @csstools-selector-resolve-nested-3.0.0.tgz
	https://registry.yarnpkg.com/@csstools/selector-specificity/-/selector-specificity-5.0.0.tgz -> @csstools-selector-specificity-5.0.0.tgz
	https://registry.yarnpkg.com/@csstools/utilities/-/utilities-2.0.0.tgz -> @csstools-utilities-2.0.0.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.6.3.tgz -> @discoveryjs-json-ext-0.6.3.tgz
	https://registry.yarnpkg.com/@dual-bundle/import-meta-resolve/-/import-meta-resolve-4.1.0.tgz -> @dual-bundle-import-meta-resolve-4.1.0.tgz
	https://registry.yarnpkg.com/@element-hq/element-call-embedded/-/element-call-embedded-0.14.1.tgz -> @element-hq-element-call-embedded-0.14.1.tgz
	https://registry.yarnpkg.com/@element-hq/element-web-module-api/-/element-web-module-api-1.4.1.tgz -> @element-hq-element-web-module-api-1.4.1.tgz
	https://registry.yarnpkg.com/@element-hq/element-web-playwright-common/-/element-web-playwright-common-1.4.6.tgz -> @element-hq-element-web-playwright-common-1.4.6.tgz
	https://registry.yarnpkg.com/@emnapi/core/-/core-1.4.5.tgz -> @emnapi-core-1.4.5.tgz
	https://registry.yarnpkg.com/@emnapi/runtime/-/runtime-1.4.5.tgz -> @emnapi-runtime-1.4.5.tgz
	https://registry.yarnpkg.com/@emnapi/wasi-threads/-/wasi-threads-1.0.4.tgz -> @emnapi-wasi-threads-1.0.4.tgz
	https://registry.yarnpkg.com/@esbuild/aix-ppc64/-/aix-ppc64-0.25.8.tgz -> @esbuild-aix-ppc64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/aix-ppc64/-/aix-ppc64-0.25.9.tgz -> @esbuild-aix-ppc64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm/-/android-arm-0.25.8.tgz -> @esbuild-android-arm-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm/-/android-arm-0.25.9.tgz -> @esbuild-android-arm-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm64/-/android-arm64-0.25.8.tgz -> @esbuild-android-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/android-arm64/-/android-arm64-0.25.9.tgz -> @esbuild-android-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/android-x64/-/android-x64-0.25.8.tgz -> @esbuild-android-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/android-x64/-/android-x64-0.25.9.tgz -> @esbuild-android-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-arm64/-/darwin-arm64-0.25.8.tgz -> @esbuild-darwin-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-arm64/-/darwin-arm64-0.25.9.tgz -> @esbuild-darwin-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-x64/-/darwin-x64-0.25.8.tgz -> @esbuild-darwin-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/darwin-x64/-/darwin-x64-0.25.9.tgz -> @esbuild-darwin-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-arm64/-/freebsd-arm64-0.25.8.tgz -> @esbuild-freebsd-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-arm64/-/freebsd-arm64-0.25.9.tgz -> @esbuild-freebsd-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-x64/-/freebsd-x64-0.25.8.tgz -> @esbuild-freebsd-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/freebsd-x64/-/freebsd-x64-0.25.9.tgz -> @esbuild-freebsd-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm/-/linux-arm-0.25.8.tgz -> @esbuild-linux-arm-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm/-/linux-arm-0.25.9.tgz -> @esbuild-linux-arm-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm64/-/linux-arm64-0.25.8.tgz -> @esbuild-linux-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-arm64/-/linux-arm64-0.25.9.tgz -> @esbuild-linux-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ia32/-/linux-ia32-0.25.8.tgz -> @esbuild-linux-ia32-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ia32/-/linux-ia32-0.25.9.tgz -> @esbuild-linux-ia32-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.25.8.tgz -> @esbuild-linux-loong64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-loong64/-/linux-loong64-0.25.9.tgz -> @esbuild-linux-loong64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-mips64el/-/linux-mips64el-0.25.8.tgz -> @esbuild-linux-mips64el-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-mips64el/-/linux-mips64el-0.25.9.tgz -> @esbuild-linux-mips64el-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ppc64/-/linux-ppc64-0.25.8.tgz -> @esbuild-linux-ppc64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-ppc64/-/linux-ppc64-0.25.9.tgz -> @esbuild-linux-ppc64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-riscv64/-/linux-riscv64-0.25.8.tgz -> @esbuild-linux-riscv64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-riscv64/-/linux-riscv64-0.25.9.tgz -> @esbuild-linux-riscv64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-s390x/-/linux-s390x-0.25.8.tgz -> @esbuild-linux-s390x-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-s390x/-/linux-s390x-0.25.9.tgz -> @esbuild-linux-s390x-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/linux-x64/-/linux-x64-0.25.8.tgz -> @esbuild-linux-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/linux-x64/-/linux-x64-0.25.9.tgz -> @esbuild-linux-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-arm64/-/netbsd-arm64-0.25.8.tgz -> @esbuild-netbsd-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-arm64/-/netbsd-arm64-0.25.9.tgz -> @esbuild-netbsd-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-x64/-/netbsd-x64-0.25.8.tgz -> @esbuild-netbsd-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/netbsd-x64/-/netbsd-x64-0.25.9.tgz -> @esbuild-netbsd-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-arm64/-/openbsd-arm64-0.25.8.tgz -> @esbuild-openbsd-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-arm64/-/openbsd-arm64-0.25.9.tgz -> @esbuild-openbsd-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-x64/-/openbsd-x64-0.25.8.tgz -> @esbuild-openbsd-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/openbsd-x64/-/openbsd-x64-0.25.9.tgz -> @esbuild-openbsd-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/openharmony-arm64/-/openharmony-arm64-0.25.8.tgz -> @esbuild-openharmony-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/openharmony-arm64/-/openharmony-arm64-0.25.9.tgz -> @esbuild-openharmony-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/sunos-x64/-/sunos-x64-0.25.8.tgz -> @esbuild-sunos-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/sunos-x64/-/sunos-x64-0.25.9.tgz -> @esbuild-sunos-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/win32-arm64/-/win32-arm64-0.25.8.tgz -> @esbuild-win32-arm64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/win32-arm64/-/win32-arm64-0.25.9.tgz -> @esbuild-win32-arm64-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/win32-ia32/-/win32-ia32-0.25.8.tgz -> @esbuild-win32-ia32-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/win32-ia32/-/win32-ia32-0.25.9.tgz -> @esbuild-win32-ia32-0.25.9.tgz
	https://registry.yarnpkg.com/@esbuild/win32-x64/-/win32-x64-0.25.8.tgz -> @esbuild-win32-x64-0.25.8.tgz
	https://registry.yarnpkg.com/@esbuild/win32-x64/-/win32-x64-0.25.9.tgz -> @esbuild-win32-x64-0.25.9.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.6.1.tgz -> @eslint-community-eslint-utils-4.6.1.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.7.0.tgz -> @eslint-community-eslint-utils-4.7.0.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.11.1.tgz -> @eslint-community-regexpp-4.11.1.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.12.1.tgz -> @eslint-community-regexpp-4.12.1.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.4.tgz -> @eslint-eslintrc-2.1.4.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.57.1.tgz -> @eslint-js-8.57.1.tgz
	https://registry.yarnpkg.com/@figspec/components/-/components-1.0.3.tgz -> @figspec-components-1.0.3.tgz
	https://registry.yarnpkg.com/@figspec/react/-/react-1.0.4.tgz -> @figspec-react-1.0.4.tgz
	https://registry.yarnpkg.com/@floating-ui/core/-/core-1.7.3.tgz -> @floating-ui-core-1.7.3.tgz
	https://registry.yarnpkg.com/@floating-ui/dom/-/dom-1.7.3.tgz -> @floating-ui-dom-1.7.3.tgz
	https://registry.yarnpkg.com/@floating-ui/react-dom/-/react-dom-2.1.5.tgz -> @floating-ui-react-dom-2.1.5.tgz
	https://registry.yarnpkg.com/@floating-ui/react/-/react-0.27.15.tgz -> @floating-ui-react-0.27.15.tgz
	https://registry.yarnpkg.com/@floating-ui/utils/-/utils-0.2.10.tgz -> @floating-ui-utils-0.2.10.tgz
	https://registry.yarnpkg.com/@fontsource/inconsolata/-/inconsolata-5.2.6.tgz -> @fontsource-inconsolata-5.2.6.tgz
	https://registry.yarnpkg.com/@fontsource/inter/-/inter-5.2.6.tgz -> @fontsource-inter-5.2.6.tgz
	https://registry.yarnpkg.com/@formatjs/ecma402-abstract/-/ecma402-abstract-2.3.4.tgz -> @formatjs-ecma402-abstract-2.3.4.tgz
	https://registry.yarnpkg.com/@formatjs/fast-memoize/-/fast-memoize-2.2.7.tgz -> @formatjs-fast-memoize-2.2.7.tgz
	https://registry.yarnpkg.com/@formatjs/intl-localematcher/-/intl-localematcher-0.6.1.tgz -> @formatjs-intl-localematcher-0.6.1.tgz
	https://registry.yarnpkg.com/@formatjs/intl-segmenter/-/intl-segmenter-11.7.10.tgz -> @formatjs-intl-segmenter-11.7.10.tgz
	https://registry.yarnpkg.com/@grpc/grpc-js/-/grpc-js-1.13.4.tgz -> @grpc-grpc-js-1.13.4.tgz
	https://registry.yarnpkg.com/@grpc/proto-loader/-/proto-loader-0.7.15.tgz -> @grpc-proto-loader-0.7.15.tgz
	https://registry.yarnpkg.com/@hapi/hoek/-/hoek-9.3.0.tgz -> @hapi-hoek-9.3.0.tgz
	https://registry.yarnpkg.com/@hapi/topo/-/topo-5.1.0.tgz -> @hapi-topo-5.1.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.13.0.tgz -> @humanwhocodes-config-array-0.13.0.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-2.0.3.tgz -> @humanwhocodes-object-schema-2.0.3.tgz
	https://registry.yarnpkg.com/@isaacs/balanced-match/-/balanced-match-4.0.1.tgz -> @isaacs-balanced-match-4.0.1.tgz
	https://registry.yarnpkg.com/@isaacs/brace-expansion/-/brace-expansion-5.0.0.tgz -> @isaacs-brace-expansion-5.0.0.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz -> @istanbuljs-load-nyc-config-1.1.0.tgz
	https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.3.tgz -> @istanbuljs-schema-0.1.3.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-29.7.0.tgz -> @jest-console-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-29.7.0.tgz -> @jest-core-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/create-cache-key-function/-/create-cache-key-function-29.7.0.tgz -> @jest-create-cache-key-function-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-29.7.0.tgz -> @jest-environment-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/expect-utils/-/expect-utils-29.7.0.tgz -> @jest-expect-utils-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/expect/-/expect-29.7.0.tgz -> @jest-expect-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-29.7.0.tgz -> @jest-fake-timers-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/globals/-/globals-29.7.0.tgz -> @jest-globals-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-29.7.0.tgz -> @jest-reporters-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/schemas/-/schemas-29.6.3.tgz -> @jest-schemas-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-29.6.3.tgz -> @jest-source-map-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-29.7.0.tgz -> @jest-test-result-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-29.7.0.tgz -> @jest-test-sequencer-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-29.7.0.tgz -> @jest-transform-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-29.6.3.tgz -> @jest-types-29.6.3.tgz
	https://registry.yarnpkg.com/@joshwooding/vite-plugin-react-docgen-typescript/-/vite-plugin-react-docgen-typescript-0.6.1.tgz -> @joshwooding-vite-plugin-react-docgen-typescript-0.6.1.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz -> @jridgewell-gen-mapping-0.3.13.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> @jridgewell-resolve-uri-3.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.11.tgz -> @jridgewell-source-map-0.3.11.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.4.tgz -> @jridgewell-sourcemap-codec-1.5.4.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz -> @jridgewell-sourcemap-codec-1.5.5.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.25.tgz -> @jridgewell-trace-mapping-0.3.25.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.30.tgz -> @jridgewell-trace-mapping-0.3.30.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.9.tgz -> @jridgewell-trace-mapping-0.3.9.tgz
	https://registry.yarnpkg.com/@js-sdsl/ordered-map/-/ordered-map-4.4.2.tgz -> @js-sdsl-ordered-map-4.4.2.tgz
	https://registry.yarnpkg.com/@jsonjoy.com/base64/-/base64-1.1.2.tgz -> @jsonjoy.com-base64-1.1.2.tgz
	https://registry.yarnpkg.com/@jsonjoy.com/json-pack/-/json-pack-1.2.0.tgz -> @jsonjoy.com-json-pack-1.2.0.tgz
	https://registry.yarnpkg.com/@jsonjoy.com/util/-/util-1.6.0.tgz -> @jsonjoy.com-util-1.6.0.tgz
	https://registry.yarnpkg.com/@keyv/serialize/-/serialize-1.1.0.tgz -> @keyv-serialize-1.1.0.tgz
	https://registry.yarnpkg.com/@leichtgewicht/ip-codec/-/ip-codec-2.0.5.tgz -> @leichtgewicht-ip-codec-2.0.5.tgz
	https://registry.yarnpkg.com/@lit-labs/react/-/react-1.2.1.tgz -> @lit-labs-react-1.2.1.tgz
	https://registry.yarnpkg.com/@lit-labs/ssr-dom-shim/-/ssr-dom-shim-1.4.0.tgz -> @lit-labs-ssr-dom-shim-1.4.0.tgz
	https://registry.yarnpkg.com/@lit/reactive-element/-/reactive-element-1.6.3.tgz -> @lit-reactive-element-1.6.3.tgz
	https://registry.yarnpkg.com/@mapbox/geojson-rewind/-/geojson-rewind-0.5.2.tgz -> @mapbox-geojson-rewind-0.5.2.tgz
	https://registry.yarnpkg.com/@mapbox/jsonlint-lines-primitives/-/jsonlint-lines-primitives-2.0.2.tgz -> @mapbox-jsonlint-lines-primitives-2.0.2.tgz
	https://registry.yarnpkg.com/@mapbox/point-geometry/-/point-geometry-1.1.0.tgz -> @mapbox-point-geometry-1.1.0.tgz
	https://registry.yarnpkg.com/@mapbox/tiny-sdf/-/tiny-sdf-2.0.7.tgz -> @mapbox-tiny-sdf-2.0.7.tgz
	https://registry.yarnpkg.com/@mapbox/unitbezier/-/unitbezier-0.0.1.tgz -> @mapbox-unitbezier-0.0.1.tgz
	https://registry.yarnpkg.com/@mapbox/vector-tile/-/vector-tile-2.0.4.tgz -> @mapbox-vector-tile-2.0.4.tgz
	https://registry.yarnpkg.com/@mapbox/whoots-js/-/whoots-js-3.1.0.tgz -> @mapbox-whoots-js-3.1.0.tgz
	https://registry.yarnpkg.com/@maplibre/maplibre-gl-style-spec/-/maplibre-gl-style-spec-23.3.0.tgz -> @maplibre-maplibre-gl-style-spec-23.3.0.tgz
	https://registry.yarnpkg.com/@maplibre/vt-pbf/-/vt-pbf-4.0.3.tgz -> @maplibre-vt-pbf-4.0.3.tgz
	https://registry.yarnpkg.com/@matrix-org/analytics-events/-/analytics-events-0.29.2.tgz -> @matrix-org-analytics-events-0.29.2.tgz
	https://registry.yarnpkg.com/@matrix-org/emojibase-bindings/-/emojibase-bindings-1.3.4.tgz -> @matrix-org-emojibase-bindings-1.3.4.tgz
	https://registry.yarnpkg.com/@matrix-org/matrix-sdk-crypto-wasm/-/matrix-sdk-crypto-wasm-15.1.0.tgz -> @matrix-org-matrix-sdk-crypto-wasm-15.1.0.tgz
	https://registry.yarnpkg.com/@matrix-org/react-sdk-module-api/-/react-sdk-module-api-2.5.0.tgz -> @matrix-org-react-sdk-module-api-2.5.0.tgz
	https://registry.yarnpkg.com/@matrix-org/spec/-/spec-1.14.0.tgz -> @matrix-org-spec-1.14.0.tgz
	https://registry.yarnpkg.com/@mdx-js/react/-/react-3.1.0.tgz -> @mdx-js-react-3.1.0.tgz
	https://registry.yarnpkg.com/@napi-rs/wasm-runtime/-/wasm-runtime-1.0.1.tgz -> @napi-rs-wasm-runtime-1.0.1.tgz
	https://registry.yarnpkg.com/@nicolo-ribaudo/eslint-scope-5-internals/-/eslint-scope-5-internals-5.1.1-v1.tgz -> @nicolo-ribaudo-eslint-scope-5-internals-5.1.1-v1.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-android-arm-eabi/-/binding-android-arm-eabi-11.6.0.tgz -> @oxc-resolver-binding-android-arm-eabi-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-android-arm64/-/binding-android-arm64-11.6.0.tgz -> @oxc-resolver-binding-android-arm64-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-darwin-arm64/-/binding-darwin-arm64-11.6.0.tgz -> @oxc-resolver-binding-darwin-arm64-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-darwin-x64/-/binding-darwin-x64-11.6.0.tgz -> @oxc-resolver-binding-darwin-x64-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-freebsd-x64/-/binding-freebsd-x64-11.6.0.tgz -> @oxc-resolver-binding-freebsd-x64-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-arm-gnueabihf/-/binding-linux-arm-gnueabihf-11.6.0.tgz -> @oxc-resolver-binding-linux-arm-gnueabihf-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-arm-musleabihf/-/binding-linux-arm-musleabihf-11.6.0.tgz -> @oxc-resolver-binding-linux-arm-musleabihf-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-arm64-gnu/-/binding-linux-arm64-gnu-11.6.0.tgz -> @oxc-resolver-binding-linux-arm64-gnu-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-arm64-musl/-/binding-linux-arm64-musl-11.6.0.tgz -> @oxc-resolver-binding-linux-arm64-musl-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-ppc64-gnu/-/binding-linux-ppc64-gnu-11.6.0.tgz -> @oxc-resolver-binding-linux-ppc64-gnu-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-riscv64-gnu/-/binding-linux-riscv64-gnu-11.6.0.tgz -> @oxc-resolver-binding-linux-riscv64-gnu-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-riscv64-musl/-/binding-linux-riscv64-musl-11.6.0.tgz -> @oxc-resolver-binding-linux-riscv64-musl-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-s390x-gnu/-/binding-linux-s390x-gnu-11.6.0.tgz -> @oxc-resolver-binding-linux-s390x-gnu-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-x64-gnu/-/binding-linux-x64-gnu-11.6.0.tgz -> @oxc-resolver-binding-linux-x64-gnu-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-linux-x64-musl/-/binding-linux-x64-musl-11.6.0.tgz -> @oxc-resolver-binding-linux-x64-musl-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-wasm32-wasi/-/binding-wasm32-wasi-11.6.0.tgz -> @oxc-resolver-binding-wasm32-wasi-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-win32-arm64-msvc/-/binding-win32-arm64-msvc-11.6.0.tgz -> @oxc-resolver-binding-win32-arm64-msvc-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-win32-ia32-msvc/-/binding-win32-ia32-msvc-11.6.0.tgz -> @oxc-resolver-binding-win32-ia32-msvc-11.6.0.tgz
	https://registry.yarnpkg.com/@oxc-resolver/binding-win32-x64-msvc/-/binding-win32-x64-msvc-11.6.0.tgz -> @oxc-resolver-binding-win32-x64-msvc-11.6.0.tgz
	https://registry.yarnpkg.com/@peculiar/asn1-schema/-/asn1-schema-2.3.13.tgz -> @peculiar-asn1-schema-2.3.13.tgz
	https://registry.yarnpkg.com/@peculiar/json-schema/-/json-schema-1.1.12.tgz -> @peculiar-json-schema-1.1.12.tgz
	https://registry.yarnpkg.com/@peculiar/webcrypto/-/webcrypto-1.5.0.tgz -> @peculiar-webcrypto-1.5.0.tgz
	https://registry.yarnpkg.com/@pkgjs/parseargs/-/parseargs-0.11.0.tgz -> @pkgjs-parseargs-0.11.0.tgz
	https://registry.yarnpkg.com/@playwright/test/-/test-1.54.2.tgz -> @playwright-test-1.54.2.tgz
	https://registry.yarnpkg.com/@polka/url/-/url-1.0.0-next.28.tgz -> @polka-url-1.0.0-next.28.tgz
	https://registry.yarnpkg.com/@principalstudio/html-webpack-inject-preload/-/html-webpack-inject-preload-1.2.7.tgz -> @principalstudio-html-webpack-inject-preload-1.2.7.tgz
	https://registry.yarnpkg.com/@protobufjs/aspromise/-/aspromise-1.1.2.tgz -> @protobufjs-aspromise-1.1.2.tgz
	https://registry.yarnpkg.com/@protobufjs/base64/-/base64-1.1.2.tgz -> @protobufjs-base64-1.1.2.tgz
	https://registry.yarnpkg.com/@protobufjs/codegen/-/codegen-2.0.4.tgz -> @protobufjs-codegen-2.0.4.tgz
	https://registry.yarnpkg.com/@protobufjs/eventemitter/-/eventemitter-1.1.0.tgz -> @protobufjs-eventemitter-1.1.0.tgz
	https://registry.yarnpkg.com/@protobufjs/fetch/-/fetch-1.1.0.tgz -> @protobufjs-fetch-1.1.0.tgz
	https://registry.yarnpkg.com/@protobufjs/float/-/float-1.0.2.tgz -> @protobufjs-float-1.0.2.tgz
	https://registry.yarnpkg.com/@protobufjs/inquire/-/inquire-1.1.0.tgz -> @protobufjs-inquire-1.1.0.tgz
	https://registry.yarnpkg.com/@protobufjs/path/-/path-1.1.2.tgz -> @protobufjs-path-1.1.2.tgz
	https://registry.yarnpkg.com/@protobufjs/pool/-/pool-1.1.0.tgz -> @protobufjs-pool-1.1.0.tgz
	https://registry.yarnpkg.com/@protobufjs/utf8/-/utf8-1.1.0.tgz -> @protobufjs-utf8-1.1.0.tgz
	https://registry.yarnpkg.com/@radix-ui/primitive/-/primitive-1.1.2.tgz -> @radix-ui-primitive-1.1.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-arrow/-/react-arrow-1.1.7.tgz -> @radix-ui-react-arrow-1.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-collection/-/react-collection-1.1.7.tgz -> @radix-ui-react-collection-1.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-compose-refs/-/react-compose-refs-1.1.2.tgz -> @radix-ui-react-compose-refs-1.1.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-context-menu/-/react-context-menu-2.2.15.tgz -> @radix-ui-react-context-menu-2.2.15.tgz
	https://registry.yarnpkg.com/@radix-ui/react-context/-/react-context-1.1.2.tgz -> @radix-ui-react-context-1.1.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-dialog/-/react-dialog-1.1.14.tgz -> @radix-ui-react-dialog-1.1.14.tgz
	https://registry.yarnpkg.com/@radix-ui/react-direction/-/react-direction-1.1.1.tgz -> @radix-ui-react-direction-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-dismissable-layer/-/react-dismissable-layer-1.1.10.tgz -> @radix-ui-react-dismissable-layer-1.1.10.tgz
	https://registry.yarnpkg.com/@radix-ui/react-dropdown-menu/-/react-dropdown-menu-2.1.15.tgz -> @radix-ui-react-dropdown-menu-2.1.15.tgz
	https://registry.yarnpkg.com/@radix-ui/react-focus-guards/-/react-focus-guards-1.1.2.tgz -> @radix-ui-react-focus-guards-1.1.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-focus-scope/-/react-focus-scope-1.1.7.tgz -> @radix-ui-react-focus-scope-1.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-form/-/react-form-0.1.7.tgz -> @radix-ui-react-form-0.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-id/-/react-id-1.1.1.tgz -> @radix-ui-react-id-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-label/-/react-label-2.1.7.tgz -> @radix-ui-react-label-2.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-menu/-/react-menu-2.1.15.tgz -> @radix-ui-react-menu-2.1.15.tgz
	https://registry.yarnpkg.com/@radix-ui/react-popper/-/react-popper-1.2.7.tgz -> @radix-ui-react-popper-1.2.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-portal/-/react-portal-1.1.9.tgz -> @radix-ui-react-portal-1.1.9.tgz
	https://registry.yarnpkg.com/@radix-ui/react-presence/-/react-presence-1.1.4.tgz -> @radix-ui-react-presence-1.1.4.tgz
	https://registry.yarnpkg.com/@radix-ui/react-primitive/-/react-primitive-2.1.3.tgz -> @radix-ui-react-primitive-2.1.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-progress/-/react-progress-1.1.7.tgz -> @radix-ui-react-progress-1.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-roving-focus/-/react-roving-focus-1.1.10.tgz -> @radix-ui-react-roving-focus-1.1.10.tgz
	https://registry.yarnpkg.com/@radix-ui/react-separator/-/react-separator-1.1.7.tgz -> @radix-ui-react-separator-1.1.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-slot/-/react-slot-1.2.3.tgz -> @radix-ui-react-slot-1.2.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-callback-ref/-/react-use-callback-ref-1.1.1.tgz -> @radix-ui-react-use-callback-ref-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-controllable-state/-/react-use-controllable-state-1.2.2.tgz -> @radix-ui-react-use-controllable-state-1.2.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-effect-event/-/react-use-effect-event-0.0.2.tgz -> @radix-ui-react-use-effect-event-0.0.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-escape-keydown/-/react-use-escape-keydown-1.1.1.tgz -> @radix-ui-react-use-escape-keydown-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-layout-effect/-/react-use-layout-effect-1.1.1.tgz -> @radix-ui-react-use-layout-effect-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-rect/-/react-use-rect-1.1.1.tgz -> @radix-ui-react-use-rect-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-size/-/react-use-size-1.1.1.tgz -> @radix-ui-react-use-size-1.1.1.tgz
	https://registry.yarnpkg.com/@radix-ui/rect/-/rect-1.1.1.tgz -> @radix-ui-rect-1.1.1.tgz
	https://registry.yarnpkg.com/@rollup/plugin-inject/-/plugin-inject-5.0.5.tgz -> @rollup-plugin-inject-5.0.5.tgz
	https://registry.yarnpkg.com/@rollup/pluginutils/-/pluginutils-5.2.0.tgz -> @rollup-pluginutils-5.2.0.tgz
	https://registry.yarnpkg.com/@rollup/rollup-android-arm-eabi/-/rollup-android-arm-eabi-4.46.3.tgz -> @rollup-rollup-android-arm-eabi-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-android-arm64/-/rollup-android-arm64-4.46.3.tgz -> @rollup-rollup-android-arm64-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-darwin-arm64/-/rollup-darwin-arm64-4.46.3.tgz -> @rollup-rollup-darwin-arm64-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-darwin-x64/-/rollup-darwin-x64-4.46.3.tgz -> @rollup-rollup-darwin-x64-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-freebsd-arm64/-/rollup-freebsd-arm64-4.46.3.tgz -> @rollup-rollup-freebsd-arm64-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-freebsd-x64/-/rollup-freebsd-x64-4.46.3.tgz -> @rollup-rollup-freebsd-x64-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-arm-gnueabihf/-/rollup-linux-arm-gnueabihf-4.46.3.tgz -> @rollup-rollup-linux-arm-gnueabihf-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-arm-musleabihf/-/rollup-linux-arm-musleabihf-4.46.3.tgz -> @rollup-rollup-linux-arm-musleabihf-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-arm64-gnu/-/rollup-linux-arm64-gnu-4.46.3.tgz -> @rollup-rollup-linux-arm64-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-arm64-musl/-/rollup-linux-arm64-musl-4.46.3.tgz -> @rollup-rollup-linux-arm64-musl-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-loongarch64-gnu/-/rollup-linux-loongarch64-gnu-4.46.3.tgz -> @rollup-rollup-linux-loongarch64-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-ppc64-gnu/-/rollup-linux-ppc64-gnu-4.46.3.tgz -> @rollup-rollup-linux-ppc64-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-riscv64-gnu/-/rollup-linux-riscv64-gnu-4.46.3.tgz -> @rollup-rollup-linux-riscv64-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-riscv64-musl/-/rollup-linux-riscv64-musl-4.46.3.tgz -> @rollup-rollup-linux-riscv64-musl-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-s390x-gnu/-/rollup-linux-s390x-gnu-4.46.3.tgz -> @rollup-rollup-linux-s390x-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-x64-gnu/-/rollup-linux-x64-gnu-4.46.3.tgz -> @rollup-rollup-linux-x64-gnu-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-linux-x64-musl/-/rollup-linux-x64-musl-4.46.3.tgz -> @rollup-rollup-linux-x64-musl-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-win32-arm64-msvc/-/rollup-win32-arm64-msvc-4.46.3.tgz -> @rollup-rollup-win32-arm64-msvc-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-win32-ia32-msvc/-/rollup-win32-ia32-msvc-4.46.3.tgz -> @rollup-rollup-win32-ia32-msvc-4.46.3.tgz
	https://registry.yarnpkg.com/@rollup/rollup-win32-x64-msvc/-/rollup-win32-x64-msvc-4.46.3.tgz -> @rollup-rollup-win32-x64-msvc-4.46.3.tgz
	https://registry.yarnpkg.com/@rrweb/types/-/types-2.0.0-alpha.18.tgz -> @rrweb-types-2.0.0-alpha.18.tgz
	https://registry.yarnpkg.com/@rtsao/scc/-/scc-1.1.0.tgz -> @rtsao-scc-1.1.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/browser-utils/-/browser-utils-10.5.0.tgz -> @sentry-internal-browser-utils-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/feedback/-/feedback-10.5.0.tgz -> @sentry-internal-feedback-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/replay-canvas/-/replay-canvas-10.5.0.tgz -> @sentry-internal-replay-canvas-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry-internal/replay/-/replay-10.5.0.tgz -> @sentry-internal-replay-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry/babel-plugin-component-annotate/-/babel-plugin-component-annotate-4.1.1.tgz -> @sentry-babel-plugin-component-annotate-4.1.1.tgz
	https://registry.yarnpkg.com/@sentry/browser/-/browser-10.5.0.tgz -> @sentry-browser-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry/bundler-plugin-core/-/bundler-plugin-core-4.1.1.tgz -> @sentry-bundler-plugin-core-4.1.1.tgz
	https://registry.yarnpkg.com/@sentry/cli-darwin/-/cli-darwin-2.52.0.tgz -> @sentry-cli-darwin-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-linux-arm/-/cli-linux-arm-2.52.0.tgz -> @sentry-cli-linux-arm-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-linux-arm64/-/cli-linux-arm64-2.52.0.tgz -> @sentry-cli-linux-arm64-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-linux-i686/-/cli-linux-i686-2.52.0.tgz -> @sentry-cli-linux-i686-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-linux-x64/-/cli-linux-x64-2.52.0.tgz -> @sentry-cli-linux-x64-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-win32-arm64/-/cli-win32-arm64-2.52.0.tgz -> @sentry-cli-win32-arm64-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-win32-i686/-/cli-win32-i686-2.52.0.tgz -> @sentry-cli-win32-i686-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli-win32-x64/-/cli-win32-x64-2.52.0.tgz -> @sentry-cli-win32-x64-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/cli/-/cli-2.52.0.tgz -> @sentry-cli-2.52.0.tgz
	https://registry.yarnpkg.com/@sentry/core/-/core-10.5.0.tgz -> @sentry-core-10.5.0.tgz
	https://registry.yarnpkg.com/@sentry/webpack-plugin/-/webpack-plugin-4.1.1.tgz -> @sentry-webpack-plugin-4.1.1.tgz
	https://registry.yarnpkg.com/@sideway/address/-/address-4.1.5.tgz -> @sideway-address-4.1.5.tgz
	https://registry.yarnpkg.com/@sideway/formula/-/formula-3.0.1.tgz -> @sideway-formula-3.0.1.tgz
	https://registry.yarnpkg.com/@sideway/pinpoint/-/pinpoint-2.0.0.tgz -> @sideway-pinpoint-2.0.0.tgz
	https://registry.yarnpkg.com/@sinclair/typebox/-/typebox-0.27.8.tgz -> @sinclair-typebox-0.27.8.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-3.0.1.tgz -> @sinonjs-commons-3.0.1.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-10.3.0.tgz -> @sinonjs-fake-timers-10.3.0.tgz
	https://registry.yarnpkg.com/@storybook/addon-designs/-/addon-designs-10.0.2.tgz -> @storybook-addon-designs-10.0.2.tgz
	https://registry.yarnpkg.com/@storybook/addon-docs/-/addon-docs-9.0.18.tgz -> @storybook-addon-docs-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/builder-vite/-/builder-vite-9.0.18.tgz -> @storybook-builder-vite-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/csf-plugin/-/csf-plugin-9.0.18.tgz -> @storybook-csf-plugin-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/global/-/global-5.0.0.tgz -> @storybook-global-5.0.0.tgz
	https://registry.yarnpkg.com/@storybook/icons/-/icons-1.4.0.tgz -> @storybook-icons-1.4.0.tgz
	https://registry.yarnpkg.com/@storybook/react-dom-shim/-/react-dom-shim-9.0.18.tgz -> @storybook-react-dom-shim-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/react-vite/-/react-vite-9.0.18.tgz -> @storybook-react-vite-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/react/-/react-9.0.18.tgz -> @storybook-react-9.0.18.tgz
	https://registry.yarnpkg.com/@storybook/test-runner/-/test-runner-0.23.0.tgz -> @storybook-test-runner-0.23.0.tgz
	https://registry.yarnpkg.com/@stylistic/eslint-plugin/-/eslint-plugin-5.2.3.tgz -> @stylistic-eslint-plugin-5.2.3.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-8.0.0.tgz -> @svgr-babel-plugin-add-jsx-attribute-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-8.0.0.tgz -> @svgr-babel-plugin-remove-jsx-attribute-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-8.0.0.tgz -> @svgr-babel-plugin-remove-jsx-empty-expression-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-8.0.0.tgz -> @svgr-babel-plugin-replace-jsx-attribute-value-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-8.0.0.tgz -> @svgr-babel-plugin-svg-dynamic-title-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-8.0.0.tgz -> @svgr-babel-plugin-svg-em-dimensions-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-8.1.0.tgz -> @svgr-babel-plugin-transform-react-native-svg-8.1.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-8.0.0.tgz -> @svgr-babel-plugin-transform-svg-component-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-8.1.0.tgz -> @svgr-babel-preset-8.1.0.tgz
	https://registry.yarnpkg.com/@svgr/core/-/core-8.1.0.tgz -> @svgr-core-8.1.0.tgz
	https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-8.0.0.tgz -> @svgr-hast-util-to-babel-ast-8.0.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-8.1.0.tgz -> @svgr-plugin-jsx-8.1.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-8.1.0.tgz -> @svgr-plugin-svgo-8.1.0.tgz
	https://registry.yarnpkg.com/@svgr/webpack/-/webpack-8.1.0.tgz -> @svgr-webpack-8.1.0.tgz
	https://registry.yarnpkg.com/@swc/core-darwin-arm64/-/core-darwin-arm64-1.12.9.tgz -> @swc-core-darwin-arm64-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-darwin-x64/-/core-darwin-x64-1.12.9.tgz -> @swc-core-darwin-x64-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-linux-arm-gnueabihf/-/core-linux-arm-gnueabihf-1.12.9.tgz -> @swc-core-linux-arm-gnueabihf-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-linux-arm64-gnu/-/core-linux-arm64-gnu-1.12.9.tgz -> @swc-core-linux-arm64-gnu-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-linux-arm64-musl/-/core-linux-arm64-musl-1.12.9.tgz -> @swc-core-linux-arm64-musl-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-linux-x64-gnu/-/core-linux-x64-gnu-1.12.9.tgz -> @swc-core-linux-x64-gnu-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-linux-x64-musl/-/core-linux-x64-musl-1.12.9.tgz -> @swc-core-linux-x64-musl-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-win32-arm64-msvc/-/core-win32-arm64-msvc-1.12.9.tgz -> @swc-core-win32-arm64-msvc-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-win32-ia32-msvc/-/core-win32-ia32-msvc-1.12.9.tgz -> @swc-core-win32-ia32-msvc-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core-win32-x64-msvc/-/core-win32-x64-msvc-1.12.9.tgz -> @swc-core-win32-x64-msvc-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/core/-/core-1.12.9.tgz -> @swc-core-1.12.9.tgz
	https://registry.yarnpkg.com/@swc/counter/-/counter-0.1.3.tgz -> @swc-counter-0.1.3.tgz
	https://registry.yarnpkg.com/@swc/jest/-/jest-0.2.38.tgz -> @swc-jest-0.2.38.tgz
	https://registry.yarnpkg.com/@swc/types/-/types-0.1.23.tgz -> @swc-types-0.1.23.tgz
	https://registry.yarnpkg.com/@testcontainers/postgresql/-/postgresql-11.0.3.tgz -> @testcontainers-postgresql-11.0.3.tgz
	https://registry.yarnpkg.com/@testing-library/dom/-/dom-10.4.1.tgz -> @testing-library-dom-10.4.1.tgz
	https://registry.yarnpkg.com/@testing-library/jest-dom/-/jest-dom-6.7.0.tgz -> @testing-library-jest-dom-6.7.0.tgz
	https://registry.yarnpkg.com/@testing-library/react/-/react-16.3.0.tgz -> @testing-library-react-16.3.0.tgz
	https://registry.yarnpkg.com/@testing-library/user-event/-/user-event-14.6.1.tgz -> @testing-library-user-event-14.6.1.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@trysound/sax/-/sax-0.2.0.tgz -> @trysound-sax-0.2.0.tgz
	https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.11.tgz -> @tsconfig-node10-1.0.11.tgz
	https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.11.tgz -> @tsconfig-node12-1.0.11.tgz
	https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.3.tgz -> @tsconfig-node14-1.0.3.tgz
	https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.4.tgz -> @tsconfig-node16-1.0.4.tgz
	https://registry.yarnpkg.com/@tybys/wasm-util/-/wasm-util-0.10.0.tgz -> @tybys-wasm-util-0.10.0.tgz
	https://registry.yarnpkg.com/@types/aria-query/-/aria-query-5.0.4.tgz -> @types-aria-query-5.0.4.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.20.5.tgz -> @types-babel__core-7.20.5.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.27.0.tgz -> @types-babel__generator-7.27.0.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.4.tgz -> @types-babel__template-7.4.4.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.20.6.tgz -> @types-babel__traverse-7.20.6.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.20.7.tgz -> @types-babel__traverse-7.20.7.tgz
	https://registry.yarnpkg.com/@types/body-parser/-/body-parser-1.19.6.tgz -> @types-body-parser-1.19.6.tgz
	https://registry.yarnpkg.com/@types/bonjour/-/bonjour-3.5.13.tgz -> @types-bonjour-3.5.13.tgz
	https://registry.yarnpkg.com/@types/chai/-/chai-5.2.2.tgz -> @types-chai-5.2.2.tgz
	https://registry.yarnpkg.com/@types/commonmark/-/commonmark-0.27.10.tgz -> @types-commonmark-0.27.10.tgz
	https://registry.yarnpkg.com/@types/connect-history-api-fallback/-/connect-history-api-fallback-1.5.4.tgz -> @types-connect-history-api-fallback-1.5.4.tgz
	https://registry.yarnpkg.com/@types/connect/-/connect-3.4.38.tgz -> @types-connect-3.4.38.tgz
	https://registry.yarnpkg.com/@types/content-type/-/content-type-1.1.9.tgz -> @types-content-type-1.1.9.tgz
	https://registry.yarnpkg.com/@types/counterpart/-/counterpart-0.18.4.tgz -> @types-counterpart-0.18.4.tgz
	https://registry.yarnpkg.com/@types/css-tree/-/css-tree-2.3.10.tgz -> @types-css-tree-2.3.10.tgz
	https://registry.yarnpkg.com/@types/deep-eql/-/deep-eql-4.0.2.tgz -> @types-deep-eql-4.0.2.tgz
	https://registry.yarnpkg.com/@types/diff-match-patch/-/diff-match-patch-1.0.36.tgz -> @types-diff-match-patch-1.0.36.tgz
	https://registry.yarnpkg.com/@types/docker-modem/-/docker-modem-3.0.6.tgz -> @types-docker-modem-3.0.6.tgz
	https://registry.yarnpkg.com/@types/dockerode/-/dockerode-3.3.42.tgz -> @types-dockerode-3.3.42.tgz
	https://registry.yarnpkg.com/@types/doctrine/-/doctrine-0.0.9.tgz -> @types-doctrine-0.0.9.tgz
	https://registry.yarnpkg.com/@types/escape-html/-/escape-html-1.0.4.tgz -> @types-escape-html-1.0.4.tgz
	https://registry.yarnpkg.com/@types/eslint-scope/-/eslint-scope-3.7.7.tgz -> @types-eslint-scope-3.7.7.tgz
	https://registry.yarnpkg.com/@types/eslint/-/eslint-9.6.1.tgz -> @types-eslint-9.6.1.tgz
	https://registry.yarnpkg.com/@types/estree/-/estree-1.0.8.tgz -> @types-estree-1.0.8.tgz
	https://registry.yarnpkg.com/@types/events/-/events-3.0.3.tgz -> @types-events-3.0.3.tgz
	https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-4.19.6.tgz -> @types-express-serve-static-core-4.19.6.tgz
	https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-5.0.6.tgz -> @types-express-serve-static-core-5.0.6.tgz
	https://registry.yarnpkg.com/@types/express/-/express-4.17.23.tgz -> @types-express-4.17.23.tgz
	https://registry.yarnpkg.com/@types/express/-/express-5.0.3.tgz -> @types-express-5.0.3.tgz
	https://registry.yarnpkg.com/@types/file-saver/-/file-saver-2.0.7.tgz -> @types-file-saver-2.0.7.tgz
	https://registry.yarnpkg.com/@types/geojson-vt/-/geojson-vt-3.2.5.tgz -> @types-geojson-vt-3.2.5.tgz
	https://registry.yarnpkg.com/@types/geojson/-/geojson-7946.0.16.tgz -> @types-geojson-7946.0.16.tgz
	https://registry.yarnpkg.com/@types/glob-to-regexp/-/glob-to-regexp-0.4.4.tgz -> @types-glob-to-regexp-0.4.4.tgz
	https://registry.yarnpkg.com/@types/graceful-fs/-/graceful-fs-4.1.9.tgz -> @types-graceful-fs-4.1.9.tgz
	https://registry.yarnpkg.com/@types/hoist-non-react-statics/-/hoist-non-react-statics-3.3.5.tgz -> @types-hoist-non-react-statics-3.3.5.tgz
	https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz -> @types-html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/@types/http-errors/-/http-errors-2.0.5.tgz -> @types-http-errors-2.0.5.tgz
	https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.16.tgz -> @types-http-proxy-1.17.16.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.6.tgz -> @types-istanbul-lib-coverage-2.0.6.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.3.tgz -> @types-istanbul-lib-report-3.0.3.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.4.tgz -> @types-istanbul-reports-3.0.4.tgz
	https://registry.yarnpkg.com/@types/jest/-/jest-29.5.12.tgz -> @types-jest-29.5.12.tgz
	https://registry.yarnpkg.com/@types/jitsi-meet/-/jitsi-meet-2.0.5.tgz -> @types-jitsi-meet-2.0.5.tgz
	https://registry.yarnpkg.com/@types/jsdom/-/jsdom-20.0.1.tgz -> @types-jsdom-20.0.1.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.15.tgz -> @types-json-schema-7.0.15.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/jsrsasign/-/jsrsasign-10.5.15.tgz -> @types-jsrsasign-10.5.15.tgz
	https://registry.yarnpkg.com/@types/katex/-/katex-0.16.7.tgz -> @types-katex-0.16.7.tgz
	https://registry.yarnpkg.com/@types/lodash/-/lodash-4.17.20.tgz -> @types-lodash-4.17.20.tgz
	https://registry.yarnpkg.com/@types/mdx/-/mdx-2.0.13.tgz -> @types-mdx-2.0.13.tgz
	https://registry.yarnpkg.com/@types/mime/-/mime-1.3.5.tgz -> @types-mime-1.3.5.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.5.tgz -> @types-minimist-1.2.5.tgz
	https://registry.yarnpkg.com/@types/modernizr/-/modernizr-3.5.6.tgz -> @types-modernizr-3.5.6.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.6.13.tgz -> @types-node-fetch-2.6.13.tgz
	https://registry.yarnpkg.com/@types/node-forge/-/node-forge-1.3.11.tgz -> @types-node-forge-1.3.11.tgz
	https://registry.yarnpkg.com/@types/node/-/node-18.19.123.tgz -> @types-node-18.19.123.tgz
	https://registry.yarnpkg.com/@types/node/-/node-24.3.0.tgz -> @types-node-24.3.0.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.4.tgz -> @types-normalize-package-data-2.4.4.tgz
	https://registry.yarnpkg.com/@types/pako/-/pako-2.0.4.tgz -> @types-pako-2.0.4.tgz
	https://registry.yarnpkg.com/@types/png-chunks-extract/-/png-chunks-extract-1.0.2.tgz -> @types-png-chunks-extract-1.0.2.tgz
	https://registry.yarnpkg.com/@types/qrcode/-/qrcode-1.5.5.tgz -> @types-qrcode-1.5.5.tgz
	https://registry.yarnpkg.com/@types/qs/-/qs-6.14.0.tgz -> @types-qs-6.14.0.tgz
	https://registry.yarnpkg.com/@types/range-parser/-/range-parser-1.2.7.tgz -> @types-range-parser-1.2.7.tgz
	https://registry.yarnpkg.com/@types/react-beautiful-dnd/-/react-beautiful-dnd-13.1.8.tgz -> @types-react-beautiful-dnd-13.1.8.tgz
	https://registry.yarnpkg.com/@types/react-dom/-/react-dom-19.1.7.tgz -> @types-react-dom-19.1.7.tgz
	https://registry.yarnpkg.com/@types/react-redux/-/react-redux-7.1.34.tgz -> @types-react-redux-7.1.34.tgz
	https://registry.yarnpkg.com/@types/react-transition-group/-/react-transition-group-4.4.12.tgz -> @types-react-transition-group-4.4.12.tgz
	https://registry.yarnpkg.com/@types/react/-/react-19.1.10.tgz -> @types-react-19.1.10.tgz
	https://registry.yarnpkg.com/@types/resolve/-/resolve-1.20.6.tgz -> @types-resolve-1.20.6.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.0.tgz -> @types-retry-0.12.0.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.2.tgz -> @types-retry-0.12.2.tgz
	https://registry.yarnpkg.com/@types/sanitize-html/-/sanitize-html-2.16.0.tgz -> @types-sanitize-html-2.16.0.tgz
	https://registry.yarnpkg.com/@types/sdp-transform/-/sdp-transform-2.4.10.tgz -> @types-sdp-transform-2.4.10.tgz
	https://registry.yarnpkg.com/@types/seedrandom/-/seedrandom-3.0.8.tgz -> @types-seedrandom-3.0.8.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.7.0.tgz -> @types-semver-7.7.0.tgz
	https://registry.yarnpkg.com/@types/send/-/send-0.17.5.tgz -> @types-send-0.17.5.tgz
	https://registry.yarnpkg.com/@types/serve-index/-/serve-index-1.9.4.tgz -> @types-serve-index-1.9.4.tgz
	https://registry.yarnpkg.com/@types/serve-static/-/serve-static-1.15.8.tgz -> @types-serve-static-1.15.8.tgz
	https://registry.yarnpkg.com/@types/sockjs/-/sockjs-0.3.36.tgz -> @types-sockjs-0.3.36.tgz
	https://registry.yarnpkg.com/@types/ssh2-streams/-/ssh2-streams-0.1.12.tgz -> @types-ssh2-streams-0.1.12.tgz
	https://registry.yarnpkg.com/@types/ssh2/-/ssh2-0.5.52.tgz -> @types-ssh2-0.5.52.tgz
	https://registry.yarnpkg.com/@types/ssh2/-/ssh2-1.15.5.tgz -> @types-ssh2-1.15.5.tgz
	https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-2.0.3.tgz -> @types-stack-utils-2.0.3.tgz
	https://registry.yarnpkg.com/@types/supercluster/-/supercluster-7.1.3.tgz -> @types-supercluster-7.1.3.tgz
	https://registry.yarnpkg.com/@types/tar-js/-/tar-js-0.3.5.tgz -> @types-tar-js-0.3.5.tgz
	https://registry.yarnpkg.com/@types/tough-cookie/-/tough-cookie-4.0.5.tgz -> @types-tough-cookie-4.0.5.tgz
	https://registry.yarnpkg.com/@types/trusted-types/-/trusted-types-2.0.7.tgz -> @types-trusted-types-2.0.7.tgz
	https://registry.yarnpkg.com/@types/ua-parser-js/-/ua-parser-js-0.7.39.tgz -> @types-ua-parser-js-0.7.39.tgz
	https://registry.yarnpkg.com/@types/uuid/-/uuid-10.0.0.tgz -> @types-uuid-10.0.0.tgz
	https://registry.yarnpkg.com/@types/wait-on/-/wait-on-5.3.4.tgz -> @types-wait-on-5.3.4.tgz
	https://registry.yarnpkg.com/@types/ws/-/ws-8.18.1.tgz -> @types-ws-8.18.1.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.3.tgz -> @types-yargs-parser-21.0.3.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.33.tgz -> @types-yargs-17.0.33.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-8.40.0.tgz -> @typescript-eslint-eslint-plugin-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-8.40.0.tgz -> @typescript-eslint-parser-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/project-service/-/project-service-8.35.0.tgz -> @typescript-eslint-project-service-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/project-service/-/project-service-8.40.0.tgz -> @typescript-eslint-project-service-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.23.0.tgz -> @typescript-eslint-scope-manager-8.23.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.35.0.tgz -> @typescript-eslint-scope-manager-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-8.40.0.tgz -> @typescript-eslint-scope-manager-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/tsconfig-utils/-/tsconfig-utils-8.35.0.tgz -> @typescript-eslint-tsconfig-utils-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/tsconfig-utils/-/tsconfig-utils-8.36.0.tgz -> @typescript-eslint-tsconfig-utils-8.36.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/tsconfig-utils/-/tsconfig-utils-8.40.0.tgz -> @typescript-eslint-tsconfig-utils-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-8.40.0.tgz -> @typescript-eslint-type-utils-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.23.0.tgz -> @typescript-eslint-types-8.23.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.35.0.tgz -> @typescript-eslint-types-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.36.0.tgz -> @typescript-eslint-types-8.36.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-8.40.0.tgz -> @typescript-eslint-types-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.23.0.tgz -> @typescript-eslint-typescript-estree-8.23.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.35.0.tgz -> @typescript-eslint-typescript-estree-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-8.40.0.tgz -> @typescript-eslint-typescript-estree-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.23.0.tgz -> @typescript-eslint-utils-8.23.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.35.0.tgz -> @typescript-eslint-utils-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-8.40.0.tgz -> @typescript-eslint-utils-8.40.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.23.0.tgz -> @typescript-eslint-visitor-keys-8.23.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.35.0.tgz -> @typescript-eslint-visitor-keys-8.35.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-8.40.0.tgz -> @typescript-eslint-visitor-keys-8.40.0.tgz
	https://registry.yarnpkg.com/@ungap/structured-clone/-/structured-clone-1.2.0.tgz -> @ungap-structured-clone-1.2.0.tgz
	https://registry.yarnpkg.com/@vector-im/compound-design-tokens/-/compound-design-tokens-6.0.0.tgz -> @vector-im-compound-design-tokens-6.0.0.tgz
	https://registry.yarnpkg.com/@vector-im/compound-web/-/compound-web-8.2.1.tgz -> @vector-im-compound-web-8.2.1.tgz
	https://registry.yarnpkg.com/@vector-im/matrix-wysiwyg/-/matrix-wysiwyg-2.39.0.tgz -> @vector-im-matrix-wysiwyg-2.39.0.tgz
	https://registry.yarnpkg.com/@vitest/expect/-/expect-3.2.4.tgz -> @vitest-expect-3.2.4.tgz
	https://registry.yarnpkg.com/@vitest/pretty-format/-/pretty-format-3.2.4.tgz -> @vitest-pretty-format-3.2.4.tgz
	https://registry.yarnpkg.com/@vitest/spy/-/spy-3.2.4.tgz -> @vitest-spy-3.2.4.tgz
	https://registry.yarnpkg.com/@vitest/utils/-/utils-3.2.4.tgz -> @vitest-utils-3.2.4.tgz
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
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-3.0.1.tgz -> @webpack-cli-configtest-3.0.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-3.0.1.tgz -> @webpack-cli-info-3.0.1.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-3.0.1.tgz -> @webpack-cli-serve-3.0.1.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/@yarnpkg/lockfile/-/lockfile-1.1.0.tgz -> @yarnpkg-lockfile-1.1.0.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/core/-/core-3.0.4.tgz -> @zxcvbn-ts-core-3.0.4.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/language-common/-/language-common-3.0.4.tgz -> @zxcvbn-ts-language-common-3.0.4.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/language-en/-/language-en-3.0.2.tgz -> @zxcvbn-ts-language-en-3.0.2.tgz
	https://registry.yarnpkg.com/abab/-/abab-2.0.6.tgz
	https://registry.yarnpkg.com/abort-controller/-/abort-controller-3.0.0.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.8.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-2.0.0.tgz
	https://registry.yarnpkg.com/acorn-globals/-/acorn-globals-7.0.1.tgz
	https://registry.yarnpkg.com/acorn-import-phases/-/acorn-import-phases-1.0.4.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-8.3.4.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.13.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.14.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.15.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-5.1.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.17.1.tgz
	https://registry.yarnpkg.com/another-json/-/another-json-0.2.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.2.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-6.2.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-7.0.0.tgz
	https://registry.yarnpkg.com/ansi-html-community/-/ansi-html-community-0.0.8.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.2.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-5.2.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.3.tgz
	https://registry.yarnpkg.com/append-transform/-/append-transform-2.0.0.tgz
	https://registry.yarnpkg.com/archiver-utils/-/archiver-utils-5.0.2.tgz
	https://registry.yarnpkg.com/archiver/-/archiver-7.0.1.tgz
	https://registry.yarnpkg.com/archy/-/archy-1.0.0.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.3.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/aria-hidden/-/aria-hidden-1.2.6.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-5.3.0.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-5.3.2.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.2.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-1.1.1.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.8.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array.prototype.findlast/-/array.prototype.findlast-1.2.5.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.5.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.3.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.3.tgz
	https://registry.yarnpkg.com/array.prototype.tosorted/-/array.prototype.tosorted-1.1.4.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.4.tgz
	https://registry.yarnpkg.com/asn1.js/-/asn1.js-4.10.1.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.6.tgz
	https://registry.yarnpkg.com/asn1js/-/asn1js-3.0.5.tgz
	https://registry.yarnpkg.com/assert/-/assert-2.1.0.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-2.0.1.tgz
	https://registry.yarnpkg.com/ast-types-flow/-/ast-types-flow-0.0.8.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.16.1.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-function/-/async-function-1.0.0.tgz
	https://registry.yarnpkg.com/async-lock/-/async-lock-1.4.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.6.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/autoprefixer/-/autoprefixer-10.4.20.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.7.tgz
	https://registry.yarnpkg.com/await-lock/-/await-lock-2.2.2.tgz
	https://registry.yarnpkg.com/axe-core/-/axe-core-4.10.2.tgz
	https://registry.yarnpkg.com/axe-core/-/axe-core-4.10.3.tgz
	https://registry.yarnpkg.com/axios/-/axios-1.10.0.tgz
	https://registry.yarnpkg.com/axios/-/axios-1.9.0.tgz
	https://registry.yarnpkg.com/axobject-query/-/axobject-query-4.1.0.tgz
	https://registry.yarnpkg.com/b4a/-/b4a-1.6.7.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-29.7.0.tgz
	https://registry.yarnpkg.com/babel-loader/-/babel-loader-10.0.0.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-29.6.3.tgz
	https://registry.yarnpkg.com/babel-plugin-jsx-remove-data-test-id/-/babel-plugin-jsx-remove-data-test-id-3.0.0.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.4.14.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.13.0.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.6.5.tgz
	https://registry.yarnpkg.com/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-1.1.0.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-29.6.3.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-2.0.0.tgz
	https://registry.yarnpkg.com/bare-events/-/bare-events-2.6.1.tgz
	https://registry.yarnpkg.com/bare-fs/-/bare-fs-4.2.0.tgz
	https://registry.yarnpkg.com/bare-os/-/bare-os-3.6.1.tgz
	https://registry.yarnpkg.com/bare-path/-/bare-path-3.0.0.tgz
	https://registry.yarnpkg.com/bare-stream/-/bare-stream-2.7.0.tgz
	https://registry.yarnpkg.com/base-x/-/base-x-5.0.1.tgz
	https://registry.yarnpkg.com/base64-arraybuffer/-/base64-arraybuffer-1.0.2.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.6.1.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz
	https://registry.yarnpkg.com/better-opn/-/better-opn-3.0.2.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.3.0.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/blob-polyfill/-/blob-polyfill-9.0.20240710.tgz
	https://registry.yarnpkg.com/bloom-filters/-/bloom-filters-3.0.4.tgz
	https://registry.yarnpkg.com/blurhash/-/blurhash-2.0.5.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-4.12.2.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-5.2.2.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.20.3.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-2.2.0.tgz
	https://registry.yarnpkg.com/bonjour-service/-/bonjour-service-1.3.0.tgz
	https://registry.yarnpkg.com/boolbase/-/boolbase-1.0.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.3.tgz
	https://registry.yarnpkg.com/brorand/-/brorand-1.1.0.tgz
	https://registry.yarnpkg.com/browser-resolve/-/browser-resolve-2.0.0.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.2.0.tgz
	https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.1.tgz
	https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.2.tgz
	https://registry.yarnpkg.com/browserify-rsa/-/browserify-rsa-4.1.1.tgz
	https://registry.yarnpkg.com/browserify-sign/-/browserify-sign-4.2.3.tgz
	https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.2.0.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.25.0.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.25.3.tgz
	https://registry.yarnpkg.com/bs58/-/bs58-6.0.0.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer-xor/-/buffer-xor-1.0.3.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-6.0.3.tgz
	https://registry.yarnpkg.com/buildcheck/-/buildcheck-0.0.6.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.3.0.tgz
	https://registry.yarnpkg.com/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz
	https://registry.yarnpkg.com/bundle-name/-/bundle-name-4.1.0.tgz
	https://registry.yarnpkg.com/byline/-/byline-5.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.1.2.tgz
	https://registry.yarnpkg.com/cacheable/-/cacheable-1.10.3.tgz
	https://registry.yarnpkg.com/caching-transform/-/caching-transform-4.0.0.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.1.tgz
	https://registry.yarnpkg.com/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.8.tgz
	https://registry.yarnpkg.com/call-bound/-/call-bound-1.0.3.tgz
	https://registry.yarnpkg.com/call-bound/-/call-bound-1.0.4.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camel-case/-/camel-case-4.1.2.tgz
	https://registry.yarnpkg.com/camelcase-css/-/camelcase-css-2.0.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caniuse-api/-/caniuse-api-3.0.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001724.tgz
	https://registry.yarnpkg.com/chai/-/chai-5.2.1.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.2.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.4.1.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-5.5.0.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-1.0.2.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-2.0.2.tgz
	https://registry.yarnpkg.com/check-error/-/check-error-2.1.1.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.6.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-4.0.3.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.4.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.9.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-4.1.0.tgz
	https://registry.yarnpkg.com/cipher-base/-/cipher-base-1.0.6.tgz
	https://registry.yarnpkg.com/cjs-module-lexer/-/cjs-module-lexer-1.4.1.tgz
	https://registry.yarnpkg.com/classnames/-/classnames-2.5.1.tgz
	https://registry.yarnpkg.com/clean-css/-/clean-css-5.3.3.tgz
	https://registry.yarnpkg.com/clean-regexp/-/clean-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-5.0.0.tgz
	https://registry.yarnpkg.com/cli-truncate/-/cli-truncate-4.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-6.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz
	https://registry.yarnpkg.com/collect-v8-coverage/-/collect-v8-coverage-1.0.2.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colord/-/colord-2.9.3.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.20.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-12.1.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-14.0.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-3.0.2.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-8.3.0.tgz
	https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz
	https://registry.yarnpkg.com/commonmark/-/commonmark-0.31.2.tgz
	https://registry.yarnpkg.com/compress-commons/-/compress-commons-6.0.2.tgz
	https://registry.yarnpkg.com/compressible/-/compressible-2.0.18.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.8.0.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concurrently/-/concurrently-9.2.0.tgz
	https://registry.yarnpkg.com/connect-history-api-fallback/-/connect-history-api-fallback-2.0.0.tgz
	https://registry.yarnpkg.com/console-browserify/-/console-browserify-1.2.0.tgz
	https://registry.yarnpkg.com/constants-browserify/-/constants-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.4.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-1.0.0.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.5.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.9.0.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.0.6.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.2.2.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.7.1.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.7.2.tgz
	https://registry.yarnpkg.com/copy-webpack-plugin/-/copy-webpack-plugin-13.0.1.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.40.0.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.45.0.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-3.45.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-8.3.6.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-9.0.0.tgz
	https://registry.yarnpkg.com/counterpart/-/counterpart-0.18.6.tgz
	https://registry.yarnpkg.com/cpu-features/-/cpu-features-0.0.10.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-0.3.0.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-1.2.2.tgz
	https://registry.yarnpkg.com/crc32-stream/-/crc32-stream-6.0.0.tgz
	https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.4.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.1.3.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.2.0.tgz
	https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.7.tgz
	https://registry.yarnpkg.com/create-jest/-/create-jest-29.7.0.tgz
	https://registry.yarnpkg.com/create-require/-/create-require-1.1.1.tgz
	https://registry.yarnpkg.com/cronstrue/-/cronstrue-3.2.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.5.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.6.tgz
	https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.12.1.tgz
	https://registry.yarnpkg.com/css-blank-pseudo/-/css-blank-pseudo-7.0.1.tgz
	https://registry.yarnpkg.com/css-box-model/-/css-box-model-1.2.1.tgz
	https://registry.yarnpkg.com/css-declaration-sorter/-/css-declaration-sorter-7.2.0.tgz
	https://registry.yarnpkg.com/css-functions-list/-/css-functions-list-3.2.3.tgz
	https://registry.yarnpkg.com/css-has-pseudo/-/css-has-pseudo-7.0.2.tgz
	https://registry.yarnpkg.com/css-loader/-/css-loader-7.1.2.tgz
	https://registry.yarnpkg.com/css-minimizer-webpack-plugin/-/css-minimizer-webpack-plugin-7.0.2.tgz
	https://registry.yarnpkg.com/css-prefers-color-scheme/-/css-prefers-color-scheme-10.0.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-4.3.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-5.1.0.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.2.1.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.3.1.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-3.1.0.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-6.1.0.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-6.2.2.tgz
	https://registry.yarnpkg.com/css.escape/-/css.escape-1.5.1.tgz
	https://registry.yarnpkg.com/cssdb/-/cssdb-8.2.3.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-3.0.0.tgz
	https://registry.yarnpkg.com/cssfontparser/-/cssfontparser-1.2.1.tgz
	https://registry.yarnpkg.com/cssnano-preset-default/-/cssnano-preset-default-7.0.6.tgz
	https://registry.yarnpkg.com/cssnano-utils/-/cssnano-utils-5.0.0.tgz
	https://registry.yarnpkg.com/cssnano/-/cssnano-7.0.6.tgz
	https://registry.yarnpkg.com/csso/-/csso-5.0.5.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.3.8.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.5.0.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-2.3.0.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-3.1.3.tgz
	https://registry.yarnpkg.com/cuint/-/cuint-0.2.2.tgz
	https://registry.yarnpkg.com/cwd/-/cwd-0.10.0.tgz
	https://registry.yarnpkg.com/damerau-levenshtein/-/damerau-levenshtein-1.0.8.tgz
	https://registry.yarnpkg.com/data-urls/-/data-urls-3.0.2.tgz
	https://registry.yarnpkg.com/data-view-buffer/-/data-view-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/data-view-byte-length/-/data-view-byte-length-1.0.2.tgz
	https://registry.yarnpkg.com/data-view-byte-offset/-/data-view-byte-offset-1.0.1.tgz
	https://registry.yarnpkg.com/date-names/-/date-names-0.1.13.tgz
	https://registry.yarnpkg.com/debounce/-/debounce-1.2.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.4.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.4.1.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decimal.js/-/decimal.js-10.4.3.tgz
	https://registry.yarnpkg.com/decimal.js/-/decimal.js-10.5.0.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-1.5.3.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-5.0.2.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.1.tgz
	https://registry.yarnpkg.com/default-browser-id/-/default-browser-id-5.0.0.tgz
	https://registry.yarnpkg.com/default-browser/-/default-browser-5.2.1.tgz
	https://registry.yarnpkg.com/default-require-extensions/-/default-require-extensions-3.0.1.tgz
	https://registry.yarnpkg.com/define-data-property/-/define-data-property-1.1.4.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-3.0.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.1.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/depd/-/depd-2.0.0.tgz
	https://registry.yarnpkg.com/dequal/-/dequal-2.0.3.tgz
	https://registry.yarnpkg.com/des.js/-/des.js-1.1.0.tgz
	https://registry.yarnpkg.com/destroy/-/destroy-1.2.0.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/detect-node-es/-/detect-node-es-1.1.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/diff-dom/-/diff-dom-5.2.0.tgz
	https://registry.yarnpkg.com/diff-match-patch/-/diff-match-patch-1.0.5.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-29.6.3.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/diffable-html/-/diffable-html-4.1.0.tgz
	https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.3.tgz
	https://registry.yarnpkg.com/dijkstrajs/-/dijkstrajs-1.0.3.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dns-packet/-/dns-packet-5.6.1.tgz
	https://registry.yarnpkg.com/docker-compose/-/docker-compose-1.2.0.tgz
	https://registry.yarnpkg.com/docker-modem/-/docker-modem-5.0.6.tgz
	https://registry.yarnpkg.com/dockerode/-/dockerode-4.0.7.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dom-accessibility-api/-/dom-accessibility-api-0.5.16.tgz
	https://registry.yarnpkg.com/dom-accessibility-api/-/dom-accessibility-api-0.6.3.tgz
	https://registry.yarnpkg.com/dom-converter/-/dom-converter-0.2.0.tgz
	https://registry.yarnpkg.com/dom-helpers/-/dom-helpers-5.2.1.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-0.2.2.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-1.4.1.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-2.0.0.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-4.22.0.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-1.3.1.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-2.3.0.tgz
	https://registry.yarnpkg.com/domexception/-/domexception-4.0.0.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-2.4.2.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-4.3.1.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-5.0.3.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-1.7.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-2.8.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-3.2.2.tgz
	https://registry.yarnpkg.com/dot-case/-/dot-case-3.0.4.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-16.6.1.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-17.2.1.tgz
	https://registry.yarnpkg.com/dunder-proto/-/dunder-proto-1.0.1.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.2.tgz
	https://registry.yarnpkg.com/earcut/-/earcut-3.0.2.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/ee-first/-/ee-first-1.1.1.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.10.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.5.180.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.5.207.tgz
	https://registry.yarnpkg.com/elliptic/-/elliptic-6.6.1.tgz
	https://registry.yarnpkg.com/emittery/-/emittery-0.13.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-10.4.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/emojibase-data/-/emojibase-data-15.3.2.tgz
	https://registry.yarnpkg.com/emojibase-regex/-/emojibase-regex-15.3.2.tgz
	https://registry.yarnpkg.com/emojibase/-/emojibase-15.3.1.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-2.0.0.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.5.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-5.18.3.tgz
	https://registry.yarnpkg.com/entities/-/entities-1.1.2.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.2.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-3.0.1.tgz
	https://registry.yarnpkg.com/entities/-/entities-4.5.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-6.0.1.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.1.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.14.0.tgz
	https://registry.yarnpkg.com/environment/-/environment-1.1.0.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.23.9.tgz
	https://registry.yarnpkg.com/es-define-property/-/es-define-property-1.0.1.tgz
	https://registry.yarnpkg.com/es-errors/-/es-errors-1.3.0.tgz
	https://registry.yarnpkg.com/es-iterator-helpers/-/es-iterator-helpers-1.2.1.tgz
	https://registry.yarnpkg.com/es-module-lexer/-/es-module-lexer-1.7.0.tgz
	https://registry.yarnpkg.com/es-object-atoms/-/es-object-atoms-1.1.1.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.2.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.3.0.tgz
	https://registry.yarnpkg.com/es6-error/-/es6-error-4.1.1.tgz
	https://registry.yarnpkg.com/esbuild-register/-/esbuild-register-3.6.0.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.25.8.tgz
	https://registry.yarnpkg.com/esbuild/-/esbuild-0.25.9.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.2.0.tgz
	https://registry.yarnpkg.com/escape-html/-/escape-html-1.0.3.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-10.1.8.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.12.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-deprecate/-/eslint-plugin-deprecate-0.8.5.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.31.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-jest/-/eslint-plugin-jest-28.11.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-jsx-a11y/-/eslint-plugin-jsx-a11y-6.10.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-matrix-org/-/eslint-plugin-matrix-org-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-compiler/-/eslint-plugin-react-compiler-19.0.0-beta-e552027-20250112.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-5.2.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.37.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-storybook/-/eslint-plugin-storybook-9.0.18.tgz
	https://registry.yarnpkg.com/eslint-plugin-unicorn/-/eslint-plugin-unicorn-56.0.1.tgz
	https://registry.yarnpkg.com/eslint-rule-composer/-/eslint-rule-composer-0.3.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-4.2.1.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.57.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-10.4.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.6.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-2.0.2.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.1.tgz
	https://registry.yarnpkg.com/event-target-shim/-/event-target-shim-5.0.1.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-4.0.7.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-5.0.1.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz
	https://registry.yarnpkg.com/except/-/except-0.1.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.1.1.tgz
	https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz
	https://registry.yarnpkg.com/expand-tilde/-/expand-tilde-1.2.2.tgz
	https://registry.yarnpkg.com/expect-playwright/-/expect-playwright-0.8.0.tgz
	https://registry.yarnpkg.com/expect/-/expect-29.7.0.tgz
	https://registry.yarnpkg.com/express/-/express-4.21.2.tgz
	https://registry.yarnpkg.com/express/-/express-5.1.0.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/fake-indexeddb/-/fake-indexeddb-6.1.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-fifo/-/fast-fifo-1.3.2.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fast-uri/-/fast-uri-3.0.6.tgz
	https://registry.yarnpkg.com/fastest-levenshtein/-/fastest-levenshtein-1.0.16.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.19.1.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.11.4.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.2.tgz
	https://registry.yarnpkg.com/fd-package-json/-/fd-package-json-2.0.0.tgz
	https://registry.yarnpkg.com/fdir/-/fdir-6.5.0.tgz
	https://registry.yarnpkg.com/fetch-mock-jest/-/fetch-mock-jest-1.5.1.tgz
	https://registry.yarnpkg.com/fetch-mock/-/fetch-mock-9.11.0.tgz
	https://registry.yarnpkg.com/fflate/-/fflate-0.4.8.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-10.1.3.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/file-loader/-/file-loader-6.2.0.tgz
	https://registry.yarnpkg.com/file-saver/-/file-saver-2.0.5.tgz
	https://registry.yarnpkg.com/file/-/file-0.2.2.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.4.tgz
	https://registry.yarnpkg.com/filesize/-/filesize-11.0.2.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.1.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.3.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-2.1.0.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-3.3.2.tgz
	https://registry.yarnpkg.com/find-file-up/-/find-file-up-0.1.3.tgz
	https://registry.yarnpkg.com/find-pkg/-/find-pkg-0.1.2.tgz
	https://registry.yarnpkg.com/find-process/-/find-process-1.4.10.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-7.0.0.tgz
	https://registry.yarnpkg.com/find-yarn-workspace-root/-/find-yarn-workspace-root-2.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.2.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-6.1.12.tgz
	https://registry.yarnpkg.com/flat/-/flat-5.0.2.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.3.1.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.3.3.tgz
	https://registry.yarnpkg.com/focus-lock/-/focus-lock-1.3.6.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.15.9.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.4.tgz
	https://registry.yarnpkg.com/foreachasync/-/foreachasync-3.0.0.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-2.0.0.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.3.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.4.tgz
	https://registry.yarnpkg.com/formatly/-/formatly-0.2.4.tgz
	https://registry.yarnpkg.com/forwarded/-/forwarded-0.2.0.tgz
	https://registry.yarnpkg.com/fraction.js/-/fraction.js-4.3.7.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.2.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-2.0.0.tgz
	https://registry.yarnpkg.com/fromentries/-/fromentries-1.3.2.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fs-exists-sync/-/fs-exists-sync-0.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fs/-/fs-0.0.1-security.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.2.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.8.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/geojson-vt/-/geojson-vt-4.0.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-east-asian-width/-/get-east-asian-width-1.3.0.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.7.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.3.0.tgz
	https://registry.yarnpkg.com/get-nonce/-/get-nonce-1.0.1.tgz
	https://registry.yarnpkg.com/get-package-type/-/get-package-type-0.1.0.tgz
	https://registry.yarnpkg.com/get-port/-/get-port-7.1.0.tgz
	https://registry.yarnpkg.com/get-proto/-/get-proto-1.0.1.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-5.0.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-6.0.1.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.1.0.tgz
	https://registry.yarnpkg.com/github-markdown-css/-/github-markdown-css-5.8.1.tgz
	https://registry.yarnpkg.com/gl-matrix/-/gl-matrix-3.4.4.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.4.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-11.0.2.tgz
	https://registry.yarnpkg.com/glob/-/glob-11.0.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-9.3.5.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-0.2.3.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-2.0.0.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-0.1.5.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.24.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-15.13.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.4.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/globjoin/-/globjoin-0.1.4.tgz
	https://registry.yarnpkg.com/glur/-/glur-1.1.2.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.2.0.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/gzip-size/-/gzip-size-6.0.0.tgz
	https://registry.yarnpkg.com/handle-thing/-/handle-thing-2.0.1.tgz
	https://registry.yarnpkg.com/harmony-reflect/-/harmony-reflect-1.6.2.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.1.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.2.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.1.0.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.2.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-2.0.2.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-3.0.5.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-3.1.0.tgz
	https://registry.yarnpkg.com/hash.js/-/hash.js-1.1.7.tgz
	https://registry.yarnpkg.com/hasha/-/hasha-5.2.2.tgz
	https://registry.yarnpkg.com/hasown/-/hasown-2.0.2.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz
	https://registry.yarnpkg.com/hermes-estree/-/hermes-estree-0.25.1.tgz
	https://registry.yarnpkg.com/hermes-parser/-/hermes-parser-0.25.1.tgz
	https://registry.yarnpkg.com/highlight.js/-/highlight.js-11.11.1.tgz
	https://registry.yarnpkg.com/hmac-drbg/-/hmac-drbg-1.0.1.tgz
	https://registry.yarnpkg.com/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz
	https://registry.yarnpkg.com/homedir-polyfill/-/homedir-polyfill-1.0.3.tgz
	https://registry.yarnpkg.com/hookified/-/hookified-1.11.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hpack.js/-/hpack.js-2.1.6.tgz
	https://registry.yarnpkg.com/html-dom-parser/-/html-dom-parser-5.1.1.tgz
	https://registry.yarnpkg.com/html-encoding-sniffer/-/html-encoding-sniffer-3.0.0.tgz
	https://registry.yarnpkg.com/html-entities/-/html-entities-2.6.0.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz
	https://registry.yarnpkg.com/html-react-parser/-/html-react-parser-5.2.6.tgz
	https://registry.yarnpkg.com/html-tags/-/html-tags-3.3.1.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-5.6.4.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-10.0.0.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-3.10.1.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-6.1.0.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-8.0.2.tgz
	https://registry.yarnpkg.com/http-deceiver/-/http-deceiver-1.2.7.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.3.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-2.0.0.tgz
	https://registry.yarnpkg.com/http-parser-js/-/http-parser-js-0.5.10.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http-proxy-middleware/-/http-proxy-middleware-2.0.9.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.18.1.tgz
	https://registry.yarnpkg.com/https-browserify/-/https-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-2.1.0.tgz
	https://registry.yarnpkg.com/husky/-/husky-9.1.7.tgz
	https://registry.yarnpkg.com/hyperdyperid/-/hyperdyperid-1.2.0.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/icss-utils/-/icss-utils-5.1.0.tgz
	https://registry.yarnpkg.com/identity-obj-proxy/-/identity-obj-proxy-3.0.0.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.3.2.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-7.0.5.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.1.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.2.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/inline-style-parser/-/inline-style-parser-0.2.4.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.1.0.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-3.1.1.tgz
	https://registry.yarnpkg.com/ip-regex/-/ip-regex-4.3.0.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-1.9.1.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-2.2.0.tgz
	https://registry.yarnpkg.com/is-arguments/-/is-arguments-1.1.1.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.5.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-async-function/-/is-async-function-2.1.1.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.1.0.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.2.1.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-2.0.5.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-3.2.1.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.15.1.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.16.1.tgz
	https://registry.yarnpkg.com/is-data-view/-/is-data-view-1.0.2.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.1.0.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-2.2.1.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-3.0.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-finalizationregistry/-/is-finalizationregistry-1.1.1.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-4.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-5.0.0.tgz
	https://registry.yarnpkg.com/is-generator-fn/-/is-generator-fn-2.1.0.tgz
	https://registry.yarnpkg.com/is-generator-function/-/is-generator-function-1.0.10.tgz
	https://registry.yarnpkg.com/is-generator-function/-/is-generator-function-1.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-inside-container/-/is-inside-container-1.0.0.tgz
	https://registry.yarnpkg.com/is-ip/-/is-ip-3.1.0.tgz
	https://registry.yarnpkg.com/is-map/-/is-map-2.0.3.tgz
	https://registry.yarnpkg.com/is-nan/-/is-nan-1.3.2.tgz
	https://registry.yarnpkg.com/is-network-error/-/is-network-error-1.1.0.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.1.1.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-3.0.0.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-4.0.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.2.1.tgz
	https://registry.yarnpkg.com/is-set/-/is-set-2.0.3.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.4.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.1.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.1.1.tgz
	https://registry.yarnpkg.com/is-subset/-/is-subset-0.1.1.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.1.1.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.13.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-weakmap/-/is-weakmap-2.0.2.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.1.1.tgz
	https://registry.yarnpkg.com/is-weakset/-/is-weakset-2.0.4.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-0.2.0.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-2.2.0.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-3.1.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/isomorphic-timers-promises/-/isomorphic-timers-promises-1.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.2.tgz
	https://registry.yarnpkg.com/istanbul-lib-hook/-/istanbul-lib-hook-3.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-4.0.3.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-5.2.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-6.0.3.tgz
	https://registry.yarnpkg.com/istanbul-lib-processinfo/-/istanbul-lib-processinfo-2.0.3.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.1.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.1.7.tgz
	https://registry.yarnpkg.com/iterator.prototype/-/iterator.prototype-1.1.5.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-3.4.3.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-4.1.0.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-4.1.1.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.9.2.tgz
	https://registry.yarnpkg.com/jest-canvas-mock/-/jest-canvas-mock-2.5.2.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-29.7.0.tgz
	https://registry.yarnpkg.com/jest-circus/-/jest-circus-29.7.0.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-29.7.0.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-29.7.0.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-29.7.0.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-29.7.0.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-29.7.0.tgz
	https://registry.yarnpkg.com/jest-environment-jsdom/-/jest-environment-jsdom-29.7.0.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-29.7.0.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-29.6.3.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-29.7.0.tgz
	https://registry.yarnpkg.com/jest-image-snapshot/-/jest-image-snapshot-6.5.1.tgz
	https://registry.yarnpkg.com/jest-junit/-/jest-junit-16.0.0.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-29.7.0.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-29.7.0.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-29.7.0.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-29.7.0.tgz
	https://registry.yarnpkg.com/jest-playwright-preset/-/jest-playwright-preset-4.0.0.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.3.tgz
	https://registry.yarnpkg.com/jest-process-manager/-/jest-process-manager-0.4.0.tgz
	https://registry.yarnpkg.com/jest-raw-loader/-/jest-raw-loader-1.0.1.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-29.6.3.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-29.7.0.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-29.7.0.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-29.7.0.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-29.7.0.tgz
	https://registry.yarnpkg.com/jest-serializer-html/-/jest-serializer-html-7.1.0.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-29.7.0.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-29.7.0.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-29.7.0.tgz
	https://registry.yarnpkg.com/jest-watch-typeahead/-/jest-watch-typeahead-2.2.2.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-29.7.0.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-27.5.1.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-29.7.0.tgz
	https://registry.yarnpkg.com/jest/-/jest-29.7.0.tgz
	https://registry.yarnpkg.com/jiti/-/jiti-1.21.6.tgz
	https://registry.yarnpkg.com/jiti/-/jiti-2.4.2.tgz
	https://registry.yarnpkg.com/joi/-/joi-17.13.3.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-xxhash/-/js-xxhash-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-20.0.3.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.0.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.1.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify/-/json-stable-stringify-1.2.1.tgz
	https://registry.yarnpkg.com/json-stringify-pretty-compact/-/json-stringify-pretty-compact-4.0.0.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonc-parser/-/jsonc-parser-3.3.1.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsonify/-/jsonify-0.0.1.tgz
	https://registry.yarnpkg.com/jsqr/-/jsqr-1.4.0.tgz
	https://registry.yarnpkg.com/jsrsasign/-/jsrsasign-11.1.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.3.5.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.10.1.tgz
	https://registry.yarnpkg.com/jwt-decode/-/jwt-decode-4.0.0.tgz
	https://registry.yarnpkg.com/katex/-/katex-0.16.22.tgz
	https://registry.yarnpkg.com/kdbush/-/kdbush-4.0.2.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.4.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-5.5.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/klaw-sync/-/klaw-sync-6.0.0.tgz
	https://registry.yarnpkg.com/kleur/-/kleur-3.0.3.tgz
	https://registry.yarnpkg.com/knip/-/knip-5.62.0.tgz
	https://registry.yarnpkg.com/known-css-properties/-/known-css-properties-0.36.0.tgz
	https://registry.yarnpkg.com/known-css-properties/-/known-css-properties-0.37.0.tgz
	https://registry.yarnpkg.com/language-subtag-registry/-/language-subtag-registry-0.3.23.tgz
	https://registry.yarnpkg.com/language-tags/-/language-tags-1.0.9.tgz
	https://registry.yarnpkg.com/launch-editor/-/launch-editor-2.10.0.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-1.0.1.tgz
	https://registry.yarnpkg.com/leven/-/leven-3.1.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/lilconfig/-/lilconfig-3.1.3.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-4.0.1.tgz
	https://registry.yarnpkg.com/linkify-react/-/linkify-react-4.3.2.tgz
	https://registry.yarnpkg.com/linkify-string/-/linkify-string-4.3.2.tgz
	https://registry.yarnpkg.com/linkifyjs/-/linkifyjs-4.3.2.tgz
	https://registry.yarnpkg.com/lint-staged/-/lint-staged-16.1.5.tgz
	https://registry.yarnpkg.com/listr2/-/listr2-9.0.1.tgz
	https://registry.yarnpkg.com/lit-element/-/lit-element-3.3.3.tgz
	https://registry.yarnpkg.com/lit-html/-/lit-html-2.8.0.tgz
	https://registry.yarnpkg.com/lit/-/lit-2.8.0.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-4.3.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.4.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-7.2.0.tgz
	https://registry.yarnpkg.com/lodash-es/-/lodash-es-4.17.21.tgz
	https://registry.yarnpkg.com/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.flattendeep/-/lodash.flattendeep-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.isequal/-/lodash.isequal-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.memoize/-/lodash.memoize-4.1.2.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.sortby/-/lodash.sortby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.truncate/-/lodash.truncate-4.4.2.tgz
	https://registry.yarnpkg.com/lodash.uniq/-/lodash.uniq-4.5.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/log-update/-/log-update-6.1.0.tgz
	https://registry.yarnpkg.com/loglevel/-/loglevel-1.9.2.tgz
	https://registry.yarnpkg.com/long/-/long-5.2.3.tgz
	https://registry.yarnpkg.com/long/-/long-5.3.2.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/loupe/-/loupe-3.1.4.tgz
	https://registry.yarnpkg.com/lower-case/-/lower-case-2.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.4.3.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-11.1.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lz-string/-/lz-string-1.5.0.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.30.17.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.30.8.tgz
	https://registry.yarnpkg.com/mailpit-api/-/mailpit-api-1.5.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-4.0.0.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.6.tgz
	https://registry.yarnpkg.com/makeerror/-/makeerror-1.0.12.tgz
	https://registry.yarnpkg.com/maplibre-gl/-/maplibre-gl-5.6.2.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-13.0.2.tgz
	https://registry.yarnpkg.com/math-intrinsics/-/math-intrinsics-1.1.0.tgz
	https://registry.yarnpkg.com/mathml-tag-names/-/mathml-tag-names-2.1.3.tgz
	https://registry.yarnpkg.com/matrix-encrypt-attachment/-/matrix-encrypt-attachment-1.0.3.tgz
	https://registry.yarnpkg.com/matrix-events-sdk/-/matrix-events-sdk-0.0.1.tgz
	https://registry.yarnpkg.com/matrix-js-sdk/-/matrix-js-sdk-38.1.0.tgz
	https://registry.yarnpkg.com/matrix-web-i18n/-/matrix-web-i18n-3.3.0.tgz
	https://registry.yarnpkg.com/matrix-widget-api/-/matrix-widget-api-1.13.1.tgz
	https://registry.yarnpkg.com/md5.js/-/md5.js-1.3.5.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.28.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.30.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.12.2.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.21.0.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-1.0.1.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-0.3.0.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-1.1.0.tgz
	https://registry.yarnpkg.com/memfs/-/memfs-4.17.2.tgz
	https://registry.yarnpkg.com/memoize-one/-/memoize-one-5.2.1.tgz
	https://registry.yarnpkg.com/memoize-one/-/memoize-one-6.0.0.tgz
	https://registry.yarnpkg.com/meow/-/meow-13.2.0.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-1.0.3.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-2.0.0.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/methods/-/methods-1.1.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.8.tgz
	https://registry.yarnpkg.com/miller-rabin/-/miller-rabin-4.0.1.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.54.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-3.0.1.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-4.0.7.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-function/-/mimic-function-5.0.1.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/mini-css-extract-plugin/-/mini-css-extract-plugin-2.9.2.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
	https://registry.yarnpkg.com/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-10.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-10.0.3.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-5.1.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-8.0.4.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.5.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.1.2.tgz
	https://registry.yarnpkg.com/mkdirp-classic/-/mkdirp-classic-0.5.3.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/modernizr/-/modernizr-3.13.1.tgz
	https://registry.yarnpkg.com/moo-color/-/moo-color-1.0.3.tgz
	https://registry.yarnpkg.com/mrmime/-/mrmime-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/multicast-dns/-/multicast-dns-7.2.5.tgz
	https://registry.yarnpkg.com/murmurhash-js/-/murmurhash-js-1.0.0.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.23.0.tgz
	https://registry.yarnpkg.com/nano-spawn/-/nano-spawn-1.0.2.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.11.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.8.tgz
	https://registry.yarnpkg.com/napi-postinstall/-/napi-postinstall-0.3.2.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.3.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.4.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-1.0.0.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/no-case/-/no-case-3.0.4.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.7.0.tgz
	https://registry.yarnpkg.com/node-forge/-/node-forge-1.3.1.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-preload/-/node-preload-0.2.1.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.19.tgz
	https://registry.yarnpkg.com/node-stdlib-browser/-/node-stdlib-browser-1.3.1.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-range/-/normalize-range-0.1.2.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-2.1.1.tgz
	https://registry.yarnpkg.com/nwsapi/-/nwsapi-2.2.13.tgz
	https://registry.yarnpkg.com/nyc/-/nyc-15.1.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.4.tgz
	https://registry.yarnpkg.com/object-is/-/object-is-1.1.6.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.7.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.8.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.8.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.3.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.2.0.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.2.1.tgz
	https://registry.yarnpkg.com/obuf/-/obuf-1.1.2.tgz
	https://registry.yarnpkg.com/oidc-client-ts/-/oidc-client-ts-3.3.0.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.4.1.tgz
	https://registry.yarnpkg.com/on-headers/-/on-headers-1.0.2.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-7.0.0.tgz
	https://registry.yarnpkg.com/open/-/open-10.1.2.tgz
	https://registry.yarnpkg.com/open/-/open-7.4.2.tgz
	https://registry.yarnpkg.com/open/-/open-8.4.2.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.5.2.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.4.tgz
	https://registry.yarnpkg.com/opus-recorder/-/opus-recorder-8.0.5.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.3.0.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/own-keys/-/own-keys-1.0.1.tgz
	https://registry.yarnpkg.com/oxc-resolver/-/oxc-resolver-11.6.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-4.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-6.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-3.0.0.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-4.6.2.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-6.2.1.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/package-hash/-/package-hash-4.0.0.tgz
	https://registry.yarnpkg.com/package-json-from-dist/-/package-json-from-dist-1.0.1.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/pako/-/pako-2.1.0.tgz
	https://registry.yarnpkg.com/param-case/-/param-case-3.0.4.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.7.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/parse-passwd/-/parse-passwd-1.0.0.tgz
	https://registry.yarnpkg.com/parse-srcset/-/parse-srcset-1.0.2.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-7.2.0.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.3.tgz
	https://registry.yarnpkg.com/pascal-case/-/pascal-case-3.1.2.tgz
	https://registry.yarnpkg.com/patch-package/-/patch-package-8.0.0.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-1.0.1.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-5.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.11.1.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-2.0.0.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-0.1.12.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-2.4.0.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-8.2.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/pathval/-/pathval-2.0.1.tgz
	https://registry.yarnpkg.com/pbf/-/pbf-4.0.1.tgz
	https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.1.3.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.1.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-4.0.3.tgz
	https://registry.yarnpkg.com/pidtree/-/pidtree-0.6.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-2.3.0.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.6.tgz
	https://registry.yarnpkg.com/pixelmatch/-/pixelmatch-5.3.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-5.0.0.tgz
	https://registry.yarnpkg.com/playwright-core/-/playwright-core-1.53.2.tgz
	https://registry.yarnpkg.com/playwright-core/-/playwright-core-1.54.2.tgz
	https://registry.yarnpkg.com/playwright/-/playwright-1.53.2.tgz
	https://registry.yarnpkg.com/playwright/-/playwright-1.54.2.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/pluralizers/-/pluralizers-0.1.7.tgz
	https://registry.yarnpkg.com/png-chunks-extract/-/png-chunks-extract-1.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-3.4.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-5.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-6.0.0.tgz
	https://registry.yarnpkg.com/possible-typed-array-names/-/possible-typed-array-names-1.0.0.tgz
	https://registry.yarnpkg.com/postcss-attribute-case-insensitive/-/postcss-attribute-case-insensitive-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-calc/-/postcss-calc-10.1.1.tgz
	https://registry.yarnpkg.com/postcss-clamp/-/postcss-clamp-4.1.0.tgz
	https://registry.yarnpkg.com/postcss-color-functional-notation/-/postcss-color-functional-notation-7.0.7.tgz
	https://registry.yarnpkg.com/postcss-color-hex-alpha/-/postcss-color-hex-alpha-10.0.0.tgz
	https://registry.yarnpkg.com/postcss-color-rebeccapurple/-/postcss-color-rebeccapurple-10.0.0.tgz
	https://registry.yarnpkg.com/postcss-colormin/-/postcss-colormin-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-convert-values/-/postcss-convert-values-7.0.4.tgz
	https://registry.yarnpkg.com/postcss-custom-media/-/postcss-custom-media-11.0.5.tgz
	https://registry.yarnpkg.com/postcss-custom-properties/-/postcss-custom-properties-14.0.4.tgz
	https://registry.yarnpkg.com/postcss-custom-selectors/-/postcss-custom-selectors-8.0.4.tgz
	https://registry.yarnpkg.com/postcss-dir-pseudo-class/-/postcss-dir-pseudo-class-9.0.1.tgz
	https://registry.yarnpkg.com/postcss-discard-comments/-/postcss-discard-comments-7.0.3.tgz
	https://registry.yarnpkg.com/postcss-discard-duplicates/-/postcss-discard-duplicates-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-discard-empty/-/postcss-discard-empty-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-discard-overridden/-/postcss-discard-overridden-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-double-position-gradients/-/postcss-double-position-gradients-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-easings/-/postcss-easings-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-focus-visible/-/postcss-focus-visible-10.0.1.tgz
	https://registry.yarnpkg.com/postcss-focus-within/-/postcss-focus-within-9.0.1.tgz
	https://registry.yarnpkg.com/postcss-font-variant/-/postcss-font-variant-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-gap-properties/-/postcss-gap-properties-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-hexrgba/-/postcss-hexrgba-2.1.0.tgz
	https://registry.yarnpkg.com/postcss-image-set-function/-/postcss-image-set-function-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-import/-/postcss-import-16.1.0.tgz
	https://registry.yarnpkg.com/postcss-js/-/postcss-js-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-lab-function/-/postcss-lab-function-7.0.7.tgz
	https://registry.yarnpkg.com/postcss-loader/-/postcss-loader-8.1.1.tgz
	https://registry.yarnpkg.com/postcss-logical/-/postcss-logical-8.0.0.tgz
	https://registry.yarnpkg.com/postcss-media-query-parser/-/postcss-media-query-parser-0.2.3.tgz
	https://registry.yarnpkg.com/postcss-merge-longhand/-/postcss-merge-longhand-7.0.4.tgz
	https://registry.yarnpkg.com/postcss-merge-rules/-/postcss-merge-rules-7.0.4.tgz
	https://registry.yarnpkg.com/postcss-minify-font-values/-/postcss-minify-font-values-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-minify-gradients/-/postcss-minify-gradients-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-minify-params/-/postcss-minify-params-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-minify-selectors/-/postcss-minify-selectors-7.0.4.tgz
	https://registry.yarnpkg.com/postcss-mixins/-/postcss-mixins-12.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-extract-imports/-/postcss-modules-extract-imports-3.1.0.tgz
	https://registry.yarnpkg.com/postcss-modules-local-by-default/-/postcss-modules-local-by-default-4.0.5.tgz
	https://registry.yarnpkg.com/postcss-modules-scope/-/postcss-modules-scope-3.2.0.tgz
	https://registry.yarnpkg.com/postcss-modules-values/-/postcss-modules-values-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-nested/-/postcss-nested-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-nesting/-/postcss-nesting-13.0.1.tgz
	https://registry.yarnpkg.com/postcss-normalize-charset/-/postcss-normalize-charset-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-display-values/-/postcss-normalize-display-values-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-positions/-/postcss-normalize-positions-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-repeat-style/-/postcss-normalize-repeat-style-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-string/-/postcss-normalize-string-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-timing-functions/-/postcss-normalize-timing-functions-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-unicode/-/postcss-normalize-unicode-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-normalize-url/-/postcss-normalize-url-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-whitespace/-/postcss-normalize-whitespace-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-opacity-percentage/-/postcss-opacity-percentage-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-ordered-values/-/postcss-ordered-values-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-overflow-shorthand/-/postcss-overflow-shorthand-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-page-break/-/postcss-page-break-3.0.4.tgz
	https://registry.yarnpkg.com/postcss-place/-/postcss-place-10.0.0.tgz
	https://registry.yarnpkg.com/postcss-preset-env/-/postcss-preset-env-10.1.3.tgz
	https://registry.yarnpkg.com/postcss-pseudo-class-any-link/-/postcss-pseudo-class-any-link-10.0.1.tgz
	https://registry.yarnpkg.com/postcss-reduce-initial/-/postcss-reduce-initial-7.0.2.tgz
	https://registry.yarnpkg.com/postcss-reduce-transforms/-/postcss-reduce-transforms-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-replace-overflow-wrap/-/postcss-replace-overflow-wrap-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-resolve-nested-selector/-/postcss-resolve-nested-selector-0.1.6.tgz
	https://registry.yarnpkg.com/postcss-safe-parser/-/postcss-safe-parser-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-scss/-/postcss-scss-4.0.9.tgz
	https://registry.yarnpkg.com/postcss-selector-not/-/postcss-selector-not-8.0.1.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-6.1.2.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-7.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-7.1.0.tgz
	https://registry.yarnpkg.com/postcss-simple-vars/-/postcss-simple-vars-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-svgo/-/postcss-svgo-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-unique-selectors/-/postcss-unique-selectors-7.0.3.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.46.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.47.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.5.3.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.5.6.tgz
	https://registry.yarnpkg.com/posthog-js/-/posthog-js-1.260.1.tgz
	https://registry.yarnpkg.com/potpack/-/potpack-2.1.0.tgz
	https://registry.yarnpkg.com/preact/-/preact-10.24.3.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.8.8.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-3.6.2.tgz
	https://registry.yarnpkg.com/pretty-error/-/pretty-error-4.0.0.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-27.5.1.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-29.7.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process-on-spawn/-/process-on-spawn-1.1.0.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.4.2.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/proper-lockfile/-/proper-lockfile-4.1.2.tgz
	https://registry.yarnpkg.com/properties-reader/-/properties-reader-2.3.0.tgz
	https://registry.yarnpkg.com/protobufjs/-/protobufjs-7.5.4.tgz
	https://registry.yarnpkg.com/protocol-buffers-schema/-/protocol-buffers-schema-3.6.0.tgz
	https://registry.yarnpkg.com/proxy-addr/-/proxy-addr-2.0.7.tgz
	https://registry.yarnpkg.com/proxy-from-env/-/proxy-from-env-1.1.0.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.9.0.tgz
	https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.3.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.3.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.1.tgz
	https://registry.yarnpkg.com/pure-rand/-/pure-rand-6.1.0.tgz
	https://registry.yarnpkg.com/pvtsutils/-/pvtsutils-1.3.5.tgz
	https://registry.yarnpkg.com/pvutils/-/pvutils-1.1.3.tgz
	https://registry.yarnpkg.com/qrcode/-/qrcode-1.5.4.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.13.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.14.0.tgz
	https://registry.yarnpkg.com/querystring-es3/-/querystring-es3-0.2.1.tgz
	https://registry.yarnpkg.com/querystring/-/querystring-0.2.1.tgz
	https://registry.yarnpkg.com/querystringify/-/querystringify-2.2.0.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quickselect/-/quickselect-3.0.0.tgz
	https://registry.yarnpkg.com/raf-schd/-/raf-schd-4.0.3.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.4.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.1.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.5.2.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-3.0.0.tgz
	https://registry.yarnpkg.com/raw-loader/-/raw-loader-4.0.2.tgz
	https://registry.yarnpkg.com/re-resizable/-/re-resizable-6.11.2.tgz
	https://registry.yarnpkg.com/react-beautiful-dnd/-/react-beautiful-dnd-13.1.1.tgz
	https://registry.yarnpkg.com/react-blurhash/-/react-blurhash-0.3.0.tgz
	https://registry.yarnpkg.com/react-clientside-effect/-/react-clientside-effect-1.2.7.tgz
	https://registry.yarnpkg.com/react-docgen-typescript/-/react-docgen-typescript-2.4.0.tgz
	https://registry.yarnpkg.com/react-docgen/-/react-docgen-8.0.0.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-19.1.1.tgz
	https://registry.yarnpkg.com/react-focus-lock/-/react-focus-lock-2.13.6.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-17.0.2.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-19.1.1.tgz
	https://registry.yarnpkg.com/react-property/-/react-property-2.0.2.tgz
	https://registry.yarnpkg.com/react-redux/-/react-redux-7.2.9.tgz
	https://registry.yarnpkg.com/react-remove-scroll-bar/-/react-remove-scroll-bar-2.3.8.tgz
	https://registry.yarnpkg.com/react-remove-scroll/-/react-remove-scroll-2.7.1.tgz
	https://registry.yarnpkg.com/react-string-replace/-/react-string-replace-1.1.1.tgz
	https://registry.yarnpkg.com/react-style-singleton/-/react-style-singleton-2.2.3.tgz
	https://registry.yarnpkg.com/react-transition-group/-/react-transition-group-4.4.5.tgz
	https://registry.yarnpkg.com/react-virtuoso/-/react-virtuoso-4.14.0.tgz
	https://registry.yarnpkg.com/react/-/react-19.1.1.tgz
	https://registry.yarnpkg.com/read-cache/-/read-cache-1.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.8.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.2.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-4.7.0.tgz
	https://registry.yarnpkg.com/readdir-glob/-/readdir-glob-1.1.3.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-4.1.1.tgz
	https://registry.yarnpkg.com/recast/-/recast-0.23.11.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.8.0.tgz
	https://registry.yarnpkg.com/redent/-/redent-3.0.0.tgz
	https://registry.yarnpkg.com/redux/-/redux-4.2.1.tgz
	https://registry.yarnpkg.com/reflect-metadata/-/reflect-metadata-0.1.14.tgz
	https://registry.yarnpkg.com/reflect.getprototypeof/-/reflect.getprototypeof-1.0.10.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.2.0.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regexp-tree/-/regexp-tree-0.1.27.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.4.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-6.2.0.tgz
	https://registry.yarnpkg.com/regjsgen/-/regjsgen-0.8.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.10.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.12.0.tgz
	https://registry.yarnpkg.com/relateurl/-/relateurl-0.2.7.tgz
	https://registry.yarnpkg.com/release-zalgo/-/release-zalgo-1.0.0.tgz
	https://registry.yarnpkg.com/renderkid/-/renderkid-3.0.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz
	https://registry.yarnpkg.com/requirejs/-/requirejs-2.3.7.tgz
	https://registry.yarnpkg.com/requires-port/-/requires-port-1.0.0.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-dir/-/resolve-dir-0.1.1.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-protobuf-schema/-/resolve-protobuf-schema-2.1.0.tgz
	https://registry.yarnpkg.com/resolve.exports/-/resolve.exports-2.0.2.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.10.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-2.0.0-next.5.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-5.1.0.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.13.1.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.1.0.tgz
	https://registry.yarnpkg.com/rfc4648/-/rfc4648-1.5.4.tgz
	https://registry.yarnpkg.com/rfdc/-/rfdc-1.4.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-6.0.1.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.1.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.2.tgz
	https://registry.yarnpkg.com/rollup/-/rollup-4.46.3.tgz
	https://registry.yarnpkg.com/router/-/router-2.2.0.tgz
	https://registry.yarnpkg.com/run-applescript/-/run-applescript-7.0.0.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/rw/-/rw-1.3.3.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-7.8.2.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.1.3.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-push-apply/-/safe-push-apply-1.0.0.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.1.0.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sanitize-html/-/sanitize-html-2.17.0.tgz
	https://registry.yarnpkg.com/saxes/-/saxes-6.0.0.tgz
	https://registry.yarnpkg.com/scheduler/-/scheduler-0.26.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.3.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-4.3.2.tgz
	https://registry.yarnpkg.com/sdp-transform/-/sdp-transform-2.14.2.tgz
	https://registry.yarnpkg.com/seedrandom/-/seedrandom-3.0.5.tgz
	https://registry.yarnpkg.com/select-hose/-/select-hose-2.0.0.tgz
	https://registry.yarnpkg.com/selfsigned/-/selfsigned-2.4.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.7.2.tgz
	https://registry.yarnpkg.com/send/-/send-0.19.0.tgz
	https://registry.yarnpkg.com/send/-/send-1.2.0.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-6.0.2.tgz
	https://registry.yarnpkg.com/serve-index/-/serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.16.2.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-2.2.0.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/set-function-length/-/set-function-length-1.2.2.tgz
	https://registry.yarnpkg.com/set-function-name/-/set-function-name-2.0.2.tgz
	https://registry.yarnpkg.com/set-proto/-/set-proto-1.0.0.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.1.0.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.2.0.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.12.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-quote/-/shell-quote-1.8.3.tgz
	https://registry.yarnpkg.com/side-channel-list/-/side-channel-list-1.0.0.tgz
	https://registry.yarnpkg.com/side-channel-map/-/side-channel-map-1.0.1.tgz
	https://registry.yarnpkg.com/side-channel-weakmap/-/side-channel-weakmap-1.0.2.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.1.0.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.yarnpkg.com/sirv/-/sirv-2.0.4.tgz
	https://registry.yarnpkg.com/sisteransi/-/sisteransi-1.0.5.tgz
	https://registry.yarnpkg.com/slash/-/slash-2.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-5.1.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-5.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/smol-toml/-/smol-toml-1.4.1.tgz
	https://registry.yarnpkg.com/snake-case/-/snake-case-3.0.4.tgz
	https://registry.yarnpkg.com/sockjs/-/sockjs-0.3.24.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.2.1.tgz
	https://registry.yarnpkg.com/source-map-loader/-/source-map-loader-5.0.0.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.13.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/spawn-wrap/-/spawn-wrap-2.0.0.tgz
	https://registry.yarnpkg.com/spawnd/-/spawnd-5.0.0.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.5.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.20.tgz
	https://registry.yarnpkg.com/spdy-transport/-/spdy-transport-3.0.0.tgz
	https://registry.yarnpkg.com/spdy/-/spdy-4.0.2.tgz
	https://registry.yarnpkg.com/split-ca/-/split-ca-1.0.1.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.3.tgz
	https://registry.yarnpkg.com/ssh-remote-port-forward/-/ssh-remote-port-forward-1.0.4.tgz
	https://registry.yarnpkg.com/ssh2/-/ssh2-1.16.0.tgz
	https://registry.yarnpkg.com/ssim.js/-/ssim.js-3.5.0.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-2.0.6.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.5.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-2.0.1.tgz
	https://registry.yarnpkg.com/storybook/-/storybook-9.0.18.tgz
	https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-3.0.0.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-3.2.0.tgz
	https://registry.yarnpkg.com/streamx/-/streamx-2.22.1.tgz
	https://registry.yarnpkg.com/string-argv/-/string-argv-0.3.2.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-4.0.2.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-5.0.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-7.2.0.tgz
	https://registry.yarnpkg.com/string.prototype.includes/-/string.prototype.includes-2.0.1.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.12.tgz
	https://registry.yarnpkg.com/string.prototype.repeat/-/string.prototype.repeat-1.0.0.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.10.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.9.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.8.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-4.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-5.0.2.tgz
	https://registry.yarnpkg.com/style-to-js/-/style-to-js-1.1.17.tgz
	https://registry.yarnpkg.com/style-to-object/-/style-to-object-1.0.9.tgz
	https://registry.yarnpkg.com/stylehacks/-/stylehacks-7.0.4.tgz
	https://registry.yarnpkg.com/stylelint-config-recommended/-/stylelint-config-recommended-17.0.0.tgz
	https://registry.yarnpkg.com/stylelint-config-standard/-/stylelint-config-standard-39.0.0.tgz
	https://registry.yarnpkg.com/stylelint-scss/-/stylelint-scss-6.12.1.tgz
	https://registry.yarnpkg.com/stylelint-value-no-unknown-custom-properties/-/stylelint-value-no-unknown-custom-properties-6.0.1.tgz
	https://registry.yarnpkg.com/stylelint/-/stylelint-16.23.1.tgz
	https://registry.yarnpkg.com/sugarss/-/sugarss-5.0.0.tgz
	https://registry.yarnpkg.com/supercluster/-/supercluster-8.0.1.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-3.2.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/svg-parser/-/svg-parser-2.0.4.tgz
	https://registry.yarnpkg.com/svg-tags/-/svg-tags-1.0.0.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-3.3.2.tgz
	https://registry.yarnpkg.com/symbol-tree/-/symbol-tree-3.2.4.tgz
	https://registry.yarnpkg.com/tabbable/-/tabbable-6.2.0.tgz
	https://registry.yarnpkg.com/table/-/table-6.9.0.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.1.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-2.2.2.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-2.1.3.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-3.1.0.tgz
	https://registry.yarnpkg.com/tar-js/-/tar-js-0.3.0.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-3.1.7.tgz
	https://registry.yarnpkg.com/temporal-polyfill/-/temporal-polyfill-0.3.0.tgz
	https://registry.yarnpkg.com/temporal-spec/-/temporal-spec-0.3.0.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-5.3.14.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.43.1.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-6.0.0.tgz
	https://registry.yarnpkg.com/testcontainers/-/testcontainers-11.5.1.tgz
	https://registry.yarnpkg.com/text-decoder/-/text-decoder-1.2.3.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/thingies/-/thingies-1.21.0.tgz
	https://registry.yarnpkg.com/thunky/-/thunky-1.1.0.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-2.0.12.tgz
	https://registry.yarnpkg.com/tiny-invariant/-/tiny-invariant-1.3.3.tgz
	https://registry.yarnpkg.com/tinyglobby/-/tinyglobby-0.2.14.tgz
	https://registry.yarnpkg.com/tinyqueue/-/tinyqueue-3.0.0.tgz
	https://registry.yarnpkg.com/tinyrainbow/-/tinyrainbow-2.0.0.tgz
	https://registry.yarnpkg.com/tinyspy/-/tinyspy-4.0.3.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.0.33.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.2.5.tgz
	https://registry.yarnpkg.com/tmpl/-/tmpl-1.0.5.tgz
	https://registry.yarnpkg.com/to-buffer/-/to-buffer-1.2.1.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/toidentifier/-/toidentifier-1.0.1.tgz
	https://registry.yarnpkg.com/totalist/-/totalist-3.0.1.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-4.1.4.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-1.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-3.0.0.tgz
	https://registry.yarnpkg.com/tree-dump/-/tree-dump-1.0.3.tgz
	https://registry.yarnpkg.com/tree-kill/-/tree-kill-1.2.2.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/ts-api-utils/-/ts-api-utils-2.1.0.tgz
	https://registry.yarnpkg.com/ts-dedent/-/ts-dedent-2.2.0.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-10.9.2.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.15.0.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-4.2.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.8.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.8.1.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.21.3.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-1.6.18.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-2.0.1.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.3.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.3.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.4.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.7.tgz
	https://registry.yarnpkg.com/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.8.3.tgz
	https://registry.yarnpkg.com/ua-parser-js/-/ua-parser-js-1.0.40.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-1.0.6.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.1.0.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.13.7.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-5.26.5.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-7.10.0.tgz
	https://registry.yarnpkg.com/undici/-/undici-7.14.0.tgz
	https://registry.yarnpkg.com/unhomoglyph/-/unhomoglyph-1.0.6.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.1.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.2.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unicorn-magic/-/unicorn-magic-0.1.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.2.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.1.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unplugin/-/unplugin-1.0.1.tgz
	https://registry.yarnpkg.com/unplugin/-/unplugin-1.16.1.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.1.3.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/url-parse/-/url-parse-1.5.10.tgz
	https://registry.yarnpkg.com/url/-/url-0.11.4.tgz
	https://registry.yarnpkg.com/use-callback-ref/-/use-callback-ref-1.3.3.tgz
	https://registry.yarnpkg.com/use-memo-one/-/use-memo-one-1.1.3.tgz
	https://registry.yarnpkg.com/use-sidecar/-/use-sidecar-1.1.3.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.5.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util/-/util-0.12.5.tgz
	https://registry.yarnpkg.com/utila/-/utila-0.4.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.1.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-10.0.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-11.1.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-8.3.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-9.0.1.tgz
	https://registry.yarnpkg.com/v8-compile-cache-lib/-/v8-compile-cache-lib-3.0.1.tgz
	https://registry.yarnpkg.com/v8-to-istanbul/-/v8-to-istanbul-9.3.0.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/vary/-/vary-1.1.2.tgz
	https://registry.yarnpkg.com/vaul/-/vaul-1.1.2.tgz
	https://registry.yarnpkg.com/vite-plugin-node-polyfills/-/vite-plugin-node-polyfills-0.24.0.tgz
	https://registry.yarnpkg.com/vite/-/vite-7.1.3.tgz
	https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-1.1.2.tgz
	https://registry.yarnpkg.com/w3c-xmlserializer/-/w3c-xmlserializer-4.0.0.tgz
	https://registry.yarnpkg.com/wait-on/-/wait-on-7.2.0.tgz
	https://registry.yarnpkg.com/wait-port/-/wait-port-0.2.14.tgz
	https://registry.yarnpkg.com/walk-up-path/-/walk-up-path-4.0.0.tgz
	https://registry.yarnpkg.com/walk/-/walk-2.3.15.tgz
	https://registry.yarnpkg.com/walker/-/walker-1.0.8.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-2.4.4.tgz
	https://registry.yarnpkg.com/wbuf/-/wbuf-1.7.3.tgz
	https://registry.yarnpkg.com/web-streams-polyfill/-/web-streams-polyfill-4.1.0.tgz
	https://registry.yarnpkg.com/web-vitals/-/web-vitals-4.2.4.tgz
	https://registry.yarnpkg.com/webcrypto-core/-/webcrypto-core-1.8.1.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-4.0.2.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-7.0.0.tgz
	https://registry.yarnpkg.com/webpack-bundle-analyzer/-/webpack-bundle-analyzer-4.10.2.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-6.0.1.tgz
	https://registry.yarnpkg.com/webpack-dev-middleware/-/webpack-dev-middleware-7.4.2.tgz
	https://registry.yarnpkg.com/webpack-dev-server/-/webpack-dev-server-5.2.2.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-6.0.1.tgz
	https://registry.yarnpkg.com/webpack-retry-chunk-load-plugin/-/webpack-retry-chunk-load-plugin-3.1.1.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.3.3.tgz
	https://registry.yarnpkg.com/webpack-version-file-plugin/-/webpack-version-file-plugin-0.5.0.tgz
	https://registry.yarnpkg.com/webpack-virtual-modules/-/webpack-virtual-modules-0.5.0.tgz
	https://registry.yarnpkg.com/webpack-virtual-modules/-/webpack-virtual-modules-0.6.2.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-5.101.3.tgz
	https://registry.yarnpkg.com/websocket-driver/-/websocket-driver-0.7.4.tgz
	https://registry.yarnpkg.com/websocket-extensions/-/websocket-extensions-0.1.4.tgz
	https://registry.yarnpkg.com/what-input/-/what-input-5.2.12.tgz
	https://registry.yarnpkg.com/whatwg-encoding/-/whatwg-encoding-2.0.0.tgz
	https://registry.yarnpkg.com/whatwg-mimetype/-/whatwg-mimetype-3.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-11.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-6.5.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.1.1.tgz
	https://registry.yarnpkg.com/which-builtin-type/-/which-builtin-type-1.2.1.tgz
	https://registry.yarnpkg.com/which-collection/-/which-collection-1.0.2.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-2.0.1.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.15.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.18.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.1.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.5.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-3.0.3.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-4.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-5.0.1.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.5.10.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.18.0.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.18.3.tgz
	https://registry.yarnpkg.com/xml-name-validator/-/xml-name-validator-4.0.0.tgz
	https://registry.yarnpkg.com/xml/-/xml-1.0.1.tgz
	https://registry.yarnpkg.com/xmlchars/-/xmlchars-2.2.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/xxhashjs/-/xxhashjs-0.2.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.3.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-2.8.1.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-18.1.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-15.4.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yn/-/yn-3.1.1.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-1.2.1.tgz
	https://registry.yarnpkg.com/zip-stream/-/zip-stream-6.0.1.tgz
	https://registry.yarnpkg.com/zod-validation-error/-/zod-validation-error-3.5.3.tgz
	https://registry.yarnpkg.com/zod/-/zod-3.25.76.tgz
) "

REPO="https://github.com/vector-im/element-web"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	EGIT_BRANCH="develop"
	DOWNLOAD=""
	IUSE="+build-online"
else
	IUSE="build-online"
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

COMMON_DEPEND=""

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}"

BDEPEND="
	${PYTHON_DEPS}
	sys-apps/yarn
	net-libs/nodejs
"

#TODO: Jitsi
#TODO: inherit webapp?

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
}

src_prepare() {
	default

	# Make SVGR not traverse the path up to / looking for a configuration file.
	# Fixes Error: "EACCES: permission denied, open '/.config/svgrrc'"
	# See https://github.com/PF4Public/gentoo-overlay/issues/276
	echo "runtimeConfig: false" > .svgrrc.yml || die
}

src_configure() {
	export PATH="/usr/$(get_libdir)/node_modules/npm/bin/node-gyp-bin:$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/node || die

	# Removing sentry dependency
	sed -i '/sentry\/webpack-plugin/d' "${WORKDIR}/${P}/package.json" || die
	sed -i '/sentry\/webpack-plugin/d' "${WORKDIR}/${P}/webpack.config.js" || die
	sed -i '/process.env.SENTRY_DSN \&\&/,/}),/s/^/\/\//' "${WORKDIR}/${P}/webpack.config.js" || die

	# Fixing pesky matrix-analytics-events
	sed -i 's/"matrix-analytics-events@github.*$/matrix-analytics-events@0.0.1:/' "${WORKDIR}/${P}/yarn.lock" || die
	sed -i 's/matrix-analytics-events "github:.*$/matrix-analytics-events "0.0.1"/' "${WORKDIR}/${P}/yarn.lock" || die

	#! 1. License of external_api.min.js in unclear
	#! 1.a License seems to be also Apache-2.0
	# einfo "Removing Jitsi"
	# sed -i '/"build:jitsi":.*$/{s++"build:jitsi": "echo",+;h};${x;/./{x;q0};x;q1}' \
	# 	package.json || die

	if ! use build-online
	then
		ONLINE_OFFLINE="--offline --frozen-lockfile"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi

	einfo "Installing node_modules"
	node /usr/bin/yarn install ${ONLINE_OFFLINE} --no-progress --ignore-scripts || die
}

src_compile() {
	node /usr/bin/yarn run build || die
}

src_install() {
	insinto /usr/share/element-web
	doins -r webapp/*
	dosym ../../../etc/element-web/config.json /usr/share/element-web/config.json

	insinto /etc/element-web
	newins config.sample.json config.json
}

pkg_postinst() {
	if ! has_version "net-im/element-desktop"
	then
		elog
		elog "element-web provides only a web application ready to be served"
		elog "If you need a desktop application, consider element-desktop"
		elog
	fi
}
