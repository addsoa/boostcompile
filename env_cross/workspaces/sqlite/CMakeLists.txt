

project(sqliteproj)
cmake_minimum_required(VERSION 3.14.0 FATAL_ERROR)

set(CMAKE_CXX_FLAGS "-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden ${TARGET_EXTRA_CXXFLAGS}") 
set(CMAKE_C_FLAGS "-fPIC -fvisibility=hidden -fvisibility-inlines-hidden ${TARGET_EXTRA_CFLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O3 ${TARGET_EXTRA_CXXFLAGS}") 
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} -O3 ${TARGET_EXTRA_CFLAGS}") 
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -g ${TARGET_EXTRA_CXXFLAGS}") 
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} -g ${TARGET_EXTRA_CFLAGS}") 
#set(CMAKE_C_FLAGS_DEBUG "-fPIC -fvisibility=hidden -fvisibility-inlines-hidden ${TARGET_EXTRA_CFLAGS} ${CMAKE_C_FLAGS_DEBUG}")
set(MAKE_STATIC_LINKER_FLAGS "-Wl --no-undefined")
include (/home/user1/workspaces/buildconfigs/toolchain_config.cmake)

# export PATH
set(ENV{PATH} ${ORIG_PATH}:${TOOLCHAIN_BIN_PATH})


#message(WARNING ${CMAKE_C_FLAGS_DEBUG})
#message(WARNING ${CMAKE_CXX_FLAGS_DEBUG})
#message(WARNING ${CMAKE_C_FLAGS_RELEASE})
#message(WARNING ${CMAKE_CXX_FLAGS_RELEASE})
message(WARNING ${CMAKE_BUILD_TYPE})

#aux_source_directory(. SQLITE_SRC)
#add_library(sqlite ${SQLITE_SRC})
add_library(sqlite sqlite3.c)

# end of export PATH
set(ENV{PATH} ${ORIG_PATH})

