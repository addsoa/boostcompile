set(ANDROID_TOOLCHAIN_ROOT /home/user1/tools/toolchains/android/r21e/toolchain)
set(ANDROID_TOOLCHAIN_BIN_PATH ${ANDROID_TOOLCHAIN_ROOT}/bin)



set(OSXCROSS_HOST aarch64-linux-android21.4)
#set(OSXCROSS_SDK  ${ANDROID_TOOLCHAIN_ROOT}/sysroot)
set(OSXCROSS_SDK  ${ANDROID_TOOLCHAIN_ROOT})


#set(CMAKE_SYSTEM_NAME "Android")
#set(CMAKE_SYSTEM_NAME "android")
#string(REGEX REPLACE "-.*" "" CMAKE_SYSTEM_PROCESSOR "${OSXCROSS_HOST}")
#set(CMAKE_SYSTEM_PROCESSOR "armv8a")
#set(CMAKE_SYSTEM_PROCESSOR "arm")
#set(CMAKE_SYSTEM_VERSION 30)

#set(ANDROID_SDK_ROOT ${ANDROID_TOOLCHAIN_ROOT}/sysroot)
set(ANDROID_HOME ${ANDROID_TOOLCHAIN_ROOT})

set(CMAKE_ANDROID_STANDALONE_TOOLCHAIN ${ANDROID_TOOLCHAIN_ROOT})
set(CMAKE_SYSROOT ${ANDROID_TOOLCHAIN_ROOT}/sysroot)
set(CMAKE_C_COMPILER ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android21-clang)
set(CMAKE_CXX_COMPILER ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android21-clang++)
set(CMAKE_AR ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-ar)
set(CMAKE_RANLIB ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-ranlib)
set(CMAKE_LD ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-ld)
set(CMAKE_ASM_COMPILER ${ANDROID_TOOLCHAIN_BIN_PATH}/aarch64-linux-android-as)


set(CMAKE_FIND_ROOT_PATH
  "${OSXCROSS_SDK}"
)



# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


#set(ENV{OPENCV_IPP_PATH} /home/user1/workspaces/opencv-4.x/build/3rdparty/ippicv/ippicv_lnx)
#set(CMAKE_BUILD_TYPE Release)


