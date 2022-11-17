#!/bin/bash

BOOST_SRC_PATH=/home/user1/workspaces/boost_1_75_0/
BOOST_STAGE_PATH=/home/user1/workspaces/libs/iossim/sim15/boost75/

cd $BOOST_SRC_PATH/tools/build/; ./bootstrap.sh

cd $BOOST_SRC_PATH; ./tools/build/b2  \
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/iossim/iossim15/SDK/iPhoneSimulator15.4.sdk/" \
    cflags="-fPIC" \
    linkflags="-isysroot /home/user1/tools/toolchains/iossim/iossim15/SDK/iPhoneSimulator15.4.sdk/" \
    define=BOOST_THREAD_TEST=1 \
    toolset=clang-testiossim \
    target-os=iphone \
    architecture=x86 \
    variant=release \
    --layout=versioned \
    threading=multi \
    threadapi=pthread \
    link=static \
    runtime-link=static \
    --stagedir=$BOOST_STAGE_PATH \
    --with-filesystem \
    -d2
