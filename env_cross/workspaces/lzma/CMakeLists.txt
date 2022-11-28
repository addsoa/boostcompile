include (/home/user1/workspaces/buildconfigs/toolchain_config.cmake)


project(lzmasdk)

#set(CMAKE_SYSTEM_NAME Mac)
#set(CMAKE_SYSTEM_PROCESSOR x86_64)

cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

#zf: win project requires O3
set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -O3") 
set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")


#set(LZMA_SRC C/Alloc.c )
set(LZMA_SRC C/Alloc.c 
	C/LzFind.c 
	C/LzFindMt.c 
	C/LzmaDec.c 
        C/LzmaEnc.c  
	C/LzmaLib.c 
	C/Threads.c
)

add_library(lzma ${LZMA_SRC})

set(ENV{PATH} ${ORIG_PATH})

