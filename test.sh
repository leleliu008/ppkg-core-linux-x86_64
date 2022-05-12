#!/bin/sh

set -e

COLOR_RED='\033[0;31m'          # Red
COLOR_GREEN='\033[0;32m'        # Green
COLOR_YELLOW='\033[0;33m'       # Yellow
COLOR_BLUE='\033[0;94m'         # Blue
COLOR_PURPLE='\033[0;35m'       # Purple
COLOR_OFF='\033[0m'             # Reset

run() {
    printf '%b\n' "${COLOR_PURPLE}==>${COLOR_OFF} ${COLOR_GREEN}$*${COLOR_OFF}"
    eval "$*"
}

mkdir bin

for item in linux/x86_64/*.tar.xz
do
    run tar vxf $item

    run cp $(basename $item .tar.xz)/bin/* bin/
done

run ls bin

export PATH="$PWD/bin:$PATH"

printf '%s\n' "$PATH" | tr ':' '\n'

for item in bin/*
do
    case $item in
        bin/c_rehash)
            run $item -h
            ;;
        bin/openssl)
            run $item help
            run $item version
            ;;
        *)
            run $item --help
            run $item --version
    esac
done
