set(IOS_TOOLCHAIN_ROOT /home/user1/tools/toolchains/ios/ios15)
set(IOS_TOOLCHAIN_BIN_PATH ${IOS_TOOLCHAIN_ROOT}/bin)

set(CMAKE_SYSROOT ${IOS_TOOLCHAIN_ROOT}/SDK/iPhoneOS15.4.sdk)
set(CMAKE_C_COMPILER ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-clang)
set(CMAKE_CXX_COMPILER ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-clang++)
set(CMAKE_AR ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-ar)
set(CMAKE_RANLIB ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-ranlib)

