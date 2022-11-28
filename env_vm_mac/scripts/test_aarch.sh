#!/bin/bash

version=1.75.0
echo "Building boost $version..."

set -eu

ANDROID_NDK_ROOT=/home/user1/workspaces/android-ndk-r21e/
toolchain=$PWD/toolchain
if [ ! -d "$toolchain" ]; then
  echo "Building toolchain..."
  $ANDROID_NDK_ROOT/build/tools/make-standalone-toolchain.sh \
      --arch=arm64 --platform=android-21 \
      --install-dir="$toolchain" \
      --toolchain=arm-linux-androideabi-clang \
      --use-llvm --stl=libc++
else
  echo "Toolchain already built"
fi

dir_name=boost_$(sed 's#\.#_#g' <<< $version)
archive=${dir_name}.tar.bz2
if [ ! -f "$archive" ]; then
  wget -O $archive "https://dl.bintray.com/boostorg/release/$version/source/$archive"
else
  echo "Archive $archive already downloaded"
fi

echo "Extracting..."
if [ ! -d "$dir_name" ]; then
  # rm -rf $dir_name
  tar xf $archive
else
  echo "Archive $archive already unpacked into $dir_name"
fi
cd $dir_name

echo "Generating config..."
user_config=tools/build/src/user-config.jam
rm -f $user_config
cat <<EOF > $user_config
import os ;
using clang : android
:
$toolchain/bin/aarch64-linux-android21-clang++
:
<archiver>$toolchain/bin/aarch64-linux-android-ar
<ranlib>$toolchain/bin/aarch64-linux-android-ranlib
;
EOF

echo "Bootstrapping..."
./bootstrap.sh #--with-toolset=clang

echo "Building..."
./b2 -j2 \
    cxxflags=-fPIC cflags=-fPIC define=BOOST_THREAD_TEST=1 \
    --with-thread \
    toolset=clang-android \
    architecture=arm \
    variant=release \
    --layout=versioned \
    target-os=android \
    threading=multi \
    threadapi=pthread \
    link=static \
    runtime-link=static \

echo "Running ranlib on libraries..."
lib_shared_path=/home/user1/boost75shared/stage/lib/
libs=$(find "bin.v2/libs/" -name '*.a')
for lib in $libs; do
  "$toolchain/bin/aarch64-linux-android-ranlib" "$lib"
  cp "$lib" "$lib_shared_path"
done

echo "Done!"
