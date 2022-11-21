include (/home/user1/tools/scripts/buildconfigs/mac_toolchain.cmake)
#include (/home/user1/tools/scripts/buildconfigs/iossim_toolchain.cmake)
#include (/home/user1/tools/scripts/buildconfigs/android_toolchain.cmake)
#include (/home/user1/tools/scripts/buildconfigs/ios_toolchain.cmake)


project(lzmasdk)

#set(CMAKE_SYSTEM_NAME Mac)
#set(CMAKE_SYSTEM_PROCESSOR x86_64)

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

#zf: win project requires O3
set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -O3") 
set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")


set(LZMA_SRC Alloc.c LzFind.c LzFindMt.c LzmaDec.c LzmaEnc.c LzmaLib.c Threads.c)

add_library(lzma ${LZMA_SRC})
