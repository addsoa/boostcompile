#!/bin/bash

set -eu

ANDROID_NDK_ROOT=/home/user1/tools/sdksrcs/android-ndk-r21e
TOOLCHAIN_DIR=/home/user1/tools/toolchains/android/r21e/toolchain

if [ ! -d "$TOOLCHAIN_DIR" ]; then
  echo "Building toolchain for android..."
  
  $ANDROID_NDK_ROOT/build/tools/make-standalone-toolchain.sh \
    --force \
    --arch=arm64 --platform=android-21 \
    --install-dir="$TOOLCHAIN_DIR" \
    --toolchain=arm-linux-androideabi-clang \
    --use-llvm --stl=libc++
else
  echo "Toolchain already built"
fi

