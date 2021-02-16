# Copyright 2009-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CARGO_OPTIONAL=1
CRATES="
	addr2line-0.14.1
	adler-0.2.3
	aes-ctr-0.6.0
	aes-soft-0.6.4
	ahash-0.4.7
	aho-corasick-0.7.15
	atomicwrites-0.2.5
	autocfg-0.1.7
	autocfg-1.0.1
	backtrace-0.3.56
	base64-0.11.0
	base64-0.13.0
	bitflags-1.2.1
	bitpacking-0.8.2
	block-buffer-0.9.0
	byteorder-1.4.2
	bytes-1.0.1
	cc-1.0.66
	census-0.4.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	cipher-0.2.5
	combine-4.5.2
	const_fn-0.4.5
	cpuid-bool-0.1.2
	crc32fast-1.2.1
	crossbeam-0.7.3
	crossbeam-channel-0.4.4
	crossbeam-channel-0.5.0
	crossbeam-deque-0.7.3
	crossbeam-deque-0.8.0
	crossbeam-epoch-0.8.2
	crossbeam-epoch-0.9.1
	crossbeam-queue-0.2.3
	crossbeam-utils-0.7.2
	crossbeam-utils-0.8.1
	crunchy-0.2.2
	crypto-mac-0.10.0
	cslice-0.2.0
	ctr-0.6.0
	digest-0.9.0
	downcast-rs-1.2.0
	either-1.6.1
	error-chain-0.12.4
	fail-0.3.0
	failure_derive-0.1.8
	failure-0.1.8
	fallible-iterator-0.2.0
	fallible-streaming-iterator-0.1.9
	filetime-0.2.14
	fnv-1.0.7
	fs_extra-1.2.0
	fs2-0.4.3
	fst-0.3.5
	futures-0.3.12
	futures-channel-0.3.12
	futures-core-0.3.12
	futures-executor-0.3.12
	futures-io-0.3.12
	futures-macro-0.3.12
	futures-sink-0.3.12
	futures-task-0.3.12
	futures-util-0.3.12
	generic-array-0.14.4
	getrandom-0.1.16
	getrandom-0.2.2
	gimli-0.23.0
	hashbrown-0.9.1
	hashlink-0.6.0
	hermit-abi-0.1.18
	hkdf-0.10.0
	hmac-0.10.1
	htmlescape-0.3.1
	inotify-0.7.1
	inotify-sys-0.1.5
	instant-0.1.9
	iovec-0.1.4
	itertools-0.8.2
	itoa-0.4.7
	lazy_static-1.4.0
	lazycell-1.3.0
	levenshtein_automata-0.1.1
	libc-0.2.86
	libsqlite3-sys-0.20.1
	linked-hash-map-0.5.4
	lock_api-0.4.2
	log-0.4.14
	lru-cache-0.1.2
	maplit-1.0.2
	maybe-uninit-2.0.0
	memchr-2.3.4
	memmap-0.7.0
	memoffset-0.5.6
	memoffset-0.6.1
	miniz_oxide-0.4.3
	mio-0.6.23
	mio-extras-2.0.6
	murmurhash32-0.2.0
	neon-0.4.0
	neon-build-0.4.0
	neon-runtime-0.4.0
	neon-serde-0.4.0
	neon-sys-0.4.0
	net2-0.2.37
	nix-0.14.1
	notify-4.0.15
	num_cpus-1.13.0
	num-0.2.1
	num-complex-0.2.4
	num-integer-0.1.44
	num-iter-0.1.42
	num-rational-0.2.4
	num-traits-0.2.14
	object-0.23.0
	once_cell-1.5.2
	opaque-debug-0.3.0
	owned-read-0.4.1
	owning_ref-0.4.1
	parking_lot_core-0.8.3
	parking_lot-0.11.1
	pbkdf2-0.6.0
	pin-project-lite-0.2.4
	pin-utils-0.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	proc-macro-hack-0.5.19
	proc-macro-nested-0.1.7
	proc-macro2-1.0.24
	quote-1.0.9
	r2d2_sqlite-0.17.0
	r2d2-0.8.9
	rand_chacha-0.1.1
	rand_chacha-0.2.2
	rand_chacha-0.3.0
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.5.1
	rand_core-0.6.2
	rand_hc-0.1.0
	rand_isaac-0.1.1
	rand_jitter-0.1.4
	rand_os-0.1.3
	rand_pcg-0.1.2
	rand_xorshift-0.1.1
	rand-0.4.6
	rand-0.6.5
	rand-0.7.3
	rand-0.8.3
	rayon-1.5.0
	rayon-core-1.9.0
	regex-1.4.3
	regex-syntax-0.4.2
	regex-syntax-0.6.22
	remove_dir_all-0.5.3
	rusqlite-0.24.2
	rust-stemmers-1.2.0
	rustc-demangle-0.1.18
	ryu-1.0.5
	same-file-1.0.6
	scheduled-thread-pool-0.2.5
	scopeguard-1.1.0
	semver-0.9.0
	semver-parser-0.7.0
	serde_derive-1.0.118
	serde_json-1.0.61
	serde-1.0.118
	seshat-2.2.3
	sha2-0.9.3
	slab-0.4.2
	smallvec-1.6.1
	snap-1.0.4
	stable_deref_trait-1.2.0
	subtle-2.4.0
	syn-1.0.60
	synstructure-0.12.4
	tantivy-0.12.0
	tantivy-fst-0.2.1
	tantivy-query-grammar-0.12.0
	tempdir-0.3.7
	tempfile-3.2.0
	thiserror-1.0.23
	thiserror-impl-1.0.23
	thread_local-1.1.3
	time-0.1.43
	tinysegmenter-0.1.1
	typenum-1.12.0
	unicode-xid-0.2.1
	utf8-ranges-1.0.4
	uuid-0.8.2
	version_check-0.9.2
	void-1.0.2
	walkdir-2.3.1
	zeroize-1.2.0
    aesni-0.10.0
    cloudabi-0.0.3
    fsevent-0.4.0
    fsevent-sys-2.0.1
    fuchsia-cprng-0.1.1
    fuchsia-zircon-0.3.3
    fuchsia-zircon-sys-0.3.3
    kernel32-sys-0.2.2
    miow-0.2.2
    rand_hc-0.2.0
    rand_hc-0.3.0
    rdrand-0.4.0
    redox_syscall-0.2.5
    vcpkg-0.2.11
    wasi-0.10.2+wasi-snapshot-preview1
    wasi-0.9.0+wasi-snapshot-preview1
    winapi-0.2.8
    winapi-0.3.9
    winapi-build-0.1.1
    winapi-i686-pc-windows-gnu-0.4.0
    winapi-util-0.1.5
    winapi-x86_64-pc-windows-gnu-0.4.0
    ws2_32-sys-0.2.1
"

inherit desktop flag-o-matic multilib toolchain-funcs cargo xdg-utils

