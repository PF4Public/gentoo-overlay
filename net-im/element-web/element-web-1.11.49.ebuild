# Copyright 2009-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A glossy Matrix collaboration client for the web"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="!build-online? (
	https://registry.yarnpkg.com/@aashutoshrathi/word-wrap/-/word-wrap-1.2.6.tgz -> @aashutoshrathi-word-wrap-1.2.6.tgz
	https://registry.yarnpkg.com/@actions/core/-/core-1.10.1.tgz -> @actions-core-1.10.1.tgz
	https://registry.yarnpkg.com/@actions/github/-/github-5.1.1.tgz -> @actions-github-5.1.1.tgz
	https://registry.yarnpkg.com/@actions/http-client/-/http-client-2.2.0.tgz -> @actions-http-client-2.2.0.tgz
	https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.2.1.tgz -> @ampproject-remapping-2.2.1.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.22.13.tgz -> @babel-code-frame-7.22.13.tgz
	https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.23.2.tgz -> @babel-compat-data-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.23.2.tgz -> @babel-core-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/eslint-parser/-/eslint-parser-7.22.15.tgz -> @babel-eslint-parser-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/eslint-plugin/-/eslint-plugin-7.22.10.tgz -> @babel-eslint-plugin-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.23.0.tgz -> @babel-generator-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.22.5.tgz -> @babel-helper-annotate-as-pure-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.22.15.tgz -> @babel-helper-builder-binary-assignment-operator-visitor-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.22.15.tgz -> @babel-helper-compilation-targets-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.22.15.tgz -> @babel-helper-create-class-features-plugin-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.22.15.tgz -> @babel-helper-create-regexp-features-plugin-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.4.3.tgz -> @babel-helper-define-polyfill-provider-0.4.3.tgz
	https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.22.20.tgz -> @babel-helper-environment-visitor-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.23.0.tgz -> @babel-helper-function-name-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.22.5.tgz -> @babel-helper-hoist-variables-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.23.0.tgz -> @babel-helper-member-expression-to-functions-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.22.15.tgz -> @babel-helper-module-imports-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.23.0.tgz -> @babel-helper-module-transforms-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.22.5.tgz -> @babel-helper-optimise-call-expression-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.22.5.tgz -> @babel-helper-plugin-utils-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.22.20.tgz -> @babel-helper-remap-async-to-generator-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.22.20.tgz -> @babel-helper-replace-supers-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.22.5.tgz -> @babel-helper-simple-access-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.22.5.tgz -> @babel-helper-skip-transparent-expression-wrappers-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.22.6.tgz -> @babel-helper-split-export-declaration-7.22.6.tgz
	https://registry.yarnpkg.com/@babel/helper-string-parser/-/helper-string-parser-7.22.5.tgz -> @babel-helper-string-parser-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.22.20.tgz -> @babel-helper-validator-identifier-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.22.15.tgz -> @babel-helper-validator-option-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.22.20.tgz -> @babel-helper-wrap-function-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.23.2.tgz -> @babel-helpers-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.22.20.tgz -> @babel-highlight-7.22.20.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.23.0.tgz -> @babel-parser-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.22.15.tgz -> @babel-plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.22.15.tgz -> @babel-plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.18.6.tgz -> @babel-plugin-proposal-class-properties-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-export-default-from/-/plugin-proposal-export-default-from-7.22.17.tgz -> @babel-plugin-proposal-export-default-from-7.22.17.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-logical-assignment-operators/-/plugin-proposal-logical-assignment-operators-7.20.7.tgz -> @babel-plugin-proposal-logical-assignment-operators-7.20.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.18.6.tgz -> @babel-plugin-proposal-nullish-coalescing-operator-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.18.6.tgz -> @babel-plugin-proposal-numeric-separator-7.18.6.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.20.7.tgz -> @babel-plugin-proposal-object-rest-spread-7.20.7.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.21.0.tgz -> @babel-plugin-proposal-optional-chaining-7.21.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz -> @babel-plugin-proposal-private-property-in-object-7.21.0-placeholder-for-preset-env.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz -> @babel-plugin-syntax-bigint-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz -> @babel-plugin-syntax-class-properties-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz -> @babel-plugin-syntax-class-static-block-7.14.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz -> @babel-plugin-syntax-dynamic-import-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-export-default-from/-/plugin-syntax-export-default-from-7.22.5.tgz -> @babel-plugin-syntax-export-default-from-7.22.5.tgz
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
	https://registry.yarnpkg.com/@babel/plugin-transform-async-generator-functions/-/plugin-transform-async-generator-functions-7.23.2.tgz -> @babel-plugin-transform-async-generator-functions-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.22.5.tgz -> @babel-plugin-transform-async-to-generator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.22.5.tgz -> @babel-plugin-transform-block-scoped-functions-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.23.0.tgz -> @babel-plugin-transform-block-scoping-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-properties/-/plugin-transform-class-properties-7.22.5.tgz -> @babel-plugin-transform-class-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-class-static-block/-/plugin-transform-class-static-block-7.22.11.tgz -> @babel-plugin-transform-class-static-block-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.22.15.tgz -> @babel-plugin-transform-classes-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.22.5.tgz -> @babel-plugin-transform-computed-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.23.0.tgz -> @babel-plugin-transform-destructuring-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.22.5.tgz -> @babel-plugin-transform-dotall-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.22.5.tgz -> @babel-plugin-transform-duplicate-keys-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-dynamic-import/-/plugin-transform-dynamic-import-7.22.11.tgz -> @babel-plugin-transform-dynamic-import-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.22.5.tgz -> @babel-plugin-transform-exponentiation-operator-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-export-namespace-from/-/plugin-transform-export-namespace-from-7.22.11.tgz -> @babel-plugin-transform-export-namespace-from-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.22.15.tgz -> @babel-plugin-transform-for-of-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.22.5.tgz -> @babel-plugin-transform-function-name-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-json-strings/-/plugin-transform-json-strings-7.22.11.tgz -> @babel-plugin-transform-json-strings-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.22.5.tgz -> @babel-plugin-transform-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-logical-assignment-operators/-/plugin-transform-logical-assignment-operators-7.22.11.tgz -> @babel-plugin-transform-logical-assignment-operators-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.22.5.tgz -> @babel-plugin-transform-member-expression-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.23.0.tgz -> @babel-plugin-transform-modules-amd-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.23.0.tgz -> @babel-plugin-transform-modules-commonjs-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.23.0.tgz -> @babel-plugin-transform-modules-systemjs-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.22.5.tgz -> @babel-plugin-transform-modules-umd-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.22.5.tgz -> @babel-plugin-transform-named-capturing-groups-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.22.5.tgz -> @babel-plugin-transform-new-target-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-nullish-coalescing-operator/-/plugin-transform-nullish-coalescing-operator-7.22.11.tgz -> @babel-plugin-transform-nullish-coalescing-operator-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-numeric-separator/-/plugin-transform-numeric-separator-7.22.11.tgz -> @babel-plugin-transform-numeric-separator-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-rest-spread/-/plugin-transform-object-rest-spread-7.22.15.tgz -> @babel-plugin-transform-object-rest-spread-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.22.5.tgz -> @babel-plugin-transform-object-super-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-catch-binding/-/plugin-transform-optional-catch-binding-7.22.11.tgz -> @babel-plugin-transform-optional-catch-binding-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-optional-chaining/-/plugin-transform-optional-chaining-7.23.0.tgz -> @babel-plugin-transform-optional-chaining-7.23.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.22.15.tgz -> @babel-plugin-transform-parameters-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-methods/-/plugin-transform-private-methods-7.22.5.tgz -> @babel-plugin-transform-private-methods-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-private-property-in-object/-/plugin-transform-private-property-in-object-7.22.11.tgz -> @babel-plugin-transform-private-property-in-object-7.22.11.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.22.5.tgz -> @babel-plugin-transform-property-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-constant-elements/-/plugin-transform-react-constant-elements-7.22.5.tgz -> @babel-plugin-transform-react-constant-elements-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.22.5.tgz -> @babel-plugin-transform-react-display-name-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.22.5.tgz -> @babel-plugin-transform-react-jsx-development-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.22.15.tgz -> @babel-plugin-transform-react-jsx-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-react-pure-annotations/-/plugin-transform-react-pure-annotations-7.22.5.tgz -> @babel-plugin-transform-react-pure-annotations-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.22.10.tgz -> @babel-plugin-transform-regenerator-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.22.5.tgz -> @babel-plugin-transform-reserved-words-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-runtime/-/plugin-transform-runtime-7.23.2.tgz -> @babel-plugin-transform-runtime-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.22.5.tgz -> @babel-plugin-transform-shorthand-properties-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.22.5.tgz -> @babel-plugin-transform-spread-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.22.5.tgz -> @babel-plugin-transform-sticky-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.22.5.tgz -> @babel-plugin-transform-template-literals-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.22.5.tgz -> @babel-plugin-transform-typeof-symbol-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.22.15.tgz -> @babel-plugin-transform-typescript-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.22.10.tgz -> @babel-plugin-transform-unicode-escapes-7.22.10.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-property-regex/-/plugin-transform-unicode-property-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-property-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/plugin-transform-unicode-sets-regex/-/plugin-transform-unicode-sets-regex-7.22.5.tgz -> @babel-plugin-transform-unicode-sets-regex-7.22.5.tgz
	https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.23.2.tgz -> @babel-preset-env-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.6-no-external-plugins.tgz -> @babel-preset-modules-0.1.6-no-external-plugins.tgz
	https://registry.yarnpkg.com/@babel/preset-react/-/preset-react-7.22.15.tgz -> @babel-preset-react-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.23.2.tgz -> @babel-preset-typescript-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/register/-/register-7.22.15.tgz -> @babel-register-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/regjsgen/-/regjsgen-0.8.0.tgz -> @babel-regjsgen-0.8.0.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.23.2.tgz -> @babel-runtime-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.22.15.tgz -> @babel-template-7.22.15.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.23.2.tgz -> @babel-traverse-7.23.2.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.23.0.tgz -> @babel-types-7.23.0.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz -> @bcoe-v8-coverage-0.2.3.tgz
	https://registry.yarnpkg.com/@casualbot/jest-sonar-reporter/-/jest-sonar-reporter-2.2.7.tgz -> @casualbot-jest-sonar-reporter-2.2.7.tgz
	https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.8.1.tgz -> @cspotcode-source-map-support-0.8.1.tgz
	https://registry.yarnpkg.com/@csstools/convert-colors/-/convert-colors-1.4.0.tgz -> @csstools-convert-colors-1.4.0.tgz
	https://registry.yarnpkg.com/@csstools/css-parser-algorithms/-/css-parser-algorithms-2.3.2.tgz -> @csstools-css-parser-algorithms-2.3.2.tgz
	https://registry.yarnpkg.com/@csstools/css-tokenizer/-/css-tokenizer-2.2.1.tgz -> @csstools-css-tokenizer-2.2.1.tgz
	https://registry.yarnpkg.com/@csstools/media-query-list-parser/-/media-query-list-parser-2.1.5.tgz -> @csstools-media-query-list-parser-2.1.5.tgz
	https://registry.yarnpkg.com/@csstools/selector-specificity/-/selector-specificity-3.0.0.tgz -> @csstools-selector-specificity-3.0.0.tgz
	https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz -> @discoveryjs-json-ext-0.5.7.tgz
	https://registry.yarnpkg.com/@eslint-community/eslint-utils/-/eslint-utils-4.4.0.tgz -> @eslint-community-eslint-utils-4.4.0.tgz
	https://registry.yarnpkg.com/@eslint-community/regexpp/-/regexpp-4.9.1.tgz -> @eslint-community-regexpp-4.9.1.tgz
	https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-2.1.2.tgz -> @eslint-eslintrc-2.1.2.tgz
	https://registry.yarnpkg.com/@eslint/js/-/js-8.51.0.tgz -> @eslint-js-8.51.0.tgz
	https://registry.yarnpkg.com/@fastify/busboy/-/busboy-2.0.0.tgz -> @fastify-busboy-2.0.0.tgz
	https://registry.yarnpkg.com/@floating-ui/core/-/core-1.5.0.tgz -> @floating-ui-core-1.5.0.tgz
	https://registry.yarnpkg.com/@floating-ui/dom/-/dom-1.5.3.tgz -> @floating-ui-dom-1.5.3.tgz
	https://registry.yarnpkg.com/@floating-ui/react-dom/-/react-dom-2.0.2.tgz -> @floating-ui-react-dom-2.0.2.tgz
	https://registry.yarnpkg.com/@floating-ui/utils/-/utils-0.1.6.tgz -> @floating-ui-utils-0.1.6.tgz
	https://registry.yarnpkg.com/@gar/promisify/-/promisify-1.1.3.tgz -> @gar-promisify-1.1.3.tgz
	https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.11.11.tgz -> @humanwhocodes-config-array-0.11.11.tgz
	https://registry.yarnpkg.com/@humanwhocodes/module-importer/-/module-importer-1.0.1.tgz -> @humanwhocodes-module-importer-1.0.1.tgz
	https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz -> @humanwhocodes-object-schema-1.2.1.tgz
	https://registry.yarnpkg.com/@isaacs/cliui/-/cliui-8.0.2.tgz -> @isaacs-cliui-8.0.2.tgz
	https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz -> @istanbuljs-load-nyc-config-1.1.0.tgz
	https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.3.tgz -> @istanbuljs-schema-0.1.3.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-29.7.0.tgz -> @jest-console-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-29.7.0.tgz -> @jest-core-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-29.7.0.tgz -> @jest-environment-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/expect-utils/-/expect-utils-28.1.3.tgz -> @jest-expect-utils-28.1.3.tgz
	https://registry.yarnpkg.com/@jest/expect-utils/-/expect-utils-29.7.0.tgz -> @jest-expect-utils-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/expect/-/expect-29.7.0.tgz -> @jest-expect-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-29.7.0.tgz -> @jest-fake-timers-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/globals/-/globals-29.7.0.tgz -> @jest-globals-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-29.7.0.tgz -> @jest-reporters-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/schemas/-/schemas-28.1.3.tgz -> @jest-schemas-28.1.3.tgz
	https://registry.yarnpkg.com/@jest/schemas/-/schemas-29.6.3.tgz -> @jest-schemas-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-29.6.3.tgz -> @jest-source-map-29.6.3.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-29.7.0.tgz -> @jest-test-result-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-29.7.0.tgz -> @jest-test-sequencer-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-29.7.0.tgz -> @jest-transform-29.7.0.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-28.1.3.tgz -> @jest-types-28.1.3.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-29.6.3.tgz -> @jest-types-29.6.3.tgz
	https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.3.tgz -> @jridgewell-gen-mapping-0.3.3.tgz
	https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.1.1.tgz -> @jridgewell-resolve-uri-3.1.1.tgz
	https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.1.2.tgz -> @jridgewell-set-array-1.1.2.tgz
	https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.5.tgz -> @jridgewell-source-map-0.3.5.tgz
	https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.15.tgz -> @jridgewell-sourcemap-codec-1.4.15.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.20.tgz -> @jridgewell-trace-mapping-0.3.20.tgz
	https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.9.tgz -> @jridgewell-trace-mapping-0.3.9.tgz
	https://registry.yarnpkg.com/@leichtgewicht/ip-codec/-/ip-codec-2.0.4.tgz -> @leichtgewicht-ip-codec-2.0.4.tgz
	https://registry.yarnpkg.com/@mapbox/geojson-rewind/-/geojson-rewind-0.5.2.tgz -> @mapbox-geojson-rewind-0.5.2.tgz
	https://registry.yarnpkg.com/@mapbox/jsonlint-lines-primitives/-/jsonlint-lines-primitives-2.0.2.tgz -> @mapbox-jsonlint-lines-primitives-2.0.2.tgz
	https://registry.yarnpkg.com/@mapbox/mapbox-gl-supported/-/mapbox-gl-supported-2.0.1.tgz -> @mapbox-mapbox-gl-supported-2.0.1.tgz
	https://registry.yarnpkg.com/@mapbox/point-geometry/-/point-geometry-0.1.0.tgz -> @mapbox-point-geometry-0.1.0.tgz
	https://registry.yarnpkg.com/@mapbox/tiny-sdf/-/tiny-sdf-2.0.6.tgz -> @mapbox-tiny-sdf-2.0.6.tgz
	https://registry.yarnpkg.com/@mapbox/unitbezier/-/unitbezier-0.0.1.tgz -> @mapbox-unitbezier-0.0.1.tgz
	https://registry.yarnpkg.com/@mapbox/vector-tile/-/vector-tile-1.3.1.tgz -> @mapbox-vector-tile-1.3.1.tgz
	https://registry.yarnpkg.com/@mapbox/whoots-js/-/whoots-js-3.1.0.tgz -> @mapbox-whoots-js-3.1.0.tgz
	https://registry.yarnpkg.com/@matrix-org/analytics-events/-/analytics-events-0.8.0.tgz -> @matrix-org-analytics-events-0.8.0.tgz
	https://registry.yarnpkg.com/@matrix-org/emojibase-bindings/-/emojibase-bindings-1.1.3.tgz -> @matrix-org-emojibase-bindings-1.1.3.tgz
	https://registry.yarnpkg.com/@matrix-org/matrix-sdk-crypto-wasm/-/matrix-sdk-crypto-wasm-2.2.0.tgz -> @matrix-org-matrix-sdk-crypto-wasm-2.2.0.tgz
	https://registry.yarnpkg.com/@matrix-org/matrix-wysiwyg/-/matrix-wysiwyg-2.4.1.tgz -> @matrix-org-matrix-wysiwyg-2.4.1.tgz
	https://registry.yarnpkg.com/@matrix-org/olm/-/olm-3.2.15.tgz -> @matrix-org-olm-3.2.15.tgz
	https://registry.yarnpkg.com/@matrix-org/react-sdk-module-api/-/react-sdk-module-api-2.1.1.tgz -> @matrix-org-react-sdk-module-api-2.1.1.tgz
	https://registry.yarnpkg.com/@matrix-org/spec/-/spec-1.8.0.tgz -> @matrix-org-spec-1.8.0.tgz
	https://registry.yarnpkg.com/@mrmlnc/readdir-enhanced/-/readdir-enhanced-2.2.1.tgz -> @mrmlnc-readdir-enhanced-2.2.1.tgz
	https://registry.yarnpkg.com/@nicolo-ribaudo/eslint-scope-5-internals/-/eslint-scope-5-internals-5.1.1-v1.tgz -> @nicolo-ribaudo-eslint-scope-5-internals-5.1.1-v1.tgz
	https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz -> @nodelib-fs.scandir-2.1.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-1.1.3.tgz -> @nodelib-fs.stat-1.1.3.tgz
	https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz -> @nodelib-fs.stat-2.0.5.tgz
	https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz -> @nodelib-fs.walk-1.2.8.tgz
	https://registry.yarnpkg.com/@npmcli/fs/-/fs-1.1.1.tgz -> @npmcli-fs-1.1.1.tgz
	https://registry.yarnpkg.com/@npmcli/move-file/-/move-file-1.1.2.tgz -> @npmcli-move-file-1.1.2.tgz
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
	https://registry.yarnpkg.com/@polka/url/-/url-1.0.0-next.23.tgz -> @polka-url-1.0.0-next.23.tgz
	https://registry.yarnpkg.com/@principalstudio/html-webpack-inject-preload/-/html-webpack-inject-preload-1.2.7.tgz -> @principalstudio-html-webpack-inject-preload-1.2.7.tgz
	https://registry.yarnpkg.com/@radix-ui/primitive/-/primitive-1.0.1.tgz -> @radix-ui-primitive-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-arrow/-/react-arrow-1.0.3.tgz -> @radix-ui-react-arrow-1.0.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-compose-refs/-/react-compose-refs-1.0.1.tgz -> @radix-ui-react-compose-refs-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-context/-/react-context-1.0.1.tgz -> @radix-ui-react-context-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-dismissable-layer/-/react-dismissable-layer-1.0.5.tgz -> @radix-ui-react-dismissable-layer-1.0.5.tgz
	https://registry.yarnpkg.com/@radix-ui/react-form/-/react-form-0.0.3.tgz -> @radix-ui-react-form-0.0.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-id/-/react-id-1.0.1.tgz -> @radix-ui-react-id-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-label/-/react-label-2.0.2.tgz -> @radix-ui-react-label-2.0.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-popper/-/react-popper-1.1.3.tgz -> @radix-ui-react-popper-1.1.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-portal/-/react-portal-1.0.4.tgz -> @radix-ui-react-portal-1.0.4.tgz
	https://registry.yarnpkg.com/@radix-ui/react-presence/-/react-presence-1.0.1.tgz -> @radix-ui-react-presence-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-primitive/-/react-primitive-1.0.3.tgz -> @radix-ui-react-primitive-1.0.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-slot/-/react-slot-1.0.2.tgz -> @radix-ui-react-slot-1.0.2.tgz
	https://registry.yarnpkg.com/@radix-ui/react-tooltip/-/react-tooltip-1.0.7.tgz -> @radix-ui-react-tooltip-1.0.7.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-callback-ref/-/react-use-callback-ref-1.0.1.tgz -> @radix-ui-react-use-callback-ref-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-controllable-state/-/react-use-controllable-state-1.0.1.tgz -> @radix-ui-react-use-controllable-state-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-escape-keydown/-/react-use-escape-keydown-1.0.3.tgz -> @radix-ui-react-use-escape-keydown-1.0.3.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-layout-effect/-/react-use-layout-effect-1.0.1.tgz -> @radix-ui-react-use-layout-effect-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-rect/-/react-use-rect-1.0.1.tgz -> @radix-ui-react-use-rect-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-use-size/-/react-use-size-1.0.1.tgz -> @radix-ui-react-use-size-1.0.1.tgz
	https://registry.yarnpkg.com/@radix-ui/react-visually-hidden/-/react-visually-hidden-1.0.3.tgz -> @radix-ui-react-visually-hidden-1.0.3.tgz
	https://registry.yarnpkg.com/@radix-ui/rect/-/rect-1.0.1.tgz -> @radix-ui-rect-1.0.1.tgz
	https://registry.yarnpkg.com/@sentry-internal/tracing/-/tracing-7.74.1.tgz -> @sentry-internal-tracing-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/browser/-/browser-7.74.1.tgz -> @sentry-browser-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/bundler-plugin-core/-/bundler-plugin-core-2.8.0.tgz -> @sentry-bundler-plugin-core-2.8.0.tgz
	https://registry.yarnpkg.com/@sentry/cli/-/cli-2.21.2.tgz -> @sentry-cli-2.21.2.tgz
	https://registry.yarnpkg.com/@sentry/core/-/core-7.74.1.tgz -> @sentry-core-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/node/-/node-7.74.1.tgz -> @sentry-node-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/replay/-/replay-7.74.1.tgz -> @sentry-replay-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/tracing/-/tracing-7.74.1.tgz -> @sentry-tracing-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/types/-/types-7.74.1.tgz -> @sentry-types-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/utils/-/utils-7.74.1.tgz -> @sentry-utils-7.74.1.tgz
	https://registry.yarnpkg.com/@sentry/webpack-plugin/-/webpack-plugin-2.8.0.tgz -> @sentry-webpack-plugin-2.8.0.tgz
	https://registry.yarnpkg.com/@sinclair/typebox/-/typebox-0.24.51.tgz -> @sinclair-typebox-0.24.51.tgz
	https://registry.yarnpkg.com/@sinclair/typebox/-/typebox-0.27.8.tgz -> @sinclair-typebox-0.27.8.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-3.0.0.tgz -> @sinonjs-commons-3.0.0.tgz
	https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-10.3.0.tgz -> @sinonjs-fake-timers-10.3.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-5.4.0.tgz -> @svgr-babel-plugin-add-jsx-attribute-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-5.4.0.tgz -> @svgr-babel-plugin-remove-jsx-attribute-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-5.0.1.tgz -> @svgr-babel-plugin-remove-jsx-empty-expression-5.0.1.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-5.0.1.tgz -> @svgr-babel-plugin-replace-jsx-attribute-value-5.0.1.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-5.4.0.tgz -> @svgr-babel-plugin-svg-dynamic-title-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-5.4.0.tgz -> @svgr-babel-plugin-svg-em-dimensions-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-5.4.0.tgz -> @svgr-babel-plugin-transform-react-native-svg-5.4.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-5.5.0.tgz -> @svgr-babel-plugin-transform-svg-component-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-5.5.0.tgz -> @svgr-babel-preset-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/core/-/core-5.5.0.tgz -> @svgr-core-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-5.5.0.tgz -> @svgr-hast-util-to-babel-ast-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-5.5.0.tgz -> @svgr-plugin-jsx-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-5.5.0.tgz -> @svgr-plugin-svgo-5.5.0.tgz
	https://registry.yarnpkg.com/@svgr/webpack/-/webpack-5.5.0.tgz -> @svgr-webpack-5.5.0.tgz
	https://registry.yarnpkg.com/@testing-library/dom/-/dom-8.20.1.tgz -> @testing-library-dom-8.20.1.tgz
	https://registry.yarnpkg.com/@testing-library/react-hooks/-/react-hooks-8.0.1.tgz -> @testing-library-react-hooks-8.0.1.tgz
	https://registry.yarnpkg.com/@testing-library/react/-/react-12.1.5.tgz -> @testing-library-react-12.1.5.tgz
	https://registry.yarnpkg.com/@tootallnate/once/-/once-2.0.0.tgz -> @tootallnate-once-2.0.0.tgz
	https://registry.yarnpkg.com/@tootallnate/quickjs-emscripten/-/quickjs-emscripten-0.23.0.tgz -> @tootallnate-quickjs-emscripten-0.23.0.tgz
	https://registry.yarnpkg.com/@trysound/sax/-/sax-0.2.0.tgz -> @trysound-sax-0.2.0.tgz
	https://registry.yarnpkg.com/@ts-morph/common/-/common-0.12.3.tgz -> @ts-morph-common-0.12.3.tgz
	https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.9.tgz -> @tsconfig-node10-1.0.9.tgz
	https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.11.tgz -> @tsconfig-node12-1.0.11.tgz
	https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.3.tgz -> @tsconfig-node14-1.0.3.tgz
	https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.4.tgz -> @tsconfig-node16-1.0.4.tgz
	https://registry.yarnpkg.com/@types/aria-query/-/aria-query-5.0.3.tgz -> @types-aria-query-5.0.3.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.20.3.tgz -> @types-babel__core-7.20.3.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.6.tgz -> @types-babel__generator-7.6.6.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.3.tgz -> @types-babel__template-7.4.3.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.20.3.tgz -> @types-babel__traverse-7.20.3.tgz
	https://registry.yarnpkg.com/@types/body-parser/-/body-parser-1.19.3.tgz -> @types-body-parser-1.19.3.tgz
	https://registry.yarnpkg.com/@types/bonjour/-/bonjour-3.5.11.tgz -> @types-bonjour-3.5.11.tgz
	https://registry.yarnpkg.com/@types/connect-history-api-fallback/-/connect-history-api-fallback-1.5.1.tgz -> @types-connect-history-api-fallback-1.5.1.tgz
	https://registry.yarnpkg.com/@types/connect/-/connect-3.4.36.tgz -> @types-connect-3.4.36.tgz
	https://registry.yarnpkg.com/@types/events/-/events-3.0.2.tgz -> @types-events-3.0.2.tgz
	https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-4.17.36.tgz -> @types-express-serve-static-core-4.17.36.tgz
	https://registry.yarnpkg.com/@types/express/-/express-4.17.17.tgz -> @types-express-4.17.17.tgz
	https://registry.yarnpkg.com/@types/geojson/-/geojson-7946.0.12.tgz -> @types-geojson-7946.0.12.tgz
	https://registry.yarnpkg.com/@types/graceful-fs/-/graceful-fs-4.1.8.tgz -> @types-graceful-fs-4.1.8.tgz
	https://registry.yarnpkg.com/@types/hoist-non-react-statics/-/hoist-non-react-statics-3.3.4.tgz -> @types-hoist-non-react-statics-3.3.4.tgz
	https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-5.1.2.tgz -> @types-html-minifier-terser-5.1.2.tgz
	https://registry.yarnpkg.com/@types/http-errors/-/http-errors-2.0.2.tgz -> @types-http-errors-2.0.2.tgz
	https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.12.tgz -> @types-http-proxy-1.17.12.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.5.tgz -> @types-istanbul-lib-coverage-2.0.5.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.2.tgz -> @types-istanbul-lib-report-3.0.2.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.3.tgz -> @types-istanbul-reports-3.0.3.tgz
	https://registry.yarnpkg.com/@types/jest/-/jest-29.5.6.tgz -> @types-jest-29.5.6.tgz
	https://registry.yarnpkg.com/@types/jitsi-meet/-/jitsi-meet-2.0.4.tgz -> @types-jitsi-meet-2.0.4.tgz
	https://registry.yarnpkg.com/@types/jsdom/-/jsdom-20.0.1.tgz -> @types-jsdom-20.0.1.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.14.tgz -> @types-json-schema-7.0.14.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/jsrsasign/-/jsrsasign-10.5.10.tgz -> @types-jsrsasign-10.5.10.tgz
	https://registry.yarnpkg.com/@types/loader-utils/-/loader-utils-2.0.5.tgz -> @types-loader-utils-2.0.5.tgz
	https://registry.yarnpkg.com/@types/lodash/-/lodash-4.14.200.tgz -> @types-lodash-4.14.200.tgz
	https://registry.yarnpkg.com/@types/mapbox__point-geometry/-/mapbox__point-geometry-0.1.3.tgz -> @types-mapbox__point-geometry-0.1.3.tgz
	https://registry.yarnpkg.com/@types/mapbox__vector-tile/-/mapbox__vector-tile-1.3.2.tgz -> @types-mapbox__vector-tile-1.3.2.tgz
	https://registry.yarnpkg.com/@types/mime/-/mime-1.3.2.tgz -> @types-mime-1.3.2.tgz
	https://registry.yarnpkg.com/@types/mime/-/mime-3.0.1.tgz -> @types-mime-3.0.1.tgz
	https://registry.yarnpkg.com/@types/minimist/-/minimist-1.2.4.tgz -> @types-minimist-1.2.4.tgz
	https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.6.7.tgz -> @types-node-fetch-2.6.7.tgz
	https://registry.yarnpkg.com/@types/node/-/node-16.18.59.tgz -> @types-node-16.18.59.tgz
	https://registry.yarnpkg.com/@types/node/-/node-20.8.7.tgz -> @types-node-20.8.7.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.3.tgz -> @types-normalize-package-data-2.4.3.tgz
	https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.1.tgz -> @types-parse-json-4.0.1.tgz
	https://registry.yarnpkg.com/@types/pbf/-/pbf-3.0.4.tgz -> @types-pbf-3.0.4.tgz
	https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.9.tgz -> @types-prop-types-15.7.9.tgz
	https://registry.yarnpkg.com/@types/q/-/q-1.5.7.tgz -> @types-q-1.5.7.tgz
	https://registry.yarnpkg.com/@types/qs/-/qs-6.9.9.tgz -> @types-qs-6.9.9.tgz
	https://registry.yarnpkg.com/@types/range-parser/-/range-parser-1.2.6.tgz -> @types-range-parser-1.2.6.tgz
	https://registry.yarnpkg.com/@types/react-dom/-/react-dom-17.0.21.tgz -> @types-react-dom-17.0.21.tgz
	https://registry.yarnpkg.com/@types/react-redux/-/react-redux-7.1.28.tgz -> @types-react-redux-7.1.28.tgz
	https://registry.yarnpkg.com/@types/react/-/react-17.0.68.tgz -> @types-react-17.0.68.tgz
	https://registry.yarnpkg.com/@types/retry/-/retry-0.12.0.tgz -> @types-retry-0.12.0.tgz
	https://registry.yarnpkg.com/@types/scheduler/-/scheduler-0.16.4.tgz -> @types-scheduler-0.16.4.tgz
	https://registry.yarnpkg.com/@types/semver/-/semver-7.5.3.tgz -> @types-semver-7.5.3.tgz
	https://registry.yarnpkg.com/@types/send/-/send-0.17.1.tgz -> @types-send-0.17.1.tgz
	https://registry.yarnpkg.com/@types/serve-index/-/serve-index-1.9.1.tgz -> @types-serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/@types/serve-static/-/serve-static-1.15.2.tgz -> @types-serve-static-1.15.2.tgz
	https://registry.yarnpkg.com/@types/sockjs/-/sockjs-0.3.33.tgz -> @types-sockjs-0.3.33.tgz
	https://registry.yarnpkg.com/@types/source-list-map/-/source-list-map-0.1.4.tgz -> @types-source-list-map-0.1.4.tgz
	https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-2.0.2.tgz -> @types-stack-utils-2.0.2.tgz
	https://registry.yarnpkg.com/@types/tapable/-/tapable-1.0.10.tgz -> @types-tapable-1.0.10.tgz
	https://registry.yarnpkg.com/@types/tough-cookie/-/tough-cookie-4.0.3.tgz -> @types-tough-cookie-4.0.3.tgz
	https://registry.yarnpkg.com/@types/ua-parser-js/-/ua-parser-js-0.7.37.tgz -> @types-ua-parser-js-0.7.37.tgz
	https://registry.yarnpkg.com/@types/uglify-js/-/uglify-js-3.17.2.tgz -> @types-uglify-js-3.17.2.tgz
	https://registry.yarnpkg.com/@types/webpack-sources/-/webpack-sources-3.2.1.tgz -> @types-webpack-sources-3.2.1.tgz
	https://registry.yarnpkg.com/@types/webpack/-/webpack-4.41.34.tgz -> @types-webpack-4.41.34.tgz
	https://registry.yarnpkg.com/@types/ws/-/ws-8.5.5.tgz -> @types-ws-8.5.5.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.1.tgz -> @types-yargs-parser-21.0.1.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.28.tgz -> @types-yargs-17.0.28.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.62.0.tgz -> @typescript-eslint-eslint-plugin-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.62.0.tgz -> @typescript-eslint-parser-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.62.0.tgz -> @typescript-eslint-scope-manager-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.62.0.tgz -> @typescript-eslint-type-utils-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.62.0.tgz -> @typescript-eslint-types-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.62.0.tgz -> @typescript-eslint-typescript-estree-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.62.0.tgz -> @typescript-eslint-utils-5.62.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.62.0.tgz -> @typescript-eslint-visitor-keys-5.62.0.tgz
	https://registry.yarnpkg.com/@vector-im/compound-design-tokens/-/compound-design-tokens-0.0.6.tgz -> @vector-im-compound-design-tokens-0.0.6.tgz
	https://registry.yarnpkg.com/@vector-im/compound-web/-/compound-web-0.5.4.tgz -> @vector-im-compound-web-0.5.4.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.9.0.tgz -> @webassemblyjs-ast-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz -> @webassemblyjs-floating-point-hex-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz -> @webassemblyjs-helper-api-error-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz -> @webassemblyjs-helper-buffer-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz -> @webassemblyjs-helper-code-frame-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz -> @webassemblyjs-helper-fsm-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz -> @webassemblyjs-helper-module-context-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz -> @webassemblyjs-helper-wasm-bytecode-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz -> @webassemblyjs-helper-wasm-section-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz -> @webassemblyjs-ieee754-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.9.0.tgz -> @webassemblyjs-leb128-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.9.0.tgz -> @webassemblyjs-utf8-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz -> @webassemblyjs-wasm-edit-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz -> @webassemblyjs-wasm-gen-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz -> @webassemblyjs-wasm-opt-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz -> @webassemblyjs-wasm-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz -> @webassemblyjs-wast-parser-1.9.0.tgz
	https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz -> @webassemblyjs-wast-printer-1.9.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-1.2.0.tgz -> @webpack-cli-configtest-1.2.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/info/-/info-1.5.0.tgz -> @webpack-cli-info-1.5.0.tgz
	https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-1.7.0.tgz -> @webpack-cli-serve-1.7.0.tgz
	https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz -> @xtuc-ieee754-1.2.0.tgz
	https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz -> @xtuc-long-4.2.2.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/core/-/core-3.0.4.tgz -> @zxcvbn-ts-core-3.0.4.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/language-common/-/language-common-3.0.4.tgz -> @zxcvbn-ts-language-common-3.0.4.tgz
	https://registry.yarnpkg.com/@zxcvbn-ts/language-en/-/language-en-3.0.2.tgz -> @zxcvbn-ts-language-en-3.0.2.tgz
	https://registry.yarnpkg.com/abab/-/abab-2.0.6.tgz
	https://registry.yarnpkg.com/abs-svg-path/-/abs-svg-path-0.1.1.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.8.tgz
	https://registry.yarnpkg.com/acorn-globals/-/acorn-globals-7.0.1.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.2.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-8.2.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-6.4.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-8.10.0.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-6.0.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-7.1.0.tgz
	https://registry.yarnpkg.com/aggregate-error/-/aggregate-error-3.1.0.tgz
	https://registry.yarnpkg.com/ajv-errors/-/ajv-errors-1.0.1.tgz
	https://registry.yarnpkg.com/ajv-formats/-/ajv-formats-2.1.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.5.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-5.1.0.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-8.12.0.tgz
	https://registry.yarnpkg.com/allchange/-/allchange-1.1.0.tgz
	https://registry.yarnpkg.com/another-json/-/another-json-0.2.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.2.tgz
	https://registry.yarnpkg.com/ansi-html-community/-/ansi-html-community-0.0.8.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-6.0.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-5.2.0.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-6.2.1.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-1.3.2.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-2.0.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.3.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz
	https://registry.yarnpkg.com/arg/-/arg-4.1.3.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-2.0.1.tgz
	https://registry.yarnpkg.com/aria-query/-/aria-query-5.1.3.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-2.0.0.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-4.0.0.tgz
	https://registry.yarnpkg.com/arr-flatten/-/arr-flatten-1.1.0.tgz
	https://registry.yarnpkg.com/arr-union/-/arr-union-3.1.0.tgz
	https://registry.yarnpkg.com/array-buffer-byte-length/-/array-buffer-byte-length-1.0.0.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-1.1.1.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-2.1.2.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.7.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-1.0.2.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-2.1.0.tgz
	https://registry.yarnpkg.com/array-uniq/-/array-uniq-1.0.3.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.2.1.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.findlastindex/-/array.prototype.findlastindex-1.2.3.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.3.2.tgz
	https://registry.yarnpkg.com/array.prototype.reduce/-/array.prototype.reduce-1.0.6.tgz
	https://registry.yarnpkg.com/array.prototype.tosorted/-/array.prototype.tosorted-1.1.2.tgz
	https://registry.yarnpkg.com/arraybuffer.prototype.slice/-/arraybuffer.prototype.slice-1.0.2.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz
	https://registry.yarnpkg.com/asn1.js/-/asn1.js-5.4.1.tgz
	https://registry.yarnpkg.com/assert/-/assert-1.5.1.tgz
	https://registry.yarnpkg.com/assign-symbols/-/assign-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.13.4.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-2.0.0.tgz
	https://registry.yarnpkg.com/async-each/-/async-each-1.0.6.tgz
	https://registry.yarnpkg.com/async/-/async-2.6.4.tgz
	https://registry.yarnpkg.com/asynciterator.prototype/-/asynciterator.prototype-1.0.0.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/atob/-/atob-2.1.2.tgz
	https://registry.yarnpkg.com/autoprefixer/-/autoprefixer-9.8.8.tgz
	https://registry.yarnpkg.com/available-typed-arrays/-/available-typed-arrays-1.0.5.tgz
	https://registry.yarnpkg.com/await-lock/-/await-lock-2.2.2.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-29.7.0.tgz
	https://registry.yarnpkg.com/babel-loader/-/babel-loader-8.3.0.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-6.1.1.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-29.6.3.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs2/-/babel-plugin-polyfill-corejs2-0.4.6.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-corejs3/-/babel-plugin-polyfill-corejs3-0.8.5.tgz
	https://registry.yarnpkg.com/babel-plugin-polyfill-regenerator/-/babel-plugin-polyfill-regenerator-0.5.3.tgz
	https://registry.yarnpkg.com/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-1.0.1.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-29.6.3.tgz
	https://registry.yarnpkg.com/babel-runtime/-/babel-runtime-6.26.0.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-2.0.0.tgz
	https://registry.yarnpkg.com/base-x/-/base-x-4.0.0.tgz
	https://registry.yarnpkg.com/base/-/base-0.11.2.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/basic-ftp/-/basic-ftp-5.0.3.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.6.1.tgz
	https://registry.yarnpkg.com/before-after-hook/-/before-after-hook-2.2.3.tgz
	https://registry.yarnpkg.com/big-integer/-/big-integer-1.6.51.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-5.2.2.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-1.13.1.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.2.0.tgz
	https://registry.yarnpkg.com/bindings/-/bindings-1.5.0.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/blurhash/-/blurhash-2.0.5.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-4.12.0.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-5.2.1.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.20.1.tgz
	https://registry.yarnpkg.com/bonjour-service/-/bonjour-service-1.1.1.tgz
	https://registry.yarnpkg.com/boolbase/-/boolbase-1.0.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-2.0.1.tgz
	https://registry.yarnpkg.com/braces/-/braces-1.8.5.tgz
	https://registry.yarnpkg.com/braces/-/braces-2.3.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/brorand/-/brorand-1.1.0.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.2.0.tgz
	https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.1.tgz
	https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.2.tgz
	https://registry.yarnpkg.com/browserify-rsa/-/browserify-rsa-4.1.0.tgz
	https://registry.yarnpkg.com/browserify-sign/-/browserify-sign-4.2.2.tgz
	https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.2.0.tgz
	https://registry.yarnpkg.com/browserslist/-/browserslist-4.22.1.tgz
	https://registry.yarnpkg.com/bs58/-/bs58-5.0.0.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.2.tgz
	https://registry.yarnpkg.com/buffer-xor/-/buffer-xor-1.0.3.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-4.9.2.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-3.3.0.tgz
	https://registry.yarnpkg.com/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.1.2.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-12.0.4.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-15.3.0.tgz
	https://registry.yarnpkg.com/cache-base/-/cache-base-1.0.1.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/call-me-maybe/-/call-me-maybe-1.0.2.tgz
	https://registry.yarnpkg.com/caller-callsite/-/caller-callsite-2.0.0.tgz
	https://registry.yarnpkg.com/caller-path/-/caller-path-2.0.0.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-2.0.0.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camel-case/-/camel-case-4.1.2.tgz
	https://registry.yarnpkg.com/camelcase-css/-/camelcase-css-2.0.1.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-7.0.2.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.3.0.tgz
	https://registry.yarnpkg.com/caniuse-api/-/caniuse-api-3.0.0.tgz
	https://registry.yarnpkg.com/caniuse-lite/-/caniuse-lite-1.0.30001550.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.2.tgz
	https://registry.yarnpkg.com/char-regex/-/char-regex-1.0.2.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-1.7.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-2.1.8.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.5.3.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chrome-trace-event/-/chrome-trace-event-1.0.3.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-3.9.0.tgz
	https://registry.yarnpkg.com/cipher-base/-/cipher-base-1.0.4.tgz
	https://registry.yarnpkg.com/cjs-module-lexer/-/cjs-module-lexer-1.2.3.tgz
	https://registry.yarnpkg.com/class-utils/-/class-utils-0.3.6.tgz
	https://registry.yarnpkg.com/classnames/-/classnames-2.3.2.tgz
	https://registry.yarnpkg.com/clean-css/-/clean-css-4.2.4.tgz
	https://registry.yarnpkg.com/clean-regexp/-/clean-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/clean-stack/-/clean-stack-2.2.0.tgz
	https://registry.yarnpkg.com/cli-color/-/cli-color-2.0.3.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-6.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-8.0.1.tgz
	https://registry.yarnpkg.com/clone-deep/-/clone-deep-4.0.1.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz
	https://registry.yarnpkg.com/coa/-/coa-2.0.2.tgz
	https://registry.yarnpkg.com/code-block-writer/-/code-block-writer-11.0.3.tgz
	https://registry.yarnpkg.com/collect-v8-coverage/-/collect-v8-coverage-1.0.2.tgz
	https://registry.yarnpkg.com/collection-visit/-/collection-visit-1.0.0.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colord/-/colord-2.9.3.tgz
	https://registry.yarnpkg.com/colorette/-/colorette-2.0.20.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-4.1.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-6.2.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-7.2.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-8.3.0.tgz
	https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz
	https://registry.yarnpkg.com/commonmark/-/commonmark-0.30.0.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.3.0.tgz
	https://registry.yarnpkg.com/compressible/-/compressible-2.0.18.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.7.4.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz
	https://registry.yarnpkg.com/concurrently/-/concurrently-8.2.1.tgz
	https://registry.yarnpkg.com/connect-history-api-fallback/-/connect-history-api-fallback-2.0.0.tgz
	https://registry.yarnpkg.com/console-browserify/-/console-browserify-1.2.0.tgz
	https://registry.yarnpkg.com/constants-browserify/-/constants-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.4.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.5.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-2.0.0.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.0.6.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.5.0.tgz
	https://registry.yarnpkg.com/copy-concurrently/-/copy-concurrently-1.0.5.tgz
	https://registry.yarnpkg.com/copy-descriptor/-/copy-descriptor-0.1.1.tgz
	https://registry.yarnpkg.com/core-js-compat/-/core-js-compat-3.33.0.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.6.12.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-3.33.0.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.3.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-5.2.1.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-7.1.0.tgz
	https://registry.yarnpkg.com/cosmiconfig/-/cosmiconfig-8.3.6.tgz
	https://registry.yarnpkg.com/counterpart/-/counterpart-0.18.6.tgz
	https://registry.yarnpkg.com/cpx/-/cpx-1.5.0.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-0.3.0.tgz
	https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.4.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.2.0.tgz
	https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.7.tgz
	https://registry.yarnpkg.com/create-jest/-/create-jest-29.7.0.tgz
	https://registry.yarnpkg.com/create-require/-/create-require-1.1.1.tgz
	https://registry.yarnpkg.com/cronstrue/-/cronstrue-2.41.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.12.0.tgz
	https://registry.yarnpkg.com/crypto-js/-/crypto-js-4.1.1.tgz
	https://registry.yarnpkg.com/css-blank-pseudo/-/css-blank-pseudo-0.1.4.tgz
	https://registry.yarnpkg.com/css-box-model/-/css-box-model-1.2.1.tgz
	https://registry.yarnpkg.com/css-declaration-sorter/-/css-declaration-sorter-6.4.1.tgz
	https://registry.yarnpkg.com/css-functions-list/-/css-functions-list-3.2.1.tgz
	https://registry.yarnpkg.com/css-has-pseudo/-/css-has-pseudo-0.10.0.tgz
	https://registry.yarnpkg.com/css-loader/-/css-loader-4.3.0.tgz
	https://registry.yarnpkg.com/css-prefers-color-scheme/-/css-prefers-color-scheme-3.1.1.tgz
	https://registry.yarnpkg.com/css-select-base-adapter/-/css-select-base-adapter-0.1.1.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-2.1.0.tgz
	https://registry.yarnpkg.com/css-select/-/css-select-4.3.0.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-1.0.0-alpha.37.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-1.1.3.tgz
	https://registry.yarnpkg.com/css-tree/-/css-tree-2.3.1.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-3.4.2.tgz
	https://registry.yarnpkg.com/css-what/-/css-what-6.1.0.tgz
	https://registry.yarnpkg.com/csscolorparser/-/csscolorparser-1.0.3.tgz
	https://registry.yarnpkg.com/cssdb/-/cssdb-4.4.0.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-2.0.0.tgz
	https://registry.yarnpkg.com/cssesc/-/cssesc-3.0.0.tgz
	https://registry.yarnpkg.com/cssfontparser/-/cssfontparser-1.2.1.tgz
	https://registry.yarnpkg.com/cssnano-preset-default/-/cssnano-preset-default-5.2.14.tgz
	https://registry.yarnpkg.com/cssnano-utils/-/cssnano-utils-3.1.0.tgz
	https://registry.yarnpkg.com/cssnano/-/cssnano-5.1.15.tgz
	https://registry.yarnpkg.com/csso/-/csso-4.2.0.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.3.8.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.5.0.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-2.3.0.tgz
	https://registry.yarnpkg.com/csstype/-/csstype-3.1.2.tgz
	https://registry.yarnpkg.com/cyclist/-/cyclist-1.0.2.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.1.tgz
	https://registry.yarnpkg.com/data-uri-to-buffer/-/data-uri-to-buffer-6.0.1.tgz
	https://registry.yarnpkg.com/data-urls/-/data-urls-3.0.2.tgz
	https://registry.yarnpkg.com/date-fns/-/date-fns-2.30.0.tgz
	https://registry.yarnpkg.com/date-names/-/date-names-0.1.13.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.7.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.4.tgz
	https://registry.yarnpkg.com/decamelize-keys/-/decamelize-keys-1.1.1.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-5.0.1.tgz
	https://registry.yarnpkg.com/decimal.js/-/decimal.js-10.4.3.tgz
	https://registry.yarnpkg.com/decode-uri-component/-/decode-uri-component-0.2.2.tgz
	https://registry.yarnpkg.com/dedent/-/dedent-1.5.1.tgz
	https://registry.yarnpkg.com/deep-equal/-/deep-equal-2.2.2.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.4.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.3.1.tgz
	https://registry.yarnpkg.com/default-gateway/-/default-gateway-6.0.3.tgz
	https://registry.yarnpkg.com/define-data-property/-/define-data-property-1.1.1.tgz
	https://registry.yarnpkg.com/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.2.1.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-0.2.5.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-1.0.0.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-2.0.2.tgz
	https://registry.yarnpkg.com/degenerator/-/degenerator-5.0.1.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/depd/-/depd-2.0.0.tgz
	https://registry.yarnpkg.com/deprecation/-/deprecation-2.3.1.tgz
	https://registry.yarnpkg.com/des.js/-/des.js-1.1.0.tgz
	https://registry.yarnpkg.com/destroy/-/destroy-1.2.0.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/detect-node-es/-/detect-node-es-1.1.0.tgz
	https://registry.yarnpkg.com/detect-node/-/detect-node-2.1.0.tgz
	https://registry.yarnpkg.com/diff-dom/-/diff-dom-4.2.8.tgz
	https://registry.yarnpkg.com/diff-match-patch/-/diff-match-patch-1.0.5.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-28.1.1.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-29.6.3.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.3.tgz
	https://registry.yarnpkg.com/dijkstrajs/-/dijkstrajs-1.0.3.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-2.0.0.tgz
	https://registry.yarnpkg.com/dir-glob/-/dir-glob-3.0.1.tgz
	https://registry.yarnpkg.com/dns-equal/-/dns-equal-1.0.0.tgz
	https://registry.yarnpkg.com/dns-packet/-/dns-packet-5.6.1.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/dom-accessibility-api/-/dom-accessibility-api-0.5.16.tgz
	https://registry.yarnpkg.com/dom-converter/-/dom-converter-0.2.0.tgz
	https://registry.yarnpkg.com/dom-helpers/-/dom-helpers-5.2.1.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-0.2.2.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-1.4.1.tgz
	https://registry.yarnpkg.com/dom-serializer/-/dom-serializer-2.0.0.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-1.2.0.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-1.3.1.tgz
	https://registry.yarnpkg.com/domelementtype/-/domelementtype-2.3.0.tgz
	https://registry.yarnpkg.com/domexception/-/domexception-4.0.0.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-4.3.1.tgz
	https://registry.yarnpkg.com/domhandler/-/domhandler-5.0.3.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-1.7.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-2.8.0.tgz
	https://registry.yarnpkg.com/domutils/-/domutils-3.1.0.tgz
	https://registry.yarnpkg.com/dot-case/-/dot-case-3.0.4.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-16.3.1.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.2.tgz
	https://registry.yarnpkg.com/duplexify/-/duplexify-3.7.1.tgz
	https://registry.yarnpkg.com/earcut/-/earcut-2.2.4.tgz
	https://registry.yarnpkg.com/eastasianwidth/-/eastasianwidth-0.2.0.tgz
	https://registry.yarnpkg.com/ee-first/-/ee-first-1.1.1.tgz
	https://registry.yarnpkg.com/electron-to-chromium/-/electron-to-chromium-1.4.557.tgz
	https://registry.yarnpkg.com/elliptic/-/elliptic-6.5.4.tgz
	https://registry.yarnpkg.com/emittery/-/emittery-0.13.1.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-9.2.2.tgz
	https://registry.yarnpkg.com/emojibase-data/-/emojibase-data-15.2.0.tgz
	https://registry.yarnpkg.com/emojibase-regex/-/emojibase-regex-15.2.0.tgz
	https://registry.yarnpkg.com/emojibase/-/emojibase-15.2.0.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-3.0.0.tgz
	https://registry.yarnpkg.com/encode-utf8/-/encode-utf8-1.0.3.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-4.5.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.0.3.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.2.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-3.0.1.tgz
	https://registry.yarnpkg.com/entities/-/entities-4.5.0.tgz
	https://registry.yarnpkg.com/envinfo/-/envinfo-7.10.0.tgz
	https://registry.yarnpkg.com/errno/-/errno-0.1.8.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.22.2.tgz
	https://registry.yarnpkg.com/es-array-method-boxes-properly/-/es-array-method-boxes-properly-1.0.0.tgz
	https://registry.yarnpkg.com/es-get-iterator/-/es-get-iterator-1.1.3.tgz
	https://registry.yarnpkg.com/es-iterator-helpers/-/es-iterator-helpers-1.0.15.tgz
	https://registry.yarnpkg.com/es-set-tostringtag/-/es-set-tostringtag-2.0.1.tgz
	https://registry.yarnpkg.com/es-shim-unscopables/-/es-shim-unscopables-1.0.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.62.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.3.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.3.tgz
	https://registry.yarnpkg.com/es6-weak-map/-/es6-weak-map-2.0.3.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-html/-/escape-html-1.0.3.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint-config-prettier/-/eslint-config-prettier-9.0.0.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.9.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.8.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-deprecate/-/eslint-plugin-deprecate-0.8.4.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.28.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-matrix-org/-/eslint-plugin-matrix-org-1.2.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-hooks/-/eslint-plugin-react-hooks-4.6.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.33.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-unicorn/-/eslint-plugin-unicorn-48.0.1.tgz
	https://registry.yarnpkg.com/eslint-rule-composer/-/eslint-rule-composer-0.3.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-4.0.3.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-7.2.2.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-3.4.3.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-8.51.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-9.6.1.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.5.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.3.0.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.1.tgz
	https://registry.yarnpkg.com/event-emitter/-/event-emitter-0.3.5.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-4.0.7.tgz
	https://registry.yarnpkg.com/events/-/events-3.3.0.tgz
	https://registry.yarnpkg.com/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz
	https://registry.yarnpkg.com/except/-/except-0.1.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-5.1.1.tgz
	https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-0.1.5.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-2.1.4.tgz
	https://registry.yarnpkg.com/expand-range/-/expand-range-1.8.2.tgz
	https://registry.yarnpkg.com/expect/-/expect-28.1.3.tgz
	https://registry.yarnpkg.com/expect/-/expect-29.7.0.tgz
	https://registry.yarnpkg.com/express/-/express-4.18.2.tgz
	https://registry.yarnpkg.com/ext/-/ext-1.7.0.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-2.0.1.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-3.0.2.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-0.3.2.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-2.0.4.tgz
	https://registry.yarnpkg.com/extract-text-webpack-plugin/-/extract-text-webpack-plugin-4.0.0-beta.0.tgz
	https://registry.yarnpkg.com/fake-indexeddb/-/fake-indexeddb-5.0.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-2.2.7.tgz
	https://registry.yarnpkg.com/fast-glob/-/fast-glob-3.3.1.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/fastest-levenshtein/-/fastest-levenshtein-1.0.16.tgz
	https://registry.yarnpkg.com/fastq/-/fastq-1.15.0.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.11.4.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.2.tgz
	https://registry.yarnpkg.com/fetch-mock-jest/-/fetch-mock-jest-1.5.1.tgz
	https://registry.yarnpkg.com/fetch-mock/-/fetch-mock-9.11.0.tgz
	https://registry.yarnpkg.com/fflate/-/fflate-0.4.8.tgz
	https://registry.yarnpkg.com/figgy-pudding/-/figgy-pudding-3.5.2.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-6.0.1.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-7.0.1.tgz
	https://registry.yarnpkg.com/file-loader/-/file-loader-6.2.0.tgz
	https://registry.yarnpkg.com/file-saver/-/file-saver-2.0.5.tgz
	https://registry.yarnpkg.com/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz
	https://registry.yarnpkg.com/file/-/file-0.2.2.tgz
	https://registry.yarnpkg.com/filename-regex/-/filename-regex-2.0.1.tgz
	https://registry.yarnpkg.com/filesize/-/filesize-10.1.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-2.2.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-4.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.2.0.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-2.1.0.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-3.3.2.tgz
	https://registry.yarnpkg.com/find-index/-/find-index-0.1.1.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-3.1.1.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-3.2.9.tgz
	https://registry.yarnpkg.com/flatten/-/flatten-1.0.3.tgz
	https://registry.yarnpkg.com/flush-write-stream/-/flush-write-stream-1.1.1.tgz
	https://registry.yarnpkg.com/focus-lock/-/focus-lock-1.0.0.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.15.3.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/for-in/-/for-in-1.0.2.tgz
	https://registry.yarnpkg.com/for-own/-/for-own-0.1.5.tgz
	https://registry.yarnpkg.com/foreachasync/-/foreachasync-3.0.0.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-3.1.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-4.0.0.tgz
	https://registry.yarnpkg.com/forwarded/-/forwarded-0.2.0.tgz
	https://registry.yarnpkg.com/fragment-cache/-/fragment-cache-0.2.1.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.2.tgz
	https://registry.yarnpkg.com/from2/-/from2-2.3.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-11.1.1.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.1.0.tgz
	https://registry.yarnpkg.com/fs-monkey/-/fs-monkey-1.0.4.tgz
	https://registry.yarnpkg.com/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.13.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.3.3.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.2.tgz
	https://registry.yarnpkg.com/function.prototype.name/-/function.prototype.name-1.1.6.tgz
	https://registry.yarnpkg.com/functions-have-names/-/functions-have-names-1.2.3.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/geojson-vt/-/geojson-vt-3.2.1.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.2.1.tgz
	https://registry.yarnpkg.com/get-package-type/-/get-package-type-0.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-6.0.1.tgz
	https://registry.yarnpkg.com/get-symbol-description/-/get-symbol-description-1.0.0.tgz
	https://registry.yarnpkg.com/get-uri/-/get-uri-6.0.2.tgz
	https://registry.yarnpkg.com/get-value/-/get-value-2.0.6.tgz
	https://registry.yarnpkg.com/gfm.css/-/gfm.css-1.1.2.tgz
	https://registry.yarnpkg.com/gl-matrix/-/gl-matrix-3.4.3.tgz
	https://registry.yarnpkg.com/glob-base/-/glob-base-0.3.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-2.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-3.1.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.2.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-6.0.2.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.3.0.tgz
	https://registry.yarnpkg.com/glob-to-regexp/-/glob-to-regexp-0.4.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-10.3.10.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.2.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-9.3.2.tgz
	https://registry.yarnpkg.com/glob2base/-/glob2base-0.0.12.tgz
	https://registry.yarnpkg.com/global-modules/-/global-modules-2.0.0.tgz
	https://registry.yarnpkg.com/global-prefix/-/global-prefix-3.0.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-13.23.0.tgz
	https://registry.yarnpkg.com/globalthis/-/globalthis-1.0.3.tgz
	https://registry.yarnpkg.com/globby/-/globby-11.1.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-8.0.2.tgz
	https://registry.yarnpkg.com/globjoin/-/globjoin-0.1.4.tgz
	https://registry.yarnpkg.com/gopd/-/gopd-1.0.1.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.11.tgz
	https://registry.yarnpkg.com/graphemer/-/graphemer-1.4.0.tgz
	https://registry.yarnpkg.com/gzip-size/-/gzip-size-6.0.0.tgz
	https://registry.yarnpkg.com/handle-thing/-/handle-thing-2.0.1.tgz
	https://registry.yarnpkg.com/hard-rejection/-/hard-rejection-2.1.0.tgz
	https://registry.yarnpkg.com/has-bigints/-/has-bigints-1.0.2.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/has-property-descriptors/-/has-property-descriptors-1.0.0.tgz
	https://registry.yarnpkg.com/has-proto/-/has-proto-1.0.1.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.3.tgz
	https://registry.yarnpkg.com/has-tostringtag/-/has-tostringtag-1.0.0.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-0.3.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-1.0.0.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-0.1.4.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-1.0.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.4.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-3.1.0.tgz
	https://registry.yarnpkg.com/hash.js/-/hash.js-1.1.7.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz
	https://registry.yarnpkg.com/highlight.js/-/highlight.js-11.9.0.tgz
	https://registry.yarnpkg.com/hmac-drbg/-/hmac-drbg-1.0.1.tgz
	https://registry.yarnpkg.com/hoek/-/hoek-4.2.1.tgz
	https://registry.yarnpkg.com/hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.9.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-4.1.0.tgz
	https://registry.yarnpkg.com/hpack.js/-/hpack.js-2.1.6.tgz
	https://registry.yarnpkg.com/html-encoding-sniffer/-/html-encoding-sniffer-3.0.0.tgz
	https://registry.yarnpkg.com/html-entities/-/html-entities-2.4.0.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/html-minifier-terser/-/html-minifier-terser-5.1.1.tgz
	https://registry.yarnpkg.com/html-tags/-/html-tags-3.3.1.tgz
	https://registry.yarnpkg.com/html-webpack-plugin/-/html-webpack-plugin-4.5.2.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-6.1.0.tgz
	https://registry.yarnpkg.com/htmlparser2/-/htmlparser2-8.0.2.tgz
	https://registry.yarnpkg.com/http-deceiver/-/http-deceiver-1.2.7.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.3.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-2.0.0.tgz
	https://registry.yarnpkg.com/http-parser-js/-/http-parser-js-0.5.8.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-5.0.0.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-7.0.0.tgz
	https://registry.yarnpkg.com/http-proxy-middleware/-/http-proxy-middleware-2.0.6.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.18.1.tgz
	https://registry.yarnpkg.com/https-browserify/-/https-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-7.0.2.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-2.1.0.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.3.tgz
	https://registry.yarnpkg.com/icss-utils/-/icss-utils-4.1.1.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-0.1.5.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-3.3.10.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-5.2.4.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-cwd/-/import-cwd-2.1.0.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-2.0.0.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-from/-/import-from-2.1.0.tgz
	https://registry.yarnpkg.com/import-lazy/-/import-lazy-4.0.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.1.0.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-4.0.0.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-5.0.0.tgz
	https://registry.yarnpkg.com/indexes-of/-/indexes-of-1.0.1.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.5.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-2.2.0.tgz
	https://registry.yarnpkg.com/ip-regex/-/ip-regex-4.3.0.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.8.tgz
	https://registry.yarnpkg.com/ip/-/ip-2.0.0.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-1.9.1.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-2.1.0.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-arguments/-/is-arguments-1.1.1.tgz
	https://registry.yarnpkg.com/is-array-buffer/-/is-array-buffer-3.0.2.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/is-async-function/-/is-async-function-2.0.0.tgz
	https://registry.yarnpkg.com/is-bigint/-/is-bigint-1.0.4.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-1.0.1.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-boolean-object/-/is-boolean-object-1.1.2.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.6.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-3.2.1.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.7.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.13.0.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.5.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-1.0.2.tgz
	https://registry.yarnpkg.com/is-directory/-/is-directory-0.3.1.tgz
	https://registry.yarnpkg.com/is-docker/-/is-docker-2.2.1.tgz
	https://registry.yarnpkg.com/is-dotfile/-/is-dotfile-1.0.3.tgz
	https://registry.yarnpkg.com/is-equal-shallow/-/is-equal-shallow-0.1.3.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-0.1.1.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-1.0.1.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-1.0.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-finalizationregistry/-/is-finalizationregistry-1.0.2.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-generator-fn/-/is-generator-fn-2.1.0.tgz
	https://registry.yarnpkg.com/is-generator-function/-/is-generator-function-1.0.10.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-2.0.1.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.3.tgz
	https://registry.yarnpkg.com/is-ip/-/is-ip-3.1.0.tgz
	https://registry.yarnpkg.com/is-map/-/is-map-2.0.2.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.2.tgz
	https://registry.yarnpkg.com/is-number-object/-/is-number-object-1.0.7.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-2.1.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-3.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-4.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.3.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-1.1.0.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-3.0.0.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-5.0.0.tgz
	https://registry.yarnpkg.com/is-posix-bracket/-/is-posix-bracket-0.1.1.tgz
	https://registry.yarnpkg.com/is-potential-custom-element-name/-/is-potential-custom-element-name-1.0.1.tgz
	https://registry.yarnpkg.com/is-primitive/-/is-primitive-2.0.0.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.2.2.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.4.tgz
	https://registry.yarnpkg.com/is-set/-/is-set-2.0.2.tgz
	https://registry.yarnpkg.com/is-shared-array-buffer/-/is-shared-array-buffer-1.0.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.1.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.7.tgz
	https://registry.yarnpkg.com/is-subset/-/is-subset-0.1.1.tgz
	https://registry.yarnpkg.com/is-svg-path/-/is-svg-path-1.0.2.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.4.tgz
	https://registry.yarnpkg.com/is-typed-array/-/is-typed-array-1.1.12.tgz
	https://registry.yarnpkg.com/is-weakmap/-/is-weakmap-2.0.1.tgz
	https://registry.yarnpkg.com/is-weakref/-/is-weakref-1.0.2.tgz
	https://registry.yarnpkg.com/is-weakset/-/is-weakset-2.0.2.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-1.1.0.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-2.2.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.5.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-2.1.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.2.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-5.2.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-6.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.1.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.1.6.tgz
	https://registry.yarnpkg.com/iterator.prototype/-/iterator.prototype-1.1.2.tgz
	https://registry.yarnpkg.com/jackspeak/-/jackspeak-2.3.6.tgz
	https://registry.yarnpkg.com/jest-canvas-mock/-/jest-canvas-mock-2.5.2.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-29.7.0.tgz
	https://registry.yarnpkg.com/jest-circus/-/jest-circus-29.7.0.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-29.7.0.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-29.7.0.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-28.1.3.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-29.7.0.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-29.7.0.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-29.7.0.tgz
	https://registry.yarnpkg.com/jest-environment-jsdom/-/jest-environment-jsdom-29.7.0.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-29.7.0.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-28.0.2.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-29.6.3.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-29.7.0.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-29.7.0.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-28.1.3.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-29.7.0.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-28.1.3.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-29.7.0.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-29.7.0.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.3.tgz
	https://registry.yarnpkg.com/jest-raw-loader/-/jest-raw-loader-1.0.1.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-29.6.3.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-29.7.0.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-29.7.0.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-29.7.0.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-29.7.0.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-29.7.0.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-28.1.3.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-29.7.0.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-29.7.0.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-29.7.0.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-26.6.2.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-29.7.0.tgz
	https://registry.yarnpkg.com/jest/-/jest-29.7.0.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-4.1.0.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-20.0.3.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-3.0.2.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.1.tgz
	https://registry.yarnpkg.com/json-loader/-/json-loader-0.5.7.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.3.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.1.0.tgz
	https://registry.yarnpkg.com/jsrsasign/-/jsrsasign-10.8.6.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-3.3.5.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.10.1.tgz
	https://registry.yarnpkg.com/jwt-decode/-/jwt-decode-3.1.2.tgz
	https://registry.yarnpkg.com/katex/-/katex-0.16.9.tgz
	https://registry.yarnpkg.com/kdbush/-/kdbush-3.0.0.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-4.5.4.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-3.2.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-4.0.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-5.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/kleur/-/kleur-3.0.3.tgz
	https://registry.yarnpkg.com/known-css-properties/-/known-css-properties-0.28.0.tgz
	https://registry.yarnpkg.com/known-css-properties/-/known-css-properties-0.29.0.tgz
	https://registry.yarnpkg.com/last-call-webpack-plugin/-/last-call-webpack-plugin-3.0.0.tgz
	https://registry.yarnpkg.com/launch-editor/-/launch-editor-2.6.0.tgz
	https://registry.yarnpkg.com/leven/-/leven-3.1.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/lilconfig/-/lilconfig-2.1.0.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.2.4.tgz
	https://registry.yarnpkg.com/linkify-element/-/linkify-element-4.1.1.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-4.0.1.tgz
	https://registry.yarnpkg.com/linkify-react/-/linkify-react-4.1.1.tgz
	https://registry.yarnpkg.com/linkify-string/-/linkify-string-4.1.1.tgz
	https://registry.yarnpkg.com/linkifyjs/-/linkifyjs-4.1.1.tgz
	https://registry.yarnpkg.com/loader-runner/-/loader-runner-2.4.0.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-1.4.2.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-2.0.4.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-3.2.1.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.escape/-/lodash.escape-4.0.1.tgz
	https://registry.yarnpkg.com/lodash.flatten/-/lodash.flatten-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.invokemap/-/lodash.invokemap-4.6.0.tgz
	https://registry.yarnpkg.com/lodash.isequal/-/lodash.isequal-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.memoize/-/lodash.memoize-4.1.2.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-4.6.2.tgz
	https://registry.yarnpkg.com/lodash.pullall/-/lodash.pullall-4.2.0.tgz
	https://registry.yarnpkg.com/lodash.sortby/-/lodash.sortby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.truncate/-/lodash.truncate-4.4.2.tgz
	https://registry.yarnpkg.com/lodash.uniq/-/lodash.uniq-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.uniqby/-/lodash.uniqby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.21.tgz
	https://registry.yarnpkg.com/loglevel/-/loglevel-1.8.1.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/lower-case/-/lower-case-2.0.2.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-10.0.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-7.18.3.tgz
	https://registry.yarnpkg.com/lru-queue/-/lru-queue-0.1.0.tgz
	https://registry.yarnpkg.com/lru_map/-/lru_map-0.3.3.tgz
	https://registry.yarnpkg.com/lz-string/-/lz-string-1.5.0.tgz
	https://registry.yarnpkg.com/magic-string/-/magic-string-0.27.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-2.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-4.0.0.tgz
	https://registry.yarnpkg.com/make-error/-/make-error-1.3.6.tgz
	https://registry.yarnpkg.com/makeerror/-/makeerror-1.0.12.tgz
	https://registry.yarnpkg.com/map-cache/-/map-cache-0.2.2.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-1.0.1.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-4.3.0.tgz
	https://registry.yarnpkg.com/map-visit/-/map-visit-1.0.0.tgz
	https://registry.yarnpkg.com/maplibre-gl/-/maplibre-gl-2.4.0.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-13.0.2.tgz
	https://registry.yarnpkg.com/math-random/-/math-random-1.0.4.tgz
	https://registry.yarnpkg.com/mathml-tag-names/-/mathml-tag-names-2.1.3.tgz
	https://registry.yarnpkg.com/matrix-encrypt-attachment/-/matrix-encrypt-attachment-1.0.3.tgz
	https://registry.yarnpkg.com/matrix-events-sdk/-/matrix-events-sdk-0.0.1.tgz
	https://registry.yarnpkg.com/matrix-js-sdk/-/matrix-js-sdk-30.0.1.tgz
	https://registry.yarnpkg.com/matrix-mock-request/-/matrix-mock-request-2.6.0.tgz
	https://registry.yarnpkg.com/matrix-react-sdk/-/matrix-react-sdk-3.84.1.tgz
	https://registry.yarnpkg.com/matrix-web-i18n/-/matrix-web-i18n-3.1.5.tgz
	https://registry.yarnpkg.com/matrix-widget-api/-/matrix-widget-api-1.6.0.tgz
	https://registry.yarnpkg.com/md5.js/-/md5.js-1.3.5.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.14.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.30.tgz
	https://registry.yarnpkg.com/mdn-data/-/mdn-data-2.0.4.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-1.0.1.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-0.3.0.tgz
	https://registry.yarnpkg.com/memfs/-/memfs-3.6.0.tgz
	https://registry.yarnpkg.com/memoize-one/-/memoize-one-5.2.1.tgz
	https://registry.yarnpkg.com/memoize-one/-/memoize-one-6.0.0.tgz
	https://registry.yarnpkg.com/memoizee/-/memoizee-0.4.15.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.4.1.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.5.0.tgz
	https://registry.yarnpkg.com/meow/-/meow-10.1.5.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-1.0.1.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/merge2/-/merge2-1.4.1.tgz
	https://registry.yarnpkg.com/methods/-/methods-1.1.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-2.3.11.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-3.1.10.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.5.tgz
	https://registry.yarnpkg.com/miller-rabin/-/miller-rabin-4.0.1.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.52.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.35.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/min-indent/-/min-indent-1.0.1.tgz
	https://registry.yarnpkg.com/mini-css-extract-plugin/-/mini-css-extract-plugin-1.6.2.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
	https://registry.yarnpkg.com/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.1.2.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-7.4.6.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-9.0.3.tgz
	https://registry.yarnpkg.com/minimist-options/-/minimist-options-4.1.0.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.8.tgz
	https://registry.yarnpkg.com/minipass-collect/-/minipass-collect-1.0.2.tgz
	https://registry.yarnpkg.com/minipass-flush/-/minipass-flush-1.0.5.tgz
	https://registry.yarnpkg.com/minipass-pipeline/-/minipass-pipeline-1.2.4.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.3.6.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-4.2.8.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-5.0.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-7.0.4.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mississippi/-/mississippi-3.0.0.tgz
	https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.2.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.6.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-3.0.1.tgz
	https://registry.yarnpkg.com/modernizr/-/modernizr-3.13.0.tgz
	https://registry.yarnpkg.com/moo-color/-/moo-color-1.0.3.tgz
	https://registry.yarnpkg.com/move-concurrently/-/move-concurrently-1.0.1.tgz
	https://registry.yarnpkg.com/mrmime/-/mrmime-1.0.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/multicast-dns/-/multicast-dns-7.2.5.tgz
	https://registry.yarnpkg.com/murmurhash-js/-/murmurhash-js-1.0.0.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.18.0.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.3.6.tgz
	https://registry.yarnpkg.com/nanomatch/-/nanomatch-1.2.13.tgz
	https://registry.yarnpkg.com/natural-compare-lite/-/natural-compare-lite-1.4.0.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.3.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/netmask/-/netmask-2.0.2.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.1.0.tgz
	https://registry.yarnpkg.com/no-case/-/no-case-3.0.4.tgz
	https://registry.yarnpkg.com/node-fetch/-/node-fetch-2.7.0.tgz
	https://registry.yarnpkg.com/node-forge/-/node-forge-1.3.1.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-libs-browser/-/node-libs-browser-2.2.1.tgz
	https://registry.yarnpkg.com/node-releases/-/node-releases-2.0.13.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-3.0.3.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-2.1.1.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-range/-/normalize-range-0.1.2.tgz
	https://registry.yarnpkg.com/normalize-svg-path/-/normalize-svg-path-1.1.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-6.1.0.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-1.0.2.tgz
	https://registry.yarnpkg.com/nth-check/-/nth-check-2.1.1.tgz
	https://registry.yarnpkg.com/num2fraction/-/num2fraction-1.2.2.tgz
	https://registry.yarnpkg.com/nwsapi/-/nwsapi-2.2.7.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object-copy/-/object-copy-0.1.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.13.0.tgz
	https://registry.yarnpkg.com/object-is/-/object-is-1.1.5.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object-visit/-/object-visit-1.0.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.4.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.7.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.7.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.7.tgz
	https://registry.yarnpkg.com/object.groupby/-/object.groupby-1.0.1.tgz
	https://registry.yarnpkg.com/object.hasown/-/object.hasown-1.1.3.tgz
	https://registry.yarnpkg.com/object.omit/-/object.omit-2.0.1.tgz
	https://registry.yarnpkg.com/object.pick/-/object.pick-1.3.0.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.7.tgz
	https://registry.yarnpkg.com/obuf/-/obuf-1.1.2.tgz
	https://registry.yarnpkg.com/oidc-client-ts/-/oidc-client-ts-2.3.0.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.4.1.tgz
	https://registry.yarnpkg.com/on-headers/-/on-headers-1.0.2.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/open/-/open-8.4.2.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.5.2.tgz
	https://registry.yarnpkg.com/optimize-css-assets-webpack-plugin/-/optimize-css-assets-webpack-plugin-6.0.1.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.3.tgz
	https://registry.yarnpkg.com/opus-recorder/-/opus-recorder-8.0.5.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/p-map/-/p-map-4.0.0.tgz
	https://registry.yarnpkg.com/p-retry/-/p-retry-4.6.2.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/pac-proxy-agent/-/pac-proxy-agent-7.0.1.tgz
	https://registry.yarnpkg.com/pac-resolver/-/pac-resolver-7.0.0.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/pako/-/pako-2.1.0.tgz
	https://registry.yarnpkg.com/parallel-transform/-/parallel-transform-1.2.0.tgz
	https://registry.yarnpkg.com/param-case/-/param-case-3.0.4.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.6.tgz
	https://registry.yarnpkg.com/parse-glob/-/parse-glob-3.0.4.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.2.0.tgz
	https://registry.yarnpkg.com/parse-srcset/-/parse-srcset-1.0.2.tgz
	https://registry.yarnpkg.com/parse-svg-path/-/parse-svg-path-0.1.2.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-7.1.2.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.3.tgz
	https://registry.yarnpkg.com/pascal-case/-/pascal-case-3.1.2.tgz
	https://registry.yarnpkg.com/pascalcase/-/pascalcase-0.1.1.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-1.0.1.tgz
	https://registry.yarnpkg.com/path-dirname/-/path-dirname-1.0.2.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.7.tgz
	https://registry.yarnpkg.com/path-scurry/-/path-scurry-1.10.1.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-0.1.7.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-2.4.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-3.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-4.0.0.tgz
	https://registry.yarnpkg.com/pbf/-/pbf-3.2.1.tgz
	https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.1.2.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-0.2.1.tgz
	https://registry.yarnpkg.com/picocolors/-/picocolors-1.0.0.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.3.1.tgz
	https://registry.yarnpkg.com/pify/-/pify-2.3.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.6.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-3.0.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-8.0.0.tgz
	https://registry.yarnpkg.com/pluralizers/-/pluralizers-0.1.7.tgz
	https://registry.yarnpkg.com/png-chunks-extract/-/png-chunks-extract-1.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-5.0.0.tgz
	https://registry.yarnpkg.com/posix-character-classes/-/posix-character-classes-0.1.1.tgz
	https://registry.yarnpkg.com/postcss-attribute-case-insensitive/-/postcss-attribute-case-insensitive-4.0.2.tgz
	https://registry.yarnpkg.com/postcss-calc/-/postcss-calc-8.2.4.tgz
	https://registry.yarnpkg.com/postcss-color-functional-notation/-/postcss-color-functional-notation-2.0.1.tgz
	https://registry.yarnpkg.com/postcss-color-gray/-/postcss-color-gray-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-color-hex-alpha/-/postcss-color-hex-alpha-5.0.3.tgz
	https://registry.yarnpkg.com/postcss-color-mod-function/-/postcss-color-mod-function-3.0.3.tgz
	https://registry.yarnpkg.com/postcss-color-rebeccapurple/-/postcss-color-rebeccapurple-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-colormin/-/postcss-colormin-5.3.1.tgz
	https://registry.yarnpkg.com/postcss-convert-values/-/postcss-convert-values-5.1.3.tgz
	https://registry.yarnpkg.com/postcss-custom-media/-/postcss-custom-media-7.0.8.tgz
	https://registry.yarnpkg.com/postcss-custom-properties/-/postcss-custom-properties-8.0.11.tgz
	https://registry.yarnpkg.com/postcss-custom-selectors/-/postcss-custom-selectors-5.1.2.tgz
	https://registry.yarnpkg.com/postcss-dir-pseudo-class/-/postcss-dir-pseudo-class-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-discard-comments/-/postcss-discard-comments-5.1.2.tgz
	https://registry.yarnpkg.com/postcss-discard-duplicates/-/postcss-discard-duplicates-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-discard-empty/-/postcss-discard-empty-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-discard-overridden/-/postcss-discard-overridden-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-double-position-gradients/-/postcss-double-position-gradients-1.0.0.tgz
	https://registry.yarnpkg.com/postcss-easings/-/postcss-easings-2.0.0.tgz
	https://registry.yarnpkg.com/postcss-env-function/-/postcss-env-function-2.0.2.tgz
	https://registry.yarnpkg.com/postcss-focus-visible/-/postcss-focus-visible-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-focus-within/-/postcss-focus-within-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-font-variant/-/postcss-font-variant-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-gap-properties/-/postcss-gap-properties-2.0.0.tgz
	https://registry.yarnpkg.com/postcss-hexrgba/-/postcss-hexrgba-2.0.1.tgz
	https://registry.yarnpkg.com/postcss-image-set-function/-/postcss-image-set-function-3.0.1.tgz
	https://registry.yarnpkg.com/postcss-import/-/postcss-import-12.0.1.tgz
	https://registry.yarnpkg.com/postcss-initial/-/postcss-initial-3.0.4.tgz
	https://registry.yarnpkg.com/postcss-js/-/postcss-js-2.0.3.tgz
	https://registry.yarnpkg.com/postcss-lab-function/-/postcss-lab-function-2.0.1.tgz
	https://registry.yarnpkg.com/postcss-load-config/-/postcss-load-config-2.1.2.tgz
	https://registry.yarnpkg.com/postcss-loader/-/postcss-loader-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-logical/-/postcss-logical-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-media-minmax/-/postcss-media-minmax-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-media-query-parser/-/postcss-media-query-parser-0.2.3.tgz
	https://registry.yarnpkg.com/postcss-merge-longhand/-/postcss-merge-longhand-5.1.7.tgz
	https://registry.yarnpkg.com/postcss-merge-rules/-/postcss-merge-rules-5.1.4.tgz
	https://registry.yarnpkg.com/postcss-minify-font-values/-/postcss-minify-font-values-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-minify-gradients/-/postcss-minify-gradients-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-minify-params/-/postcss-minify-params-5.1.4.tgz
	https://registry.yarnpkg.com/postcss-minify-selectors/-/postcss-minify-selectors-5.2.1.tgz
	https://registry.yarnpkg.com/postcss-mixins/-/postcss-mixins-6.2.3.tgz
	https://registry.yarnpkg.com/postcss-modules-extract-imports/-/postcss-modules-extract-imports-2.0.0.tgz
	https://registry.yarnpkg.com/postcss-modules-local-by-default/-/postcss-modules-local-by-default-3.0.3.tgz
	https://registry.yarnpkg.com/postcss-modules-scope/-/postcss-modules-scope-2.2.0.tgz
	https://registry.yarnpkg.com/postcss-modules-values/-/postcss-modules-values-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-nested/-/postcss-nested-4.2.3.tgz
	https://registry.yarnpkg.com/postcss-nesting/-/postcss-nesting-7.0.1.tgz
	https://registry.yarnpkg.com/postcss-normalize-charset/-/postcss-normalize-charset-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-display-values/-/postcss-normalize-display-values-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-positions/-/postcss-normalize-positions-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-normalize-repeat-style/-/postcss-normalize-repeat-style-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-normalize-string/-/postcss-normalize-string-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-timing-functions/-/postcss-normalize-timing-functions-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-unicode/-/postcss-normalize-unicode-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-normalize-url/-/postcss-normalize-url-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-normalize-whitespace/-/postcss-normalize-whitespace-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-ordered-values/-/postcss-ordered-values-5.1.3.tgz
	https://registry.yarnpkg.com/postcss-overflow-shorthand/-/postcss-overflow-shorthand-2.0.0.tgz
	https://registry.yarnpkg.com/postcss-page-break/-/postcss-page-break-2.0.0.tgz
	https://registry.yarnpkg.com/postcss-place/-/postcss-place-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-preset-env/-/postcss-preset-env-6.7.1.tgz
	https://registry.yarnpkg.com/postcss-pseudo-class-any-link/-/postcss-pseudo-class-any-link-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-reduce-initial/-/postcss-reduce-initial-5.1.2.tgz
	https://registry.yarnpkg.com/postcss-reduce-transforms/-/postcss-reduce-transforms-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-replace-overflow-wrap/-/postcss-replace-overflow-wrap-3.0.0.tgz
	https://registry.yarnpkg.com/postcss-resolve-nested-selector/-/postcss-resolve-nested-selector-0.1.1.tgz
	https://registry.yarnpkg.com/postcss-safe-parser/-/postcss-safe-parser-6.0.0.tgz
	https://registry.yarnpkg.com/postcss-scss/-/postcss-scss-4.0.9.tgz
	https://registry.yarnpkg.com/postcss-selector-matches/-/postcss-selector-matches-4.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-not/-/postcss-selector-not-4.0.1.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-5.0.0.tgz
	https://registry.yarnpkg.com/postcss-selector-parser/-/postcss-selector-parser-6.0.13.tgz
	https://registry.yarnpkg.com/postcss-simple-vars/-/postcss-simple-vars-5.0.2.tgz
	https://registry.yarnpkg.com/postcss-svgo/-/postcss-svgo-5.1.0.tgz
	https://registry.yarnpkg.com/postcss-unique-selectors/-/postcss-unique-selectors-5.1.1.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-3.3.1.tgz
	https://registry.yarnpkg.com/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz
	https://registry.yarnpkg.com/postcss-values-parser/-/postcss-values-parser-2.0.1.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-7.0.39.tgz
	https://registry.yarnpkg.com/postcss/-/postcss-8.4.31.tgz
	https://registry.yarnpkg.com/posthog-js/-/posthog-js-1.83.0.tgz
	https://registry.yarnpkg.com/potpack/-/potpack-1.0.2.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/preserve/-/preserve-0.2.0.tgz
	https://registry.yarnpkg.com/prettier/-/prettier-2.8.8.tgz
	https://registry.yarnpkg.com/pretty-error/-/pretty-error-2.1.2.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-27.5.1.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-28.1.3.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-29.7.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.4.2.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.8.1.tgz
	https://registry.yarnpkg.com/proposal-temporal/-/proposal-temporal-0.9.0.tgz
	https://registry.yarnpkg.com/protocol-buffers-schema/-/protocol-buffers-schema-3.6.0.tgz
	https://registry.yarnpkg.com/proxy-addr/-/proxy-addr-2.0.7.tgz
	https://registry.yarnpkg.com/proxy-agent/-/proxy-agent-6.3.1.tgz
	https://registry.yarnpkg.com/proxy-from-env/-/proxy-from-env-1.1.0.tgz
	https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.9.0.tgz
	https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.3.tgz
	https://registry.yarnpkg.com/pump/-/pump-2.0.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/pumpify/-/pumpify-1.5.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.3.0.tgz
	https://registry.yarnpkg.com/pure-rand/-/pure-rand-6.0.4.tgz
	https://registry.yarnpkg.com/q/-/q-1.5.1.tgz
	https://registry.yarnpkg.com/qrcode/-/qrcode-1.5.3.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.11.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.11.2.tgz
	https://registry.yarnpkg.com/querystring-es3/-/querystring-es3-0.2.1.tgz
	https://registry.yarnpkg.com/querystring/-/querystring-0.2.1.tgz
	https://registry.yarnpkg.com/querystringify/-/querystringify-2.2.0.tgz
	https://registry.yarnpkg.com/queue-microtask/-/queue-microtask-1.2.3.tgz
	https://registry.yarnpkg.com/quick-lru/-/quick-lru-5.1.1.tgz
	https://registry.yarnpkg.com/quickselect/-/quickselect-2.0.0.tgz
	https://registry.yarnpkg.com/raf-schd/-/raf-schd-4.0.3.tgz
	https://registry.yarnpkg.com/randomatic/-/randomatic-3.1.1.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.4.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.1.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.5.1.tgz
	https://registry.yarnpkg.com/raw-loader/-/raw-loader-4.0.2.tgz
	https://registry.yarnpkg.com/re-resizable/-/re-resizable-6.9.11.tgz
	https://registry.yarnpkg.com/react-beautiful-dnd/-/react-beautiful-dnd-13.1.1.tgz
	https://registry.yarnpkg.com/react-blurhash/-/react-blurhash-0.3.0.tgz
	https://registry.yarnpkg.com/react-clientside-effect/-/react-clientside-effect-1.2.6.tgz
	https://registry.yarnpkg.com/react-dom/-/react-dom-17.0.2.tgz
	https://registry.yarnpkg.com/react-error-boundary/-/react-error-boundary-3.1.4.tgz
	https://registry.yarnpkg.com/react-focus-lock/-/react-focus-lock-2.9.6.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-17.0.2.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-18.2.0.tgz
	https://registry.yarnpkg.com/react-redux/-/react-redux-7.2.9.tgz
	https://registry.yarnpkg.com/react-transition-group/-/react-transition-group-4.4.5.tgz
	https://registry.yarnpkg.com/react/-/react-17.0.2.tgz
	https://registry.yarnpkg.com/read-cache/-/read-cache-1.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-8.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-6.0.0.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.8.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.2.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-2.2.1.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.6.0.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.7.1.tgz
	https://registry.yarnpkg.com/redent/-/redent-4.0.0.tgz
	https://registry.yarnpkg.com/redux/-/redux-4.2.1.tgz
	https://registry.yarnpkg.com/reflect.getprototypeof/-/reflect.getprototypeof-1.0.4.tgz
	https://registry.yarnpkg.com/regenerate-unicode-properties/-/regenerate-unicode-properties-10.1.1.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.4.2.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.11.1.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.14.0.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.15.2.tgz
	https://registry.yarnpkg.com/regex-cache/-/regex-cache-0.4.4.tgz
	https://registry.yarnpkg.com/regex-not/-/regex-not-1.0.2.tgz
	https://registry.yarnpkg.com/regexp-tree/-/regexp-tree-0.1.27.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.5.1.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-5.3.2.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.10.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.9.1.tgz
	https://registry.yarnpkg.com/relateurl/-/relateurl-0.2.7.tgz
	https://registry.yarnpkg.com/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz
	https://registry.yarnpkg.com/renderkid/-/renderkid-2.0.7.tgz
	https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.4.tgz
	https://registry.yarnpkg.com/repeat-string/-/repeat-string-1.6.1.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-from-string/-/require-from-string-2.0.2.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz
	https://registry.yarnpkg.com/requirejs/-/requirejs-2.3.6.tgz
	https://registry.yarnpkg.com/requires-port/-/requires-port-1.0.0.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve-protobuf-schema/-/resolve-protobuf-schema-2.1.0.tgz
	https://registry.yarnpkg.com/resolve-url/-/resolve-url-0.2.1.tgz
	https://registry.yarnpkg.com/resolve.exports/-/resolve.exports-2.0.2.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.22.8.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-2.0.0-next.5.tgz
	https://registry.yarnpkg.com/ret/-/ret-0.1.15.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.13.1.tgz
	https://registry.yarnpkg.com/reusify/-/reusify-1.0.4.tgz
	https://registry.yarnpkg.com/rfc4648/-/rfc4648-1.5.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-5.0.5.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.2.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.2.0.tgz
	https://registry.yarnpkg.com/run-queue/-/run-queue-1.0.3.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-7.8.1.tgz
	https://registry.yarnpkg.com/safe-array-concat/-/safe-array-concat-1.0.1.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safe-regex-test/-/safe-regex-test-1.0.0.tgz
	https://registry.yarnpkg.com/safe-regex/-/safe-regex-1.1.0.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sanitize-html/-/sanitize-html-2.11.0.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/saxes/-/saxes-6.0.0.tgz
	https://registry.yarnpkg.com/scheduler/-/scheduler-0.20.2.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-0.4.7.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-1.0.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-2.7.1.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-3.3.0.tgz
	https://registry.yarnpkg.com/schema-utils/-/schema-utils-4.2.0.tgz
	https://registry.yarnpkg.com/sdp-transform/-/sdp-transform-2.14.1.tgz
	https://registry.yarnpkg.com/select-hose/-/select-hose-2.0.0.tgz
	https://registry.yarnpkg.com/selfsigned/-/selfsigned-2.1.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.5.4.tgz
	https://registry.yarnpkg.com/send/-/send-0.18.0.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-4.0.0.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-5.0.1.tgz
	https://registry.yarnpkg.com/serve-index/-/serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.15.0.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/set-function-name/-/set-function-name-2.0.1.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-2.0.1.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.1.0.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.2.0.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.11.tgz
	https://registry.yarnpkg.com/shallow-clone/-/shallow-clone-3.0.1.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shell-quote/-/shell-quote-1.8.1.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.4.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.7.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-4.1.0.tgz
	https://registry.yarnpkg.com/sirv/-/sirv-2.0.3.tgz
	https://registry.yarnpkg.com/sisteransi/-/sisteransi-1.0.5.tgz
	https://registry.yarnpkg.com/slash/-/slash-1.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.2.0.tgz
	https://registry.yarnpkg.com/snapdragon-node/-/snapdragon-node-2.1.1.tgz
	https://registry.yarnpkg.com/snapdragon-util/-/snapdragon-util-3.0.1.tgz
	https://registry.yarnpkg.com/snapdragon/-/snapdragon-0.8.2.tgz
	https://registry.yarnpkg.com/sockjs/-/sockjs-0.3.24.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-8.0.2.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.7.1.tgz
	https://registry.yarnpkg.com/source-list-map/-/source-list-map-2.0.1.tgz
	https://registry.yarnpkg.com/source-map-js/-/source-map-js-1.0.2.tgz
	https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.3.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.13.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.21.tgz
	https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.7.4.tgz
	https://registry.yarnpkg.com/spawn-command/-/spawn-command-0.0.2.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.16.tgz
	https://registry.yarnpkg.com/spdy-transport/-/spdy-transport-3.0.0.tgz
	https://registry.yarnpkg.com/spdy/-/spdy-4.0.2.tgz
	https://registry.yarnpkg.com/split-string/-/split-string-3.1.0.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.1.3.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-6.0.2.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-8.0.1.tgz
	https://registry.yarnpkg.com/stable/-/stable-0.1.8.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-2.0.6.tgz
	https://registry.yarnpkg.com/static-extend/-/static-extend-0.1.2.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.5.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-2.0.1.tgz
	https://registry.yarnpkg.com/stop-iteration-iterator/-/stop-iteration-iterator-1.0.0.tgz
	https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-2.0.2.tgz
	https://registry.yarnpkg.com/stream-each/-/stream-each-1.2.3.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-2.8.3.tgz
	https://registry.yarnpkg.com/stream-shift/-/stream-shift-1.0.1.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-4.0.2.tgz
	https://registry.yarnpkg.com/string-replace-loader/-/string-replace-loader-3.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.3.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-5.1.2.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.10.tgz
	https://registry.yarnpkg.com/string.prototype.repeat/-/string.prototype.repeat-0.2.0.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.2.8.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.7.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.7.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-7.1.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-3.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-4.0.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/style-loader/-/style-loader-2.0.0.tgz
	https://registry.yarnpkg.com/style-search/-/style-search-0.1.0.tgz
	https://registry.yarnpkg.com/stylehacks/-/stylehacks-5.1.1.tgz
	https://registry.yarnpkg.com/stylelint-config-recommended/-/stylelint-config-recommended-13.0.0.tgz
	https://registry.yarnpkg.com/stylelint-config-standard/-/stylelint-config-standard-34.0.0.tgz
	https://registry.yarnpkg.com/stylelint-scss/-/stylelint-scss-5.2.1.tgz
	https://registry.yarnpkg.com/stylelint/-/stylelint-15.11.0.tgz
	https://registry.yarnpkg.com/subarg/-/subarg-1.0.0.tgz
	https://registry.yarnpkg.com/sugarss/-/sugarss-2.0.0.tgz
	https://registry.yarnpkg.com/supercluster/-/supercluster-7.1.5.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-8.1.1.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-3.0.0.tgz
	https://registry.yarnpkg.com/supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz
	https://registry.yarnpkg.com/svg-arc-to-cubic-bezier/-/svg-arc-to-cubic-bezier-3.2.0.tgz
	https://registry.yarnpkg.com/svg-parser/-/svg-parser-2.0.4.tgz
	https://registry.yarnpkg.com/svg-path-bounds/-/svg-path-bounds-1.0.2.tgz
	https://registry.yarnpkg.com/svg-tags/-/svg-tags-1.0.0.tgz
	https://registry.yarnpkg.com/svg2vectordrawable/-/svg2vectordrawable-2.9.1.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-1.3.2.tgz
	https://registry.yarnpkg.com/svgo/-/svgo-2.8.0.tgz
	https://registry.yarnpkg.com/svgpath/-/svgpath-2.6.0.tgz
	https://registry.yarnpkg.com/symbol-tree/-/symbol-tree-3.2.4.tgz
	https://registry.yarnpkg.com/table/-/table-6.8.1.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-1.1.3.tgz
	https://registry.yarnpkg.com/tar-js/-/tar-js-0.3.0.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.2.0.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-1.4.5.tgz
	https://registry.yarnpkg.com/terser-webpack-plugin/-/terser-webpack-plugin-4.2.3.tgz
	https://registry.yarnpkg.com/terser/-/terser-4.8.1.tgz
	https://registry.yarnpkg.com/terser/-/terser-5.22.0.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-6.0.0.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz
	https://registry.yarnpkg.com/thunky/-/thunky-1.1.0.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-2.0.12.tgz
	https://registry.yarnpkg.com/timers-ext/-/timers-ext-0.1.7.tgz
	https://registry.yarnpkg.com/tiny-invariant/-/tiny-invariant-1.3.1.tgz
	https://registry.yarnpkg.com/tinyqueue/-/tinyqueue-2.0.3.tgz
	https://registry.yarnpkg.com/tmpl/-/tmpl-1.0.5.tgz
	https://registry.yarnpkg.com/to-arraybuffer/-/to-arraybuffer-1.0.1.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-object-path/-/to-object-path-0.3.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-2.1.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/to-regex/-/to-regex-3.0.2.tgz
	https://registry.yarnpkg.com/toidentifier/-/toidentifier-1.0.1.tgz
	https://registry.yarnpkg.com/totalist/-/totalist-3.0.1.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-4.1.3.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-0.0.3.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-1.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-3.0.0.tgz
	https://registry.yarnpkg.com/tree-kill/-/tree-kill-1.2.2.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-4.1.1.tgz
	https://registry.yarnpkg.com/true-myth/-/true-myth-4.1.1.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/ts-morph/-/ts-morph-13.0.3.tgz
	https://registry.yarnpkg.com/ts-node/-/ts-node-10.9.1.tgz
	https://registry.yarnpkg.com/ts-prune/-/ts-prune-0.10.3.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.14.2.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-2.6.2.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.21.0.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.0.tgz
	https://registry.yarnpkg.com/tunnel/-/tunnel-0.0.6.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.20.2.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.21.3.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-1.4.0.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-1.6.18.tgz
	https://registry.yarnpkg.com/type/-/type-1.2.0.tgz
	https://registry.yarnpkg.com/type/-/type-2.7.2.tgz
	https://registry.yarnpkg.com/typed-array-buffer/-/typed-array-buffer-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-byte-length/-/typed-array-byte-length-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-byte-offset/-/typed-array-byte-offset-1.0.0.tgz
	https://registry.yarnpkg.com/typed-array-length/-/typed-array-length-1.0.4.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-5.2.2.tgz
	https://registry.yarnpkg.com/ua-parser-js/-/ua-parser-js-1.0.36.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-1.0.6.tgz
	https://registry.yarnpkg.com/unbox-primitive/-/unbox-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/undici-types/-/undici-types-5.25.3.tgz
	https://registry.yarnpkg.com/undici/-/undici-5.26.3.tgz
	https://registry.yarnpkg.com/unhomoglyph/-/unhomoglyph-1.0.6.tgz
	https://registry.yarnpkg.com/unicode-canonical-property-names-ecmascript/-/unicode-canonical-property-names-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-ecmascript/-/unicode-match-property-ecmascript-2.0.0.tgz
	https://registry.yarnpkg.com/unicode-match-property-value-ecmascript/-/unicode-match-property-value-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/unicode-property-aliases-ecmascript/-/unicode-property-aliases-ecmascript-2.1.0.tgz
	https://registry.yarnpkg.com/union-value/-/union-value-1.0.1.tgz
	https://registry.yarnpkg.com/uniq/-/uniq-1.0.1.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.2.tgz
	https://registry.yarnpkg.com/universal-user-agent/-/universal-user-agent-6.0.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.2.0.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-2.0.0.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unplugin/-/unplugin-1.0.1.tgz
	https://registry.yarnpkg.com/unquote/-/unquote-1.1.1.tgz
	https://registry.yarnpkg.com/unset-value/-/unset-value-1.0.0.tgz
	https://registry.yarnpkg.com/upath/-/upath-1.2.0.tgz
	https://registry.yarnpkg.com/update-browserslist-db/-/update-browserslist-db-1.0.13.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/urix/-/urix-0.1.0.tgz
	https://registry.yarnpkg.com/url-parse/-/url-parse-1.5.10.tgz
	https://registry.yarnpkg.com/url/-/url-0.11.3.tgz
	https://registry.yarnpkg.com/use-callback-ref/-/use-callback-ref-1.3.0.tgz
	https://registry.yarnpkg.com/use-memo-one/-/use-memo-one-1.1.3.tgz
	https://registry.yarnpkg.com/use-sidecar/-/use-sidecar-1.1.2.tgz
	https://registry.yarnpkg.com/use/-/use-3.1.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.0.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.1.tgz
	https://registry.yarnpkg.com/util/-/util-0.10.4.tgz
	https://registry.yarnpkg.com/util/-/util-0.11.1.tgz
	https://registry.yarnpkg.com/utila/-/utila-0.4.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.1.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-8.3.2.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-9.0.1.tgz
	https://registry.yarnpkg.com/v8-compile-cache-lib/-/v8-compile-cache-lib-3.0.1.tgz
	https://registry.yarnpkg.com/v8-to-istanbul/-/v8-to-istanbul-9.1.3.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/vary/-/vary-1.1.2.tgz
	https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-1.1.2.tgz
	https://registry.yarnpkg.com/vt-pbf/-/vt-pbf-3.1.3.tgz
	https://registry.yarnpkg.com/w3c-xmlserializer/-/w3c-xmlserializer-4.0.0.tgz
	https://registry.yarnpkg.com/walk/-/walk-2.3.15.tgz
	https://registry.yarnpkg.com/walker/-/walker-1.0.8.tgz
	https://registry.yarnpkg.com/watchpack-chokidar2/-/watchpack-chokidar2-2.0.1.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-1.7.5.tgz
	https://registry.yarnpkg.com/wbuf/-/wbuf-1.7.3.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-3.0.1.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-4.0.2.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-7.0.0.tgz
	https://registry.yarnpkg.com/webpack-bundle-analyzer/-/webpack-bundle-analyzer-4.9.1.tgz
	https://registry.yarnpkg.com/webpack-cli/-/webpack-cli-4.10.0.tgz
	https://registry.yarnpkg.com/webpack-dev-middleware/-/webpack-dev-middleware-5.3.3.tgz
	https://registry.yarnpkg.com/webpack-dev-server/-/webpack-dev-server-4.15.1.tgz
	https://registry.yarnpkg.com/webpack-merge/-/webpack-merge-5.9.0.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-1.4.3.tgz
	https://registry.yarnpkg.com/webpack-sources/-/webpack-sources-3.2.3.tgz
	https://registry.yarnpkg.com/webpack-virtual-modules/-/webpack-virtual-modules-0.5.0.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-4.47.0.tgz
	https://registry.yarnpkg.com/websocket-driver/-/websocket-driver-0.7.4.tgz
	https://registry.yarnpkg.com/websocket-extensions/-/websocket-extensions-0.1.4.tgz
	https://registry.yarnpkg.com/what-input/-/what-input-5.2.12.tgz
	https://registry.yarnpkg.com/whatwg-encoding/-/whatwg-encoding-2.0.0.tgz
	https://registry.yarnpkg.com/whatwg-mimetype/-/whatwg-mimetype-3.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-11.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-5.0.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-6.5.0.tgz
	https://registry.yarnpkg.com/which-boxed-primitive/-/which-boxed-primitive-1.0.2.tgz
	https://registry.yarnpkg.com/which-builtin-type/-/which-builtin-type-1.1.3.tgz
	https://registry.yarnpkg.com/which-collection/-/which-collection-1.0.1.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-2.0.1.tgz
	https://registry.yarnpkg.com/which-typed-array/-/which-typed-array-1.1.11.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/wildcard/-/wildcard-2.0.1.tgz
	https://registry.yarnpkg.com/worker-farm/-/worker-farm-1.7.0.tgz
	https://registry.yarnpkg.com/worker-loader/-/worker-loader-3.0.8.tgz
	https://registry.yarnpkg.com/worklet-loader/-/worklet-loader-2.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-6.2.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-8.1.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-4.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-5.0.1.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.5.9.tgz
	https://registry.yarnpkg.com/ws/-/ws-8.14.2.tgz
	https://registry.yarnpkg.com/xml-name-validator/-/xml-name-validator-4.0.0.tgz
	https://registry.yarnpkg.com/xml/-/xml-1.0.1.tgz
	https://registry.yarnpkg.com/xmlchars/-/xmlchars-2.2.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.3.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.8.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-1.10.2.tgz
	https://registry.yarnpkg.com/yaml/-/yaml-2.3.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-18.1.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.9.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-21.1.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-15.4.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-17.7.2.tgz
	https://registry.yarnpkg.com/yn/-/yn-3.1.1.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
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

	# Make SVGR not traverse the path up to / looking for aconfiguration file.
	# Fixes Error: EACCES: permission denied, open '/.config/svgrrc'
	# See https://github.com/PF4Public/gentoo-overlay/issues/276
	echo "runtimeConfig: false" > .svgrrc.yml || die
}

src_configure() {
	export PATH="/usr/$(get_libdir)/node_modules/npm/bin/node-gyp-bin:$PATH"
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/node || die

	# Removing sentry dependency
	sed -i '/sentry/d' "${WORKDIR}/${P}/package.json" || die
	sed -i '/sentry\/webpack-plugin/d' "${WORKDIR}/${P}/webpack.config.js" || die

	# Fixing pesky matrix-analytics-events
	sed -i 's/"matrix-analytics-events@github.*$/matrix-analytics-events@0.0.1:/' "${WORKDIR}/${P}/yarn.lock" || die
	sed -i 's/matrix-analytics-events "github:.*$/matrix-analytics-events "0.0.1"/' "${WORKDIR}/${P}/yarn.lock" || die

	#! 1. License of external_api.min.js in unclear
	#! 2. Unpackageable file → maybe enable in "build-online"?
	#! 3. Maybe package jitsi-meet? No idea if they are compatible
	einfo "Removing Jitsi"
	sed -i '/"build:jitsi":.*$/{s++"build:jitsi": "echo",+;h};${x;/./{x;q0};x;q1}' \
		package.json || die

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
