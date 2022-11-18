set(ANDROID_TOOLCHAIN_ROOT /home/user1/tools/toolchains/android/r21e/toolchain)
set(ANDROID_TOOLCHAIN_BIN_PATH ${ANDROID_TOOLCHAIN_ROOT}/bin)

set(CMAKE_SYSROOT ${ANDROID_TOOLCHAIN_ROOT}/sysroot)
set(CMAKE_C_COMPILER ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android21-clang)
set(CMAKE_CXX_COMPILER ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android21-clang++)
set(CMAKE_AR ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-ar)
set(CMAKE_RANLIB ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-ranlib)