DESCRIPTION="A glossy Matrix collaboration client for desktop"
HOMEPAGE="https://element.io/"
LICENSE="Apache-2.0"
SLOT="0"
SRC_URI="
	native-modules? (
		https://github.com/matrix-org/seshat/archive/2.2.3.tar.gz -> matrix-seshat-2.2.3.tar.gz
		https://github.com/atom/node-keytar/archive/v5.6.0.tar.gz -> keytar-5.6.0.tar.gz
		$(cargo_crate_uris ${CRATES})
	)

	https://registry.yarnpkg.com/7zip-bin/-/7zip-bin-5.0.3.tgz
	https://registry.yarnpkg.com/abab/-/abab-2.0.3.tgz
	https://registry.yarnpkg.com/abab/-/abab-2.0.5.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.0.9.tgz
	https://registry.yarnpkg.com/abbrev/-/abbrev-1.1.1.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.3.tgz
	https://registry.yarnpkg.com/accepts/-/accepts-1.3.5.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-3.3.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-4.0.13.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-4.0.4.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.2.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.3.0.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.4.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.5.3.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.7.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-5.7.4.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-6.4.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-6.4.2.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.1.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.3.1.tgz
	https://registry.yarnpkg.com/acorn/-/acorn-7.4.1.tgz
	https://registry.yarnpkg.com/acorn-globals/-/acorn-globals-4.3.4.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-3.0.1.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-4.1.1.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.2.0.tgz
	https://registry.yarnpkg.com/acorn-jsx/-/acorn-jsx-5.3.1.tgz
	https://registry.yarnpkg.com/acorn-node/-/acorn-node-1.3.0.tgz
	https://registry.yarnpkg.com/acorn-walk/-/acorn-walk-6.2.0.tgz
	https://registry.yarnpkg.com/addressparser/-/addressparser-1.0.1.tgz
	https://registry.yarnpkg.com/adm-zip/-/adm-zip-0.4.7.tgz
	https://registry.yarnpkg.com/after/-/after-0.8.2.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-2.1.1.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-4.2.1.tgz
	https://registry.yarnpkg.com/agent-base/-/agent-base-4.3.0.tgz
	https://registry.yarnpkg.com/agentkeepalive/-/agentkeepalive-3.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-4.11.5.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-4.11.8.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-5.5.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.10.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.2.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.3.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.5.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.12.6.tgz
	https://registry.yarnpkg.com/ajv/-/ajv-6.5.2.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-1.5.1.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.2.0.tgz
	https://registry.yarnpkg.com/ajv-keywords/-/ajv-keywords-3.4.1.tgz
	https://registry.yarnpkg.com/align-text/-/align-text-0.1.4.tgz
	https://registry.yarnpkg.com/amdefine/-/amdefine-1.0.1.tgz
	https://registry.yarnpkg.com/amqplib/-/amqplib-0.5.2.tgz
	https://registry.yarnpkg.com/ansi-align/-/ansi-align-2.0.0.tgz
	https://registry.yarnpkg.com/ansi-align/-/ansi-align-3.0.0.tgz
	https://registry.yarnpkg.com/ansi/-/ansi-0.3.1.tgz
	https://registry.yarnpkg.com/ansicolors/-/ansicolors-0.3.2.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-3.2.3.tgz
	https://registry.yarnpkg.com/ansi-colors/-/ansi-colors-4.1.1.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-1.4.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-3.1.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-3.2.0.tgz
	https://registry.yarnpkg.com/ansi-escapes/-/ansi-escapes-4.3.1.tgz
	https://registry.yarnpkg.com/ansi-escape-sequences/-/ansi-escape-sequences-3.0.0.tgz
	https://registry.yarnpkg.com/ansi-escape-sequences/-/ansi-escape-sequences-4.1.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-2.1.1.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-3.0.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-4.1.0.tgz
	https://registry.yarnpkg.com/ansi-regex/-/ansi-regex-5.0.0.tgz
	https://registry.yarnpkg.com/ansistyles/-/ansistyles-0.1.3.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-2.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-3.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.2.1.tgz
	https://registry.yarnpkg.com/ansi-styles/-/ansi-styles-4.3.0.tgz
	https://registry.yarnpkg.com/any-base/-/any-base-1.1.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-1.3.2.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-2.0.0.tgz
	https://registry.yarnpkg.com/anymatch/-/anymatch-3.1.1.tgz
	https://registry.yarnpkg.com/app-builder-bin/-/app-builder-bin-3.5.10.tgz
	https://registry.yarnpkg.com/app-builder-lib/-/app-builder-lib-22.9.1.tgz
	https://registry.yarnpkg.com/append-transform/-/append-transform-0.4.0.tgz
	https://registry.yarnpkg.com/applescript/-/applescript-1.0.0.tgz
	https://registry.yarnpkg.com/app-usage-stats/-/app-usage-stats-0.5.1.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-1.2.0.tgz
	https://registry.yarnpkg.com/aproba/-/aproba-2.0.0.tgz
	https://registry.yarnpkg.com/archiver/-/archiver-0.14.4.tgz
	https://registry.yarnpkg.com/archiver/-/archiver-5.2.0.tgz
	https://registry.yarnpkg.com/archiver-utils/-/archiver-utils-2.1.0.tgz
	https://registry.yarnpkg.com/archy/-/archy-1.0.0.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.0.6.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.4.tgz
	https://registry.yarnpkg.com/are-we-there-yet/-/are-we-there-yet-1.1.5.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-0.1.16.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.10.tgz
	https://registry.yarnpkg.com/argparse/-/argparse-1.0.9.tgz
	https://registry.yarnpkg.com/array-back/-/array-back-1.0.4.tgz
	https://registry.yarnpkg.com/array-back/-/array-back-2.0.0.tgz
	https://registry.yarnpkg.com/array-back/-/array-back-3.1.0.tgz
	https://registry.yarnpkg.com/arraybuffer.slice/-/arraybuffer.slice-0.0.6.tgz
	https://registry.yarnpkg.com/arraybuffer.slice/-/arraybuffer.slice-0.0.7.tgz
	https://registry.yarnpkg.com/array-equal/-/array-equal-1.0.0.tgz
	https://registry.yarnpkg.com/array-filter/-/array-filter-0.0.1.tgz
	https://registry.yarnpkg.com/array-find-index/-/array-find-index-1.0.2.tgz
	https://registry.yarnpkg.com/array-flatten/-/array-flatten-1.1.1.tgz
	https://registry.yarnpkg.com/array-includes/-/array-includes-3.1.1.tgz
	https://registry.yarnpkg.com/array-index/-/array-index-1.0.0.tgz
	https://registry.yarnpkg.com/array-map/-/array-map-0.0.0.tgz
	https://registry.yarnpkg.com/array.prototype.find/-/array.prototype.find-2.0.4.tgz
	https://registry.yarnpkg.com/array.prototype.flat/-/array.prototype.flat-1.2.3.tgz
	https://registry.yarnpkg.com/array.prototype.flatmap/-/array.prototype.flatmap-1.2.3.tgz
	https://registry.yarnpkg.com/array-reduce/-/array-reduce-0.0.0.tgz
	https://registry.yarnpkg.com/array-slice/-/array-slice-0.2.3.tgz
	https://registry.yarnpkg.com/array-union/-/array-union-1.0.2.tgz
	https://registry.yarnpkg.com/array-uniq/-/array-uniq-1.0.3.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.2.1.tgz
	https://registry.yarnpkg.com/array-unique/-/array-unique-0.3.2.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-2.0.0.tgz
	https://registry.yarnpkg.com/arr-diff/-/arr-diff-4.0.0.tgz
	https://registry.yarnpkg.com/arr-flatten/-/arr-flatten-1.1.0.tgz
	https://registry.yarnpkg.com/arrify/-/arrify-1.0.1.tgz
	https://registry.yarnpkg.com/arr-union/-/arr-union-3.1.0.tgz
	https://registry.yarnpkg.com/asap/-/asap-2.0.6.tgz
	https://registry.yarnpkg.com/asar/-/asar-2.0.1.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.1.11.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.3.tgz
	https://registry.yarnpkg.com/asn1/-/asn1-0.2.4.tgz
	https://registry.yarnpkg.com/asn1.js/-/asn1.js-4.10.1.tgz
	https://registry.yarnpkg.com/asn1.js/-/asn1.js-4.9.2.tgz
	https://registry.yarnpkg.com/assert/-/assert-1.4.1.tgz
	https://registry.yarnpkg.com/assertion-error/-/assertion-error-1.1.0.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-0.1.5.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-0.2.0.tgz
	https://registry.yarnpkg.com/assert-plus/-/assert-plus-1.0.0.tgz
	https://registry.yarnpkg.com/assign-symbols/-/assign-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/astral-regex/-/astral-regex-1.0.0.tgz
	https://registry.yarnpkg.com/ast-types/-/ast-types-0.11.3.tgz
	https://registry.yarnpkg.com/astw/-/astw-2.2.0.tgz
	https://registry.yarnpkg.com/async/-/async-0.1.22.tgz
	https://registry.yarnpkg.com/async/-/async-0.2.10.tgz
	https://registry.yarnpkg.com/async/-/async-0.9.2.tgz
	https://registry.yarnpkg.com/async/-/async-1.0.0.tgz
	https://registry.yarnpkg.com/async/-/async-1.4.0.tgz
	https://registry.yarnpkg.com/async/-/async-1.5.2.tgz
	https://registry.yarnpkg.com/async/-/async-2.6.1.tgz
	https://registry.yarnpkg.com/async/-/async-3.2.0.tgz
	https://registry.yarnpkg.com/async-each/-/async-each-1.0.1.tgz
	https://registry.yarnpkg.com/async-each/-/async-each-1.0.3.tgz
	https://registry.yarnpkg.com/async-exit-hook/-/async-exit-hook-2.0.1.tgz
	https://registry.yarnpkg.com/asynckit/-/asynckit-0.4.0.tgz
	https://registry.yarnpkg.com/async-limiter/-/async-limiter-1.0.0.tgz
	https://registry.yarnpkg.com/async-limiter/-/async-limiter-1.0.1.tgz
	https://registry.yarnpkg.com/at-least-node/-/at-least-node-1.0.0.tgz
	https://registry.yarnpkg.com/atob/-/atob-2.1.1.tgz
	https://registry.yarnpkg.com/atob/-/atob-2.1.2.tgz
	https://registry.yarnpkg.com/atomically/-/atomically-1.7.0.tgz
	https://registry.yarnpkg.com/auto-launch/-/auto-launch-5.0.5.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.11.0.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.6.0.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.7.0.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.9.0.tgz
	https://registry.yarnpkg.com/aws4/-/aws4-1.9.1.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.5.0.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.6.0.tgz
	https://registry.yarnpkg.com/aws-sign2/-/aws-sign2-0.7.0.tgz
	https://registry.yarnpkg.com/axios/-/axios-0.15.3.tgz
	https://registry.yarnpkg.com/babel-cli/-/babel-cli-6.26.0.tgz
	https://registry.yarnpkg.com/babel-code-frame/-/babel-code-frame-6.22.0.tgz
	https://registry.yarnpkg.com/babel-code-frame/-/babel-code-frame-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.10.4.tgz -> @babel-code-frame-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.12.13.tgz -> @babel-code-frame-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.5.5.tgz -> @babel-code-frame-7.5.5.tgz
	https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.8.3.tgz -> @babel-code-frame-7.8.3.tgz
	https://registry.yarnpkg.com/babel-core/-/babel-core-6.26.0.tgz
	https://registry.yarnpkg.com/babel-core/-/babel-core-6.26.3.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.12.16.tgz -> @babel-core-7.12.16.tgz
	https://registry.yarnpkg.com/@babel/core/-/core-7.9.0.tgz -> @babel-core-7.9.0.tgz
	https://registry.yarnpkg.com/babel-eslint/-/babel-eslint-10.1.0.tgz
	https://registry.yarnpkg.com/babel-generator/-/babel-generator-6.26.1.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.10.5.tgz -> @babel-generator-7.10.5.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.12.15.tgz -> @babel-generator-7.12.15.tgz
	https://registry.yarnpkg.com/@babel/generator/-/generator-7.9.5.tgz -> @babel-generator-7.9.5.tgz
	https://registry.yarnpkg.com/babel-helper-builder-binary-assignment-operator-visitor/-/babel-helper-builder-binary-assignment-operator-visitor-6.24.1.tgz
	https://registry.yarnpkg.com/babel-helper-call-delegate/-/babel-helper-call-delegate-6.24.1.tgz
	https://registry.yarnpkg.com/babel-helper-define-map/-/babel-helper-define-map-6.26.0.tgz
	https://registry.yarnpkg.com/babel-helper-explode-assignable-expression/-/babel-helper-explode-assignable-expression-6.24.1.tgz
	https://registry.yarnpkg.com/babel-helper-function-name/-/babel-helper-function-name-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.10.4.tgz -> @babel-helper-function-name-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.12.13.tgz -> @babel-helper-function-name-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.9.5.tgz -> @babel-helper-function-name-7.9.5.tgz
	https://registry.yarnpkg.com/babel-helper-get-function-arity/-/babel-helper-get-function-arity-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.10.4.tgz -> @babel-helper-get-function-arity-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.12.13.tgz -> @babel-helper-get-function-arity-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-get-function-arity/-/helper-get-function-arity-7.8.3.tgz -> @babel-helper-get-function-arity-7.8.3.tgz
	https://registry.yarnpkg.com/babel-helper-hoist-variables/-/babel-helper-hoist-variables-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.12.16.tgz -> @babel-helper-member-expression-to-functions-7.12.16.tgz
	https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.8.3.tgz -> @babel-helper-member-expression-to-functions-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.12.13.tgz -> @babel-helper-module-imports-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.8.3.tgz -> @babel-helper-module-imports-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.12.13.tgz -> @babel-helper-module-transforms-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.9.0.tgz -> @babel-helper-module-transforms-7.9.0.tgz
	https://registry.yarnpkg.com/babel-helper-optimise-call-expression/-/babel-helper-optimise-call-expression-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.12.13.tgz -> @babel-helper-optimise-call-expression-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.8.3.tgz -> @babel-helper-optimise-call-expression-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.12.13.tgz -> @babel-helper-plugin-utils-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.8.3.tgz -> @babel-helper-plugin-utils-7.8.3.tgz
	https://registry.yarnpkg.com/babel-helper-regex/-/babel-helper-regex-6.26.0.tgz
	https://registry.yarnpkg.com/babel-helper-remap-async-to-generator/-/babel-helper-remap-async-to-generator-6.24.1.tgz
	https://registry.yarnpkg.com/babel-helper-replace-supers/-/babel-helper-replace-supers-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.12.13.tgz -> @babel-helper-replace-supers-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.8.6.tgz -> @babel-helper-replace-supers-7.8.6.tgz
	https://registry.yarnpkg.com/babel-helpers/-/babel-helpers-6.24.1.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.12.13.tgz -> @babel-helpers-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.9.2.tgz -> @babel-helpers-7.9.2.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.12.13.tgz -> @babel-helper-simple-access-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.8.3.tgz -> @babel-helper-simple-access-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.10.4.tgz -> @babel-helper-split-export-declaration-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.12.13.tgz -> @babel-helper-split-export-declaration-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.8.3.tgz -> @babel-helper-split-export-declaration-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.10.4.tgz -> @babel-helper-validator-identifier-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.12.11.tgz -> @babel-helper-validator-identifier-7.12.11.tgz
	https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.9.5.tgz -> @babel-helper-validator-identifier-7.9.5.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.10.4.tgz -> @babel-highlight-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.12.13.tgz -> @babel-highlight-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.5.0.tgz -> @babel-highlight-7.5.0.tgz
	https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.9.0.tgz -> @babel-highlight-7.9.0.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-24.9.0.tgz
	https://registry.yarnpkg.com/babel-jest/-/babel-jest-25.4.0.tgz
	https://registry.yarnpkg.com/babel-loader/-/babel-loader-6.4.1.tgz
	https://registry.yarnpkg.com/babel-messages/-/babel-messages-6.23.0.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.10.5.tgz -> @babel-parser-7.10.5.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.12.16.tgz -> @babel-parser-7.12.16.tgz
	https://registry.yarnpkg.com/@babel/parser/-/parser-7.9.4.tgz -> @babel-parser-7.9.4.tgz
	https://registry.yarnpkg.com/babel-plugin-check-es2015-constants/-/babel-plugin-check-es2015-constants-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-external-helpers/-/babel-plugin-external-helpers-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-5.2.0.tgz
	https://registry.yarnpkg.com/babel-plugin-istanbul/-/babel-plugin-istanbul-6.0.0.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-24.9.0.tgz
	https://registry.yarnpkg.com/babel-plugin-jest-hoist/-/babel-plugin-jest-hoist-25.4.0.tgz
	https://registry.yarnpkg.com/babel-plugin-syntax-async-functions/-/babel-plugin-syntax-async-functions-6.13.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz -> @babel-plugin-syntax-async-generators-7.8.4.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz -> @babel-plugin-syntax-bigint-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.8.3.tgz -> @babel-plugin-syntax-class-properties-7.8.3.tgz
	https://registry.yarnpkg.com/babel-plugin-syntax-exponentiation-operator/-/babel-plugin-syntax-exponentiation-operator-6.13.0.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz -> @babel-plugin-syntax-json-strings-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.8.3.tgz -> @babel-plugin-syntax-logical-assignment-operators-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz -> @babel-plugin-syntax-nullish-coalescing-operator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.8.3.tgz -> @babel-plugin-syntax-numeric-separator-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz -> @babel-plugin-syntax-object-rest-spread-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz -> @babel-plugin-syntax-optional-catch-binding-7.8.3.tgz
	https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz -> @babel-plugin-syntax-optional-chaining-7.8.3.tgz
	https://registry.yarnpkg.com/babel-plugin-syntax-trailing-function-commas/-/babel-plugin-syntax-trailing-function-commas-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-async-to-generator/-/babel-plugin-transform-async-to-generator-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-arrow-functions/-/babel-plugin-transform-es2015-arrow-functions-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-block-scoped-functions/-/babel-plugin-transform-es2015-block-scoped-functions-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-block-scoping/-/babel-plugin-transform-es2015-block-scoping-6.26.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-classes/-/babel-plugin-transform-es2015-classes-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-computed-properties/-/babel-plugin-transform-es2015-computed-properties-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-destructuring/-/babel-plugin-transform-es2015-destructuring-6.23.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-duplicate-keys/-/babel-plugin-transform-es2015-duplicate-keys-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-for-of/-/babel-plugin-transform-es2015-for-of-6.23.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-function-name/-/babel-plugin-transform-es2015-function-name-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-literals/-/babel-plugin-transform-es2015-literals-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-modules-amd/-/babel-plugin-transform-es2015-modules-amd-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-modules-commonjs/-/babel-plugin-transform-es2015-modules-commonjs-6.26.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-modules-commonjs/-/babel-plugin-transform-es2015-modules-commonjs-6.7.7.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-modules-systemjs/-/babel-plugin-transform-es2015-modules-systemjs-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-modules-umd/-/babel-plugin-transform-es2015-modules-umd-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-object-super/-/babel-plugin-transform-es2015-object-super-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-parameters/-/babel-plugin-transform-es2015-parameters-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-shorthand-properties/-/babel-plugin-transform-es2015-shorthand-properties-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-spread/-/babel-plugin-transform-es2015-spread-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-sticky-regex/-/babel-plugin-transform-es2015-sticky-regex-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-template-literals/-/babel-plugin-transform-es2015-template-literals-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-typeof-symbol/-/babel-plugin-transform-es2015-typeof-symbol-6.23.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es2015-unicode-regex/-/babel-plugin-transform-es2015-unicode-regex-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es3-member-expression-literals/-/babel-plugin-transform-es3-member-expression-literals-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-es3-property-literals/-/babel-plugin-transform-es3-property-literals-6.22.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-exponentiation-operator/-/babel-plugin-transform-exponentiation-operator-6.24.1.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-regenerator/-/babel-plugin-transform-regenerator-6.26.0.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-regenerator/-/babel-plugin-transform-regenerator-6.6.5.tgz
	https://registry.yarnpkg.com/babel-plugin-transform-strict-mode/-/babel-plugin-transform-strict-mode-6.24.1.tgz
	https://registry.yarnpkg.com/babel-polyfill/-/babel-polyfill-6.26.0.tgz
	https://registry.yarnpkg.com/babel-preset-current-node-syntax/-/babel-preset-current-node-syntax-0.1.2.tgz
	https://registry.yarnpkg.com/babel-preset-es2015/-/babel-preset-es2015-6.24.1.tgz
	https://registry.yarnpkg.com/babel-preset-es2015/-/babel-preset-es2015-6.6.0.tgz
	https://registry.yarnpkg.com/babel-preset-es2015-mod/-/babel-preset-es2015-mod-6.6.0.tgz
	https://registry.yarnpkg.com/babel-preset-es2016/-/babel-preset-es2016-6.24.1.tgz
	https://registry.yarnpkg.com/babel-preset-es2017/-/babel-preset-es2017-6.24.1.tgz
	https://registry.yarnpkg.com/babel-preset-es3/-/babel-preset-es3-1.0.1.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-24.9.0.tgz
	https://registry.yarnpkg.com/babel-preset-jest/-/babel-preset-jest-25.4.0.tgz
	https://registry.yarnpkg.com/babel-preset-latest/-/babel-preset-latest-6.24.1.tgz
	https://registry.yarnpkg.com/babel-register/-/babel-register-6.26.0.tgz
	https://registry.yarnpkg.com/babel-runtime/-/babel-runtime-5.8.38.tgz
	https://registry.yarnpkg.com/babel-runtime/-/babel-runtime-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.11.2.tgz -> @babel-runtime-7.11.2.tgz
	https://registry.yarnpkg.com/babel-template/-/babel-template-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.10.4.tgz -> @babel-template-7.10.4.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.12.13.tgz -> @babel-template-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/template/-/template-7.8.6.tgz -> @babel-template-7.8.6.tgz
	https://registry.yarnpkg.com/babel-traverse/-/babel-traverse-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.10.5.tgz -> @babel-traverse-7.10.5.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.12.13.tgz -> @babel-traverse-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.9.5.tgz -> @babel-traverse-7.9.5.tgz
	https://registry.yarnpkg.com/babel-types/-/babel-types-6.26.0.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.10.5.tgz -> @babel-types-7.10.5.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.12.13.tgz -> @babel-types-7.12.13.tgz
	https://registry.yarnpkg.com/@babel/types/-/types-7.9.5.tgz -> @babel-types-7.9.5.tgz
	https://registry.yarnpkg.com/babylon/-/babylon-6.18.0.tgz
	https://registry.yarnpkg.com/backo2/-/backo2-1.0.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-0.4.2.tgz
	https://registry.yarnpkg.com/balanced-match/-/balanced-match-1.0.0.tgz
	https://registry.yarnpkg.com/base64-arraybuffer/-/base64-arraybuffer-0.1.5.tgz
	https://registry.yarnpkg.com/base64id/-/base64id-1.0.0.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.2.1.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.2.3.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.3.0.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.3.1.tgz
	https://registry.yarnpkg.com/base64-js/-/base64-js-1.5.1.tgz
	https://registry.yarnpkg.com/base/-/base-0.11.2.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.5.3.tgz
	https://registry.yarnpkg.com/batch/-/batch-0.6.1.tgz
	https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz -> @bcoe-v8-coverage-0.2.3.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.1.tgz
	https://registry.yarnpkg.com/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz
	https://registry.yarnpkg.com/better-assert/-/better-assert-1.0.2.tgz
	https://registry.yarnpkg.com/big-integer/-/big-integer-1.6.48.tgz
	https://registry.yarnpkg.com/big.js/-/big.js-3.2.0.tgz
	https://registry.yarnpkg.com/binary/-/binary-0.3.0.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-1.11.0.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-1.13.1.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.1.0.tgz
	https://registry.yarnpkg.com/binary-extensions/-/binary-extensions-2.2.0.tgz
	https://registry.yarnpkg.com/bindings/-/bindings-1.5.0.tgz
	https://registry.yarnpkg.com/bind-obj-methods/-/bind-obj-methods-1.0.0.tgz
	https://registry.yarnpkg.com/bin-links/-/bin-links-1.1.7.tgz
	https://registry.yarnpkg.com/bin-links/-/bin-links-1.1.8.tgz
	https://registry.yarnpkg.com/bitsyntax/-/bitsyntax-0.0.4.tgz
	https://registry.yarnpkg.com/bl/-/bl-0.9.5.tgz
	https://registry.yarnpkg.com/bl/-/bl-1.1.2.tgz
	https://registry.yarnpkg.com/bl/-/bl-3.0.1.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.0.3.tgz
	https://registry.yarnpkg.com/bl/-/bl-4.1.0.tgz
	https://registry.yarnpkg.com/blob/-/blob-0.0.4.tgz
	https://registry.yarnpkg.com/block-stream/-/block-stream-0.0.9.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-2.11.0.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.4.7.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.5.1.tgz
	https://registry.yarnpkg.com/bluebird/-/bluebird-3.7.2.tgz
	https://registry.yarnpkg.com/bluebird-lst/-/bluebird-lst-1.0.9.tgz
	https://registry.yarnpkg.com/bmp-js/-/bmp-js-0.1.0.tgz
	https://registry.yarnpkg.com/bn.js/-/bn.js-4.11.8.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.14.2.tgz
	https://registry.yarnpkg.com/body-parser/-/body-parser-1.18.2.tgz
	https://registry.yarnpkg.com/boom/-/boom-2.10.1.tgz
	https://registry.yarnpkg.com/boom/-/boom-4.3.1.tgz
	https://registry.yarnpkg.com/boom/-/boom-5.2.0.tgz
	https://registry.yarnpkg.com/boxen/-/boxen-1.3.0.tgz
	https://registry.yarnpkg.com/boxen/-/boxen-4.2.0.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.11.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.6.tgz
	https://registry.yarnpkg.com/brace-expansion/-/brace-expansion-1.1.8.tgz
	https://registry.yarnpkg.com/braces/-/braces-0.1.5.tgz
	https://registry.yarnpkg.com/braces/-/braces-1.8.5.tgz
	https://registry.yarnpkg.com/braces/-/braces-2.3.2.tgz
	https://registry.yarnpkg.com/braces/-/braces-3.0.2.tgz
	https://registry.yarnpkg.com/brorand/-/brorand-1.1.0.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-0.4.0.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.1.1.tgz
	https://registry.yarnpkg.com/browserify-aes/-/browserify-aes-1.2.0.tgz
	https://registry.yarnpkg.com/browserify/-/browserify-13.3.0.tgz
	https://registry.yarnpkg.com/browserify/-/browserify-14.5.0.tgz
	https://registry.yarnpkg.com/browserify/-/browserify-16.2.0.tgz
	https://registry.yarnpkg.com/browserify/-/browserify-16.2.2.tgz
	https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.0.tgz
	https://registry.yarnpkg.com/browserify-cipher/-/browserify-cipher-1.0.1.tgz
	https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.0.tgz
	https://registry.yarnpkg.com/browserify-des/-/browserify-des-1.0.1.tgz
	https://registry.yarnpkg.com/browserify-istanbul/-/browserify-istanbul-2.0.0.tgz
	https://registry.yarnpkg.com/browserify-rsa/-/browserify-rsa-4.0.1.tgz
	https://registry.yarnpkg.com/browserify-sign/-/browserify-sign-4.0.4.tgz
	https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.1.4.tgz
	https://registry.yarnpkg.com/browserify-zlib/-/browserify-zlib-0.2.0.tgz
	https://registry.yarnpkg.com/browser-pack/-/browser-pack-6.0.2.tgz
	https://registry.yarnpkg.com/browser-pack/-/browser-pack-6.0.4.tgz
	https://registry.yarnpkg.com/browser-pack/-/browser-pack-6.1.0.tgz
	https://registry.yarnpkg.com/browser-process-hrtime/-/browser-process-hrtime-1.0.0.tgz
	https://registry.yarnpkg.com/browser-resolve/-/browser-resolve-1.11.2.tgz
	https://registry.yarnpkg.com/browser-resolve/-/browser-resolve-1.11.3.tgz
	https://registry.yarnpkg.com/browser-stdout/-/browser-stdout-1.3.0.tgz
	https://registry.yarnpkg.com/browser-stdout/-/browser-stdout-1.3.1.tgz
	https://registry.yarnpkg.com/bser/-/bser-2.1.1.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-4.9.1.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.0.8.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.1.0.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.6.0.tgz
	https://registry.yarnpkg.com/buffer/-/buffer-5.7.1.tgz
	https://registry.yarnpkg.com/buffer-crc32/-/buffer-crc32-0.2.13.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-0.0.1.tgz
	https://registry.yarnpkg.com/buffer-equal/-/buffer-equal-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-0.1.2.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-from/-/buffer-from-1.1.1.tgz
	https://registry.yarnpkg.com/buffer-indexof-polyfill/-/buffer-indexof-polyfill-1.0.2.tgz
	https://registry.yarnpkg.com/buffer-more-ints/-/buffer-more-ints-0.0.2.tgz
	https://registry.yarnpkg.com/buffers/-/buffers-0.1.1.tgz
	https://registry.yarnpkg.com/buffer-shims/-/buffer-shims-1.0.0.tgz
	https://registry.yarnpkg.com/buffer-xor/-/buffer-xor-1.0.3.tgz
	https://registry.yarnpkg.com/builder-util/-/builder-util-22.9.1.tgz
	https://registry.yarnpkg.com/builder-util-runtime/-/builder-util-runtime-8.7.2.tgz
	https://registry.yarnpkg.com/buildmail/-/buildmail-4.0.1.tgz
	https://registry.yarnpkg.com/builtin-modules/-/builtin-modules-1.1.1.tgz
	https://registry.yarnpkg.com/builtins/-/builtins-1.0.3.tgz
	https://registry.yarnpkg.com/builtin-status-codes/-/builtin-status-codes-3.0.0.tgz
	https://registry.yarnpkg.com/byline/-/byline-5.0.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-0.1.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-2.2.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-2.4.0.tgz
	https://registry.yarnpkg.com/bytes/-/bytes-3.0.0.tgz
	https://registry.yarnpkg.com/byte-size/-/byte-size-5.0.1.tgz
	https://registry.yarnpkg.com/cacache/-/cacache-12.0.3.tgz
	https://registry.yarnpkg.com/cacheable-request/-/cacheable-request-6.1.0.tgz
	https://registry.yarnpkg.com/cache-base/-/cache-base-1.0.1.tgz
	https://registry.yarnpkg.com/cached-path-relative/-/cached-path-relative-1.0.1.tgz
	https://registry.yarnpkg.com/cache-point/-/cache-point-0.4.0.tgz
	https://registry.yarnpkg.com/caching-transform/-/caching-transform-1.0.1.tgz
	https://registry.yarnpkg.com/call-bind/-/call-bind-1.0.2.tgz
	https://registry.yarnpkg.com/caller-path/-/caller-path-0.1.0.tgz
	https://registry.yarnpkg.com/call-limit/-/call-limit-1.1.1.tgz
	https://registry.yarnpkg.com/callsite/-/callsite-1.0.0.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-0.2.0.tgz
	https://registry.yarnpkg.com/callsites/-/callsites-3.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-1.2.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-2.1.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-4.1.0.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-5.3.1.tgz
	https://registry.yarnpkg.com/camelcase/-/camelcase-6.2.0.tgz
	https://registry.yarnpkg.com/camelcase-keys/-/camelcase-keys-2.1.0.tgz
	https://registry.yarnpkg.com/capture-exit/-/capture-exit-2.0.0.tgz
	https://registry.yarnpkg.com/capture-stack-trace/-/capture-stack-trace-1.0.1.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.11.0.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.12.0.tgz
	https://registry.yarnpkg.com/caseless/-/caseless-0.9.0.tgz
	https://registry.yarnpkg.com/catharsis/-/catharsis-0.8.11.tgz
	https://registry.yarnpkg.com/catharsis/-/catharsis-0.8.8.tgz
	https://registry.yarnpkg.com/center-align/-/center-align-0.1.3.tgz
	https://registry.yarnpkg.com/chai/-/chai-3.5.0.tgz
	https://registry.yarnpkg.com/chai/-/chai-4.3.0.tgz
	https://registry.yarnpkg.com/chainsaw/-/chainsaw-0.1.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-1.1.3.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.1.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.3.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.1.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-2.4.2.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-3.0.0.tgz
	https://registry.yarnpkg.com/chalk/-/chalk-4.1.0.tgz
	https://registry.yarnpkg.com/chardet/-/chardet-0.4.2.tgz
	https://registry.yarnpkg.com/chardet/-/chardet-0.7.0.tgz
	https://registry.yarnpkg.com/check-error/-/check-error-1.0.2.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-1.7.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-2.0.4.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.3.0.tgz
	https://registry.yarnpkg.com/chokidar/-/chokidar-3.4.3.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.0.1.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-1.1.4.tgz
	https://registry.yarnpkg.com/chownr/-/chownr-2.0.0.tgz
	https://registry.yarnpkg.com/chromium-pickle-js/-/chromium-pickle-js-0.2.0.tgz
	https://registry.yarnpkg.com/cidr-regex/-/cidr-regex-2.0.10.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-1.6.0.tgz
	https://registry.yarnpkg.com/ci-info/-/ci-info-2.0.0.tgz
	https://registry.yarnpkg.com/cipher-base/-/cipher-base-1.0.4.tgz
	https://registry.yarnpkg.com/circular-json/-/circular-json-0.3.1.tgz
	https://registry.yarnpkg.com/circular-json/-/circular-json-0.3.3.tgz
	https://registry.yarnpkg.com/circular-json/-/circular-json-0.5.5.tgz
	https://registry.yarnpkg.com/class-utils/-/class-utils-0.3.6.tgz
	https://registry.yarnpkg.com/clean-yaml-object/-/clean-yaml-object-0.1.0.tgz
	https://registry.yarnpkg.com/cli-boxes/-/cli-boxes-1.0.0.tgz
	https://registry.yarnpkg.com/cli-boxes/-/cli-boxes-2.2.0.tgz
	https://registry.yarnpkg.com/cli/-/cli-0.4.3.tgz
	https://registry.yarnpkg.com/cli/-/cli-0.4.5.tgz
	https://registry.yarnpkg.com/cli-columns/-/cli-columns-3.1.2.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-1.0.2.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-2.1.0.tgz
	https://registry.yarnpkg.com/cli-cursor/-/cli-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/cliff/-/cliff-0.1.10.tgz
	https://registry.yarnpkg.com/cli-table3/-/cli-table3-0.5.1.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-2.1.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-3.2.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-4.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-5.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-6.0.0.tgz
	https://registry.yarnpkg.com/cliui/-/cliui-7.0.4.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-1.1.1.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-2.1.0.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-2.2.0.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-2.2.1.tgz
	https://registry.yarnpkg.com/cli-width/-/cli-width-3.0.0.tgz
	https://registry.yarnpkg.com/clone/-/clone-1.0.3.tgz
	https://registry.yarnpkg.com/clone/-/clone-1.0.4.tgz
	https://registry.yarnpkg.com/clone-response/-/clone-response-1.0.2.tgz
	https://registry.yarnpkg.com/cmake-js/-/cmake-js-5.2.0.tgz
	https://registry.yarnpkg.com/cmd-shim/-/cmd-shim-3.0.3.tgz
	https://registry.yarnpkg.com/@cnakazawa/watch/-/watch-1.0.4.tgz -> @cnakazawa-watch-1.0.4.tgz
	https://registry.yarnpkg.com/co/-/co-4.6.0.tgz
	https://registry.yarnpkg.com/code-point-at/-/code-point-at-1.1.0.tgz
	https://registry.yarnpkg.com/coffee-script/-/coffee-script-1.3.3.tgz
	https://registry.yarnpkg.com/collect-all/-/collect-all-1.0.3.tgz
	https://registry.yarnpkg.com/collection-visit/-/collection-visit-1.0.0.tgz
	https://registry.yarnpkg.com/collect-v8-coverage/-/collect-v8-coverage-1.0.1.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.1.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-1.9.3.tgz
	https://registry.yarnpkg.com/color-convert/-/color-convert-2.0.1.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.3.tgz
	https://registry.yarnpkg.com/color-name/-/color-name-1.1.4.tgz
	https://registry.yarnpkg.com/colors/-/colors-0.6.2.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.0.3.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.1.2.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.2.3.tgz
	https://registry.yarnpkg.com/colors/-/colors-1.4.0.tgz
	https://registry.yarnpkg.com/color-support/-/color-support-1.1.3.tgz
	https://registry.yarnpkg.com/columnify/-/columnify-1.5.4.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-0.0.7.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.5.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.6.tgz
	https://registry.yarnpkg.com/combined-stream/-/combined-stream-1.0.8.tgz
	https://registry.yarnpkg.com/combine-lists/-/combine-lists-1.0.1.tgz
	https://registry.yarnpkg.com/combine-source-map/-/combine-source-map-0.7.2.tgz
	https://registry.yarnpkg.com/combine-source-map/-/combine-source-map-0.8.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-0.6.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.10.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.11.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.14.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.15.1.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.16.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.20.3.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.2.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.3.0.tgz
	https://registry.yarnpkg.com/commander/-/commander-2.9.0.tgz
	https://registry.yarnpkg.com/command-line-args/-/command-line-args-4.0.6.tgz
	https://registry.yarnpkg.com/command-line-args/-/command-line-args-4.0.7.tgz
	https://registry.yarnpkg.com/command-line-commands/-/command-line-commands-2.0.1.tgz
	https://registry.yarnpkg.com/command-line-tool/-/command-line-tool-0.7.0.tgz
	https://registry.yarnpkg.com/command-line-usage/-/command-line-usage-4.0.0.tgz
	https://registry.yarnpkg.com/command-line-usage/-/command-line-usage-4.1.0.tgz
	https://registry.yarnpkg.com/commondir/-/commondir-1.0.1.tgz
	https://registry.yarnpkg.com/common-sequence/-/common-sequence-1.0.2.tgz
	https://registry.yarnpkg.com/component-bind/-/component-bind-1.0.0.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.1.2.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.2.1.tgz
	https://registry.yarnpkg.com/component-emitter/-/component-emitter-1.3.0.tgz
	https://registry.yarnpkg.com/component-inherit/-/component-inherit-0.0.3.tgz
	https://registry.yarnpkg.com/compress-commons/-/compress-commons-0.2.9.tgz
	https://registry.yarnpkg.com/compress-commons/-/compress-commons-4.0.2.tgz
	https://registry.yarnpkg.com/compressible/-/compressible-2.0.13.tgz
	https://registry.yarnpkg.com/compression/-/compression-1.7.2.tgz
	https://registry.yarnpkg.com/concat-map/-/concat-map-0.0.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.5.0.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.5.2.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.0.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.1.tgz
	https://registry.yarnpkg.com/concat-stream/-/concat-stream-1.6.2.tgz
	https://registry.yarnpkg.com/conf/-/conf-7.1.2.tgz
	https://registry.yarnpkg.com/config-chain/-/config-chain-1.1.12.tgz
	https://registry.yarnpkg.com/config-master/-/config-master-3.1.0.tgz
	https://registry.yarnpkg.com/configstore/-/configstore-3.1.2.tgz
	https://registry.yarnpkg.com/configstore/-/configstore-5.0.1.tgz
	https://registry.yarnpkg.com/connect/-/connect-2.4.6.tgz
	https://registry.yarnpkg.com/connect/-/connect-3.6.0.tgz
	https://registry.yarnpkg.com/connect/-/connect-3.6.6.tgz
	https://registry.yarnpkg.com/connect-history-api-fallback/-/connect-history-api-fallback-1.5.0.tgz
	https://registry.yarnpkg.com/console-browserify/-/console-browserify-1.1.0.tgz
	https://registry.yarnpkg.com/console-control-strings/-/console-control-strings-1.1.0.tgz
	https://registry.yarnpkg.com/constants-browserify/-/constants-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/contains-path/-/contains-path-0.1.0.tgz
	https://registry.yarnpkg.com/content-disposition/-/content-disposition-0.5.2.tgz
	https://registry.yarnpkg.com/content-type/-/content-type-1.0.4.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.1.3.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.5.1.tgz
	https://registry.yarnpkg.com/convert-source-map/-/convert-source-map-1.7.0.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.0.4.tgz
	https://registry.yarnpkg.com/cookie/-/cookie-0.3.1.tgz
	https://registry.yarnpkg.com/cookie-signature/-/cookie-signature-1.0.6.tgz
	https://registry.yarnpkg.com/copy-concurrently/-/copy-concurrently-1.0.5.tgz
	https://registry.yarnpkg.com/copy-descriptor/-/copy-descriptor-0.1.1.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-1.2.7.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.5.3.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.5.4.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.5.5.tgz
	https://registry.yarnpkg.com/core-js/-/core-js-2.6.12.tgz
	https://registry.yarnpkg.com/core-util-is/-/core-util-is-1.0.2.tgz
	https://registry.yarnpkg.com/coveralls/-/coveralls-2.13.1.tgz
	https://registry.yarnpkg.com/coveralls/-/coveralls-2.13.3.tgz
	https://registry.yarnpkg.com/crc32/-/crc32-0.2.2.tgz
	https://registry.yarnpkg.com/crc-32/-/crc-32-1.2.0.tgz
	https://registry.yarnpkg.com/crc32-stream/-/crc32-stream-0.3.4.tgz
	https://registry.yarnpkg.com/crc32-stream/-/crc32-stream-4.0.1.tgz
	https://registry.yarnpkg.com/crc/-/crc-0.2.0.tgz
	https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.0.tgz
	https://registry.yarnpkg.com/create-ecdh/-/create-ecdh-4.0.1.tgz
	https://registry.yarnpkg.com/create-error-class/-/create-error-class-3.0.2.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.1.3.tgz
	https://registry.yarnpkg.com/create-hash/-/create-hash-1.2.0.tgz
	https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.6.tgz
	https://registry.yarnpkg.com/create-hmac/-/create-hmac-1.1.7.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-4.0.2.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-5.1.0.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-6.0.5.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.2.tgz
	https://registry.yarnpkg.com/cross-spawn/-/cross-spawn-7.0.3.tgz
	https://registry.yarnpkg.com/cryptiles/-/cryptiles-2.0.5.tgz
	https://registry.yarnpkg.com/cryptiles/-/cryptiles-3.1.2.tgz
	https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.12.0.tgz
	https://registry.yarnpkg.com/crypto-browserify/-/crypto-browserify-3.3.0.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-1.0.0.tgz
	https://registry.yarnpkg.com/crypto-random-string/-/crypto-random-string-2.0.0.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.3.8.tgz
	https://registry.yarnpkg.com/cssom/-/cssom-0.4.4.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-1.4.0.tgz
	https://registry.yarnpkg.com/cssstyle/-/cssstyle-2.2.0.tgz
	https://registry.yarnpkg.com/ctype/-/ctype-0.5.3.tgz
	https://registry.yarnpkg.com/cuint/-/cuint-0.2.2.tgz
	https://registry.yarnpkg.com/currently-unhandled/-/currently-unhandled-0.4.1.tgz
	https://registry.yarnpkg.com/custom-event/-/custom-event-1.0.1.tgz
	https://registry.yarnpkg.com/cycle/-/cycle-1.0.3.tgz
	https://registry.yarnpkg.com/cyclist/-/cyclist-1.0.1.tgz
	https://registry.yarnpkg.com/dashdash/-/dashdash-1.14.1.tgz
	https://registry.yarnpkg.com/data-uri-to-buffer/-/data-uri-to-buffer-1.2.0.tgz
	https://registry.yarnpkg.com/data-urls/-/data-urls-1.1.0.tgz
	https://registry.yarnpkg.com/dateformat/-/dateformat-1.0.2-1.2.3.tgz
	https://registry.yarnpkg.com/date-format/-/date-format-1.2.0.tgz
	https://registry.yarnpkg.com/date-now/-/date-now-0.1.4.tgz
	https://registry.yarnpkg.com/d/-/d-0.1.1.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.0.tgz
	https://registry.yarnpkg.com/d/-/d-1.0.1.tgz
	https://registry.yarnpkg.com/debounce-fn/-/debounce-fn-4.0.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-0.7.4.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.2.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.3.3.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.8.tgz
	https://registry.yarnpkg.com/debug/-/debug-2.6.9.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.1.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-3.2.6.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.1.1.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.2.0.tgz
	https://registry.yarnpkg.com/debug/-/debug-4.3.1.tgz
	https://registry.yarnpkg.com/debug-log/-/debug-log-1.0.1.tgz
	https://registry.yarnpkg.com/debuglog/-/debuglog-1.0.1.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-1.2.0.tgz
	https://registry.yarnpkg.com/decamelize/-/decamelize-4.0.0.tgz
	https://registry.yarnpkg.com/decode-uri-component/-/decode-uri-component-0.2.0.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-3.3.0.tgz
	https://registry.yarnpkg.com/decompress-response/-/decompress-response-4.2.1.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-0.1.3.tgz
	https://registry.yarnpkg.com/deep-eql/-/deep-eql-3.0.1.tgz
	https://registry.yarnpkg.com/deep-equal/-/deep-equal-1.0.1.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.4.2.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.5.1.tgz
	https://registry.yarnpkg.com/deep-extend/-/deep-extend-0.6.0.tgz
	https://registry.yarnpkg.com/deep-is/-/deep-is-0.1.3.tgz
	https://registry.yarnpkg.com/deeply/-/deeply-1.0.0.tgz
	https://registry.yarnpkg.com/deepmerge/-/deepmerge-4.2.2.tgz
	https://registry.yarnpkg.com/default-require-extensions/-/default-require-extensions-1.0.0.tgz
	https://registry.yarnpkg.com/defaults/-/defaults-1.0.3.tgz
	https://registry.yarnpkg.com/defer-promise/-/defer-promise-1.0.1.tgz
	https://registry.yarnpkg.com/defer-to-connect/-/defer-to-connect-1.1.1.tgz
	https://registry.yarnpkg.com/defined/-/defined-1.0.0.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.2.tgz
	https://registry.yarnpkg.com/define-properties/-/define-properties-1.1.3.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-0.2.5.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-1.0.0.tgz
	https://registry.yarnpkg.com/define-property/-/define-property-2.0.2.tgz
	https://registry.yarnpkg.com/deflate-js/-/deflate-js-0.2.3.tgz
	https://registry.yarnpkg.com/degenerator/-/degenerator-1.0.4.tgz
	https://registry.yarnpkg.com/deglob/-/deglob-2.1.0.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-0.0.5.tgz
	https://registry.yarnpkg.com/delayed-stream/-/delayed-stream-1.0.0.tgz
	https://registry.yarnpkg.com/del/-/del-2.2.2.tgz
	https://registry.yarnpkg.com/delegates/-/delegates-1.0.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.0.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.1.tgz
	https://registry.yarnpkg.com/depd/-/depd-1.1.2.tgz
	https://registry.yarnpkg.com/deps-sort/-/deps-sort-2.0.0.tgz
	https://registry.yarnpkg.com/des.js/-/des.js-1.0.0.tgz
	https://registry.yarnpkg.com/destroy/-/destroy-1.0.4.tgz
	https://registry.yarnpkg.com/detect-indent/-/detect-indent-4.0.0.tgz
	https://registry.yarnpkg.com/detect-indent/-/detect-indent-5.0.0.tgz
	https://registry.yarnpkg.com/detective/-/detective-4.7.0.tgz
	https://registry.yarnpkg.com/detective/-/detective-4.7.1.tgz
	https://registry.yarnpkg.com/detective/-/detective-5.1.0.tgz
	https://registry.yarnpkg.com/detect-libc/-/detect-libc-1.0.3.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-2.1.0.tgz
	https://registry.yarnpkg.com/detect-newline/-/detect-newline-3.1.0.tgz
	https://registry.yarnpkg.com/@develar/schema-utils/-/schema-utils-2.6.5.tgz -> @develar-schema-utils-2.6.5.tgz
	https://registry.yarnpkg.com/dezalgo/-/dezalgo-1.0.3.tgz
	https://registry.yarnpkg.com/di/-/di-0.0.1.tgz
	https://registry.yarnpkg.com/diff/-/diff-1.4.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.2.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.3.1.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.4.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-3.5.0.tgz
	https://registry.yarnpkg.com/diff/-/diff-4.0.2.tgz
	https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.2.tgz
	https://registry.yarnpkg.com/diffie-hellman/-/diffie-hellman-5.0.3.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-24.9.0.tgz
	https://registry.yarnpkg.com/diff-sequences/-/diff-sequences-25.2.6.tgz
	https://registry.yarnpkg.com/dmd/-/dmd-3.0.6.tgz
	https://registry.yarnpkg.com/dmg-builder/-/dmg-builder-22.9.1.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-0.7.2.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-1.5.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-2.1.0.tgz
	https://registry.yarnpkg.com/doctrine/-/doctrine-3.0.0.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-1.1.7.tgz
	https://registry.yarnpkg.com/domain-browser/-/domain-browser-1.2.0.tgz
	https://registry.yarnpkg.com/domexception/-/domexception-1.0.1.tgz
	https://registry.yarnpkg.com/dom-serialize/-/dom-serialize-2.2.1.tgz
	https://registry.yarnpkg.com/dom-walk/-/dom-walk-0.1.1.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-5.0.1.tgz
	https://registry.yarnpkg.com/dotenv/-/dotenv-8.2.0.tgz
	https://registry.yarnpkg.com/dotenv-expand/-/dotenv-expand-5.1.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-4.2.0.tgz
	https://registry.yarnpkg.com/dot-prop/-/dot-prop-5.2.0.tgz
	https://registry.yarnpkg.com/double-ended-queue/-/double-ended-queue-2.1.0-0.tgz
	https://registry.yarnpkg.com/du/-/du-0.1.0.tgz
	https://registry.yarnpkg.com/duplexer2/-/duplexer2-0.0.2.tgz
	https://registry.yarnpkg.com/duplexer2/-/duplexer2-0.1.4.tgz
	https://registry.yarnpkg.com/duplexer3/-/duplexer3-0.1.4.tgz
	https://registry.yarnpkg.com/duplexer/-/duplexer-0.1.1.tgz
	https://registry.yarnpkg.com/duplexify/-/duplexify-3.7.1.tgz
	https://registry.yarnpkg.com/each-series-async/-/each-series-async-1.0.1.tgz
	https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.1.tgz
	https://registry.yarnpkg.com/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz
	https://registry.yarnpkg.com/editor/-/editor-1.0.0.tgz
	https://registry.yarnpkg.com/ee-first/-/ee-first-1.1.1.tgz
	https://registry.yarnpkg.com/ejs/-/ejs-3.1.5.tgz
	https://registry.yarnpkg.com/electron-builder/-/electron-builder-22.9.1.tgz
	https://registry.yarnpkg.com/electron-builder-squirrel-windows/-/electron-builder-squirrel-windows-22.9.1.tgz
	https://registry.yarnpkg.com/electron-devtools-installer/-/electron-devtools-installer-3.1.1.tgz
	https://registry.yarnpkg.com/electron-notarize/-/electron-notarize-1.0.0.tgz
	https://registry.yarnpkg.com/electron-publish/-/electron-publish-22.9.1.tgz
	https://registry.yarnpkg.com/electron-store/-/electron-store-6.0.1.tgz
	https://registry.yarnpkg.com/electron-window-state/-/electron-window-state-5.0.3.tgz
	https://registry.yarnpkg.com/elliptic/-/elliptic-6.4.0.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-7.0.3.tgz
	https://registry.yarnpkg.com/emoji-regex/-/emoji-regex-8.0.0.tgz
	https://registry.yarnpkg.com/emojis-list/-/emojis-list-2.1.0.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.1.tgz
	https://registry.yarnpkg.com/encodeurl/-/encodeurl-1.0.2.tgz
	https://registry.yarnpkg.com/encoding/-/encoding-0.1.12.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.1.tgz
	https://registry.yarnpkg.com/end-of-stream/-/end-of-stream-1.4.4.tgz
	https://registry.yarnpkg.com/engine.io-client/-/engine.io-client-1.8.5.tgz
	https://registry.yarnpkg.com/engine.io-client/-/engine.io-client-3.1.6.tgz
	https://registry.yarnpkg.com/engine.io/-/engine.io-1.8.5.tgz
	https://registry.yarnpkg.com/engine.io/-/engine.io-3.1.5.tgz
	https://registry.yarnpkg.com/engine.io-parser/-/engine.io-parser-1.3.2.tgz
	https://registry.yarnpkg.com/engine.io-parser/-/engine.io-parser-2.1.2.tgz
	https://registry.yarnpkg.com/enhanced-resolve/-/enhanced-resolve-0.9.1.tgz
	https://registry.yarnpkg.com/enquirer/-/enquirer-2.3.6.tgz
	https://registry.yarnpkg.com/ent/-/ent-2.2.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.0.0.tgz
	https://registry.yarnpkg.com/entities/-/entities-2.0.3.tgz
	https://registry.yarnpkg.com/envar/-/envar-2.0.0.tgz
	https://registry.yarnpkg.com/env-paths/-/env-paths-2.2.0.tgz
	https://registry.yarnpkg.com/err-code/-/err-code-1.1.2.tgz
	https://registry.yarnpkg.com/errno/-/errno-0.1.7.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.1.tgz
	https://registry.yarnpkg.com/error-ex/-/error-ex-1.3.2.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.14.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.38.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.39.tgz
	https://registry.yarnpkg.com/es5-ext/-/es5-ext-0.10.53.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.1.tgz
	https://registry.yarnpkg.com/es6-iterator/-/es6-iterator-2.0.3.tgz
	https://registry.yarnpkg.com/es6-map/-/es6-map-0.1.4.tgz
	https://registry.yarnpkg.com/es6-map/-/es6-map-0.1.5.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-3.3.1.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.0.5.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.2.4.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.2.6.tgz
	https://registry.yarnpkg.com/es6-promise/-/es6-promise-4.2.8.tgz
	https://registry.yarnpkg.com/es6-promisify/-/es6-promisify-5.0.0.tgz
	https://registry.yarnpkg.com/es6-set/-/es6-set-0.1.5.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.1.tgz
	https://registry.yarnpkg.com/es6-symbol/-/es6-symbol-3.1.3.tgz
	https://registry.yarnpkg.com/es6-weak-map/-/es6-weak-map-2.0.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.10.0.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.12.0.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.16.0.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.16.3.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.17.5.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.17.6.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.18.0-next.2.tgz
	https://registry.yarnpkg.com/es-abstract/-/es-abstract-1.7.0.tgz
	https://registry.yarnpkg.com/escalade/-/escalade-3.1.1.tgz
	https://registry.yarnpkg.com/escape-goat/-/escape-goat-2.1.1.tgz
	https://registry.yarnpkg.com/escape-html/-/escape-html-1.0.3.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.2.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-1.0.5.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-2.0.0.tgz
	https://registry.yarnpkg.com/escape-string-regexp/-/escape-string-regexp-4.0.0.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-1.14.1.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-1.14.3.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-1.7.1.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-1.8.1.tgz
	https://registry.yarnpkg.com/escodegen/-/escodegen-1.9.1.tgz
	https://registry.yarnpkg.com/escope/-/escope-3.6.0.tgz
	https://registry.yarnpkg.com/eslint-config-esnext/-/eslint-config-esnext-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.13.0.tgz
	https://registry.yarnpkg.com/eslint-config-google/-/eslint-config-google-0.14.0.tgz
	https://registry.yarnpkg.com/eslint-config-hapi/-/eslint-config-hapi-12.0.0.tgz
	https://registry.yarnpkg.com/eslint-config-matrix-org/-/eslint-config-matrix-org-0.1.2.tgz
	https://registry.yarnpkg.com/eslint-config-node/-/eslint-config-node-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-react-native/-/eslint-config-react-native-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-recommended/-/eslint-config-recommended-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-config-standard/-/eslint-config-standard-10.2.1.tgz
	https://registry.yarnpkg.com/eslint-config-standard-jsx/-/eslint-config-standard-jsx-4.0.2.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-1.10.3.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-3.17.1.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-3.19.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-5.2.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-6.8.0.tgz
	https://registry.yarnpkg.com/eslint/-/eslint-7.3.1.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.2.3.tgz
	https://registry.yarnpkg.com/eslint-import-resolver-node/-/eslint-import-resolver-node-0.3.4.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.1.1.tgz
	https://registry.yarnpkg.com/eslint-module-utils/-/eslint-module-utils-2.6.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-babel/-/eslint-plugin-babel-5.3.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-hapi/-/eslint-plugin-hapi-4.1.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.2.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-import/-/eslint-plugin-import-2.22.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-node/-/eslint-plugin-node-4.2.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-promise/-/eslint-plugin-promise-3.5.0.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-6.10.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-react/-/eslint-plugin-react-7.20.3.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-native/-/eslint-plugin-react-native-3.8.1.tgz
	https://registry.yarnpkg.com/eslint-plugin-react-native-globals/-/eslint-plugin-react-native-globals-0.1.2.tgz
	https://registry.yarnpkg.com/eslint-plugin-standard/-/eslint-plugin-standard-3.0.1.tgz
	https://registry.yarnpkg.com/eslint-rule-composer/-/eslint-rule-composer-0.3.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-4.0.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.0.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.0.tgz
	https://registry.yarnpkg.com/eslint-scope/-/eslint-scope-5.1.1.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-1.3.1.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-1.4.3.tgz
	https://registry.yarnpkg.com/eslint-utils/-/eslint-utils-2.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.0.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.1.0.tgz
	https://registry.yarnpkg.com/eslint-visitor-keys/-/eslint-visitor-keys-1.3.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-2.2.5.tgz
	https://registry.yarnpkg.com/espree/-/espree-3.1.7.tgz
	https://registry.yarnpkg.com/espree/-/espree-3.4.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-3.5.2.tgz
	https://registry.yarnpkg.com/espree/-/espree-3.5.3.tgz
	https://registry.yarnpkg.com/espree/-/espree-4.0.0.tgz
	https://registry.yarnpkg.com/espree/-/espree-6.2.1.tgz
	https://registry.yarnpkg.com/espree/-/espree-7.2.0.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-1.0.4.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-1.2.5.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-2.5.0.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-2.7.3.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-3.1.3.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.0.tgz
	https://registry.yarnpkg.com/esprima/-/esprima-4.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.0.0.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.0.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.3.1.tgz
	https://registry.yarnpkg.com/esquery/-/esquery-1.4.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.1.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.2.0.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.2.1.tgz
	https://registry.yarnpkg.com/esrecurse/-/esrecurse-4.3.0.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.1.1.tgz
	https://registry.yarnpkg.com/es-to-primitive/-/es-to-primitive-1.2.1.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-1.9.3.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.1.1.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.2.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-4.3.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.1.0.tgz
	https://registry.yarnpkg.com/estraverse/-/estraverse-5.2.0.tgz
	https://registry.yarnpkg.com/estraverse-fb/-/estraverse-fb-1.3.2.tgz
	https://registry.yarnpkg.com/estree-walker/-/estree-walker-0.2.1.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-1.1.6.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.2.tgz
	https://registry.yarnpkg.com/esutils/-/esutils-2.0.3.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.0.tgz
	https://registry.yarnpkg.com/etag/-/etag-1.8.1.tgz
	https://registry.yarnpkg.com/eventemitter2/-/eventemitter2-0.4.14.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-1.2.0.tgz
	https://registry.yarnpkg.com/eventemitter3/-/eventemitter3-3.1.0.tgz
	https://registry.yarnpkg.com/event-emitter/-/event-emitter-0.3.5.tgz
	https://registry.yarnpkg.com/events/-/events-1.1.1.tgz
	https://registry.yarnpkg.com/events/-/events-2.0.0.tgz
	https://registry.yarnpkg.com/eventsource/-/eventsource-0.1.6.tgz
	https://registry.yarnpkg.com/events-to-array/-/events-to-array-1.1.2.tgz
	https://registry.yarnpkg.com/evp_bytestokey/-/evp_bytestokey-1.0.3.tgz
	https://registry.yarnpkg.com/execa/-/execa-0.7.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-1.0.0.tgz
	https://registry.yarnpkg.com/execa/-/execa-3.4.0.tgz
	https://registry.yarnpkg.com/exec-sh/-/exec-sh-0.3.4.tgz
	https://registry.yarnpkg.com/execspawn/-/execspawn-1.0.1.tgz
	https://registry.yarnpkg.com/exif-parser/-/exif-parser-0.1.12.tgz
	https://registry.yarnpkg.com/exit/-/exit-0.1.2.tgz
	https://registry.yarnpkg.com/exit-hook/-/exit-hook-1.1.1.tgz
	https://registry.yarnpkg.com/exit-on-epipe/-/exit-on-epipe-1.0.1.tgz
	https://registry.yarnpkg.com/expand-braces/-/expand-braces-0.1.2.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-0.1.5.tgz
	https://registry.yarnpkg.com/expand-brackets/-/expand-brackets-2.1.4.tgz
	https://registry.yarnpkg.com/expand-range/-/expand-range-0.1.1.tgz
	https://registry.yarnpkg.com/expand-range/-/expand-range-1.8.2.tgz
	https://registry.yarnpkg.com/expand-template/-/expand-template-2.0.3.tgz
	https://registry.yarnpkg.com/expect/-/expect-24.9.0.tgz
	https://registry.yarnpkg.com/expect/-/expect-25.4.0.tgz
	https://registry.yarnpkg.com/express/-/express-4.16.2.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.0.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.1.tgz
	https://registry.yarnpkg.com/extend/-/extend-3.0.2.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-2.0.1.tgz
	https://registry.yarnpkg.com/extend-shallow/-/extend-shallow-3.0.2.tgz
	https://registry.yarnpkg.com/external-editor/-/external-editor-2.2.0.tgz
	https://registry.yarnpkg.com/external-editor/-/external-editor-3.1.0.tgz
	https://registry.yarnpkg.com/ext/-/ext-1.4.0.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-0.3.2.tgz
	https://registry.yarnpkg.com/extglob/-/extglob-2.0.4.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-1.5.0.tgz
	https://registry.yarnpkg.com/extract-zip/-/extract-zip-1.6.6.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.0.2.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.3.0.tgz
	https://registry.yarnpkg.com/extsprintf/-/extsprintf-1.4.0.tgz
	https://registry.yarnpkg.com/eyes/-/eyes-0.1.8.tgz
	https://registry.yarnpkg.com/fake/-/fake-0.2.2.tgz
	https://registry.yarnpkg.com/far/-/far-0.0.7.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-1.0.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-1.1.0.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-2.0.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.1.tgz
	https://registry.yarnpkg.com/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.0.0.tgz
	https://registry.yarnpkg.com/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-1.0.7.tgz
	https://registry.yarnpkg.com/fast-levenshtein/-/fast-levenshtein-2.0.6.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.10.0.tgz
	https://registry.yarnpkg.com/faye-websocket/-/faye-websocket-0.11.1.tgz
	https://registry.yarnpkg.com/fb-watchman/-/fb-watchman-2.0.1.tgz
	https://registry.yarnpkg.com/fd-slicer/-/fd-slicer-1.0.1.tgz
	https://registry.yarnpkg.com/feature-detect-es6/-/feature-detect-es6-1.3.1.tgz
	https://registry.yarnpkg.com/figgy-pudding/-/figgy-pudding-3.5.1.tgz
	https://registry.yarnpkg.com/figures/-/figures-1.7.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-2.0.0.tgz
	https://registry.yarnpkg.com/figures/-/figures-3.2.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-1.3.1.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-2.0.0.tgz
	https://registry.yarnpkg.com/file-entry-cache/-/file-entry-cache-5.0.1.tgz
	https://registry.yarnpkg.com/filelist/-/filelist-1.0.1.tgz
	https://registry.yarnpkg.com/filename-regex/-/filename-regex-2.0.1.tgz
	https://registry.yarnpkg.com/fileset/-/fileset-0.2.1.tgz
	https://registry.yarnpkg.com/file-set/-/file-set-1.1.1.tgz
	https://registry.yarnpkg.com/file-sync-cmp/-/file-sync-cmp-0.1.1.tgz
	https://registry.yarnpkg.com/file-type/-/file-type-9.0.0.tgz
	https://registry.yarnpkg.com/file-uri-to-path/-/file-uri-to-path-1.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-2.2.3.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-2.2.4.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-4.0.0.tgz
	https://registry.yarnpkg.com/fill-range/-/fill-range-7.0.1.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.0.0.tgz
	https://registry.yarnpkg.com/finalhandler/-/finalhandler-1.1.0.tgz
	https://registry.yarnpkg.com/find-cache-dir/-/find-cache-dir-0.1.1.tgz
	https://registry.yarnpkg.com/find-npm-prefix/-/find-npm-prefix-1.0.2.tgz
	https://registry.yarnpkg.com/find-replace/-/find-replace-1.0.3.tgz
	https://registry.yarnpkg.com/find-root/-/find-root-1.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-1.1.2.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-2.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-3.0.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-4.1.0.tgz
	https://registry.yarnpkg.com/find-up/-/find-up-5.0.0.tgz
	https://registry.yarnpkg.com/findup-sync/-/findup-sync-0.1.3.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-1.2.2.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-1.3.0.tgz
	https://registry.yarnpkg.com/flat-cache/-/flat-cache-2.0.1.tgz
	https://registry.yarnpkg.com/flat/-/flat-4.1.1.tgz
	https://registry.yarnpkg.com/flat/-/flat-5.0.2.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-2.0.1.tgz
	https://registry.yarnpkg.com/flatted/-/flatted-2.0.2.tgz
	https://registry.yarnpkg.com/flush-write-stream/-/flush-write-stream-1.1.1.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-0.0.7.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.0.0.tgz
	https://registry.yarnpkg.com/follow-redirects/-/follow-redirects-1.4.1.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.2.tgz
	https://registry.yarnpkg.com/for-each/-/for-each-0.3.3.tgz
	https://registry.yarnpkg.com/foreach/-/foreach-2.0.5.tgz
	https://registry.yarnpkg.com/foreground-child/-/foreground-child-1.5.6.tgz
	https://registry.yarnpkg.com/forever-agent/-/forever-agent-0.6.1.tgz
	https://registry.yarnpkg.com/for-in/-/for-in-1.0.2.tgz
	https://registry.yarnpkg.com/formatio/-/formatio-1.2.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-0.2.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.0.0.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.1.2.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.1.4.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.1.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.2.tgz
	https://registry.yarnpkg.com/form-data/-/form-data-2.3.3.tgz
	https://registry.yarnpkg.com/formidable/-/formidable-1.0.11.tgz
	https://registry.yarnpkg.com/formidable/-/formidable-1.1.1.tgz
	https://registry.yarnpkg.com/for-own/-/for-own-0.1.5.tgz
	https://registry.yarnpkg.com/forwarded/-/forwarded-0.1.2.tgz
	https://registry.yarnpkg.com/fragment-cache/-/fragment-cache-0.2.1.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.1.0.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.0.tgz
	https://registry.yarnpkg.com/fresh/-/fresh-0.5.2.tgz
	https://registry.yarnpkg.com/from2/-/from2-1.3.0.tgz
	https://registry.yarnpkg.com/from2/-/from2-2.3.0.tgz
	https://registry.yarnpkg.com/from/-/from-0.1.7.tgz
	https://registry.yarnpkg.com/fs-constants/-/fs-constants-1.0.0.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.1.3.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.12.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.13.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.3.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-1.2.4.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.1.2.tgz
	https://registry.yarnpkg.com/fsevents/-/fsevents-2.1.3.tgz
	https://registry.yarnpkg.com/fs-exists-cached/-/fs-exists-cached-1.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-1.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-5.0.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-8.1.0.tgz
	https://registry.yarnpkg.com/fs-extra/-/fs-extra-9.0.1.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.5.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-1.2.7.tgz
	https://registry.yarnpkg.com/fs-minipass/-/fs-minipass-2.0.0.tgz
	https://registry.yarnpkg.com/fs-readdir-recursive/-/fs-readdir-recursive-1.1.0.tgz
	https://registry.yarnpkg.com/fs.realpath/-/fs.realpath-1.0.0.tgz
	https://registry.yarnpkg.com/fs-then-native/-/fs-then-native-2.0.0.tgz
	https://registry.yarnpkg.com/fstream/-/fstream-1.0.11.tgz
	https://registry.yarnpkg.com/fstream/-/fstream-1.0.12.tgz
	https://registry.yarnpkg.com/fstream-ignore/-/fstream-ignore-1.0.5.tgz
	https://registry.yarnpkg.com/fstream-npm/-/fstream-npm-1.2.1.tgz
	https://registry.yarnpkg.com/fs-vacuum/-/fs-vacuum-1.2.10.tgz
	https://registry.yarnpkg.com/fs-write-stream-atomic/-/fs-write-stream-atomic-1.0.10.tgz
	https://registry.yarnpkg.com/ftp/-/ftp-0.3.10.tgz
	https://registry.yarnpkg.com/functional-red-black-tree/-/functional-red-black-tree-1.0.1.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.0.tgz
	https://registry.yarnpkg.com/function-bind/-/function-bind-1.1.1.tgz
	https://registry.yarnpkg.com/function-loop/-/function-loop-1.0.1.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-1.2.7.tgz
	https://registry.yarnpkg.com/gauge/-/gauge-2.7.4.tgz
	https://registry.yarnpkg.com/gaze/-/gaze-1.1.2.tgz
	https://registry.yarnpkg.com/generate-function/-/generate-function-2.0.0.tgz
	https://registry.yarnpkg.com/generate-object-property/-/generate-object-property-1.2.0.tgz
	https://registry.yarnpkg.com/genfun/-/genfun-5.0.0.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.1.tgz
	https://registry.yarnpkg.com/gensync/-/gensync-1.0.0-beta.2.tgz
	https://registry.yarnpkg.com/gentle-fs/-/gentle-fs-2.3.0.tgz
	https://registry.yarnpkg.com/gentle-fs/-/gentle-fs-2.3.1.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-1.0.2.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-1.0.3.tgz
	https://registry.yarnpkg.com/get-caller-file/-/get-caller-file-2.0.5.tgz
	https://registry.yarnpkg.com/get-func-name/-/get-func-name-2.0.0.tgz
	https://registry.yarnpkg.com/get-intrinsic/-/get-intrinsic-1.1.1.tgz
	https://registry.yarnpkg.com/getobject/-/getobject-0.1.0.tgz
	https://registry.yarnpkg.com/getpass/-/getpass-0.1.6.tgz
	https://registry.yarnpkg.com/getpass/-/getpass-0.1.7.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-4.0.1.tgz
	https://registry.yarnpkg.com/get-stdin/-/get-stdin-5.0.1.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-3.0.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-4.1.0.tgz
	https://registry.yarnpkg.com/get-stream/-/get-stream-5.1.0.tgz
	https://registry.yarnpkg.com/get-uri/-/get-uri-2.0.2.tgz
	https://registry.yarnpkg.com/get-value/-/get-value-2.0.6.tgz
	https://registry.yarnpkg.com/ghostface/-/ghostface-1.5.0.tgz
	https://registry.yarnpkg.com/ghreleases/-/ghreleases-3.0.2.tgz
	https://registry.yarnpkg.com/ghrepos/-/ghrepos-2.1.0.tgz
	https://registry.yarnpkg.com/ghutils/-/ghutils-3.2.6.tgz
	https://registry.yarnpkg.com/gifwrap/-/gifwrap-0.9.2.tgz
	https://registry.yarnpkg.com/git-config/-/git-config-0.0.7.tgz
	https://registry.yarnpkg.com/github-from-package/-/github-from-package-0.0.0.tgz
	https://registry.yarnpkg.com/github/-/github-1.4.0.tgz
	https://registry.yarnpkg.com/github-publish-release/-/github-publish-release-4.0.0.tgz
	https://registry.yarnpkg.com/global-dirs/-/global-dirs-0.1.1.tgz
	https://registry.yarnpkg.com/global-dirs/-/global-dirs-2.0.1.tgz
	https://registry.yarnpkg.com/global/-/global-4.3.2.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.12.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-11.7.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-12.4.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-8.18.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-9.16.0.tgz
	https://registry.yarnpkg.com/globals/-/globals-9.18.0.tgz
	https://registry.yarnpkg.com/glob-base/-/glob-base-0.3.0.tgz
	https://registry.yarnpkg.com/globby/-/globby-5.0.0.tgz
	https://registry.yarnpkg.com/glob/-/glob-3.1.21.tgz
	https://registry.yarnpkg.com/glob/-/glob-3.2.11.tgz
	https://registry.yarnpkg.com/glob/-/glob-4.3.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-5.0.15.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.1.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.2.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.3.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.5.tgz
	https://registry.yarnpkg.com/glob/-/glob-7.1.6.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-2.0.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-3.1.0.tgz
	https://registry.yarnpkg.com/glob-parent/-/glob-parent-5.1.1.tgz
	https://registry.yarnpkg.com/globule/-/globule-1.2.0.tgz
	https://registry.yarnpkg.com/glob-whatev/-/glob-whatev-0.1.8.tgz
	https://registry.yarnpkg.com/got/-/got-6.7.1.tgz
	https://registry.yarnpkg.com/got/-/got-9.6.0.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-1.2.3.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.1.11.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.3.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.4.tgz
	https://registry.yarnpkg.com/graceful-fs/-/graceful-fs-4.2.6.tgz
	https://registry.yarnpkg.com/graceful-readlink/-/graceful-readlink-1.0.1.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.10.3.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.10.5.tgz
	https://registry.yarnpkg.com/growl/-/growl-1.9.2.tgz
	https://registry.yarnpkg.com/growly/-/growly-1.3.0.tgz
	https://registry.yarnpkg.com/grunt-babel/-/grunt-babel-6.0.0.tgz
	https://registry.yarnpkg.com/grunt-clean/-/grunt-clean-0.4.0.tgz
	https://registry.yarnpkg.com/grunt-cli/-/grunt-cli-0.1.13.tgz
	https://registry.yarnpkg.com/grunt-contrib-clean/-/grunt-contrib-clean-1.1.0.tgz
	https://registry.yarnpkg.com/grunt-contrib-copy/-/grunt-contrib-copy-1.0.0.tgz
	https://registry.yarnpkg.com/grunt-contrib-uglify/-/grunt-contrib-uglify-1.0.2.tgz
	https://registry.yarnpkg.com/grunt-contrib-watch/-/grunt-contrib-watch-1.0.0.tgz
	https://registry.yarnpkg.com/grunt-eslint/-/grunt-eslint-17.3.2.tgz
	https://registry.yarnpkg.com/grunt/-/grunt-0.3.17.tgz
	https://registry.yarnpkg.com/grunt/-/grunt-0.4.5.tgz
	https://registry.yarnpkg.com/grunt-karma/-/grunt-karma-0.12.2.tgz
	https://registry.yarnpkg.com/grunt-legacy-log/-/grunt-legacy-log-0.1.3.tgz
	https://registry.yarnpkg.com/grunt-legacy-log-utils/-/grunt-legacy-log-utils-0.1.1.tgz
	https://registry.yarnpkg.com/grunt-legacy-util/-/grunt-legacy-util-0.2.0.tgz
	https://registry.yarnpkg.com/grunt-mocha-istanbul/-/grunt-mocha-istanbul-3.0.1.tgz
	https://registry.yarnpkg.com/grunt-mocha-test/-/grunt-mocha-test-0.12.7.tgz
	https://registry.yarnpkg.com/grunt-webpack/-/grunt-webpack-1.0.18.tgz
	https://registry.yarnpkg.com/gzip-js/-/gzip-js-0.3.2.tgz
	https://registry.yarnpkg.com/gzip-size/-/gzip-size-1.0.0.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-3.0.3.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.0.11.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.0.6.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.7.6.tgz
	https://registry.yarnpkg.com/handlebars/-/handlebars-4.7.7.tgz
	https://registry.yarnpkg.com/hapi-capitalize-modules/-/hapi-capitalize-modules-1.1.6.tgz
	https://registry.yarnpkg.com/hapi-for-you/-/hapi-for-you-1.0.0.tgz
	https://registry.yarnpkg.com/hapi-no-var/-/hapi-no-var-1.0.1.tgz
	https://registry.yarnpkg.com/hapi-scope-start/-/hapi-scope-start-2.1.1.tgz
	https://registry.yarnpkg.com/har-schema/-/har-schema-1.0.5.tgz
	https://registry.yarnpkg.com/har-schema/-/har-schema-2.0.0.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-1.8.0.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-2.0.6.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-4.2.1.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.0.3.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.1.3.tgz
	https://registry.yarnpkg.com/har-validator/-/har-validator-5.1.5.tgz
	https://registry.yarnpkg.com/has-ansi/-/has-ansi-2.0.0.tgz
	https://registry.yarnpkg.com/has-binary2/-/has-binary2-1.0.2.tgz
	https://registry.yarnpkg.com/has-binary/-/has-binary-0.1.7.tgz
	https://registry.yarnpkg.com/has-cors/-/has-cors-1.1.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-1.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-2.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-3.0.0.tgz
	https://registry.yarnpkg.com/has-flag/-/has-flag-4.0.0.tgz
	https://registry.yarnpkg.com/hasha/-/hasha-2.2.0.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.1.tgz
	https://registry.yarnpkg.com/has/-/has-1.0.3.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-2.0.2.tgz
	https://registry.yarnpkg.com/hash-base/-/hash-base-3.0.4.tgz
	https://registry.yarnpkg.com/hash.js/-/hash.js-1.1.3.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.0.tgz
	https://registry.yarnpkg.com/has-symbols/-/has-symbols-1.0.1.tgz
	https://registry.yarnpkg.com/has-unicode/-/has-unicode-2.0.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-0.3.1.tgz
	https://registry.yarnpkg.com/has-value/-/has-value-1.0.0.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-0.1.4.tgz
	https://registry.yarnpkg.com/has-values/-/has-values-1.0.0.tgz
	https://registry.yarnpkg.com/has-yarn/-/has-yarn-2.1.0.tgz
	https://registry.yarnpkg.com/hat/-/hat-0.0.3.tgz
	https://registry.yarnpkg.com/hawk/-/hawk-2.3.1.tgz
	https://registry.yarnpkg.com/hawk/-/hawk-3.1.3.tgz
	https://registry.yarnpkg.com/hawk/-/hawk-6.0.2.tgz
	https://registry.yarnpkg.com/he/-/he-1.1.1.tgz
	https://registry.yarnpkg.com/he/-/he-1.2.0.tgz
	https://registry.yarnpkg.com/hipchat-notifier/-/hipchat-notifier-1.1.0.tgz
	https://registry.yarnpkg.com/hmac-drbg/-/hmac-drbg-1.0.1.tgz
	https://registry.yarnpkg.com/hoek/-/hoek-2.16.3.tgz
	https://registry.yarnpkg.com/hoek/-/hoek-4.2.0.tgz
	https://registry.yarnpkg.com/hoek/-/hoek-4.2.1.tgz
	https://registry.yarnpkg.com/home-or-tmp/-/home-or-tmp-2.0.0.tgz
	https://registry.yarnpkg.com/home-path/-/home-path-1.0.5.tgz
	https://registry.yarnpkg.com/hooker/-/hooker-0.2.3.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.5.0.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.5.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-2.8.8.tgz
	https://registry.yarnpkg.com/hosted-git-info/-/hosted-git-info-3.0.7.tgz
	https://registry.yarnpkg.com/html-encoding-sniffer/-/html-encoding-sniffer-1.0.2.tgz
	https://registry.yarnpkg.com/htmlescape/-/htmlescape-1.1.1.tgz
	https://registry.yarnpkg.com/html-escaper/-/html-escaper-2.0.2.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-3.8.1.tgz
	https://registry.yarnpkg.com/http-cache-semantics/-/http-cache-semantics-4.0.3.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.3.1.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.1.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.2.tgz
	https://registry.yarnpkg.com/http-errors/-/http-errors-1.6.3.tgz
	https://registry.yarnpkg.com/httpntlm/-/httpntlm-1.6.1.tgz
	https://registry.yarnpkg.com/http-parser-js/-/http-parser-js-0.4.10.tgz
	https://registry.yarnpkg.com/http-proxy-agent/-/http-proxy-agent-2.1.0.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.16.2.tgz
	https://registry.yarnpkg.com/http-proxy/-/http-proxy-1.17.0.tgz
	https://registry.yarnpkg.com/http-proxy-middleware/-/http-proxy-middleware-0.17.4.tgz
	https://registry.yarnpkg.com/httpreq/-/httpreq-0.4.24.tgz
	https://registry.yarnpkg.com/https-browserify/-/https-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/https-browserify/-/https-browserify-1.0.0.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-0.10.1.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.1.1.tgz
	https://registry.yarnpkg.com/http-signature/-/http-signature-1.2.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-1.0.0.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-2.2.1.tgz
	https://registry.yarnpkg.com/https-proxy-agent/-/https-proxy-agent-2.2.4.tgz
	https://registry.yarnpkg.com/humanize-ms/-/humanize-ms-1.2.1.tgz
	https://registry.yarnpkg.com/human-signals/-/human-signals-1.1.1.tgz
	https://registry.yarnpkg.com/hyperquest/-/hyperquest-2.1.3.tgz
	https://registry.yarnpkg.com/@iarna/cli/-/cli-1.2.0.tgz -> @iarna-cli-1.2.0.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.2.11.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.13.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.15.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.19.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.21.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.23.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.4.24.tgz
	https://registry.yarnpkg.com/iconv-lite/-/iconv-lite-0.6.2.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.1.11.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.1.13.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.1.8.tgz
	https://registry.yarnpkg.com/ieee754/-/ieee754-1.2.1.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-0.1.5.tgz
	https://registry.yarnpkg.com/iferr/-/iferr-1.0.2.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-3.2.6.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-3.3.7.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-4.0.3.tgz
	https://registry.yarnpkg.com/ignore/-/ignore-4.0.6.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.1.tgz
	https://registry.yarnpkg.com/ignore-walk/-/ignore-walk-3.0.3.tgz
	https://registry.yarnpkg.com/image-q/-/image-q-1.1.1.tgz
	https://registry.yarnpkg.com/immediate/-/immediate-3.0.6.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.2.1.tgz
	https://registry.yarnpkg.com/import-fresh/-/import-fresh-3.3.0.tgz
	https://registry.yarnpkg.com/import-lazy/-/import-lazy-2.1.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-2.0.0.tgz
	https://registry.yarnpkg.com/import-local/-/import-local-3.0.2.tgz
	https://registry.yarnpkg.com/imurmurhash/-/imurmurhash-0.1.4.tgz
	https://registry.yarnpkg.com/indent-string/-/indent-string-2.1.0.tgz
	https://registry.yarnpkg.com/indexof/-/indexof-0.0.1.tgz
	https://registry.yarnpkg.com/infer-owner/-/infer-owner-1.0.4.tgz
	https://registry.yarnpkg.com/inflection/-/inflection-1.12.0.tgz
	https://registry.yarnpkg.com/inflection/-/inflection-1.3.8.tgz
	https://registry.yarnpkg.com/inflight/-/inflight-1.0.6.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-1.0.2.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.1.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.3.tgz
	https://registry.yarnpkg.com/inherits/-/inherits-2.0.4.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.5.tgz
	https://registry.yarnpkg.com/ini/-/ini-1.3.8.tgz
	https://registry.yarnpkg.com/iniparser/-/iniparser-1.0.5.tgz
	https://registry.yarnpkg.com/init-package-json/-/init-package-json-1.10.3.tgz
	https://registry.yarnpkg.com/inline-source-map/-/inline-source-map-0.6.2.tgz
	https://registry.yarnpkg.com/in-publish/-/in-publish-2.0.0.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-0.11.4.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-0.12.0.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-3.3.0.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-5.2.0.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-7.1.0.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-7.3.2.tgz
	https://registry.yarnpkg.com/inquirer/-/inquirer-7.3.3.tgz
	https://registry.yarnpkg.com/insert-module-globals/-/insert-module-globals-7.0.1.tgz
	https://registry.yarnpkg.com/insert-module-globals/-/insert-module-globals-7.0.6.tgz
	https://registry.yarnpkg.com/internal-slot/-/internal-slot-1.0.2.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-0.6.6.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.0.1.tgz
	https://registry.yarnpkg.com/interpret/-/interpret-1.1.0.tgz
	https://registry.yarnpkg.com/invariant/-/invariant-2.2.3.tgz
	https://registry.yarnpkg.com/invariant/-/invariant-2.2.4.tgz
	https://registry.yarnpkg.com/invert-kv/-/invert-kv-1.0.0.tgz
	https://registry.yarnpkg.com/ipaddr.js/-/ipaddr.js-1.6.0.tgz
	https://registry.yarnpkg.com/ip/-/ip-1.1.5.tgz
	https://registry.yarnpkg.com/ip-regex/-/ip-regex-2.1.0.tgz
	https://registry.yarnpkg.com/ipv6/-/ipv6-3.1.3.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-accessor-descriptor/-/is-accessor-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-0.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-1.0.0.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.1.tgz
	https://registry.yarnpkg.com/isarray/-/isarray-2.0.4.tgz
	https://registry.yarnpkg.com/is-arrayish/-/is-arrayish-0.2.1.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-3.0.2.tgz
	https://registry.yarnpkg.com/isbinaryfile/-/isbinaryfile-4.0.6.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-1.0.1.tgz
	https://registry.yarnpkg.com/is-binary-path/-/is-binary-path-2.1.0.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.5.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-1.1.6.tgz
	https://registry.yarnpkg.com/is-buffer/-/is-buffer-2.0.5.tgz
	https://registry.yarnpkg.com/is-builtin-module/-/is-builtin-module-1.0.0.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.3.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.4.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.1.5.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.0.tgz
	https://registry.yarnpkg.com/is-callable/-/is-callable-1.2.3.tgz
	https://registry.yarnpkg.com/is-cidr/-/is-cidr-3.1.0.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-1.2.1.tgz
	https://registry.yarnpkg.com/is-ci/-/is-ci-2.0.0.tgz
	https://registry.yarnpkg.com/is-core-module/-/is-core-module-2.2.0.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-0.1.4.tgz
	https://registry.yarnpkg.com/is-data-descriptor/-/is-data-descriptor-1.0.0.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.1.tgz
	https://registry.yarnpkg.com/is-date-object/-/is-date-object-1.0.2.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-0.1.6.tgz
	https://registry.yarnpkg.com/is-descriptor/-/is-descriptor-1.0.2.tgz
	https://registry.yarnpkg.com/is-dotfile/-/is-dotfile-1.0.3.tgz
	https://registry.yarnpkg.com/is-equal-shallow/-/is-equal-shallow-0.1.3.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-1.1.2.tgz
	https://registry.yarnpkg.com/isexe/-/isexe-2.0.0.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-0.1.1.tgz
	https://registry.yarnpkg.com/is-extendable/-/is-extendable-1.0.1.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-1.0.0.tgz
	https://registry.yarnpkg.com/is-extglob/-/is-extglob-2.1.1.tgz
	https://registry.yarnpkg.com/is-finite/-/is-finite-1.0.2.tgz
	https://registry.yarnpkg.com/is-finite/-/is-finite-1.1.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-1.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-2.0.0.tgz
	https://registry.yarnpkg.com/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz
	https://registry.yarnpkg.com/is-function/-/is-function-1.0.1.tgz
	https://registry.yarnpkg.com/is-generator-fn/-/is-generator-fn-2.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-2.0.1.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-3.1.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.0.tgz
	https://registry.yarnpkg.com/is-glob/-/is-glob-4.0.1.tgz
	https://registry.yarnpkg.com/is-installed-globally/-/is-installed-globally-0.1.0.tgz
	https://registry.yarnpkg.com/is-installed-globally/-/is-installed-globally-0.3.1.tgz
	https://registry.yarnpkg.com/is-iojs/-/is-iojs-1.1.0.tgz
	https://registry.yarnpkg.com/is-my-ip-valid/-/is-my-ip-valid-1.0.0.tgz
	https://registry.yarnpkg.com/is-my-json-valid/-/is-my-json-valid-2.16.0.tgz
	https://registry.yarnpkg.com/is-my-json-valid/-/is-my-json-valid-2.17.1.tgz
	https://registry.yarnpkg.com/is-my-json-valid/-/is-my-json-valid-2.17.2.tgz
	https://registry.yarnpkg.com/is-negative-zero/-/is-negative-zero-2.0.1.tgz
	https://registry.yarnpkg.com/is-node-modern/-/is-node-modern-1.0.0.tgz
	https://registry.yarnpkg.com/is-npm/-/is-npm-1.0.0.tgz
	https://registry.yarnpkg.com/is-npm/-/is-npm-4.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-0.1.1.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-2.1.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-3.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-4.0.0.tgz
	https://registry.yarnpkg.com/is-number/-/is-number-7.0.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-2.1.0.tgz
	https://registry.yarnpkg.com/isobject/-/isobject-3.0.1.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-1.0.1.tgz
	https://registry.yarnpkg.com/is-obj/-/is-obj-2.0.0.tgz
	https://registry.yarnpkg.com/is-path-cwd/-/is-path-cwd-1.0.0.tgz
	https://registry.yarnpkg.com/is-path-in-cwd/-/is-path-in-cwd-1.0.0.tgz
	https://registry.yarnpkg.com/is-path-in-cwd/-/is-path-in-cwd-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-1.0.0.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-1.0.1.tgz
	https://registry.yarnpkg.com/is-path-inside/-/is-path-inside-3.0.2.tgz
	https://registry.yarnpkg.com/is-plain-object/-/is-plain-object-2.0.4.tgz
	https://registry.yarnpkg.com/is-plain-obj/-/is-plain-obj-2.1.0.tgz
	https://registry.yarnpkg.com/is-posix-bracket/-/is-posix-bracket-0.1.1.tgz
	https://registry.yarnpkg.com/is-primitive/-/is-primitive-2.0.0.tgz
	https://registry.yarnpkg.com/is-promise/-/is-promise-2.1.0.tgz
	https://registry.yarnpkg.com/is-property/-/is-property-1.0.2.tgz
	https://registry.yarnpkg.com/is-redirect/-/is-redirect-1.0.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.4.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.0.5.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.0.tgz
	https://registry.yarnpkg.com/is-regex/-/is-regex-1.1.2.tgz
	https://registry.yarnpkg.com/is-resolvable/-/is-resolvable-1.0.0.tgz
	https://registry.yarnpkg.com/is-resolvable/-/is-resolvable-1.1.0.tgz
	https://registry.yarnpkg.com/is-retry-allowed/-/is-retry-allowed-1.2.0.tgz
	https://registry.yarnpkg.com/isstream/-/isstream-0.1.2.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-1.1.0.tgz
	https://registry.yarnpkg.com/is-stream/-/is-stream-2.0.0.tgz
	https://registry.yarnpkg.com/is-string/-/is-string-1.0.5.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.1.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.2.tgz
	https://registry.yarnpkg.com/is-symbol/-/is-symbol-1.0.3.tgz
	https://registry.yarnpkg.com/istanbul/-/istanbul-0.4.5.tgz
	https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.0.0.tgz -> @istanbuljs-load-nyc-config-1.0.0.tgz
	https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.2.tgz -> @istanbuljs-schema-0.1.2.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-1.1.2.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.5.tgz
	https://registry.yarnpkg.com/istanbul-lib-coverage/-/istanbul-lib-coverage-3.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-hook/-/istanbul-lib-hook-1.1.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-1.9.2.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-3.3.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-instrument/-/istanbul-lib-instrument-4.0.1.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-1.1.3.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-2.0.8.tgz
	https://registry.yarnpkg.com/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-1.2.3.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-3.0.6.tgz
	https://registry.yarnpkg.com/istanbul-lib-source-maps/-/istanbul-lib-source-maps-4.0.0.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-1.1.4.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-2.2.7.tgz
	https://registry.yarnpkg.com/istanbul-reports/-/istanbul-reports-3.0.2.tgz
	https://registry.yarnpkg.com/is-typedarray/-/is-typedarray-1.0.0.tgz
	https://registry.yarnpkg.com/is-utf8/-/is-utf8-0.2.1.tgz
	https://registry.yarnpkg.com/is-windows/-/is-windows-1.0.2.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-1.1.0.tgz
	https://registry.yarnpkg.com/is-wsl/-/is-wsl-2.1.1.tgz
	https://registry.yarnpkg.com/is-yarn-global/-/is-yarn-global-0.3.0.tgz
	https://registry.yarnpkg.com/jade/-/jade-0.26.3.tgz
	https://registry.yarnpkg.com/jake/-/jake-10.8.2.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-24.9.0.tgz
	https://registry.yarnpkg.com/jest-changed-files/-/jest-changed-files-25.4.0.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-24.9.0.tgz
	https://registry.yarnpkg.com/jest-cli/-/jest-cli-25.4.0.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-24.9.0.tgz
	https://registry.yarnpkg.com/jest-config/-/jest-config-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-24.9.0.tgz -> @jest-console-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/console/-/console-25.4.0.tgz -> @jest-console-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-24.9.0.tgz -> @jest-core-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/core/-/core-25.4.0.tgz -> @jest-core-25.4.0.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-24.9.0.tgz
	https://registry.yarnpkg.com/jest-diff/-/jest-diff-25.4.0.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-24.9.0.tgz
	https://registry.yarnpkg.com/jest-docblock/-/jest-docblock-25.3.0.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-24.9.0.tgz
	https://registry.yarnpkg.com/jest-each/-/jest-each-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-24.9.0.tgz -> @jest-environment-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/environment/-/environment-25.4.0.tgz -> @jest-environment-25.4.0.tgz
	https://registry.yarnpkg.com/jest-environment-jsdom/-/jest-environment-jsdom-24.9.0.tgz
	https://registry.yarnpkg.com/jest-environment-jsdom/-/jest-environment-jsdom-25.4.0.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-24.9.0.tgz
	https://registry.yarnpkg.com/jest-environment-node/-/jest-environment-node-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-24.9.0.tgz -> @jest-fake-timers-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-25.4.0.tgz -> @jest-fake-timers-25.4.0.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-24.9.0.tgz
	https://registry.yarnpkg.com/jest-get-type/-/jest-get-type-25.2.6.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-24.9.0.tgz
	https://registry.yarnpkg.com/jest-haste-map/-/jest-haste-map-25.4.0.tgz
	https://registry.yarnpkg.com/jest-jasmine2/-/jest-jasmine2-24.9.0.tgz
	https://registry.yarnpkg.com/jest-jasmine2/-/jest-jasmine2-25.4.0.tgz
	https://registry.yarnpkg.com/jest/-/jest-24.9.0.tgz
	https://registry.yarnpkg.com/jest/-/jest-25.4.0.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-24.9.0.tgz
	https://registry.yarnpkg.com/jest-leak-detector/-/jest-leak-detector-25.4.0.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-24.9.0.tgz
	https://registry.yarnpkg.com/jest-matcher-utils/-/jest-matcher-utils-25.4.0.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-24.9.0.tgz
	https://registry.yarnpkg.com/jest-message-util/-/jest-message-util-25.4.0.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-24.9.0.tgz
	https://registry.yarnpkg.com/jest-mock/-/jest-mock-25.4.0.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.1.tgz
	https://registry.yarnpkg.com/jest-pnp-resolver/-/jest-pnp-resolver-1.2.2.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-24.9.0.tgz
	https://registry.yarnpkg.com/jest-regex-util/-/jest-regex-util-25.2.6.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-24.9.0.tgz -> @jest-reporters-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/reporters/-/reporters-25.4.0.tgz -> @jest-reporters-25.4.0.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-24.9.0.tgz
	https://registry.yarnpkg.com/jest-resolve-dependencies/-/jest-resolve-dependencies-25.4.0.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-24.9.0.tgz
	https://registry.yarnpkg.com/jest-resolve/-/jest-resolve-25.4.0.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-24.9.0.tgz
	https://registry.yarnpkg.com/jest-runner/-/jest-runner-25.4.0.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-24.9.0.tgz
	https://registry.yarnpkg.com/jest-runtime/-/jest-runtime-25.4.0.tgz
	https://registry.yarnpkg.com/jest-serializer/-/jest-serializer-24.9.0.tgz
	https://registry.yarnpkg.com/jest-serializer/-/jest-serializer-25.2.6.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-24.9.0.tgz
	https://registry.yarnpkg.com/jest-snapshot/-/jest-snapshot-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-24.9.0.tgz -> @jest-source-map-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/source-map/-/source-map-25.2.6.tgz -> @jest-source-map-25.2.6.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-24.9.0.tgz -> @jest-test-result-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/test-result/-/test-result-25.4.0.tgz -> @jest-test-result-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-24.9.0.tgz -> @jest-test-sequencer-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-25.4.0.tgz -> @jest-test-sequencer-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-24.9.0.tgz -> @jest-transform-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/transform/-/transform-25.4.0.tgz -> @jest-transform-25.4.0.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-24.9.0.tgz -> @jest-types-24.9.0.tgz
	https://registry.yarnpkg.com/@jest/types/-/types-25.4.0.tgz -> @jest-types-25.4.0.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-24.9.0.tgz
	https://registry.yarnpkg.com/jest-util/-/jest-util-25.4.0.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-24.9.0.tgz
	https://registry.yarnpkg.com/jest-validate/-/jest-validate-25.4.0.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-24.9.0.tgz
	https://registry.yarnpkg.com/jest-watcher/-/jest-watcher-25.4.0.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-24.9.0.tgz
	https://registry.yarnpkg.com/jest-worker/-/jest-worker-25.4.0.tgz
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
	https://registry.yarnpkg.com/jodid25519/-/jodid25519-1.0.2.tgz
	https://registry.yarnpkg.com/jpeg-js/-/jpeg-js-0.4.2.tgz
	https://registry.yarnpkg.com/js2xmlparser/-/js2xmlparser-1.0.0.tgz
	https://registry.yarnpkg.com/js2xmlparser/-/js2xmlparser-4.0.1.tgz
	https://registry.yarnpkg.com/jsbn/-/jsbn-0.1.1.tgz
	https://registry.yarnpkg.com/jsdoc2md-stats/-/jsdoc2md-stats-2.0.1.tgz
	https://registry.yarnpkg.com/jsdoc-75lb/-/jsdoc-75lb-3.6.0.tgz
	https://registry.yarnpkg.com/jsdoc-api/-/jsdoc-api-3.0.0.tgz
	https://registry.yarnpkg.com/jsdoc/-/jsdoc-3.6.4.tgz
	https://registry.yarnpkg.com/jsdoc/-/jsdoc-3.6.6.tgz
	https://registry.yarnpkg.com/jsdoc-parse/-/jsdoc-parse-3.0.0.tgz
	https://registry.yarnpkg.com/jsdoc-to-markdown/-/jsdoc-to-markdown-3.0.0.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-11.12.0.tgz
	https://registry.yarnpkg.com/jsdom/-/jsdom-15.2.1.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-0.5.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-1.3.0.tgz
	https://registry.yarnpkg.com/jsesc/-/jsesc-2.5.2.tgz
	https://registry.yarnpkg.com/jshint/-/jshint-0.9.1.tgz
	https://registry.yarnpkg.com/json3/-/json3-3.3.2.tgz
	https://registry.yarnpkg.com/json5/-/json5-0.5.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-1.0.1.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.1.3.tgz
	https://registry.yarnpkg.com/json5/-/json5-2.2.0.tgz
	https://registry.yarnpkg.com/json-buffer/-/json-buffer-3.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-2.4.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-4.0.0.tgz
	https://registry.yarnpkg.com/jsonfile/-/jsonfile-6.0.1.tgz
	https://registry.yarnpkg.com/jsonify/-/jsonify-0.0.0.tgz
	https://registry.yarnpkg.com/jsonist/-/jsonist-2.1.2.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.1.tgz
	https://registry.yarnpkg.com/json-parse-better-errors/-/json-parse-better-errors-1.0.2.tgz
	https://registry.yarnpkg.com/jsonparse/-/jsonparse-1.3.1.tgz
	https://registry.yarnpkg.com/jsonpointer/-/jsonpointer-4.0.1.tgz
	https://registry.yarnpkg.com/json-schema/-/json-schema-0.2.3.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.3.1.tgz
	https://registry.yarnpkg.com/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz
	https://registry.yarnpkg.com/json-schema-typed/-/json-schema-typed-7.0.3.tgz
	https://registry.yarnpkg.com/json-stable-stringify/-/json-stable-stringify-0.0.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify/-/json-stable-stringify-1.0.1.tgz
	https://registry.yarnpkg.com/json-stable-stringify-without-jsonify/-/json-stable-stringify-without-jsonify-1.0.1.tgz
	https://registry.yarnpkg.com/JSONStream/-/JSONStream-1.3.2.tgz
	https://registry.yarnpkg.com/JSONStream/-/JSONStream-1.3.3.tgz
	https://registry.yarnpkg.com/JSONStream/-/JSONStream-1.3.5.tgz
	https://registry.yarnpkg.com/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-1.4.0.tgz
	https://registry.yarnpkg.com/jsprim/-/jsprim-1.4.1.tgz
	https://registry.yarnpkg.com/js-string-escape/-/js-string-escape-1.0.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-3.0.1.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-3.0.2.tgz
	https://registry.yarnpkg.com/js-tokens/-/js-tokens-4.0.0.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-1.4.1.tgz
	https://registry.yarnpkg.com/jsx-ast-utils/-/jsx-ast-utils-2.4.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-2.0.5.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.10.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.12.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.13.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.0.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.14.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.4.5.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.6.1.tgz
	https://registry.yarnpkg.com/js-yaml/-/js-yaml-3.8.2.tgz
	https://registry.yarnpkg.com/jszip/-/jszip-3.5.0.tgz
	https://registry.yarnpkg.com/karma-browserify/-/karma-browserify-5.3.0.tgz
	https://registry.yarnpkg.com/karma/-/karma-0.13.22.tgz
	https://registry.yarnpkg.com/karma/-/karma-2.0.5.tgz
	https://registry.yarnpkg.com/karma-mocha/-/karma-mocha-0.2.2.tgz
	https://registry.yarnpkg.com/karma-mocha/-/karma-mocha-1.3.0.tgz
	https://registry.yarnpkg.com/karma-mocha-reporter/-/karma-mocha-reporter-2.2.5.tgz
	https://registry.yarnpkg.com/karma-phantomjs-launcher/-/karma-phantomjs-launcher-1.0.4.tgz
	https://registry.yarnpkg.com/karma-sauce-launcher/-/karma-sauce-launcher-0.3.1.tgz
	https://registry.yarnpkg.com/karma-sourcemap-loader/-/karma-sourcemap-loader-0.3.7.tgz
	https://registry.yarnpkg.com/karma-webpack/-/karma-webpack-1.8.1.tgz
	https://registry.yarnpkg.com/kew/-/kew-0.7.0.tgz
	https://registry.yarnpkg.com/keyv/-/keyv-3.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-3.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-3.2.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-4.0.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-5.1.0.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.2.tgz
	https://registry.yarnpkg.com/kind-of/-/kind-of-6.0.3.tgz
	https://registry.yarnpkg.com/klaw/-/klaw-1.3.1.tgz
	https://registry.yarnpkg.com/klaw/-/klaw-3.0.0.tgz
	https://registry.yarnpkg.com/kleur/-/kleur-3.0.3.tgz
	https://registry.yarnpkg.com/labeled-stream-splicer/-/labeled-stream-splicer-2.0.0.tgz
	https://registry.yarnpkg.com/labeled-stream-splicer/-/labeled-stream-splicer-2.0.1.tgz
	https://registry.yarnpkg.com/latest-version/-/latest-version-3.1.0.tgz
	https://registry.yarnpkg.com/latest-version/-/latest-version-5.1.0.tgz
	https://registry.yarnpkg.com/lazy-cache/-/lazy-cache-1.0.4.tgz
	https://registry.yarnpkg.com/lazy-property/-/lazy-property-1.0.0.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-0.1.0.tgz
	https://registry.yarnpkg.com/lazystream/-/lazystream-1.0.0.tgz
	https://registry.yarnpkg.com/lazy-val/-/lazy-val-1.0.4.tgz
	https://registry.yarnpkg.com/lcid/-/lcid-1.0.0.tgz
	https://registry.yarnpkg.com/lcov-parse/-/lcov-parse-0.0.10.tgz
	https://registry.yarnpkg.com/left-pad/-/left-pad-1.3.0.tgz
	https://registry.yarnpkg.com/leven/-/leven-3.1.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.2.5.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.3.0.tgz
	https://registry.yarnpkg.com/levn/-/levn-0.4.1.tgz
	https://registry.yarnpkg.com/lexical-scope/-/lexical-scope-1.2.0.tgz
	https://registry.yarnpkg.com/libbase64/-/libbase64-0.1.0.tgz
	https://registry.yarnpkg.com/libcipm/-/libcipm-4.0.8.tgz
	https://registry.yarnpkg.com/libmime/-/libmime-3.0.0.tgz
	https://registry.yarnpkg.com/libnpmaccess/-/libnpmaccess-3.0.2.tgz
	https://registry.yarnpkg.com/libnpmconfig/-/libnpmconfig-1.2.1.tgz
	https://registry.yarnpkg.com/libnpmhook/-/libnpmhook-5.0.3.tgz
	https://registry.yarnpkg.com/libnpm/-/libnpm-3.0.1.tgz
	https://registry.yarnpkg.com/libnpmorg/-/libnpmorg-1.0.1.tgz
	https://registry.yarnpkg.com/libnpmpublish/-/libnpmpublish-1.1.3.tgz
	https://registry.yarnpkg.com/libnpmsearch/-/libnpmsearch-2.0.2.tgz
	https://registry.yarnpkg.com/libnpmteam/-/libnpmteam-1.0.2.tgz
	https://registry.yarnpkg.com/libnpx/-/libnpx-10.2.4.tgz
	https://registry.yarnpkg.com/libqp/-/libqp-1.1.0.tgz
	https://registry.yarnpkg.com/lie/-/lie-3.3.0.tgz
	https://registry.yarnpkg.com/lines-and-columns/-/lines-and-columns-1.1.6.tgz
	https://registry.yarnpkg.com/linkify-it/-/linkify-it-2.2.0.tgz
	https://registry.yarnpkg.com/listenercount/-/listenercount-1.0.1.tgz
	https://registry.yarnpkg.com/livereload-js/-/livereload-js-2.3.0.tgz
	https://registry.yarnpkg.com/load-bmfont/-/load-bmfont-1.4.1.tgz
	https://registry.yarnpkg.com/loader-utils/-/loader-utils-0.2.17.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-1.1.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-2.0.0.tgz
	https://registry.yarnpkg.com/load-json-file/-/load-json-file-4.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-2.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-3.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-5.0.0.tgz
	https://registry.yarnpkg.com/locate-path/-/locate-path-6.0.0.tgz
	https://registry.yarnpkg.com/lockfile/-/lockfile-1.0.4.tgz
	https://registry.yarnpkg.com/lock-verify/-/lock-verify-2.2.0.tgz
	https://registry.yarnpkg.com/lodash._arraycopy/-/lodash._arraycopy-3.0.0.tgz
	https://registry.yarnpkg.com/lodash._arrayeach/-/lodash._arrayeach-3.0.0.tgz
	https://registry.yarnpkg.com/lodash._arraymap/-/lodash._arraymap-3.0.0.tgz
	https://registry.yarnpkg.com/lodash._baseassign/-/lodash._baseassign-3.2.0.tgz
	https://registry.yarnpkg.com/lodash._baseclone/-/lodash._baseclone-3.3.0.tgz
	https://registry.yarnpkg.com/lodash._basecopy/-/lodash._basecopy-3.0.1.tgz
	https://registry.yarnpkg.com/lodash._basecreate/-/lodash._basecreate-3.0.3.tgz
	https://registry.yarnpkg.com/lodash._basedifference/-/lodash._basedifference-3.0.3.tgz
	https://registry.yarnpkg.com/lodash._baseflatten/-/lodash._baseflatten-3.1.4.tgz
	https://registry.yarnpkg.com/lodash._basefor/-/lodash._basefor-3.0.3.tgz
	https://registry.yarnpkg.com/lodash._baseindexof/-/lodash._baseindexof-3.1.0.tgz
	https://registry.yarnpkg.com/lodash._baseuniq/-/lodash._baseuniq-4.6.0.tgz
	https://registry.yarnpkg.com/lodash._bindcallback/-/lodash._bindcallback-3.0.1.tgz
	https://registry.yarnpkg.com/lodash._cacheindexof/-/lodash._cacheindexof-3.0.2.tgz
	https://registry.yarnpkg.com/lodash.clonedeep/-/lodash.clonedeep-3.0.2.tgz
	https://registry.yarnpkg.com/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.cond/-/lodash.cond-4.5.2.tgz
	https://registry.yarnpkg.com/lodash._createassigner/-/lodash._createassigner-3.1.1.tgz
	https://registry.yarnpkg.com/lodash._createcache/-/lodash._createcache-3.1.2.tgz
	https://registry.yarnpkg.com/lodash.create/-/lodash.create-3.1.1.tgz
	https://registry.yarnpkg.com/lodash._createset/-/lodash._createset-4.0.3.tgz
	https://registry.yarnpkg.com/lodash.debounce/-/lodash.debounce-4.0.8.tgz
	https://registry.yarnpkg.com/lodash.defaults/-/lodash.defaults-4.2.0.tgz
	https://registry.yarnpkg.com/lodash.difference/-/lodash.difference-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.flatten/-/lodash.flatten-4.4.0.tgz
	https://registry.yarnpkg.com/lodash._getnative/-/lodash._getnative-3.9.1.tgz
	https://registry.yarnpkg.com/lodash.isarguments/-/lodash.isarguments-3.1.0.tgz
	https://registry.yarnpkg.com/lodash.isarray/-/lodash.isarray-3.0.4.tgz
	https://registry.yarnpkg.com/lodash._isiterateecall/-/lodash._isiterateecall-3.0.9.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-3.2.0.tgz
	https://registry.yarnpkg.com/lodash.isplainobject/-/lodash.isplainobject-4.0.6.tgz
	https://registry.yarnpkg.com/lodash.istypedarray/-/lodash.istypedarray-3.0.6.tgz
	https://registry.yarnpkg.com/lodash.keysin/-/lodash.keysin-3.0.8.tgz
	https://registry.yarnpkg.com/lodash.keys/-/lodash.keys-3.1.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-0.9.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-2.4.2.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-3.10.1.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-3.2.0.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-3.9.3.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.10.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.15.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.19.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.20.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.4.tgz
	https://registry.yarnpkg.com/lodash/-/lodash-4.17.5.tgz
	https://registry.yarnpkg.com/lodash.memoize/-/lodash.memoize-3.0.4.tgz
	https://registry.yarnpkg.com/lodash.merge/-/lodash.merge-3.3.2.tgz
	https://registry.yarnpkg.com/lodash.omit/-/lodash.omit-3.1.0.tgz
	https://registry.yarnpkg.com/lodash.omit/-/lodash.omit-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.padend/-/lodash.padend-4.6.1.tgz
	https://registry.yarnpkg.com/lodash.pad/-/lodash.pad-4.5.1.tgz
	https://registry.yarnpkg.com/lodash.padstart/-/lodash.padstart-4.6.1.tgz
	https://registry.yarnpkg.com/lodash._pickbyarray/-/lodash._pickbyarray-3.0.2.tgz
	https://registry.yarnpkg.com/lodash._pickbycallback/-/lodash._pickbycallback-3.0.0.tgz
	https://registry.yarnpkg.com/lodash.pick/-/lodash.pick-4.4.0.tgz
	https://registry.yarnpkg.com/lodash.restparam/-/lodash.restparam-3.6.1.tgz
	https://registry.yarnpkg.com/lodash._root/-/lodash._root-3.0.1.tgz
	https://registry.yarnpkg.com/lodash.sortby/-/lodash.sortby-4.7.0.tgz
	https://registry.yarnpkg.com/lodash.toplainobject/-/lodash.toplainobject-3.0.0.tgz
	https://registry.yarnpkg.com/lodash.union/-/lodash.union-4.6.0.tgz
	https://registry.yarnpkg.com/lodash.uniq/-/lodash.uniq-4.5.0.tgz
	https://registry.yarnpkg.com/lodash.without/-/lodash.without-4.4.0.tgz
	https://registry.yarnpkg.com/log4js/-/log4js-0.6.38.tgz
	https://registry.yarnpkg.com/log4js/-/log4js-2.11.0.tgz
	https://registry.yarnpkg.com/log-driver/-/log-driver-1.2.5.tgz
	https://registry.yarnpkg.com/loggly/-/loggly-0.3.11.tgz
	https://registry.yarnpkg.com/loggly/-/loggly-1.1.1.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-2.2.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-3.0.0.tgz
	https://registry.yarnpkg.com/log-symbols/-/log-symbols-4.0.0.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-1.6.0.tgz
	https://registry.yarnpkg.com/lolex/-/lolex-5.1.2.tgz
	https://registry.yarnpkg.com/longest/-/longest-1.0.1.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.3.1.tgz
	https://registry.yarnpkg.com/loose-envify/-/loose-envify-1.4.0.tgz
	https://registry.yarnpkg.com/loud-rejection/-/loud-rejection-1.6.0.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-1.0.1.tgz
	https://registry.yarnpkg.com/lowercase-keys/-/lowercase-keys-2.0.0.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-1.0.6.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-2.2.4.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-2.7.3.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.3.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-4.1.5.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-5.1.1.tgz
	https://registry.yarnpkg.com/lru-cache/-/lru-cache-6.0.0.tgz
	https://registry.yarnpkg.com/mailcomposer/-/mailcomposer-4.0.1.tgz
	https://registry.yarnpkg.com/mailgun-js/-/mailgun-js-0.18.1.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-1.3.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-2.1.0.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.0.2.tgz
	https://registry.yarnpkg.com/make-dir/-/make-dir-3.1.0.tgz
	https://registry.yarnpkg.com/makeerror/-/makeerror-1.0.11.tgz
	https://registry.yarnpkg.com/make-fetch-happen/-/make-fetch-happen-5.0.2.tgz
	https://registry.yarnpkg.com/map-cache/-/map-cache-0.2.2.tgz
	https://registry.yarnpkg.com/map-limit/-/map-limit-0.0.1.tgz
	https://registry.yarnpkg.com/map-obj/-/map-obj-1.0.1.tgz
	https://registry.yarnpkg.com/map-stream/-/map-stream-0.1.0.tgz
	https://registry.yarnpkg.com/map-visit/-/map-visit-1.0.0.tgz
	https://registry.yarnpkg.com/markdown-it-anchor/-/markdown-it-anchor-5.2.7.tgz
	https://registry.yarnpkg.com/markdown-it-anchor/-/markdown-it-anchor-5.3.0.tgz
	https://registry.yarnpkg.com/markdown-it/-/markdown-it-10.0.0.tgz
	https://registry.yarnpkg.com/marked/-/marked-0.3.6.tgz
	https://registry.yarnpkg.com/marked/-/marked-0.8.2.tgz
	https://registry.yarnpkg.com/math-random/-/math-random-1.0.4.tgz
	https://registry.yarnpkg.com/maxmin/-/maxmin-1.1.0.tgz
	https://registry.yarnpkg.com/md5-hex/-/md5-hex-1.3.0.tgz
	https://registry.yarnpkg.com/md5.js/-/md5.js-1.3.4.tgz
	https://registry.yarnpkg.com/md5-o-matic/-/md5-o-matic-0.1.1.tgz
	https://registry.yarnpkg.com/mdurl/-/mdurl-1.0.1.tgz
	https://registry.yarnpkg.com/meant/-/meant-1.0.3.tgz
	https://registry.yarnpkg.com/media-typer/-/media-typer-0.3.0.tgz
	https://registry.yarnpkg.com/mem/-/mem-1.1.0.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.2.0.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.3.0.tgz
	https://registry.yarnpkg.com/memory-fs/-/memory-fs-0.4.1.tgz
	https://registry.yarnpkg.com/memory-stream/-/memory-stream-0.0.3.tgz
	https://registry.yarnpkg.com/meow/-/meow-3.7.0.tgz
	https://registry.yarnpkg.com/merge-descriptors/-/merge-descriptors-1.0.1.tgz
	https://registry.yarnpkg.com/merge-source-map/-/merge-source-map-1.1.0.tgz
	https://registry.yarnpkg.com/merge-stream/-/merge-stream-2.0.0.tgz
	https://registry.yarnpkg.com/methods/-/methods-1.1.2.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-2.3.11.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-3.1.10.tgz
	https://registry.yarnpkg.com/micromatch/-/micromatch-4.0.2.tgz
	https://registry.yarnpkg.com/miller-rabin/-/miller-rabin-4.0.1.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.12.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.26.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.27.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.30.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.33.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.42.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.43.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.44.0.tgz
	https://registry.yarnpkg.com/mime-db/-/mime-db-1.45.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.2.6.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.3.4.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.4.1.tgz
	https://registry.yarnpkg.com/mime/-/mime-1.6.0.tgz
	https://registry.yarnpkg.com/mime/-/mime-2.5.0.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.0.14.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.14.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.15.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.17.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.18.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.25.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.26.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.27.tgz
	https://registry.yarnpkg.com/mime-types/-/mime-types-2.1.28.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-1.2.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-2.1.0.tgz
	https://registry.yarnpkg.com/mimic-fn/-/mimic-fn-3.1.0.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-1.0.1.tgz
	https://registry.yarnpkg.com/mimic-response/-/mimic-response-2.1.0.tgz
	https://registry.yarnpkg.com/min-document/-/min-document-2.19.0.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.0.tgz
	https://registry.yarnpkg.com/minimalistic-assert/-/minimalistic-assert-1.0.1.tgz
	https://registry.yarnpkg.com/minimalistic-crypto-utils/-/minimalistic-crypto-utils-1.0.1.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-0.0.5.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-0.2.14.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-0.3.0.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-2.0.10.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.3.tgz
	https://registry.yarnpkg.com/minimatch/-/minimatch-3.0.4.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-0.0.10.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-0.0.8.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.0.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.3.tgz
	https://registry.yarnpkg.com/minimist/-/minimist-1.2.5.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.2.1.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.2.4.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-2.9.0.tgz
	https://registry.yarnpkg.com/minipass/-/minipass-3.1.1.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-1.1.0.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-1.3.3.tgz
	https://registry.yarnpkg.com/minizlib/-/minizlib-2.1.2.tgz
	https://registry.yarnpkg.com/mississippi/-/mississippi-3.0.0.tgz
	https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.1.tgz
	https://registry.yarnpkg.com/mixin-deep/-/mixin-deep-1.3.2.tgz
	https://registry.yarnpkg.com/mkdirp2/-/mkdirp2-1.0.3.tgz
	https://registry.yarnpkg.com/mkdirp-classic/-/mkdirp-classic-0.5.3.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.3.0.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.0.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.1.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-0.5.5.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.3.tgz
	https://registry.yarnpkg.com/mkdirp/-/mkdirp-1.0.4.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-2.5.3.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-3.5.3.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-4.0.1.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-5.1.1.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-5.2.0.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-7.2.0.tgz
	https://registry.yarnpkg.com/mocha/-/mocha-8.2.1.tgz
	https://registry.yarnpkg.com/mocha-qunit-ui/-/mocha-qunit-ui-0.1.3.tgz
	https://registry.yarnpkg.com/modify-babel-preset/-/modify-babel-preset-2.0.2.tgz
	https://registry.yarnpkg.com/module-deps/-/module-deps-4.1.1.tgz
	https://registry.yarnpkg.com/module-deps/-/module-deps-6.0.2.tgz
	https://registry.yarnpkg.com/move-concurrently/-/move-concurrently-1.0.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-0.7.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-0.7.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.0.0.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.1.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.2.tgz
	https://registry.yarnpkg.com/ms/-/ms-2.1.3.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.5.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.7.tgz
	https://registry.yarnpkg.com/mute-stream/-/mute-stream-0.0.8.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.10.0.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.14.1.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.14.2.tgz
	https://registry.yarnpkg.com/nan/-/nan-2.9.2.tgz
	https://registry.yarnpkg.com/nanoid/-/nanoid-3.1.12.tgz
	https://registry.yarnpkg.com/nanomatch/-/nanomatch-1.2.13.tgz
	https://registry.yarnpkg.com/napi-build-utils/-/napi-build-utils-1.0.2.tgz
	https://registry.yarnpkg.com/native-promise-only/-/native-promise-only-0.8.1.tgz
	https://registry.yarnpkg.com/natural-compare/-/natural-compare-1.4.0.tgz
	https://registry.yarnpkg.com/needle/-/needle-2.2.1.tgz
	https://registry.yarnpkg.com/needle/-/needle-2.5.0.tgz
	https://registry.yarnpkg.com/negotiator/-/negotiator-0.6.1.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.1.tgz
	https://registry.yarnpkg.com/neo-async/-/neo-async-2.6.2.tgz
	https://registry.yarnpkg.com/neon-cli/-/neon-cli-0.3.3.tgz
	https://registry.yarnpkg.com/netmask/-/netmask-1.0.6.tgz
	https://registry.yarnpkg.com/next-tick/-/next-tick-1.0.0.tgz
	https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.4.tgz
	https://registry.yarnpkg.com/nice-try/-/nice-try-1.0.5.tgz
	https://registry.yarnpkg.com/no-arrowception/-/no-arrowception-1.0.0.tgz
	https://registry.yarnpkg.com/node-abi/-/node-abi-2.19.3.tgz
	https://registry.yarnpkg.com/node-cpplint/-/node-cpplint-0.4.0.tgz
	https://registry.yarnpkg.com/node-environment-flags/-/node-environment-flags-1.0.6.tgz
	https://registry.yarnpkg.com/node-fetch-npm/-/node-fetch-npm-2.0.2.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-5.1.0.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-5.1.1.tgz
	https://registry.yarnpkg.com/node-gyp/-/node-gyp-6.1.0.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.3.3.tgz
	https://registry.yarnpkg.com/node-int64/-/node-int64-0.4.0.tgz
	https://registry.yarnpkg.com/node-libs-browser/-/node-libs-browser-0.7.0.tgz
	https://registry.yarnpkg.com/nodemailer-direct-transport/-/nodemailer-direct-transport-3.3.2.tgz
	https://registry.yarnpkg.com/nodemailer-fetch/-/nodemailer-fetch-1.6.0.tgz
	https://registry.yarnpkg.com/nodemailer/-/nodemailer-2.7.2.tgz
	https://registry.yarnpkg.com/nodemailer-shared/-/nodemailer-shared-1.1.0.tgz
	https://registry.yarnpkg.com/nodemailer-smtp-pool/-/nodemailer-smtp-pool-2.8.2.tgz
	https://registry.yarnpkg.com/nodemailer-smtp-transport/-/nodemailer-smtp-transport-2.7.2.tgz
	https://registry.yarnpkg.com/nodemailer-wellknown/-/nodemailer-wellknown-0.1.10.tgz
	https://registry.yarnpkg.com/node-modules-regexp/-/node-modules-regexp-1.0.0.tgz
	https://registry.yarnpkg.com/node-ninja/-/node-ninja-1.0.2.tgz
	https://registry.yarnpkg.com/node-notifier/-/node-notifier-5.4.3.tgz
	https://registry.yarnpkg.com/node-notifier/-/node-notifier-6.0.0.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.10.3.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.15.0.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.6.39.tgz
	https://registry.yarnpkg.com/node-pre-gyp/-/node-pre-gyp-0.9.1.tgz
	https://registry.yarnpkg.com/nodeunit/-/nodeunit-0.7.4.tgz
	https://registry.yarnpkg.com/node-uuid/-/node-uuid-1.4.8.tgz
	https://registry.yarnpkg.com/noop-logger/-/noop-logger-0.1.1.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-1.0.10.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-3.0.6.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-4.0.1.tgz
	https://registry.yarnpkg.com/nopt/-/nopt-4.0.3.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.4.0.tgz
	https://registry.yarnpkg.com/normalize-package-data/-/normalize-package-data-2.5.0.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-2.1.1.tgz
	https://registry.yarnpkg.com/normalize-path/-/normalize-path-3.0.0.tgz
	https://registry.yarnpkg.com/normalize-url/-/normalize-url-4.5.0.tgz
	https://registry.yarnpkg.com/npm-audit-report/-/npm-audit-report-1.3.3.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.0.3.tgz
	https://registry.yarnpkg.com/npm-bundled/-/npm-bundled-1.1.1.tgz
	https://registry.yarnpkg.com/npm-cache-filename/-/npm-cache-filename-1.0.2.tgz
	https://registry.yarnpkg.com/npm-install-checks/-/npm-install-checks-3.0.2.tgz
	https://registry.yarnpkg.com/npm-lifecycle/-/npm-lifecycle-3.1.4.tgz
	https://registry.yarnpkg.com/npm-lifecycle/-/npm-lifecycle-3.1.5.tgz
	https://registry.yarnpkg.com/npm-logical-tree/-/npm-logical-tree-1.2.1.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-1.2.1.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-2.0.4.tgz
	https://registry.yarnpkg.com/npmlog/-/npmlog-4.1.2.tgz
	https://registry.yarnpkg.com/npm-normalize-package-bin/-/npm-normalize-package-bin-1.0.1.tgz
	https://registry.yarnpkg.com/npm/-/npm-6.14.11.tgz
	https://registry.yarnpkg.com/npm-package-arg/-/npm-package-arg-6.1.1.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.1.10.tgz
	https://registry.yarnpkg.com/npm-packlist/-/npm-packlist-1.4.8.tgz
	https://registry.yarnpkg.com/npm-path/-/npm-path-2.0.4.tgz
	https://registry.yarnpkg.com/npm-pick-manifest/-/npm-pick-manifest-3.0.2.tgz
	https://registry.yarnpkg.com/npm-profile/-/npm-profile-4.0.2.tgz
	https://registry.yarnpkg.com/npm-profile/-/npm-profile-4.0.4.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-4.0.2.tgz
	https://registry.yarnpkg.com/npm-registry-fetch/-/npm-registry-fetch-4.0.7.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-2.0.2.tgz
	https://registry.yarnpkg.com/npm-run-path/-/npm-run-path-4.0.1.tgz
	https://registry.yarnpkg.com/npm-user-validate/-/npm-user-validate-1.0.1.tgz
	https://registry.yarnpkg.com/npm-which/-/npm-which-3.0.1.tgz
	https://registry.yarnpkg.com/number-is-nan/-/number-is-nan-1.0.1.tgz
	https://registry.yarnpkg.com/nw-gyp/-/nw-gyp-3.6.5.tgz
	https://registry.yarnpkg.com/nwsapi/-/nwsapi-2.2.0.tgz
	https://registry.yarnpkg.com/nyc/-/nyc-11.4.1.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.6.0.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.8.2.tgz
	https://registry.yarnpkg.com/oauth-sign/-/oauth-sign-0.9.0.tgz
	https://registry.yarnpkg.com/obake/-/obake-0.1.2.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.0.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.0.tgz
	https://registry.yarnpkg.com/object-assign/-/object-assign-4.1.1.tgz
	https://registry.yarnpkg.com/object.assign/-/object.assign-4.1.2.tgz
	https://registry.yarnpkg.com/object-component/-/object-component-0.0.3.tgz
	https://registry.yarnpkg.com/object-copy/-/object-copy-0.1.0.tgz
	https://registry.yarnpkg.com/object.entries/-/object.entries-1.1.2.tgz
	https://registry.yarnpkg.com/object.fromentries/-/object.fromentries-2.0.2.tgz
	https://registry.yarnpkg.com/object-get/-/object-get-2.1.0.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.0.3.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.0.tgz
	https://registry.yarnpkg.com/object.getownpropertydescriptors/-/object.getownpropertydescriptors-2.1.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.2.1.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.3.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.6.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.7.0.tgz
	https://registry.yarnpkg.com/object-inspect/-/object-inspect-1.9.0.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.0.11.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.0.12.tgz
	https://registry.yarnpkg.com/object-keys/-/object-keys-1.1.1.tgz
	https://registry.yarnpkg.com/object.omit/-/object.omit-2.0.1.tgz
	https://registry.yarnpkg.com/object.pick/-/object.pick-1.3.0.tgz
	https://registry.yarnpkg.com/object-to-spawn-args/-/object-to-spawn-args-1.1.1.tgz
	https://registry.yarnpkg.com/object.values/-/object.values-1.1.1.tgz
	https://registry.yarnpkg.com/object-visit/-/object-visit-1.0.1.tgz
	https://registry.yarnpkg.com/omggif/-/omggif-1.0.10.tgz
	https://registry.yarnpkg.com/once/-/once-1.3.3.tgz
	https://registry.yarnpkg.com/once/-/once-1.4.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-1.1.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-2.0.1.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.0.tgz
	https://registry.yarnpkg.com/onetime/-/onetime-5.1.2.tgz
	https://registry.yarnpkg.com/on-finished/-/on-finished-2.3.0.tgz
	https://registry.yarnpkg.com/on-headers/-/on-headers-1.0.1.tgz
	https://registry.yarnpkg.com/oop/-/oop-0.0.3.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.4.3.tgz
	https://registry.yarnpkg.com/opener/-/opener-1.5.2.tgz
	https://registry.yarnpkg.com/open/-/open-0.0.5.tgz
	https://registry.yarnpkg.com/optimist/-/optimist-0.3.7.tgz
	https://registry.yarnpkg.com/optimist/-/optimist-0.6.1.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.5.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.6.0.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.8.2.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.8.3.tgz
	https://registry.yarnpkg.com/optionator/-/optionator-0.9.1.tgz
	https://registry.yarnpkg.com/options/-/options-0.0.6.tgz
	https://registry.yarnpkg.com/original/-/original-1.0.0.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.1.2.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.2.1.tgz
	https://registry.yarnpkg.com/os-browserify/-/os-browserify-0.3.0.tgz
	https://registry.yarnpkg.com/osenv/-/osenv-0.1.5.tgz
	https://registry.yarnpkg.com/os-homedir/-/os-homedir-1.0.2.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-1.4.0.tgz
	https://registry.yarnpkg.com/os-locale/-/os-locale-2.1.0.tgz
	https://registry.yarnpkg.com/os-shim/-/os-shim-0.1.3.tgz
	https://registry.yarnpkg.com/os-tmpdir/-/os-tmpdir-1.0.2.tgz
	https://registry.yarnpkg.com/outpipe/-/outpipe-1.1.1.tgz
	https://registry.yarnpkg.com/output-file-sync/-/output-file-sync-1.1.2.tgz
	https://registry.yarnpkg.com/own-or-env/-/own-or-env-1.0.1.tgz
	https://registry.yarnpkg.com/own-or/-/own-or-1.0.0.tgz
	https://registry.yarnpkg.com/package-json/-/package-json-4.0.1.tgz
	https://registry.yarnpkg.com/package-json/-/package-json-6.5.0.tgz
	https://registry.yarnpkg.com/package/-/package-1.0.1.tgz
	https://registry.yarnpkg.com/pacote/-/pacote-9.5.12.tgz
	https://registry.yarnpkg.com/pac-proxy-agent/-/pac-proxy-agent-2.0.2.tgz
	https://registry.yarnpkg.com/pac-resolver/-/pac-resolver-3.0.0.tgz
	https://registry.yarnpkg.com/pako/-/pako-0.2.9.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.11.tgz
	https://registry.yarnpkg.com/pako/-/pako-1.0.6.tgz
	https://registry.yarnpkg.com/parallel-transform/-/parallel-transform-1.2.0.tgz
	https://registry.yarnpkg.com/parent-module/-/parent-module-1.0.1.tgz
	https://registry.yarnpkg.com/parents/-/parents-1.0.1.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-4.0.0.tgz
	https://registry.yarnpkg.com/parse5/-/parse5-5.1.0.tgz
	https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.0.tgz
	https://registry.yarnpkg.com/parse-asn1/-/parse-asn1-5.1.1.tgz
	https://registry.yarnpkg.com/parse-bmfont-ascii/-/parse-bmfont-ascii-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-binary/-/parse-bmfont-binary-1.0.6.tgz
	https://registry.yarnpkg.com/parse-bmfont-xml/-/parse-bmfont-xml-1.1.4.tgz
	https://registry.yarnpkg.com/parse-glob/-/parse-glob-3.0.4.tgz
	https://registry.yarnpkg.com/parse-headers/-/parse-headers-2.0.3.tgz
	https://registry.yarnpkg.com/parsejson/-/parsejson-0.0.3.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-2.2.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-4.0.0.tgz
	https://registry.yarnpkg.com/parse-json/-/parse-json-5.0.0.tgz
	https://registry.yarnpkg.com/parseqs/-/parseqs-0.0.5.tgz
	https://registry.yarnpkg.com/parseuri/-/parseuri-0.0.5.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.1.tgz
	https://registry.yarnpkg.com/parseurl/-/parseurl-1.3.2.tgz
	https://registry.yarnpkg.com/pascalcase/-/pascalcase-0.1.1.tgz
	https://registry.yarnpkg.com/path-array/-/path-array-1.0.1.tgz
	https://registry.yarnpkg.com/path-browserify/-/path-browserify-0.0.0.tgz
	https://registry.yarnpkg.com/path-dirname/-/path-dirname-1.0.2.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-2.1.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-3.0.0.tgz
	https://registry.yarnpkg.com/path-exists/-/path-exists-4.0.0.tgz
	https://registry.yarnpkg.com/path-is-absolute/-/path-is-absolute-1.0.1.tgz
	https://registry.yarnpkg.com/path-is-inside/-/path-is-inside-1.0.2.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-2.0.1.tgz
	https://registry.yarnpkg.com/path-key/-/path-key-3.1.1.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.5.tgz
	https://registry.yarnpkg.com/path-parse/-/path-parse-1.0.6.tgz
	https://registry.yarnpkg.com/path-platform/-/path-platform-0.11.15.tgz
	https://registry.yarnpkg.com/path-proxy/-/path-proxy-1.0.0.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-0.1.7.tgz
	https://registry.yarnpkg.com/path-to-regexp/-/path-to-regexp-1.7.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-1.1.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-2.0.0.tgz
	https://registry.yarnpkg.com/path-type/-/path-type-3.0.0.tgz
	https://registry.yarnpkg.com/pathval/-/pathval-1.1.1.tgz
	https://registry.yarnpkg.com/pause/-/pause-0.0.1.tgz
	https://registry.yarnpkg.com/pause-stream/-/pause-stream-0.0.11.tgz
	https://registry.yarnpkg.com/pbkdf2-compat/-/pbkdf2-compat-2.0.1.tgz
	https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.0.14.tgz
	https://registry.yarnpkg.com/pbkdf2/-/pbkdf2-3.0.16.tgz
	https://registry.yarnpkg.com/p-cancelable/-/p-cancelable-1.1.0.tgz
	https://registry.yarnpkg.com/p-each-series/-/p-each-series-1.0.0.tgz
	https://registry.yarnpkg.com/p-each-series/-/p-each-series-2.1.0.tgz
	https://registry.yarnpkg.com/pend/-/pend-1.2.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-0.2.0.tgz
	https://registry.yarnpkg.com/performance-now/-/performance-now-2.1.0.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-1.0.0.tgz
	https://registry.yarnpkg.com/p-finally/-/p-finally-2.0.1.tgz
	https://registry.yarnpkg.com/phantomjs-prebuilt/-/phantomjs-prebuilt-2.1.14.tgz
	https://registry.yarnpkg.com/phantomjs-prebuilt/-/phantomjs-prebuilt-2.1.16.tgz
	https://registry.yarnpkg.com/phin/-/phin-2.9.3.tgz
	https://registry.yarnpkg.com/picomatch/-/picomatch-2.2.2.tgz
	https://registry.yarnpkg.com/pify/-/pify-2.3.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-3.0.0.tgz
	https://registry.yarnpkg.com/pify/-/pify-4.0.1.tgz
	https://registry.yarnpkg.com/pinkie/-/pinkie-2.0.4.tgz
	https://registry.yarnpkg.com/pinkie-promise/-/pinkie-promise-2.0.1.tgz
	https://registry.yarnpkg.com/pirates/-/pirates-4.0.1.tgz
	https://registry.yarnpkg.com/pixelmatch/-/pixelmatch-4.0.2.tgz
	https://registry.yarnpkg.com/pkg-config/-/pkg-config-1.1.1.tgz
	https://registry.yarnpkg.com/pkg-conf/-/pkg-conf-2.1.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-1.0.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-2.0.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-3.0.0.tgz
	https://registry.yarnpkg.com/pkg-dir/-/pkg-dir-4.2.0.tgz
	https://registry.yarnpkg.com/pkgfiles/-/pkgfiles-2.3.2.tgz
	https://registry.yarnpkg.com/pkginfo/-/pkginfo-0.2.3.tgz
	https://registry.yarnpkg.com/pkginfo/-/pkginfo-0.3.1.tgz
	https://registry.yarnpkg.com/pkginfo/-/pkginfo-0.4.1.tgz
	https://registry.yarnpkg.com/pkgresolve/-/pkgresolve-1.1.4.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-1.0.0.tgz
	https://registry.yarnpkg.com/pkg-up/-/pkg-up-3.1.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.2.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-1.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.2.1.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-2.3.0.tgz
	https://registry.yarnpkg.com/p-limit/-/p-limit-3.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-2.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-3.0.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-4.1.0.tgz
	https://registry.yarnpkg.com/p-locate/-/p-locate-5.0.0.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-1.2.1.tgz
	https://registry.yarnpkg.com/pluralize/-/pluralize-7.0.0.tgz
	https://registry.yarnpkg.com/pngjs/-/pngjs-3.4.0.tgz
	https://registry.yarnpkg.com/png-to-ico/-/png-to-ico-2.1.1.tgz
	https://registry.yarnpkg.com/pn/-/pn-1.1.0.tgz
	https://registry.yarnpkg.com/posix-character-classes/-/posix-character-classes-0.1.1.tgz
	https://registry.yarnpkg.com/prebuild-install/-/prebuild-install-5.3.3.tgz
	https://registry.yarnpkg.com/prebuild/-/prebuild-10.0.1.tgz
	https://registry.yarnpkg.com/pre-commit/-/pre-commit-1.2.2.tgz
	https://registry.yarnpkg.com/p-reduce/-/p-reduce-1.0.0.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.1.2.tgz
	https://registry.yarnpkg.com/prelude-ls/-/prelude-ls-1.2.1.tgz
	https://registry.yarnpkg.com/prepend-http/-/prepend-http-1.0.4.tgz
	https://registry.yarnpkg.com/prepend-http/-/prepend-http-2.0.0.tgz
	https://registry.yarnpkg.com/preserve/-/preserve-0.2.0.tgz
	https://registry.yarnpkg.com/pretty-bytes/-/pretty-bytes-1.0.4.tgz
	https://registry.yarnpkg.com/pretty-bytes/-/pretty-bytes-4.0.2.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-24.9.0.tgz
	https://registry.yarnpkg.com/pretty-format/-/pretty-format-25.4.0.tgz
	https://registry.yarnpkg.com/printj/-/printj-1.1.2.tgz
	https://registry.yarnpkg.com/private/-/private-0.1.8.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-1.0.7.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.0.tgz
	https://registry.yarnpkg.com/process-nextick-args/-/process-nextick-args-2.0.1.tgz
	https://registry.yarnpkg.com/process/-/process-0.11.10.tgz
	https://registry.yarnpkg.com/process/-/process-0.5.2.tgz
	https://registry.yarnpkg.com/progress/-/progress-1.1.8.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.0.tgz
	https://registry.yarnpkg.com/progress/-/progress-2.0.3.tgz
	https://registry.yarnpkg.com/promise-inflight/-/promise-inflight-1.0.1.tgz
	https://registry.yarnpkg.com/promise-retry/-/promise-retry-1.1.1.tgz
	https://registry.yarnpkg.com/promisify-call/-/promisify-call-2.0.4.tgz
	https://registry.yarnpkg.com/prompt/-/prompt-0.1.12.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.3.2.tgz
	https://registry.yarnpkg.com/prompts/-/prompts-2.4.0.tgz
	https://registry.yarnpkg.com/promzard/-/promzard-0.3.0.tgz
	https://registry.yarnpkg.com/prop-types/-/prop-types-15.7.2.tgz
	https://registry.yarnpkg.com/protoduck/-/protoduck-5.0.1.tgz
	https://registry.yarnpkg.com/proto-list/-/proto-list-1.2.4.tgz
	https://registry.yarnpkg.com/proxy-addr/-/proxy-addr-2.0.3.tgz
	https://registry.yarnpkg.com/proxy-agent/-/proxy-agent-3.0.1.tgz
	https://registry.yarnpkg.com/proxy-from-env/-/proxy-from-env-1.0.0.tgz
	https://registry.yarnpkg.com/prr/-/prr-1.0.1.tgz
	https://registry.yarnpkg.com/pseudomap/-/pseudomap-1.0.2.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.6.0.tgz
	https://registry.yarnpkg.com/psl/-/psl-1.8.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-1.0.0.tgz
	https://registry.yarnpkg.com/p-try/-/p-try-2.2.0.tgz
	https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.0.tgz
	https://registry.yarnpkg.com/public-encrypt/-/public-encrypt-4.0.2.tgz
	https://registry.yarnpkg.com/pumpify/-/pumpify-1.5.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-2.0.1.tgz
	https://registry.yarnpkg.com/pump/-/pump-3.0.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.3.2.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-1.4.1.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.0.tgz
	https://registry.yarnpkg.com/punycode/-/punycode-2.1.1.tgz
	https://registry.yarnpkg.com/pupa/-/pupa-2.0.1.tgz
	https://registry.yarnpkg.com/qjobs/-/qjobs-1.2.0.tgz
	https://registry.yarnpkg.com/q/-/q-1.4.1.tgz
	https://registry.yarnpkg.com/q/-/q-1.5.1.tgz
	https://registry.yarnpkg.com/qrcode-terminal/-/qrcode-terminal-0.12.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-0.5.1.tgz
	https://registry.yarnpkg.com/qs/-/qs-2.4.2.tgz
	https://registry.yarnpkg.com/qs/-/qs-5.1.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-5.2.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.2.3.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.3.2.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.4.0.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.5.1.tgz
	https://registry.yarnpkg.com/qs/-/qs-6.5.2.tgz
	https://registry.yarnpkg.com/querystring-es3/-/querystring-es3-0.2.1.tgz
	https://registry.yarnpkg.com/querystringify/-/querystringify-0.0.4.tgz
	https://registry.yarnpkg.com/querystringify/-/querystringify-1.0.0.tgz
	https://registry.yarnpkg.com/querystring/-/querystring-0.2.0.tgz
	https://registry.yarnpkg.com/query-string/-/query-string-6.10.1.tgz
	https://registry.yarnpkg.com/quickly-copy-file/-/quickly-copy-file-1.0.0.tgz
	https://registry.yarnpkg.com/qw/-/qw-1.0.1.tgz
	https://registry.yarnpkg.com/randomatic/-/randomatic-1.1.7.tgz
	https://registry.yarnpkg.com/randomatic/-/randomatic-3.1.1.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.0.5.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.0.6.tgz
	https://registry.yarnpkg.com/randombytes/-/randombytes-2.1.0.tgz
	https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.3.tgz
	https://registry.yarnpkg.com/randomfill/-/randomfill-1.0.4.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-0.0.4.tgz
	https://registry.yarnpkg.com/range-parser/-/range-parser-1.2.0.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.1.7.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.3.2.tgz
	https://registry.yarnpkg.com/raw-body/-/raw-body-2.3.3.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.5.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.6.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.7.tgz
	https://registry.yarnpkg.com/rc/-/rc-1.2.8.tgz
	https://registry.yarnpkg.com/react-is/-/react-is-16.13.1.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-1.0.34.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-1.1.14.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.0.6.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.1.5.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.2.6.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.3.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.4.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.5.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.6.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-2.3.7.tgz
	https://registry.yarnpkg.com/readable-stream/-/readable-stream-3.6.0.tgz
	https://registry.yarnpkg.com/read-cmd-shim/-/read-cmd-shim-1.0.5.tgz
	https://registry.yarnpkg.com/read-config-file/-/read-config-file-6.0.0.tgz
	https://registry.yarnpkg.com/readdir-glob/-/readdir-glob-1.1.1.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-2.1.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-2.2.1.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.2.0.tgz
	https://registry.yarnpkg.com/readdirp/-/readdirp-3.5.0.tgz
	https://registry.yarnpkg.com/readdir-scoped-modules/-/readdir-scoped-modules-1.1.0.tgz
	https://registry.yarnpkg.com/read-installed/-/read-installed-4.0.3.tgz
	https://registry.yarnpkg.com/readline2/-/readline2-1.0.1.tgz
	https://registry.yarnpkg.com/read-only-stream/-/read-only-stream-2.0.0.tgz
	https://registry.yarnpkg.com/read-package-json/-/read-package-json-2.1.1.tgz
	https://registry.yarnpkg.com/read-package-tree/-/read-package-tree-5.3.1.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-1.1.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-3.0.0.tgz
	https://registry.yarnpkg.com/read-pkg/-/read-pkg-5.2.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-1.0.1.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-2.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-4.0.0.tgz
	https://registry.yarnpkg.com/read-pkg-up/-/read-pkg-up-7.0.1.tgz
	https://registry.yarnpkg.com/read/-/read-1.0.7.tgz
	https://registry.yarnpkg.com/realpath-native/-/realpath-native-1.1.0.tgz
	https://registry.yarnpkg.com/realpath-native/-/realpath-native-2.0.0.tgz
	https://registry.yarnpkg.com/rechoir/-/rechoir-0.6.2.tgz
	https://registry.yarnpkg.com/redent/-/redent-1.0.0.tgz
	https://registry.yarnpkg.com/redis-commands/-/redis-commands-1.3.5.tgz
	https://registry.yarnpkg.com/redis-parser/-/redis-parser-2.6.0.tgz
	https://registry.yarnpkg.com/redis/-/redis-2.8.0.tgz
	https://registry.yarnpkg.com/reduce-extract/-/reduce-extract-1.0.0.tgz
	https://registry.yarnpkg.com/reduce-flatten/-/reduce-flatten-1.0.1.tgz
	https://registry.yarnpkg.com/reduce-unique/-/reduce-unique-1.0.0.tgz
	https://registry.yarnpkg.com/reduce-without/-/reduce-without-1.0.1.tgz
	https://registry.yarnpkg.com/re-emitter/-/re-emitter-1.1.3.tgz
	https://registry.yarnpkg.com/regenerate/-/regenerate-1.3.3.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.10.5.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.11.1.tgz
	https://registry.yarnpkg.com/regenerator-runtime/-/regenerator-runtime-0.13.7.tgz
	https://registry.yarnpkg.com/regenerator-transform/-/regenerator-transform-0.10.1.tgz
	https://registry.yarnpkg.com/regex-cache/-/regex-cache-0.4.4.tgz
	https://registry.yarnpkg.com/regex-not/-/regex-not-1.0.2.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-1.1.0.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-2.0.1.tgz
	https://registry.yarnpkg.com/regexpp/-/regexpp-3.1.0.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.2.0.tgz
	https://registry.yarnpkg.com/regexp.prototype.flags/-/regexp.prototype.flags-1.3.0.tgz
	https://registry.yarnpkg.com/regexpu-core/-/regexpu-core-2.0.0.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-3.4.0.tgz
	https://registry.yarnpkg.com/registry-auth-token/-/registry-auth-token-4.0.0.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-3.1.0.tgz
	https://registry.yarnpkg.com/registry-url/-/registry-url-5.1.0.tgz
	https://registry.yarnpkg.com/regjsgen/-/regjsgen-0.2.0.tgz
	https://registry.yarnpkg.com/regjsparser/-/regjsparser-0.1.5.tgz
	https://registry.yarnpkg.com/remove-trailing-separator/-/remove-trailing-separator-1.1.0.tgz
	https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.2.tgz
	https://registry.yarnpkg.com/repeat-element/-/repeat-element-1.1.3.tgz
	https://registry.yarnpkg.com/repeating/-/repeating-2.0.1.tgz
	https://registry.yarnpkg.com/repeat-string/-/repeat-string-0.2.2.tgz
	https://registry.yarnpkg.com/repeat-string/-/repeat-string-1.6.1.tgz
	https://registry.yarnpkg.com/req-then/-/req-then-0.6.2.tgz
	https://registry.yarnpkg.com/request-progress/-/request-progress-2.0.1.tgz
	https://registry.yarnpkg.com/request-promise-core/-/request-promise-core-1.1.3.tgz
	https://registry.yarnpkg.com/request-promise-core/-/request-promise-core-1.1.4.tgz
	https://registry.yarnpkg.com/request-promise-native/-/request-promise-native-1.0.8.tgz
	https://registry.yarnpkg.com/request-promise-native/-/request-promise-native-1.0.9.tgz
	https://registry.yarnpkg.com/request/-/request-2.55.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.75.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.76.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.79.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.81.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.83.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.85.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.87.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.88.0.tgz
	https://registry.yarnpkg.com/request/-/request-2.88.2.tgz
	https://registry.yarnpkg.com/request/-/request-2.9.203.tgz
	https://registry.yarnpkg.com/requestretry/-/requestretry-1.13.0.tgz
	https://registry.yarnpkg.com/require-directory/-/require-directory-2.1.1.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-1.0.1.tgz
	https://registry.yarnpkg.com/require-main-filename/-/require-main-filename-2.0.0.tgz
	https://registry.yarnpkg.com/require-relative/-/require-relative-0.8.7.tgz
	https://registry.yarnpkg.com/requires-port/-/requires-port-1.0.0.tgz
	https://registry.yarnpkg.com/require-uncached/-/require-uncached-1.0.3.tgz
	https://registry.yarnpkg.com/requizzle/-/requizzle-0.2.1.tgz
	https://registry.yarnpkg.com/requizzle/-/requizzle-0.2.3.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-2.0.0.tgz
	https://registry.yarnpkg.com/resolve-cwd/-/resolve-cwd-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-1.0.1.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-2.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-3.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-4.0.0.tgz
	https://registry.yarnpkg.com/resolve-from/-/resolve-from-5.0.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-0.3.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.11.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.13.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.16.1.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.17.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.1.7.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.20.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.4.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.5.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.6.0.tgz
	https://registry.yarnpkg.com/resolve/-/resolve-1.7.1.tgz
	https://registry.yarnpkg.com/resolve-url/-/resolve-url-0.2.1.tgz
	https://registry.yarnpkg.com/responselike/-/responselike-1.0.2.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-1.0.1.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-2.0.0.tgz
	https://registry.yarnpkg.com/restore-cursor/-/restore-cursor-3.1.0.tgz
	https://registry.yarnpkg.com/resumer/-/resumer-0.0.0.tgz
	https://registry.yarnpkg.com/ret/-/ret-0.1.15.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.10.1.tgz
	https://registry.yarnpkg.com/retry/-/retry-0.12.0.tgz
	https://registry.yarnpkg.com/right-align/-/right-align-0.1.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.2.8.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.4.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.2.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.6.3.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-2.7.1.tgz
	https://registry.yarnpkg.com/rimraf/-/rimraf-3.0.2.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-0.2.0.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.1.tgz
	https://registry.yarnpkg.com/ripemd160/-/ripemd160-2.0.2.tgz
	https://registry.yarnpkg.com/rollup-plugin-babel/-/rollup-plugin-babel-2.7.1.tgz
	https://registry.yarnpkg.com/rollup-plugin-node-resolve/-/rollup-plugin-node-resolve-2.1.1.tgz
	https://registry.yarnpkg.com/rollup-pluginutils/-/rollup-pluginutils-1.5.2.tgz
	https://registry.yarnpkg.com/rollup/-/rollup-0.41.6.tgz
	https://registry.yarnpkg.com/rsvp/-/rsvp-3.6.2.tgz
	https://registry.yarnpkg.com/rsvp/-/rsvp-4.8.5.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-0.1.0.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-2.3.0.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-2.4.0.tgz
	https://registry.yarnpkg.com/run-async/-/run-async-2.4.1.tgz
	https://registry.yarnpkg.com/run-parallel/-/run-parallel-1.1.6.tgz
	https://registry.yarnpkg.com/run-queue/-/run-queue-1.0.3.tgz
	https://registry.yarnpkg.com/run-waterfall/-/run-waterfall-1.1.7.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-5.5.11.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.5.5.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.6.0.tgz
	https://registry.yarnpkg.com/rxjs/-/rxjs-6.6.3.tgz
	https://registry.yarnpkg.com/rx-lite-aggregates/-/rx-lite-aggregates-4.0.8.tgz
	https://registry.yarnpkg.com/rx-lite/-/rx-lite-3.1.2.tgz
	https://registry.yarnpkg.com/rx-lite/-/rx-lite-4.0.8.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.1.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.1.2.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.0.tgz
	https://registry.yarnpkg.com/safe-buffer/-/safe-buffer-5.2.1.tgz
	https://registry.yarnpkg.com/safer-buffer/-/safer-buffer-2.1.2.tgz
	https://registry.yarnpkg.com/safe-regex/-/safe-regex-1.1.0.tgz
	https://registry.yarnpkg.com/samsam/-/samsam-1.3.0.tgz
	https://registry.yarnpkg.com/sander/-/sander-0.5.1.tgz
	https://registry.yarnpkg.com/sane/-/sane-4.1.0.tgz
	https://registry.yarnpkg.com/sanitize-filename/-/sanitize-filename-1.6.3.tgz
	https://registry.yarnpkg.com/sauce-connect-launcher/-/sauce-connect-launcher-0.13.0.tgz
	https://registry.yarnpkg.com/saucelabs/-/saucelabs-1.4.0.tgz
	https://registry.yarnpkg.com/saxes/-/saxes-3.1.11.tgz
	https://registry.yarnpkg.com/sax/-/sax-1.2.4.tgz
	https://registry.yarnpkg.com/semver-diff/-/semver-diff-2.1.0.tgz
	https://registry.yarnpkg.com/semver-diff/-/semver-diff-3.1.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-1.0.14.tgz
	https://registry.yarnpkg.com/semver/-/semver-4.3.6.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.0.3.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.5.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-5.7.1.tgz
	https://registry.yarnpkg.com/semver/-/semver-6.3.0.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.3.2.tgz
	https://registry.yarnpkg.com/semver/-/semver-7.3.4.tgz
	https://registry.yarnpkg.com/send/-/send-0.0.4.tgz
	https://registry.yarnpkg.com/send/-/send-0.15.1.tgz
	https://registry.yarnpkg.com/send/-/send-0.16.1.tgz
	https://registry.yarnpkg.com/serialize-javascript/-/serialize-javascript-5.0.1.tgz
	https://registry.yarnpkg.com/serve-index/-/serve-index-1.9.1.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.12.1.tgz
	https://registry.yarnpkg.com/serve-static/-/serve-static-1.13.1.tgz
	https://registry.yarnpkg.com/set-blocking/-/set-blocking-2.0.0.tgz
	https://registry.yarnpkg.com/setimmediate/-/setimmediate-1.0.5.tgz
	https://registry.yarnpkg.com/set-immediate-shim/-/set-immediate-shim-1.0.1.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.0.3.tgz
	https://registry.yarnpkg.com/setprototypeof/-/setprototypeof-1.1.0.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-0.4.3.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-2.0.0.tgz
	https://registry.yarnpkg.com/set-value/-/set-value-2.0.1.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.2.6.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.10.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.11.tgz
	https://registry.yarnpkg.com/sha.js/-/sha.js-2.4.9.tgz
	https://registry.yarnpkg.com/sha/-/sha-3.0.0.tgz
	https://registry.yarnpkg.com/shasum/-/shasum-1.0.2.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-1.2.0.tgz
	https://registry.yarnpkg.com/shebang-command/-/shebang-command-2.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-1.0.0.tgz
	https://registry.yarnpkg.com/shebang-regex/-/shebang-regex-3.0.0.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.5.3.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.7.7.tgz
	https://registry.yarnpkg.com/shelljs/-/shelljs-0.7.8.tgz
	https://registry.yarnpkg.com/shell-quote/-/shell-quote-1.6.1.tgz
	https://registry.yarnpkg.com/shellwords/-/shellwords-0.1.1.tgz
	https://registry.yarnpkg.com/side-channel/-/side-channel-1.0.2.tgz
	https://registry.yarnpkg.com/sigmund/-/sigmund-1.0.1.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.2.tgz
	https://registry.yarnpkg.com/signal-exit/-/signal-exit-3.0.3.tgz
	https://registry.yarnpkg.com/simple-concat/-/simple-concat-1.0.1.tgz
	https://registry.yarnpkg.com/simple-get/-/simple-get-3.1.0.tgz
	https://registry.yarnpkg.com/simple-mime/-/simple-mime-0.1.0.tgz
	https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz -> @sindresorhus-is-0.14.0.tgz
	https://registry.yarnpkg.com/@sinonjs/commons/-/commons-1.7.2.tgz -> @sinonjs-commons-1.7.2.tgz
	https://registry.yarnpkg.com/sinon/-/sinon-2.4.1.tgz
	https://registry.yarnpkg.com/sisteransi/-/sisteransi-1.0.5.tgz
	https://registry.yarnpkg.com/slack-node/-/slack-node-0.2.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-1.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-2.0.0.tgz
	https://registry.yarnpkg.com/slash/-/slash-3.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-0.0.4.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-1.0.0.tgz
	https://registry.yarnpkg.com/slice-ansi/-/slice-ansi-2.1.0.tgz
	https://registry.yarnpkg.com/slide/-/slide-1.1.6.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-1.1.15.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.0.1.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.0.2.tgz
	https://registry.yarnpkg.com/smart-buffer/-/smart-buffer-4.1.0.tgz
	https://registry.yarnpkg.com/smtp-connection/-/smtp-connection-2.12.0.tgz
	https://registry.yarnpkg.com/snapdragon-node/-/snapdragon-node-2.1.1.tgz
	https://registry.yarnpkg.com/snapdragon/-/snapdragon-0.8.2.tgz
	https://registry.yarnpkg.com/snapdragon-util/-/snapdragon-util-3.0.1.tgz
	https://registry.yarnpkg.com/sntp/-/sntp-1.0.9.tgz
	https://registry.yarnpkg.com/sntp/-/sntp-2.1.0.tgz
	https://registry.yarnpkg.com/socket.io-adapter/-/socket.io-adapter-0.5.0.tgz
	https://registry.yarnpkg.com/socket.io-adapter/-/socket.io-adapter-1.1.1.tgz
	https://registry.yarnpkg.com/socket.io-client/-/socket.io-client-1.7.4.tgz
	https://registry.yarnpkg.com/socket.io-client/-/socket.io-client-2.0.4.tgz
	https://registry.yarnpkg.com/socket.io-parser/-/socket.io-parser-2.3.1.tgz
	https://registry.yarnpkg.com/socket.io-parser/-/socket.io-parser-3.1.3.tgz
	https://registry.yarnpkg.com/socket.io/-/socket.io-1.7.4.tgz
	https://registry.yarnpkg.com/socket.io/-/socket.io-2.0.4.tgz
	https://registry.yarnpkg.com/sockjs-client/-/sockjs-client-1.1.4.tgz
	https://registry.yarnpkg.com/sockjs/-/sockjs-0.3.19.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-3.0.1.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-4.0.1.tgz
	https://registry.yarnpkg.com/socks-proxy-agent/-/socks-proxy-agent-4.0.2.tgz
	https://registry.yarnpkg.com/socks/-/socks-1.1.10.tgz
	https://registry.yarnpkg.com/socks/-/socks-1.1.9.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.2.1.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.3.2.tgz
	https://registry.yarnpkg.com/socks/-/socks-2.3.3.tgz
	https://registry.yarnpkg.com/socksv5/-/socksv5-0.0.6.tgz
	https://registry.yarnpkg.com/sorcery/-/sorcery-0.10.0.tgz
	https://registry.yarnpkg.com/sort-array/-/sort-array-1.1.2.tgz
	https://registry.yarnpkg.com/sorted-object/-/sorted-object-2.0.1.tgz
	https://registry.yarnpkg.com/sorted-union-stream/-/sorted-union-stream-2.1.3.tgz
	https://registry.yarnpkg.com/source-list-map/-/source-list-map-0.1.8.tgz
	https://registry.yarnpkg.com/sourcemap-codec/-/sourcemap-codec-1.4.1.tgz
	https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.2.tgz
	https://registry.yarnpkg.com/source-map-resolve/-/source-map-resolve-0.5.3.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.1.32.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.1.43.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.2.0.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.4.4.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.6.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.5.7.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.6.1.tgz
	https://registry.yarnpkg.com/source-map/-/source-map-0.7.3.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.2.10.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.3.3.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.4.18.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.17.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.18.tgz
	https://registry.yarnpkg.com/source-map-support/-/source-map-support-0.5.19.tgz
	https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.0.tgz
	https://registry.yarnpkg.com/source-map-url/-/source-map-url-0.4.1.tgz
	https://registry.yarnpkg.com/spawn-sync/-/spawn-sync-1.0.15.tgz
	https://registry.yarnpkg.com/spawn-wrap/-/spawn-wrap-1.4.2.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.0.0.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.1.0.tgz
	https://registry.yarnpkg.com/spdx-correct/-/spdx-correct-3.1.1.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.1.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.2.0.tgz
	https://registry.yarnpkg.com/spdx-exceptions/-/spdx-exceptions-2.3.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.0.tgz
	https://registry.yarnpkg.com/spdx-expression-parse/-/spdx-expression-parse-3.0.1.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.0.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.5.tgz
	https://registry.yarnpkg.com/spdx-license-ids/-/spdx-license-ids-3.0.7.tgz
	https://registry.yarnpkg.com/splitargs/-/splitargs-0.0.7.tgz
	https://registry.yarnpkg.com/split-on-first/-/split-on-first-1.1.0.tgz
	https://registry.yarnpkg.com/split/-/split-0.3.3.tgz
	https://registry.yarnpkg.com/split/-/split-1.0.0.tgz
	https://registry.yarnpkg.com/split-string/-/split-string-3.1.0.tgz
	https://registry.yarnpkg.com/sprintf-js/-/sprintf-js-1.0.3.tgz
	https://registry.yarnpkg.com/sprintf/-/sprintf-0.1.5.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.11.0.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.13.1.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.14.1.tgz
	https://registry.yarnpkg.com/sshpk/-/sshpk-1.16.1.tgz
	https://registry.yarnpkg.com/ssri/-/ssri-6.0.1.tgz
	https://registry.yarnpkg.com/stack-trace/-/stack-trace-0.0.10.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-1.0.1.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-1.0.2.tgz
	https://registry.yarnpkg.com/stack-utils/-/stack-utils-1.0.4.tgz
	https://registry.yarnpkg.com/standard-engine/-/standard-engine-7.0.0.tgz
	https://registry.yarnpkg.com/standard/-/standard-10.0.3.tgz
	https://registry.yarnpkg.com/static-extend/-/static-extend-0.1.2.tgz
	https://registry.yarnpkg.com/stat-mode/-/stat-mode-1.0.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.3.1.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.4.0.tgz
	https://registry.yarnpkg.com/statuses/-/statuses-1.5.0.tgz
	https://registry.yarnpkg.com/stealthy-require/-/stealthy-require-1.1.1.tgz
	https://registry.yarnpkg.com/stream-browserify/-/stream-browserify-2.0.1.tgz
	https://registry.yarnpkg.com/stream-cache/-/stream-cache-0.0.2.tgz
	https://registry.yarnpkg.com/stream-combiner2/-/stream-combiner2-1.1.1.tgz
	https://registry.yarnpkg.com/stream-combiner/-/stream-combiner-0.0.4.tgz
	https://registry.yarnpkg.com/stream-connect/-/stream-connect-1.0.2.tgz
	https://registry.yarnpkg.com/stream-consume/-/stream-consume-0.1.0.tgz
	https://registry.yarnpkg.com/stream-each/-/stream-each-1.2.3.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-2.7.2.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-2.8.0.tgz
	https://registry.yarnpkg.com/stream-http/-/stream-http-2.8.1.tgz
	https://registry.yarnpkg.com/stream-iterate/-/stream-iterate-1.2.0.tgz
	https://registry.yarnpkg.com/stream-read-all/-/stream-read-all-0.1.0.tgz
	https://registry.yarnpkg.com/streamroller/-/streamroller-0.7.0.tgz
	https://registry.yarnpkg.com/stream-shift/-/stream-shift-1.0.1.tgz
	https://registry.yarnpkg.com/stream-splicer/-/stream-splicer-2.0.0.tgz
	https://registry.yarnpkg.com/stream-via/-/stream-via-1.0.4.tgz
	https://registry.yarnpkg.com/strict-uri-encode/-/strict-uri-encode-2.0.0.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-0.10.31.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.0.3.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.1.1.tgz
	https://registry.yarnpkg.com/string_decoder/-/string_decoder-1.3.0.tgz
	https://registry.yarnpkg.com/stringify-package/-/stringify-package-1.0.1.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-2.0.0.tgz
	https://registry.yarnpkg.com/string-length/-/string-length-3.1.0.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-2.0.0.tgz
	https://registry.yarnpkg.com/string.prototype.matchall/-/string.prototype.matchall-4.0.2.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.1.tgz
	https://registry.yarnpkg.com/string.prototype.trimend/-/string.prototype.trimend-1.0.3.tgz
	https://registry.yarnpkg.com/string.prototype.trimleft/-/string.prototype.trimleft-2.1.0.tgz
	https://registry.yarnpkg.com/string.prototype.trimleft/-/string.prototype.trimleft-2.1.2.tgz
	https://registry.yarnpkg.com/string.prototype.trimright/-/string.prototype.trimright-2.1.0.tgz
	https://registry.yarnpkg.com/string.prototype.trimright/-/string.prototype.trimright-2.1.2.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.1.tgz
	https://registry.yarnpkg.com/string.prototype.trimstart/-/string.prototype.trimstart-1.0.3.tgz
	https://registry.yarnpkg.com/string.prototype.trim/-/string.prototype.trim-1.1.2.tgz
	https://registry.yarnpkg.com/stringstream/-/stringstream-0.0.5.tgz
	https://registry.yarnpkg.com/stringstream/-/stringstream-0.0.6.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-1.0.2.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-2.0.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-2.1.1.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-3.1.0.tgz
	https://registry.yarnpkg.com/string-width/-/string-width-4.2.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-3.0.1.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-4.0.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-5.2.0.tgz
	https://registry.yarnpkg.com/strip-ansi/-/strip-ansi-6.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-2.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-3.0.0.tgz
	https://registry.yarnpkg.com/strip-bom/-/strip-bom-4.0.0.tgz
	https://registry.yarnpkg.com/strip-eof/-/strip-eof-1.0.0.tgz
	https://registry.yarnpkg.com/strip-final-newline/-/strip-final-newline-2.0.0.tgz
	https://registry.yarnpkg.com/strip-indent/-/strip-indent-1.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-1.0.4.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-2.0.1.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.0.tgz
	https://registry.yarnpkg.com/strip-json-comments/-/strip-json-comments-3.1.1.tgz
	https://registry.yarnpkg.com/subarg/-/subarg-1.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-1.2.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-2.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-3.1.2.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-3.2.3.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-4.4.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-4.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.3.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.4.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-5.5.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-6.0.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-6.1.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.1.0.tgz
	https://registry.yarnpkg.com/supports-color/-/supports-color-7.2.0.tgz
	https://registry.yarnpkg.com/supports-hyperlinks/-/supports-hyperlinks-2.1.0.tgz
	https://registry.yarnpkg.com/symbol-observable/-/symbol-observable-1.0.1.tgz
	https://registry.yarnpkg.com/symbol-tree/-/symbol-tree-3.2.4.tgz
	https://registry.yarnpkg.com/syntax-error/-/syntax-error-1.3.0.tgz
	https://registry.yarnpkg.com/syntax-error/-/syntax-error-1.4.0.tgz
	https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz -> @szmarczak-http-timer-1.1.2.tgz
	https://registry.yarnpkg.com/table-layout/-/table-layout-0.4.0.tgz
	https://registry.yarnpkg.com/table-layout/-/table-layout-0.4.5.tgz
	https://registry.yarnpkg.com/table/-/table-3.8.3.tgz
	https://registry.yarnpkg.com/table/-/table-4.0.3.tgz
	https://registry.yarnpkg.com/table/-/table-5.4.6.tgz
	https://registry.yarnpkg.com/taffydb/-/taffydb-2.6.2.tgz
	https://registry.yarnpkg.com/tapable/-/tapable-0.1.10.tgz
	https://registry.yarnpkg.com/tap-dot/-/tap-dot-1.0.5.tgz
	https://registry.yarnpkg.com/tape/-/tape-4.11.0.tgz
	https://registry.yarnpkg.com/tape/-/tape-4.6.3.tgz
	https://registry.yarnpkg.com/tape/-/tape-4.8.0.tgz
	https://registry.yarnpkg.com/tap-mocha-reporter/-/tap-mocha-reporter-3.0.6.tgz
	https://registry.yarnpkg.com/tap-out/-/tap-out-1.4.2.tgz
	https://registry.yarnpkg.com/tap-parser/-/tap-parser-5.4.0.tgz
	https://registry.yarnpkg.com/tap-parser/-/tap-parser-7.0.0.tgz
	https://registry.yarnpkg.com/tap/-/tap-11.1.1.tgz
	https://registry.yarnpkg.com/tar-fs/-/tar-fs-2.1.1.tgz
	https://registry.yarnpkg.com/tar-pack/-/tar-pack-3.4.1.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-1.1.5.tgz
	https://registry.yarnpkg.com/tar-stream/-/tar-stream-2.2.0.tgz
	https://registry.yarnpkg.com/tar/-/tar-2.2.1.tgz
	https://registry.yarnpkg.com/tar/-/tar-2.2.2.tgz
	https://registry.yarnpkg.com/tar/-/tar-4.4.13.tgz
	https://registry.yarnpkg.com/tar/-/tar-4.4.2.tgz
	https://registry.yarnpkg.com/tar/-/tar-6.1.0.tgz
	https://registry.yarnpkg.com/temp-file/-/temp-file-3.3.7.tgz
	https://registry.yarnpkg.com/temporary/-/temporary-0.0.8.tgz
	https://registry.yarnpkg.com/temp-path/-/temp-path-1.0.0.tgz
	https://registry.yarnpkg.com/terminal-link/-/terminal-link-2.1.1.tgz
	https://registry.yarnpkg.com/term-size/-/term-size-1.2.0.tgz
	https://registry.yarnpkg.com/term-size/-/term-size-2.2.0.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-4.2.0.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-5.2.3.tgz
	https://registry.yarnpkg.com/test-exclude/-/test-exclude-6.0.0.tgz
	https://registry.yarnpkg.com/test-runner/-/test-runner-0.4.0.tgz
	https://registry.yarnpkg.com/test-value/-/test-value-1.1.0.tgz
	https://registry.yarnpkg.com/test-value/-/test-value-2.1.0.tgz
	https://registry.yarnpkg.com/text-encoding/-/text-encoding-0.6.4.tgz
	https://registry.yarnpkg.com/text-table/-/text-table-0.2.0.tgz
	https://registry.yarnpkg.com/throat/-/throat-4.1.0.tgz
	https://registry.yarnpkg.com/throat/-/throat-5.0.0.tgz
	https://registry.yarnpkg.com/throttleit/-/throttleit-1.0.0.tgz
	https://registry.yarnpkg.com/through2/-/through2-0.6.5.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.3.tgz
	https://registry.yarnpkg.com/through2/-/through2-2.0.5.tgz
	https://registry.yarnpkg.com/through/-/through-2.3.8.tgz
	https://registry.yarnpkg.com/thunkify/-/thunkify-2.1.2.tgz
	https://registry.yarnpkg.com/timed-out/-/timed-out-4.0.1.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-1.4.2.tgz
	https://registry.yarnpkg.com/timers-browserify/-/timers-browserify-2.0.6.tgz
	https://registry.yarnpkg.com/timespan/-/timespan-2.3.0.tgz
	https://registry.yarnpkg.com/time-stamp/-/time-stamp-2.0.0.tgz
	https://registry.yarnpkg.com/timm/-/timm-1.7.1.tgz
	https://registry.yarnpkg.com/tinycolor2/-/tinycolor2-1.4.2.tgz
	https://registry.yarnpkg.com/tiny-lr/-/tiny-lr-0.2.1.tgz
	https://registry.yarnpkg.com/tiny-relative-date/-/tiny-relative-date-1.3.0.tgz
	https://registry.yarnpkg.com/tmatch/-/tmatch-3.1.0.tgz
	https://registry.yarnpkg.com/tmpl/-/tmpl-1.0.4.tgz
	https://registry.yarnpkg.com/tmp-promise/-/tmp-promise-1.1.0.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.0.33.tgz
	https://registry.yarnpkg.com/tmp/-/tmp-0.1.0.tgz
	https://registry.yarnpkg.com/to-arraybuffer/-/to-arraybuffer-1.0.1.tgz
	https://registry.yarnpkg.com/to-array/-/to-array-0.1.4.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-1.0.3.tgz
	https://registry.yarnpkg.com/to-fast-properties/-/to-fast-properties-2.0.0.tgz
	https://registry.yarnpkg.com/to-iso-string/-/to-iso-string-0.0.2.tgz
	https://registry.yarnpkg.com/toml/-/toml-2.3.6.tgz
	https://registry.yarnpkg.com/to-object-path/-/to-object-path-0.3.0.tgz
	https://registry.yarnpkg.com/to-readable-stream/-/to-readable-stream-1.0.0.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-2.1.1.tgz
	https://registry.yarnpkg.com/to-regex-range/-/to-regex-range-5.0.1.tgz
	https://registry.yarnpkg.com/to-regex/-/to-regex-3.0.2.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.3.2.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.3.3.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.3.4.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.4.3.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-2.5.0.tgz
	https://registry.yarnpkg.com/tough-cookie/-/tough-cookie-3.0.1.tgz
	https://registry.yarnpkg.com/tr46/-/tr46-1.0.1.tgz
	https://registry.yarnpkg.com/traceur/-/traceur-0.0.111.tgz
	https://registry.yarnpkg.com/traverse/-/traverse-0.3.9.tgz
	https://registry.yarnpkg.com/trim-newlines/-/trim-newlines-1.0.0.tgz
	https://registry.yarnpkg.com/trim-right/-/trim-right-1.0.1.tgz
	https://registry.yarnpkg.com/trim/-/trim-0.0.1.tgz
	https://registry.yarnpkg.com/trivial-deferred/-/trivial-deferred-1.0.1.tgz
	https://registry.yarnpkg.com/truncate-utf8-bytes/-/truncate-utf8-bytes-1.0.2.tgz
	https://registry.yarnpkg.com/tryit/-/tryit-1.0.3.tgz
	https://registry.yarnpkg.com/tsame/-/tsame-1.1.2.tgz
	https://registry.yarnpkg.com/tsconfig-paths/-/tsconfig-paths-3.9.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.10.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.11.1.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.13.0.tgz
	https://registry.yarnpkg.com/tslib/-/tslib-1.14.1.tgz
	https://registry.yarnpkg.com/tsscmp/-/tsscmp-1.0.5.tgz
	https://registry.yarnpkg.com/ts-typed-json/-/ts-typed-json-0.2.2.tgz
	https://registry.yarnpkg.com/tsutils/-/tsutils-3.17.1.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.0.tgz
	https://registry.yarnpkg.com/tty-browserify/-/tty-browserify-0.0.1.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.4.3.tgz
	https://registry.yarnpkg.com/tunnel-agent/-/tunnel-agent-0.6.0.tgz
	https://registry.yarnpkg.com/tweetnacl/-/tweetnacl-0.14.5.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.3.2.tgz
	https://registry.yarnpkg.com/type-check/-/type-check-0.4.0.tgz
	https://registry.yarnpkg.com/typedarray-to-buffer/-/typedarray-to-buffer-3.1.5.tgz
	https://registry.yarnpkg.com/typedarray/-/typedarray-0.0.6.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-0.1.1.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-1.0.0.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.3.tgz
	https://registry.yarnpkg.com/type-detect/-/type-detect-4.0.8.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.11.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.16.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.6.0.tgz
	https://registry.yarnpkg.com/type-fest/-/type-fest-0.8.1.tgz
	https://registry.yarnpkg.com/type-is/-/type-is-1.6.16.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.1.12.tgz -> @types-babel__core-7.1.12.tgz
	https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.1.7.tgz -> @types-babel__core-7.1.7.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.1.tgz -> @types-babel__generator-7.6.1.tgz
	https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.2.tgz -> @types-babel__generator-7.6.2.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.0.2.tgz -> @types-babel__template-7.0.2.tgz
	https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.0.tgz -> @types-babel__template-7.4.0.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.0.10.tgz -> @types-babel__traverse-7.0.10.tgz
	https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.11.0.tgz -> @types-babel__traverse-7.11.0.tgz
	https://registry.yarnpkg.com/@types/color-name/-/color-name-1.1.1.tgz -> @types-color-name-1.1.1.tgz
	https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-3.7.0.tgz -> @typescript-eslint-eslint-plugin-3.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/experimental-utils/-/experimental-utils-3.7.0.tgz -> @typescript-eslint-experimental-utils-3.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-3.7.0.tgz -> @typescript-eslint-parser-3.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-3.7.0.tgz -> @typescript-eslint-typescript-estree-3.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/types/-/types-3.7.0.tgz -> @typescript-eslint-types-3.7.0.tgz
	https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-3.7.0.tgz -> @typescript-eslint-visitor-keys-3.7.0.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-2.8.1.tgz
	https://registry.yarnpkg.com/typescript/-/typescript-3.9.7.tgz
	https://registry.yarnpkg.com/@types/debug/-/debug-4.1.5.tgz -> @types-debug-4.1.5.tgz
	https://registry.yarnpkg.com/@types/eslint-visitor-keys/-/eslint-visitor-keys-1.0.0.tgz -> @types-eslint-visitor-keys-1.0.0.tgz
	https://registry.yarnpkg.com/@types/fs-extra/-/fs-extra-9.0.1.tgz -> @types-fs-extra-9.0.1.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.1.tgz -> @types-istanbul-lib-coverage-2.0.1.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.3.tgz -> @types-istanbul-lib-coverage-2.0.3.tgz
	https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz -> @types-istanbul-lib-report-3.0.0.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-1.1.1.tgz -> @types-istanbul-reports-1.1.1.tgz
	https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-1.1.2.tgz -> @types-istanbul-reports-1.1.2.tgz
	https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz -> @types-json5-0.0.29.tgz
	https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.5.tgz -> @types-json-schema-7.0.5.tgz
	https://registry.yarnpkg.com/@types/node/-/node-13.7.1.tgz -> @types-node-13.7.1.tgz
	https://registry.yarnpkg.com/@types/node/-/node-14.14.21.tgz -> @types-node-14.14.21.tgz
	https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.0.tgz -> @types-normalize-package-data-2.4.0.tgz
	https://registry.yarnpkg.com/@types/prettier/-/prettier-1.19.1.tgz -> @types-prettier-1.19.1.tgz
	https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-1.0.1.tgz -> @types-stack-utils-1.0.1.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-15.0.0.tgz -> @types-yargs-parser-15.0.0.tgz
	https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-20.2.0.tgz -> @types-yargs-parser-20.2.0.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-13.0.11.tgz -> @types-yargs-13.0.11.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-13.0.8.tgz -> @types-yargs-13.0.8.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-15.0.4.tgz -> @types-yargs-15.0.4.tgz
	https://registry.yarnpkg.com/@types/yargs/-/yargs-15.0.5.tgz -> @types-yargs-15.0.5.tgz
	https://registry.yarnpkg.com/type/-/type-1.2.0.tgz
	https://registry.yarnpkg.com/type/-/type-2.3.0.tgz
	https://registry.yarnpkg.com/typical/-/typical-2.6.1.tgz
	https://registry.yarnpkg.com/uc.micro/-/uc.micro-1.0.6.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-1.3.5.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.3.6.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.6.4.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.7.5.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.8.12.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-2.8.29.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.12.8.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.4.6.tgz
	https://registry.yarnpkg.com/uglify-js/-/uglify-js-3.9.1.tgz
	https://registry.yarnpkg.com/uglify-to-browserify/-/uglify-to-browserify-1.0.2.tgz
	https://registry.yarnpkg.com/uid-number/-/uid-number-0.0.6.tgz
	https://registry.yarnpkg.com/ultron/-/ultron-1.0.2.tgz
	https://registry.yarnpkg.com/ultron/-/ultron-1.1.1.tgz
	https://registry.yarnpkg.com/umask/-/umask-1.1.0.tgz
	https://registry.yarnpkg.com/umd/-/umd-3.0.1.tgz
	https://registry.yarnpkg.com/umd/-/umd-3.0.3.tgz
	https://registry.yarnpkg.com/underscore-contrib/-/underscore-contrib-0.3.0.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-2.1.1.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-2.2.1.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-2.3.3.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-2.4.0.tgz
	https://registry.yarnpkg.com/underscore.string/-/underscore.string-3.0.3.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.10.2.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.2.4.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.6.0.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.7.0.tgz
	https://registry.yarnpkg.com/underscore/-/underscore-1.8.3.tgz
	https://registry.yarnpkg.com/@ungap/promise-all-settled/-/promise-all-settled-1.1.2.tgz -> @ungap-promise-all-settled-1.1.2.tgz
	https://registry.yarnpkg.com/unicode-length/-/unicode-length-1.0.3.tgz
	https://registry.yarnpkg.com/union-value/-/union-value-1.0.0.tgz
	https://registry.yarnpkg.com/union-value/-/union-value-1.0.1.tgz
	https://registry.yarnpkg.com/unique-filename/-/unique-filename-1.1.1.tgz
	https://registry.yarnpkg.com/unique-slug/-/unique-slug-2.0.2.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-1.0.0.tgz
	https://registry.yarnpkg.com/unique-string/-/unique-string-2.0.0.tgz
	https://registry.yarnpkg.com/uniq/-/uniq-1.0.1.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-0.1.2.tgz
	https://registry.yarnpkg.com/universalify/-/universalify-1.0.0.tgz
	https://registry.yarnpkg.com/unpipe/-/unpipe-1.0.0.tgz
	https://registry.yarnpkg.com/unset-value/-/unset-value-1.0.0.tgz
	https://registry.yarnpkg.com/untildify/-/untildify-3.0.3.tgz
	https://registry.yarnpkg.com/unzip-crx-3/-/unzip-crx-3-0.2.0.tgz
	https://registry.yarnpkg.com/unzipper/-/unzipper-0.8.14.tgz
	https://registry.yarnpkg.com/unzip-response/-/unzip-response-2.0.1.tgz
	https://registry.yarnpkg.com/upath/-/upath-1.1.0.tgz
	https://registry.yarnpkg.com/update-notifier/-/update-notifier-2.5.0.tgz
	https://registry.yarnpkg.com/update-notifier/-/update-notifier-4.1.3.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.2.2.tgz
	https://registry.yarnpkg.com/uri-js/-/uri-js-4.4.1.tgz
	https://registry.yarnpkg.com/uri-path/-/uri-path-1.0.0.tgz
	https://registry.yarnpkg.com/urix/-/urix-0.1.0.tgz
	https://registry.yarnpkg.com/url-join/-/url-join-0.0.1.tgz
	https://registry.yarnpkg.com/url-parse-lax/-/url-parse-lax-1.0.0.tgz
	https://registry.yarnpkg.com/url-parse-lax/-/url-parse-lax-3.0.0.tgz
	https://registry.yarnpkg.com/url-parse/-/url-parse-1.0.5.tgz
	https://registry.yarnpkg.com/url-parse/-/url-parse-1.2.0.tgz
	https://registry.yarnpkg.com/url-template/-/url-template-2.0.8.tgz
	https://registry.yarnpkg.com/url/-/url-0.11.0.tgz
	https://registry.yarnpkg.com/usage-stats/-/usage-stats-0.9.1.tgz
	https://registry.yarnpkg.com/useragent/-/useragent-2.2.1.tgz
	https://registry.yarnpkg.com/useragent/-/useragent-2.3.0.tgz
	https://registry.yarnpkg.com/user-home/-/user-home-1.1.1.tgz
	https://registry.yarnpkg.com/user-home/-/user-home-2.0.0.tgz
	https://registry.yarnpkg.com/use/-/use-3.1.1.tgz
	https://registry.yarnpkg.com/utf8-byte-length/-/utf8-byte-length-1.0.4.tgz
	https://registry.yarnpkg.com/utif/-/utif-2.0.1.tgz
	https://registry.yarnpkg.com/util-deprecate/-/util-deprecate-1.0.2.tgz
	https://registry.yarnpkg.com/util-extend/-/util-extend-1.0.3.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.0.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.0.1.tgz
	https://registry.yarnpkg.com/util.promisify/-/util.promisify-1.1.1.tgz
	https://registry.yarnpkg.com/util-promisify/-/util-promisify-2.1.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.0.tgz
	https://registry.yarnpkg.com/utils-merge/-/utils-merge-1.0.1.tgz
	https://registry.yarnpkg.com/util/-/util-0.10.3.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.0.1.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.1.0.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.2.1.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.3.3.tgz
	https://registry.yarnpkg.com/uuid/-/uuid-3.4.0.tgz
	https://registry.yarnpkg.com/uws/-/uws-9.14.0.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.1.0.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.1.1.tgz
	https://registry.yarnpkg.com/v8-compile-cache/-/v8-compile-cache-2.2.0.tgz
	https://registry.yarnpkg.com/v8flags/-/v8flags-2.1.1.tgz
	https://registry.yarnpkg.com/v8-to-istanbul/-/v8-to-istanbul-4.1.3.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.3.tgz
	https://registry.yarnpkg.com/validate-npm-package-license/-/validate-npm-package-license-3.0.4.tgz
	https://registry.yarnpkg.com/validate-npm-package-name/-/validate-npm-package-name-3.0.0.tgz
	https://registry.yarnpkg.com/vargs/-/vargs-0.1.0.tgz
	https://registry.yarnpkg.com/vary/-/vary-1.1.2.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.10.0.tgz
	https://registry.yarnpkg.com/verror/-/verror-1.3.6.tgz
	https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-0.0.4.tgz
	https://registry.yarnpkg.com/vm-browserify/-/vm-browserify-1.0.1.tgz
	https://registry.yarnpkg.com/void-elements/-/void-elements-2.0.1.tgz
	https://registry.yarnpkg.com/w3c-hr-time/-/w3c-hr-time-1.0.2.tgz
	https://registry.yarnpkg.com/w3c-xmlserializer/-/w3c-xmlserializer-1.1.2.tgz
	https://registry.yarnpkg.com/walk-back/-/walk-back-2.0.1.tgz
	https://registry.yarnpkg.com/walk-back/-/walk-back-3.0.0.tgz
	https://registry.yarnpkg.com/walker/-/walker-1.0.7.tgz
	https://registry.yarnpkg.com/watchify/-/watchify-3.11.0.tgz
	https://registry.yarnpkg.com/watchpack/-/watchpack-0.2.9.tgz
	https://registry.yarnpkg.com/wcwidth/-/wcwidth-1.0.1.tgz
	https://registry.yarnpkg.com/wd/-/wd-0.3.12.tgz
	https://registry.yarnpkg.com/webidl-conversions/-/webidl-conversions-4.0.2.tgz
	https://registry.yarnpkg.com/webpack-core/-/webpack-core-0.6.9.tgz
	https://registry.yarnpkg.com/webpack-dev-middleware/-/webpack-dev-middleware-1.12.2.tgz
	https://registry.yarnpkg.com/webpack-dev-server/-/webpack-dev-server-1.16.5.tgz
	https://registry.yarnpkg.com/webpack/-/webpack-1.15.0.tgz
	https://registry.yarnpkg.com/websocket-driver/-/websocket-driver-0.7.0.tgz
	https://registry.yarnpkg.com/websocket-extensions/-/websocket-extensions-0.1.3.tgz
	https://registry.yarnpkg.com/whatwg-encoding/-/whatwg-encoding-1.0.5.tgz
	https://registry.yarnpkg.com/whatwg-mimetype/-/whatwg-mimetype-2.3.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-6.5.0.tgz
	https://registry.yarnpkg.com/whatwg-url/-/whatwg-url-7.1.0.tgz
	https://registry.yarnpkg.com/when/-/when-3.7.8.tgz
	https://registry.yarnpkg.com/which-module/-/which-module-2.0.0.tgz
	https://registry.yarnpkg.com/which-pm-runs/-/which-pm-runs-1.0.0.tgz
	https://registry.yarnpkg.com/which/-/which-1.0.9.tgz
	https://registry.yarnpkg.com/which/-/which-1.2.12.tgz
	https://registry.yarnpkg.com/which/-/which-1.2.14.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.0.tgz
	https://registry.yarnpkg.com/which/-/which-1.3.1.tgz
	https://registry.yarnpkg.com/which/-/which-2.0.2.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.2.tgz
	https://registry.yarnpkg.com/wide-align/-/wide-align-1.1.3.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-2.0.1.tgz
	https://registry.yarnpkg.com/widest-line/-/widest-line-3.1.0.tgz
	https://registry.yarnpkg.com/window-size/-/window-size-0.1.0.tgz
	https://registry.yarnpkg.com/window-size/-/window-size-0.1.4.tgz
	https://registry.yarnpkg.com/winreg/-/winreg-1.2.4.tgz
	https://registry.yarnpkg.com/winston/-/winston-0.5.11.tgz
	https://registry.yarnpkg.com/winston/-/winston-0.8.3.tgz
	https://registry.yarnpkg.com/with-callback/-/with-callback-1.0.2.tgz
	https://registry.yarnpkg.com/wordwrapjs/-/wordwrapjs-2.0.0.tgz
	https://registry.yarnpkg.com/wordwrapjs/-/wordwrapjs-3.0.0.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-0.0.2.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-0.0.3.tgz
	https://registry.yarnpkg.com/wordwrap/-/wordwrap-1.0.0.tgz
	https://registry.yarnpkg.com/word-wrap/-/word-wrap-1.2.3.tgz
	https://registry.yarnpkg.com/worker-farm/-/worker-farm-1.7.0.tgz
	https://registry.yarnpkg.com/workerpool/-/workerpool-6.0.2.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-2.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-5.1.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-6.2.0.tgz
	https://registry.yarnpkg.com/wrap-ansi/-/wrap-ansi-7.0.0.tgz
	https://registry.yarnpkg.com/wrappy/-/wrappy-1.0.2.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-1.3.4.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-2.3.0.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-2.4.1.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-2.4.3.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-3.0.1.tgz
	https://registry.yarnpkg.com/write-file-atomic/-/write-file-atomic-3.0.3.tgz
	https://registry.yarnpkg.com/write/-/write-0.2.1.tgz
	https://registry.yarnpkg.com/write/-/write-1.0.3.tgz
	https://registry.yarnpkg.com/ws/-/ws-1.1.5.tgz
	https://registry.yarnpkg.com/ws/-/ws-3.3.3.tgz
	https://registry.yarnpkg.com/ws/-/ws-5.2.2.tgz
	https://registry.yarnpkg.com/ws/-/ws-7.2.3.tgz
	https://registry.yarnpkg.com/wtf-8/-/wtf-8-1.0.0.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-3.0.0.tgz
	https://registry.yarnpkg.com/xdg-basedir/-/xdg-basedir-4.0.0.tgz
	https://registry.yarnpkg.com/xhr/-/xhr-2.5.0.tgz
	https://registry.yarnpkg.com/xml2js/-/xml2js-0.4.22.tgz
	https://registry.yarnpkg.com/xmlbuilder/-/xmlbuilder-11.0.1.tgz
	https://registry.yarnpkg.com/xmlchars/-/xmlchars-2.2.0.tgz
	https://registry.yarnpkg.com/xmlcreate/-/xmlcreate-2.0.3.tgz
	https://registry.yarnpkg.com/xml-escape/-/xml-escape-1.0.0.tgz
	https://registry.yarnpkg.com/xmlhttprequest-ssl/-/xmlhttprequest-ssl-1.5.3.tgz
	https://registry.yarnpkg.com/xmlhttprequest-ssl/-/xmlhttprequest-ssl-1.5.5.tgz
	https://registry.yarnpkg.com/xml-name-validator/-/xml-name-validator-3.0.0.tgz
	https://registry.yarnpkg.com/xml-parse-from-string/-/xml-parse-from-string-1.0.1.tgz
	https://registry.yarnpkg.com/xregexp/-/xregexp-2.0.0.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.1.tgz
	https://registry.yarnpkg.com/xtend/-/xtend-4.0.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-3.2.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-3.2.2.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.0.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-4.0.1.tgz
	https://registry.yarnpkg.com/y18n/-/y18n-5.0.5.tgz
	https://registry.yarnpkg.com/yaku/-/yaku-0.16.7.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-2.1.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.0.2.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-3.1.1.tgz
	https://registry.yarnpkg.com/yallist/-/yallist-4.0.0.tgz
	https://registry.yarnpkg.com/yapool/-/yapool-1.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-13.1.2.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-15.0.1.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-18.1.3.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-20.2.4.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-7.0.0.tgz
	https://registry.yarnpkg.com/yargs-parser/-/yargs-parser-8.1.0.tgz
	https://registry.yarnpkg.com/yargs-unparser/-/yargs-unparser-1.6.0.tgz
	https://registry.yarnpkg.com/yargs-unparser/-/yargs-unparser-2.0.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-10.1.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-13.3.2.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-14.2.3.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-15.3.1.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-16.2.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-3.10.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-3.32.0.tgz
	https://registry.yarnpkg.com/yargs/-/yargs-8.0.2.tgz
	https://registry.yarnpkg.com/yauzl/-/yauzl-2.4.1.tgz
	https://registry.yarnpkg.com/yeast/-/yeast-0.1.2.tgz
	https://registry.yarnpkg.com/yocto-queue/-/yocto-queue-0.1.0.tgz
	https://registry.yarnpkg.com/zip-stream/-/zip-stream-0.5.2.tgz
	https://registry.yarnpkg.com/zip-stream/-/zip-stream-4.0.4.tgz
	https://registry.npmjs.org/event-stream/-/event-stream-3.3.4.tgz#4ab4c9a0f5a54db9338b4c34d86bfce8f4b35571
	https://codeload.github.com/kpdecker/istanbul/tar.gz/dd1228d2f0a6e8506cbb5dba398a8297b1dbaf22
