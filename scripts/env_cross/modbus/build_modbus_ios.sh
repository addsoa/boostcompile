LIBMODBUS_SRC_PATH=/home/user1/workspaces/libmodbus


cd ${LIBMODBUS_SRC_PATH};
./configure \
	--prefix=/home/user1/workspaces/libmodbus/build \
	--build=x86_64 \
	--host=mac \
	--disable-silent-rules \
	--enable-static \
	CC=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-clang \
	CXX=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-clang++ \
	AR=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-ar \
	RANLIB=/home/user1/tools/toolchains/ios/ios15/bin/arm-apple-darwin21-ranlib \
	CXXFLAGS="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/ios/ios15/SDK/iPhoneOS15.4.sdk" 

cd ${LIBMODBUS_SRC_PATH}; make
cd ${LIBMODBUS_SRC_PATH}; make install
