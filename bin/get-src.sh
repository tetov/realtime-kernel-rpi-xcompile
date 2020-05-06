#! /bin/env sh
set -e

# Find kernel version with a matching rt patch
MAJOR="5"
MINOR="4"
PATCH="34"
VERSION="$MAJOR.$MINOR.$PATCH"

RT_PATCH_VER="rt21"


# Find a rpi conf for kernel version (bcm2771 for RPi4)
CONF_URL="https://raw.githubusercontent.com/raspberrypi/linux/rpi-5.4.y/arch/arm64/configs/bcm2711_defconfig"

KERNEL_SRC_URL="https://cdn.kernel.org/pub/linux/kernel/v${MAJOR}.x/linux-${VERSION}.tar.xz"
KERNEL_SRC_SIGN_URL="https://cdn.kernel.org/pub/linux/kernel/v${MAJOR}.x/linux-${VERSION}.tar.sign"

PATCH_URL="https://cdn.kernel.org/pub/linux/kernel/projects/rt/${MAJOR}.${MINOR}/patch-${VERSION}-${RT_PATCH_VER}.patch.xz"
PATCH_URL_SIGN="https://cdn.kernel.org/pub/linux/kernel/projects/rt/${MAJOR}.${MINOR}/patch-${VERSION}-${RT_PATCH_VER}.patch.sign"


wget -N "$PATCH_URL"
wget -N "$PATCH_URL_SIGN"

wget -N "$KERNEL_SRC_URL"
wget -N "$KERNEL_SRC_SIGN_URL"

wget -O .config "$CONF_URL"

xz -dkfv linux-${VERSION}.tar.xz
xz -dkfv patch-${VERSION}-${RT_PATCH_VER}.patch.xz

# kernel signatures
gpg --auto-key-locate wkd --locate-keys torvalds@kernel.org gregkh@kernel.org


# OSADL signing key for patch
gpg  --recv-keys 514B0EDE3C387F944FB3799329E574109AEBFAAa

gpg --verify linux-${VERSION}.tar.sign
gpg --verify patch-${VERSION}-${RT_PATCH_VER}.patch.sign

tar xvf linux-${VERSION}.tar

cd linux-${VERSION}

cat ../patch-${VERSION}-${RT_PATCH_VER}.patch | patch -p1 --verbose

mv ../.config ./