"

REPO="https://github.com/vector-im/element-desktop"
ELECTRON_VERSION="11.2.3"
#ELEMENT_COMMIT_ID="ae245c9b1f06e79cec4829f8cd1555206b0ec8f2"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="${REPO}.git"
	DOWNLOAD=""
	ELECTRON_DEPS="${ELECTRON_VERSION%%.*}="
	IUSE="+build-online native-modules"
else
	IUSE="build-online native-modules"
	ELECTRON_DEPS="${ELECTRON_VERSION%%.*}/${ELECTRON_VERSION#*.}"
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

RESTRICT="mirror"

COMMON_DEPEND="
	~net-im/element-web-${PV}
	dev-util/electron:${ELECTRON_DEPS}
	native-modules? ( dev-db/sqlcipher )
	net-libs/nodejs
"

RDEPEND="${COMMON_DEPEND}
"
DEPEND="${COMMON_DEPEND}
"

BDEPEND="
	${PYTHON_DEPS}
	sys-apps/yarn
	native-modules? ( virtual/rust )
"

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

	if use native-modules
	then
		custom_cargo_src_unpack
	fi
}

# src_prepare() {
# 	default

# 	einfo "Removing vscode-ripgrep and other dependencies"
# 	sed -i '/"vscode-ripgrep"/d' package.json || die
# 	sed -i '/"vscode-telemetry-extractor"/d' package.json || die
# 	sed -i '/"esbuild"/d' build/package.json || die

