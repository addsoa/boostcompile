
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -std=c++11")
include(/home/user1/workspaces/buildconfigs/toolchain_config.cmake)

# build target
set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build")

# other options
set(ENABLE_PIC 1)
set(BUILD_SHARED_LIBS 0)

set(BUILD_DOCS 0)
set(BUILD_opencv_js 0)
set(BUILD_PERF_TEST 0)
set(BUILD_FAT_JAVA_LIB 0)
set(BUILD_ANDROID_SERVICE 0)
set(BUILD_JAVA 0)
set(BUILD_OBJC 0)
set(BUILD_KOTLIN_EXTENSIONS 0)
set(BUILD_opencv_apps 0)

set(INSTALL_PYTHON_EXAMPLES 0)
set(INSTALL_ANDROID_EXAMPLES 0)
set(INSTALL_TO_MANGLED_PATHS 0)

set(CV_TRACE 1)

set(OPENCV_README_FILE 0)
set(OPENCV_LICENSE_FILE 0)

set(OPENCV_FORCE_3RDPARTY_BUILD 1)
set(BUILD_PERF_TESTS 0)
set(BUILD_TESTS 0)
set(BUILD_WITH_DYNAMIC_IPP 0)

set(ENV{OPENCV_IPP_PATH} /home/user1/workspaces/opencv-4.x/build/3rdparty/ippicv/ippicv_mac)


# opencl deprecated
set(WITH_OPENCL 0)
set(WITH_LAPACK 0)
set(BUILD_ANDROID_EXAMPLES 0)
set(INSTALL_ANDROID_EXAMPLES 0)

# TODO: big endian for arm
#set(WORDS_BIGENDIAN 0)
# libtiff
#set(bigendian 0)
# openjpeg
#set(OPJ_BIG_ENDIAN 0)


if(BUILD_MAC_LIB)
    set(APPLE 1)
    set(IOS 0)
    set(ANDROID 0)
    set(UNIX 0)

    set(WORDS_BIGENDIAN 0)
    # libtiff
    set(bigendian 0)
    # openjpeg
    set(OPJ_BIG_ENDIAN 0)
endif()
if(BUILD_ANDROID_LIB)
    set(APPLE 0)
    set(IOS 0)
    set(ANDROID 1)
    set(UNIX 0)

    set(WORDS_BIGENDIAN 1)
    # libtiff
    set(bigendian 1)
    # openjpeg
    set(OPJ_BIG_ENDIAN 1)
endif()
if(BUILD_IOSSIM_LIB)
    set(APPLE 1)
    set(IOS 1)
    set(ANDROID 0)
    set(UNIX 0)

    set(WORDS_BIGENDIAN 0)
    # libtiff
    set(bigendian 0)
    # openjpeg
    set(OPJ_BIG_ENDIAN 0)
endif()
if(BUILD_IOS_LIB)
    set(APPLE 1)
    set(IOS 1)
    set(ANDROID 0)
    set(UNIX 0)

    set(WORDS_BIGENDIAN 1)
    # libtiff
    set(bigendian 1)
    # openjpeg
    set(OPJ_BIG_ENDIAN 1)
endif()


#
#set(OPENCV_EXTRA_FLAGS "${OPENCV_EXTRA_FLAGS_DEBUG} -stdlib=libstdc++")

