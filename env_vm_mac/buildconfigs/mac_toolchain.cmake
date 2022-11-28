set(MAC_TOOLCHAIN_ROOT /home/user1/tools/toolchains/mac/macos12)
set(MAC_TOOLCHAIN_BIN_PATH ${MAC_TOOLCHAIN_ROOT}/bin)


set(OSXCROSS_HOST x86_64-apple-darwin21.4)
set(OSXCROSS_TARGET_DIR /home/user1/tools/toolchains/mac/macos12/)
set(OSXCROSS_SDK /home/user1/tools/toolchains/mac/macos12/SDK/MacOSX12.3.sdk/)
#osxcross_getconf(OSXCROSS_HOST)
#osxcross_getconf(OSXCROSS_TARGET_DIR)
#osxcross_getconf(OSXCROSS_TARGET)
#osxcross_getconf(OSXCROSS_SDK)

set(CMAKE_SYSTEM_NAME "Darwin")
string(REGEX REPLACE "-.*" "" CMAKE_SYSTEM_PROCESSOR "${OSXCROSS_HOST}")


set(CMAKE_SYSROOT ${MAC_TOOLCHAIN_ROOT}/SDK/MacOSX12.3.sdk)
set(CMAKE_C_COMPILER ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-clang)
set(CMAKE_CXX_COMPILER ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-clang++)
#set(CMAKE_CXX_COMPILER_AR ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ar)
#set(CMAKE_CXX_COMPILER_RANLIB ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ranlib)
set(CMAKE_AR ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ar)
set(CMAKE_RANLIB ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ranlib)
set(CMAKE_LD ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-ld)
set(CMAKE_ASM_COMPILER ${MAC_TOOLCHAIN_BIN_PATH}/x86_64-apple-darwin21.4-as)


# where is the target environment
set(CMAKE_FIND_ROOT_PATH
  "${OSXCROSS_SDK}"
  "${OSXCROSS_TARGET_DIR}/macports/pkgs/opt/local")

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


#set(CMAKE_BUILD_TYPE Debug)
#set(CMAKE_BUILD_TYPE Release)

# CMakeLists.txt
#set(WORDS_BIGENDIAN 0) 
# libtiff
#set(bigendian 0)
# openjpeg
#set(OPJ_BIG_ENDIAN 0)

#set(ENV{OPENCV_IPP_PATH} /home/user1/workspaces/opencv-4.x/build/3rdparty/ippicv/ippicv_mac)


#find_path(malloc.h $(OSXCROSS_SDK)/usr/include/malloc/)
#list(APPEND CMAKE_INCLUDE_PATH ${OSXCROSS_SDK}/usr/include/malloc/)