# 	#sed -i '/"electron"/d' package.json || die
# 	#sed -i '/vscode-ripgrep/d' remote/package.json || die
# 	sed -i '/"playwright"/d' package.json || die

# 	sed -i '/"typescript-web-server"/d' extensions/typescript-language-features/package.json || die

# 	einfo "Editing postinstall.js"
# 	#sed -i "s/ || arg === '--frozen-lockfile'/ || arg === '--frozen-lockfile' || arg === '--offline' || arg === '--no-progress'/" build/npm/postinstall.js || die
# 	sed -i '/git config pull/d' build/npm/postinstall.js || die

# 	einfo "Editing dirs.js"
# 	sed -i '/remote/d' build/npm/dirs.js || die
# 	sed -i '/test\/automation/d' build/npm/dirs.js || die
# 	sed -i '/test\/integration\/browser/d' build/npm/dirs.js || die
# 	sed -i '/test\/smoke/d' build/npm/dirs.js || die
# 	sed -i '/test\/monaco/d' build/npm/dirs.js || die

# 	einfo "Editing build/gulpfile.extensions.js"
# 	sed -i '/bundle-marketplace-extensions-build/d' build/gulpfile.extensions.js || die

# 	einfo "Editing build/gulpfile.vscode.js"
# 	#sed -i 's/ffmpegChromium: true/ffmpegChromium: false/' build/gulpfile.vscode.js || die
# 	sed -i '/ffmpegChromium/d' build/gulpfile.vscode.js || die

