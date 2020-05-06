docker run --rm dockcross/linux-arm64 > ./dockcross
chmod +x ./dockcross

./dockross sh get-src.sh

cd linux-*

../dockcross sh compile.sh
