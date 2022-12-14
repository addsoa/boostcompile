#set(BUILD_MAC_LIB 1)
#set(BUILD_ANDROID_LIB 1)
#set(BUILD_IOSSIM_LIB 1)
#set(BUILD_IOS_LIB 1)


#set(CMAKE_BUILD_TYPE Debug)
#set(CMAKE_BUILD_TYPE Release)

#TODO: Recover orig_path
set(ORIG_PATH $ENV{PATH})
message(STATUS "get orig path ${ORIG_PATH}")

set(TARGET_LIB_PATH_BASE /home/user1/workspaces/libs)

set(BUILD_SCRIPTS_PATH /home/user1/workspaces/buildconfigs)

set(TOOLCHAIN_BIN_PATH "")

if(BUILD_MAC_LIB)
    include(${BUILD_SCRIPTS_PATH}/mac_toolchain.cmake)
    set(TOOLCHAIN_BIN_PATH ${MAC_TOOLCHAIN_BIN_PATH})
    # set(ENV{PATH} ${ORIG_PATH}:/home/user1/tools/toolchains/mac/macos12/bin/)
    # message(STATUS "get new path $ENV{PATH}")
    set(TARGET_LIB_PATH ${TARGET_LIB_PATH_BASE}/mac)
    message(STATUS "libs put into ${TARGET_LIB_PATH}")
endif()
if(BUILD_ANDROID_LIB)
    include(${BUILD_SCRIPTS_PATH}/android_toolchain.cmake)
    set(TOOLCHAIN_BIN_PATH ${ANDROID_TOOLCHAIN_BIN_PATH})
    #set(ENV{PATH} ${ORIG_PATH}:/home/user1/tools/toolchains/android/r21e/toolchain/bin/)
    #message(STATUS "get new path $ENV{PATH}")
    set(TARGET_LIB_PATH ${TARGET_LIB_PATH_BASE}/android/r21)
    message(STATUS "libs put into ${TARGET_LIB_PATH}")
endif()    
if(BUILD_IOSSIM_LIB)
    include(${BUILD_SCRIPTS_PATH}/iossim_toolchain.cmake)
    set(TOOLCHAIN_BIN_PATH ${IOSSIM_TOOLCHAIN_BIN_PATH})
    #    set(ENV{PATH} ${ORIG_PATH}:/home/user1/tools/toolchains/iossim/iossim15/bin/)
    #message(STATUS "get new path $ENV{PATH}")
    set(TARGET_LIB_PATH ${TARGET_LIB_PATH_BASE}/iossim/sim15)
    message(STATUS "libs put into ${TARGET_LIB_PATH}")
endif()    
if(BUILD_IOS_LIB)
    include(${BUILD_SCRIPTS_PATH}/ios_toolchain.cmake)
    set(TOOLCHAIN_BIN_PATH ${IOS_TOOLCHAIN_BIN_PATH})
    #set(ENV{PATH} ${ORIG_PATH}:/home/user1/tools/toolchains/ios/ios15/bin/)
    #message(STATUS "get new path $ENV{PATH}")
    set(TARGET_LIB_PATH ${TARGET_LIB_PATH_BASE}/ios/sim15)
    message(STATUS "libs put into ${TARGET_LIB_PATH}")
endif()    