# 	einfo "Editing build/gulpfile.vscode.linux.js"
# 	sed -i 's/gulp.task(buildDebTask);$/gulp.task(prepareDebTask);gulp.task(buildDebTask);/' build/gulpfile.vscode.linux.js || die

# 	einfo "Editing product.json"

# 	mv product.json product.json.bak || die
# 	sed -i '1d' product.json.bak || die

# 	if use liveshare
# 	then
# 	sed -i 's/"ms-vscode.vscode-js-profile-flame",/"ms-vscode.vscode-js-profile-flame", "ms-vsliveshare.vsliveshare",/' product.json.bak || die
# 	fi

# 	if use insiders
# 	then
# 	sed -i 's/"ms-vscode.vscode-js-profile-flame",/"ms-vscode.references-view", "ms-vsliveshare.vsliveshare", "ms-vsliveshare.cloudenv", "ms-vsliveshare.cloudenv-explorer", "ms-vsonline.vsonline", "GitHub.vscode-pull-request-github", "GitHub.vscode-pull-request-github-insiders", "Microsoft.vscode-nmake-tools", "ms-vscode-remote.remote-containers", "ms-vscode-remote.remote-containers-nightly", "ms-vscode-remote.remote-ssh", "ms-vscode-remote.remote-ssh-nightly", "ms-vscode-remote.remote-ssh-edit", "ms-vscode-remote.remote-ssh-edit-nightly", "ms-vscode-remote.remote-wsl", "ms-vscode-remote.remote-wsl-nightly", "ms-vscode-remote.vscode-remote-extensionpack", "ms-vscode-remote.vscode-remote-extensionpack-nightly", "ms-azuretools.vscode-docker", "ms-vscode.azure-account", "ms-vscode.js-debug", "ms-vscode.js-debug-nightly", "ms-vscode.vscode-js-profile-table", "ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-github-issue-notebooks", "ms-vscode.vscode-markdown-notebook", "ms-azuretools.vscode-azurestaticwebapps", "ms-dotnettools.dotnet-interactive-vscode", "ms-python.python", "ms-ai-tools.notebook-renderers",/' product.json.bak || die
# 	fi

