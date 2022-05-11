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

for item in linux/x86_64/*.tar.xz
do
    run tar vxf $item

    for item2 in $(basename $item .tar.xz)/bin/*
    do
        run $item2 --help
        run $item2 --version
    done
done
