#include (/home/user1/tools/scripts/buildconfigs/toolchain_config.cmake)
include (/home/user1/workspaces/buildconfigs/toolchain_config.cmake)


project(ibiconv)

#set(CMAKE_SYSTEM_NAME Mac)
#set(CMAKE_SYSTEM_PROCESSOR x86_64)

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden") 
set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")

#message(STATUS "ar = ${CMAKE_CXX_COMPILER_AR}")
include_directories(./)
include_directories(./include)

#file(GLOB ICONV_SRC "*.def")
set(ICONV_SRC ./iconv.c ./localcharset.c ./relocatable.c)
add_library(iconv ${ICONV_SRC})

set(ENV{PATH} ${ORIG_PATH})

