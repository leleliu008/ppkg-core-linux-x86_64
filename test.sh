#!/bin/sh

set -ex

mkdir bin

for item in linux/x86_64/*.tar.xz
do
    tar vxf "$item"

    for item2 in $(basename "$item" .tar.xz)/bin/*
    do
        "$item2" --help
        "$item2" --version
    done
done
