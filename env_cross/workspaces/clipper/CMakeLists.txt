#include (/home/user1/tools/scripts/buildconfigs/toolchain_config.cmake)


project(clipperlib)

include (/home/user1/workspaces/buildconfigs/toolchain_config.cmake)
set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden") 

set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")

#set(CMAKE_SYSTEM_NAME Mac)
#set(CMAKE_SYSTEM_PROCESSOR x86_64)

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)


#message(STATUS "ar = ${CMAKE_CXX_COMPILER_AR}")

aux_source_directory(. CLIPPER_SRC)
add_library(clipper ${CLIPPER_SRC})

set(ENV{PATH} ${ORIG_PATH})

