LIBMODBUS_SRC_PATH=/home/user1/workspaces/libmodbus
SDK_BIN_PATH=/home/user1/tools/toolchains/ios/ios15/bin

ORIG_PATH=$PATH
export PATH=$PATH:$SDK_BIN_PATH

cd ${LIBMODBUS_SRC_PATH};
./configure \
	--prefix=/home/user1/workspaces/libmodbus/build \
	--build=x86_64 \
	--host=mac \
	--disable-silent-rules \
	--enable-static \
	CC=${SDK_BIN_PATH}/arm-apple-darwin21-clang \
	CXX=${SDK_BIN_PATH}/arm-apple-darwin21-clang++ \
	AR=${SDK_BIN_PATH}/arm-apple-darwin21-ar \
	RANLIB=${SDK_BIN_PATH}/arm-apple-darwin21-ranlib \
	CXXFLAGS="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/ios/ios15/SDK/iPhoneOS15.4.sdk" 

cd ${LIBMODBUS_SRC_PATH}; make
cd ${LIBMODBUS_SRC_PATH}; make install

export PATH=$ORIG_PATH

#	CC=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-clang \
#	CXX=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-clang++ \
#	AR=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-ar \
#	RANLIB=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-ranlib \
