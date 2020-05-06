#! /bin/env sh
set -e

docker run --rm tetov/arm64-kernel-xcompile:latest > ./dockcross
chmod +x ./dockcross

./dockcross bin/get-src.sh
./dockcross bin/compile.sh
