set(IOS_TOOLCHAIN_ROOT /home/user1/tools/toolchains/ios/ios15)
set(IOS_TOOLCHAIN_BIN_PATH ${IOS_TOOLCHAIN_ROOT}/bin)

set(OSXCROSS_HOST arm-apple-darwin21)
set(OSXCROSS_TARGET_DIR ${IOS_TOOLCHAIN_ROOT})
set(OSXCROSS_SDK ${IOS_TOOLCHAIN_ROOT}/SDK/iPhoneOS15.4.sdk/)


set(CMAKE_SYSROOT ${IOS_TOOLCHAIN_ROOT}/SDK/iPhoneOS15.4.sdk)
set(CMAKE_C_COMPILER ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-clang)
set(CMAKE_CXX_COMPILER ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-clang++)
set(CMAKE_AR ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-ar)
set(CMAKE_RANLIB ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-ranlib)
set(CMAKE_LD ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-ld)
set(CMAKE_ASM_COMPILER ${IOS_TOOLCHAIN_BIN_PATH}/arm-apple-darwin21-as)


# sqlite: nohave_system, iphone_simulator
# TODO: special flags relayed to specific project
set(IOS_CFLAGS "-DSQLITE_NOHAVE_SYSTEM ")
set(IOS_CXXFLAGS "-DSQLITE_NOHAVE_SYSTEM ")


# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


set(TARGET_EXTRA_CFLAGS ${IOS_CFLAGS})
set(TARGET_EXTRA_CXXFLAGS ${IOS_CXXFLAGS})

