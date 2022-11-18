set(MAC_TOOLCHAIN_ROOT /home/user1/tools/toolchains/mac/macos12)
set(MAC_TOOLCHAIN_BIN_PATH ${MAC_TOOLCHAIN_ROOT}/bin)

set(CMAKE_SYSROOT ${MAC_TOOLCHAIN_ROOT}/SDK/MacOSX12.3.sdk)
set(CMAKE_C_COMPILER ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-clang)
set(CMAKE_CXX_COMPILER ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-clang++)
#set(CMAKE_CXX_COMPILER_AR ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ar)
#set(CMAKE_CXX_COMPILER_RANLIB ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ranlib)
set(CMAKE_AR ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ar)
set(CMAKE_RANLIB ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ranlib)

#set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)