# 	cat "${FILESDIR}/heading.json" > product.json
# 	if use openvsx
# 	then
# 		cat "${FILESDIR}/openvsx.json" >> product.json
# 	else
# 		cat "${FILESDIR}/marketplace.json" >> product.json
# 	fi

# 	if use badge-providers
# 	then
# 		cat "${FILESDIR}/badge_prov.json" >> product.json
# 	fi

# 	cat product.json.bak >> product.json

# 	einfo "Disabling telemetry by default"
# 	perl -0777 -pi -e "s/'default': true,\n\s*'tags': \['usesOnlineServices'\]/'default': false,'tags': ['usesOnlineServices']/m or die" src/vs/platform/telemetry/common/telemetryService.ts || die
# 	perl -0777 -pi -e "s/'default': true,\n\s*'tags': \['usesOnlineServices'\]/'default': false,'tags': ['usesOnlineServices']/m or die" src/vs/workbench/electron-sandbox/desktop.contribution.ts || die

# 	einfo "Disabling automatic updates by default"
# 	perl -0777 -pi -e "s/enum: \['none', 'manual', 'start', 'default'\],\n\s*default: 'default',/enum: ['none', 'manual', 'start', 'default'], default: 'none',/m or die" src/vs/platform/update/common/update.config.contribution.ts || die

