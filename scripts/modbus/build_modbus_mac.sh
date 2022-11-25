LIBMODBUS_SRC_PATH=/home/user1/workspaces/libmodbus

ORIG_PATH=$PATH
export PATH=$PATH:/home/user1/tools/toolchains/mac/macos12/bin

cd ${LIBMODBUS_SRC_PATH};
./configure \
	--prefix=/home/user1/workspaces/libmodbus/build \
	--build=x86_64 \
	--host=mac \
	--disable-silent-rules \
	--enable-static \
        CC=/home/user1/tools/toolchains/mac/macos12/bin/x86_64-apple-darwin21.4-clang \
        CXX=/home/user1/tools/toolchains/mac/macos12/bin/x86_64-apple-darwin21.4-clang++ \
	AR=/home/user1/tools/toolchains/mac/macos12/bin/x86_64-apple-darwin21.4-ar \
	RANLIB=/home/user1/tools/toolchains/mac/macos12/bin/x86_64-apple-darwin21.4-ranlib \
	CXXFLAGS="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/mac/macos12/SDK/MacOSX12.3.sdk" 

cd ${LIBMODBUS_SRC_PATH}; make
cd ${LIBMODBUS_SRC_PATH}; make install

export PATH=$ORIG_PATH
