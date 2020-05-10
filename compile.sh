#! /bin/env sh
set -e

cd linux-*

make olddefconfig
make menuconfig
make -j "$(nproc)" KBUILD_IMAGE=arch/arm64/boot/Image deb-pkg