# 	if use substitute-urls
# 	then
# 		ebegin "Substituting urls"
# 			#Taken from VSCodium
# 			TELEMETRY_URLS="(dc\.services\.visualstudio\.com)|(vortex\.data\.microsoft\.com)"
# 			REPLACEMENT="s/$TELEMETRY_URLS/0\.0\.0\.0/g"
# 			grep -rl --exclude-dir=.git -E $TELEMETRY_URLS . | xargs sed -i -E $REPLACEMENT
# 		eend $? || die
# 	fi
# }

# src_configure() {

# }

src_compile() {
	local myarch="$(tc-arch)"

	if [[ $myarch = amd64 ]] ; then
		VSCODE_ARCH="x64"
	elif [[ $myarch = x86 ]] ; then
		VSCODE_ARCH="ia32"
	else
		die "Failed to determine target arch, got '$myarch'."
	fi

	ebegin "Installing node_modules"

	OLD_PATH=$PATH
	export PATH="/usr/$(get_libdir)/electron-${ELECTRON_VERSION%%.*}:/usr/$(get_libdir)/electron-${ELECTRON_VERSION%%.*}/npm/bin/node-gyp-bin:$PATH"
	export CFLAGS="${CFLAGS} -I/usr/include/electron-${ELECTRON_VERSION%%.*}/node"
	export CPPFLAGS="${CPPFLAGS} -I/usr/include/electron-${ELECTRON_VERSION%%.*}/node"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	yarn config set disable-self-update-check true || die
	yarn config set nodedir /usr/include/electron-${ELECTRON_VERSION%%.*}/node || die

	if ! use build-online
	then
		ONLINE_OFFLINE="--offline"
		yarn config set yarn-offline-mirror "${DISTDIR}" || die
	fi
	node /usr/bin/yarn install --frozen-lockfile ${ONLINE_OFFLINE} --no-progress || die
#--ignore-optional
#--ignore-engines
#--production=true
#--no-progress
#--skip-integrity-check
#--verbose

	einfo "Editing ElectronFramework.js"
	sed -i 's/return unpack(options, createDownloadOpts.*$/return true;/' \
		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die
	sed -i 's/return beforeCopyExtraFiles(options);$/return true;/' \
		node_modules/app-builder-lib/out/electron/ElectronFramework.js || die

	if use native-modules
	then
		mkdir -p .hak/matrix-seshat .hak/keytar
		pushd .hak/matrix-seshat > /dev/null || die
			tar -xf "${DISTDIR}/matrix-seshat-2.2.3.tar.gz" || die
			mv seshat-*/seshat-node build
			pushd build > /dev/null || die
				node /usr/bin/yarn install --frozen-lockfile ${ONLINE_OFFLINE} --ignore-scripts --no-progress || die
				cd native; cargo build --offline --release --verbose; cd ..
			popd > /dev/null || die
		popd > /dev/null || die
		pushd .hak/keytar > /dev/null || die
			tar -xf "${DISTDIR}/keytar-5.6.0.tar.gz" || die
			mv node-keytar-* build
			pushd build > /dev/null || die
				cp ${FILESDIR}/yarn.lock yarn.lock
				node /usr/bin/yarn install --frozen-lockfile ${ONLINE_OFFLINE} --ignore-scripts --no-progress || die
			popd > /dev/null || die
		popd > /dev/null || die
		node /usr/bin/yarn run build:native
	fi

	/usr/bin/node node_modules/.bin/electron-builder --dir

	#cp -r /usr/share/element-web webapp
	#rm -f webapp/config.json
	#cp -f /etc/element-web/config.json webapp/config.json
	#node node_modules/.bin/asar p webapp webapp.asar
	#node node_modules/.bin/asar l webapp.asar

	export PATH=${OLD_PATH}

	die
}

