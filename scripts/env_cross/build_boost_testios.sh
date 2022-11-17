#!/bin/bash

BOOST_SRC_PATH=/home/user1/workspaces/boost_1_75_0/
BOOST_STAGE_PATH=/home/user1/workspaces/libs/ios/ios15/boost75
IOS_SDK_PATH=/home/user1/tools/toolchains/ios/ios15/SDK/iPhoneOS15.4.sdk/

cd $BOOST_SRC_PATH/tools/build/; ./bootstrap.sh

cd $BOOST_SRC_PATH; ./tools/build/b2  \
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot $IOS_SDK_PATH " \
    cflags="-fPIC" \
    linkflags="-isysroot $IOS_SDK_PATH " \
    define=BOOST_THREAD_TEST=1 \
    toolset=clang-testios \
    target-os=iphone \
    architecture=arm \
    variant=release \
    --layout=versioned \
    threading=multi \
    threadapi=pthread \
    link=static \
    runtime-link=static \
    --stagedir=$BOOST_STAGE_PATH \
    --with-atomic \
    --with-filesystem \
    -d2
