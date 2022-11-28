LIBMODBUS_SRC_PATH=/home/user1/workspaces/libmodbus
SDK_BIN_PATH=/home/user1/tools/toolchains/android/r21e/toolchain/bin

ORIG_PATH=$PATH
export PATH=$PATH:$SDK_BIN_PATH

cd ${LIBMODBUS_SRC_PATH};
./configure \
	--prefix=/home/user1/workspaces/libmodbus/build \
	--build=x86_64 \
	--host=mac \
	--disable-silent-rules \
	--enable-static \
	CC=/home/user1/tools/toolchains/android/r21e/toolchain/bin/aarch64-linux-android21-clang \
	CXX=/home/user1/tools/toolchains/android/r21e/toolchain/bin/aarch64-linux-android21-clang++ \
	AR=/home/user1/tools/toolchains/android/r21e/toolchain/bin/aarch64-linux-android-ar \
	RANLIB=/home/user1/tools/toolchains/android/r21e/toolchain/bin/aarch64-linux-android-ranlib \
	CXXFLAGS="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/android/r21e/toolchain/sysroot"

cd ${LIBMODBUS_SRC_PATH}; make
cd ${LIBMODBUS_SRC_PATH}; make install

export PATH=$ORIG_PATH