src_install() {
	YARN_CACHE_FOLDER="${T}/.yarn-cache" /usr/bin/node node_modules/gulp/bin/gulp.js vscode-linux-${VSCODE_ARCH}-prepare-deb || die
	local VSCODE_HOME="/usr/$(get_libdir)/vscode"

	if use ignore-gpu-blacklist
	then
		IGNORE_BLACKLIST="--ignore-gpu-blacklist"
	fi

	exeinto "${VSCODE_HOME}"
	sed -i '/^ELECTRON/,+3d' "${WORKDIR}"/V*/bin/code-oss || die
	echo "VSCODE_PATH=\"/usr/$(get_libdir)/vscode\"
	ELECTRON_PATH=\"/usr/$(get_libdir)/electron-${ELECTRON_VERSION%%.*}\"
	CLI=\"\${VSCODE_PATH}/out/cli.js\"
	exec /usr/bin/env ELECTRON_RUN_AS_NODE=1 \
	NPM_CONFIG_NODEDIR=\"\${ELECTRON_PATH}/node/\" \
	\"\${ELECTRON_PATH}/electron\" \"\${CLI}\" --app=\"\${VSCODE_PATH}\" ${IGNORE_BLACKLIST} \"\$@\"" >> "${WORKDIR}"/V*/bin/code-oss
	doexe "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/bin/code-oss
	dosym "${VSCODE_HOME}/code-oss" /usr/bin/code-oss

	if use builtin-extensions
	then
	einfo "Installing builtin extensions"
	pushd "${T}" > /dev/null || die
	for ext in "${!builtin_exts[@]}";
	do
		cp "${DISTDIR}/ms-vscode.${ext}-${builtin_exts[${ext}]}.zip.gz" "${T}" || die
		gunzip "ms-vscode.${ext}-${builtin_exts[${ext}]}.zip.gz" || die
		unzip "ms-vscode.${ext}-${builtin_exts[${ext}]}.zip" extension/* > /dev/null || die
		mv extension "${WORKDIR}/VSCode-linux-${VSCODE_ARCH}/extensions/ms-vscode.${ext}" || die
	done
	popd > /dev/null || die
	fi

	insinto "${VSCODE_HOME}"
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/extensions
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/out
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/resources
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/*.json
	doins "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar
	doins -r "${WORKDIR}"/VSCode-linux-${VSCODE_ARCH}/node_modules.asar.unpacked

	pushd .build/linux/deb/*/code-oss-*/usr/share/ > /dev/null || die

	insinto /usr/share/
	sed -i 's$/usr/share/code-oss/code-oss$/usr/bin/code-oss$' applications/*.desktop || die
	doins -r applications bash-completion pixmaps zsh

	insinto /usr/share/metainfo/
	doins appdata/*

	popd > /dev/null || die
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

#modified version from cargo.eclass
custom_cargo_src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	mkdir -p "${ECARGO_VENDOR}" || die
	mkdir -p "${S}" || die

	local archive shasum pkg
	for archive in ${A}; do
		case "${archive}" in
			*.crate)
				ebegin "Loading ${archive} into Cargo registry"
				tar -xf "${DISTDIR}"/${archive} -C "${ECARGO_VENDOR}/" || die
				# generate sha256sum of the crate itself as cargo needs this
				shasum=$(sha256sum "${DISTDIR}"/${archive} | cut -d ' ' -f 1)
				pkg=$(basename ${archive} .crate)
				cat <<- EOF > ${ECARGO_VENDOR}/${pkg}/.cargo-checksum.json
				{
					"package": "${shasum}",
					"files": {}
				}
				EOF
				# if this is our target package we need it in ${WORKDIR} too
				# to make ${S} (and handle any revisions too)
				if [[ ${P} == ${pkg}* ]]; then
					tar -xf "${DISTDIR}"/${archive} -C "${WORKDIR}" || die
				fi
				eend $?
				;;
			cargo-snapshot*)
				ebegin "Unpacking ${archive}"
				mkdir -p "${S}"/target/snapshot
				tar -xzf "${DISTDIR}"/${archive} -C "${S}"/target/snapshot --strip-components 2 || die
				# cargo's makefile needs this otherwise it will try to
				# download it
				touch "${S}"/target/snapshot/bin/cargo || die
				eend $?
				;;
			*)
				;;
		esac
	done

	cargo_gen_config
}