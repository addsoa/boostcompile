# For more information about using CMake with Android Studio, read the
# documentation: https://d.android.com/studio/projects/add-native-code.html

# Sets the minimum version of CMake required to build the native library.

cmake_minimum_required(VERSION 3.18.1)

# Declares and names the project.

project("testnc0")

## Set compiler
set(VERBOSE 1)
set(CMAKE_C_COMPILER /usr/bin/clang)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_FLAGS "-Wall -std=c++11 -D_GNU_SOURCE -fvisibility-inlines-hidden -fvisibility=hidden")

## TODO: boost_shared_path and lib path set
set(BOOST_PATH /Users/bsl/zf/workspaces)
set(BOOST_INC_PATH ${BOOST_PATH}/include)
set(BOOST_LIB_PATH ${BOOST_PATH}/lib/darwin/lib/)

include_directories(${BOOST_INC_PATH})

add_subdirectory(sharedlibtest)
add_subdirectory(staticboosttest)


# Creates and names a library, sets it as either STATIC
# or SHARED, and provides the relative paths to its source code.
# You can define multiple libraries, and CMake builds them for you.
# Gradle automatically packages shared libraries with your APK.

#add_library(
#        testnc0
#        SHARED
#        native-lib.cpp
#        strgen.cpp
#)

add_executable(hello hello.cpp strgen.cpp)

# Searches for a specified prebuilt library and stores the path as a
# variable. Because CMake includes system libraries in the search path by
# default, you only need to specify the name of the public NDK library
# you want to add. CMake verifies that the library exists before
# completing its build.
# suppose there is a log demo

# Specifies libraries CMake should link to your target library. You
# can link multiple libraries, such as libraries you define in this
# build script, prebuilt third-party libraries, or system libraries.

target_link_libraries( # Specifies the target library.
	hello
#        testnc0

#        libboost_atomic

        testshared
        boostusage
        # Links the target library to the log library
        # included in the NDK.
#        ${log-lib}
)
