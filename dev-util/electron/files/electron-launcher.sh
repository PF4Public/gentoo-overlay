#!/usr/bin/env sh

set -euo pipefail

name=@ELECTRON@
libdir=@LIBDIR@
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
    mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
        flags+=("${line}")
    fi
done

exec /usr/${libdir}/${name}/electron "${flags[@]}" "$@"
