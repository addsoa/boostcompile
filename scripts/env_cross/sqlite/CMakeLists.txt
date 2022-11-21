#include (/home/user1/tools/scripts/buildconfigs/mac_toolchain.cmake)
#include (/home/user1/tools/scripts/buildconfigs/iossim_toolchain.cmake)
#include (/home/user1/tools/scripts/buildconfigs/android_toolchain.cmake)
include (/home/user1/tools/scripts/buildconfigs/ios_toolchain.cmake)


project(sqliteproj)

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -O3 ${TARGET_EXTRA_CXXFLAGS}") 
set(CMAKE_C_FLAGS "-fPIC -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -O3 ${TARGET_EXTRA_CFLAGS}")
set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")


#message(STATUS "ar = ${CMAKE_CXX_COMPILER_AR}")

aux_source_directory(. SQLITE_SRC)
add_library(sqlite ${SQLITE_SRC})
