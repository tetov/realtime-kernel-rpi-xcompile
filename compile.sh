#! /bin/env sh
cd linux-*
sudo apt install -y libssl-dev
make olddefconfig
make menuconfig
make -j $(nproc) all dtbs deb-pkg
