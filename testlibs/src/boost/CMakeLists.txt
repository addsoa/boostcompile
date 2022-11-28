project(boostbuildtest)

cmake_minimum_required(VERSION 3.23)


## Set compiler
set(VERBOSE 1)
set(CMAKE_C_COMPILER /usr/bin/clang)
set(CMAKE_CXX_COMPILER /usr/bin/clang++)
set(CMAKE_CXX_FLAGS "-Wall -std=c++11 -D_GNU_SOURCE -fvisibility-inlines-hidden -fvisibility=hidden")


include_directories(/Users/bsl/zf/workspaces/testlibs/include)
link_directories(/Users/bsl/zf/workspaces/testlibs/libs/maclibs/boost)

##z is for libz for iostream test
#target_link_libraries(boostusage 
add_executable(boostusage boosttest.cpp main.cpp)
target_link_libraries(boostusage
					boost_atomic
                                        boost_filesystem
                                        boost_container
                                        boost_date_time
                                        z boost_iostreams
	                                boost_json
        #                                # suppose they are used alternatively
        #                                boost_stacktrace_basic
                                        boost_stacktrace_noop
                                        boost_thread
        )

