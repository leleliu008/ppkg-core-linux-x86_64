#!/bin/sh

set -ex

mkdir bin

for item in *
do
    tar vxf "linux/x86_64/$item"
    cp -r   "linux/x86_64/$(basename "$item" .tar.xz)/bin" bin
done

for item in bin/*
do
    "$item" --help
    "$item" --version
done
