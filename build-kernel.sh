#! /bin/env sh
set -e

# docker pull tetov/linux-arm64-kernel-xcompile:latest
docker run --rm tetov/linux-arm64-kernel-xcompile > dockcross
chmod +x dockcross

./dockcross sh get-src.sh
./dockcross sh compile.sh
