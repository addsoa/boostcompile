LIBMODBUS_SRC_PATH=/home/user1/workspaces/libmodbus
SDK_BIN_PATH=/home/user1/tools/toolchains/iossim/iossim15/bin/
MY_SYSROOT_PATH=/home/user1/tools/toolchains/iossim/iossim15/SDK/iPhoneSimulator15.4.sdk/


ORIG_PATH=$PATH
export PATH=$PATH:$SDK_BIN_PATH


cd ${LIBMODBUS_SRC_PATH};
./configure \
	--prefix=/home/user1/workspaces/libmodbus/build \
	--build=x86_64 \
	--host=arm \
	--disable-silent-rules \
	--enable-static \
	CC=${SDK_BIN_PATH}/x86_64-apple-darwin21-clang \
	CXX=${SDK_BIN_PATH}/x86_64-apple-darwin21-clang++ \
	AR=${SDK_BIN_PATH}/x86_64-apple-darwin21-ar \
	RANLIB=${SDK_BIN_PATH}/x86_64-apple-darwin21-ranlib \
	CXXFLAGS="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot ${MY_SYSROOT_PATH}" 

cd ${LIBMODBUS_SRC_PATH}; make install

export PATH=$ORIG_PATH
