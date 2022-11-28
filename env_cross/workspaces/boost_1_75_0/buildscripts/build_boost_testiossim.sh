#!/bin/bash

VARIANT="release"
if [ $# -ne  1 ]
then
        echo "Variant = release by default "
fi

if [[ $1 = "release" ]]
then
        VARIANT=release
elif [[ $1 = "debug" ]]
then
        VARIANT=debug
else
        echo "unknown variant: release/debug"
        exit 1
fi

echo "to build variant = $VARIANT"


BOOST_SRC_PATH=/home/user1/workspaces/boost_1_75_0/
BOOST_STAGE_PATH=/home/user1/workspaces/libs/iossim/sim15/boost75/

#cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot /home/user1/tools/toolchains/iossim/iossim15/SDK/iPhoneSimulator15.4.sdk/" \
#linkflags="-isysroot /home/user1/tools/toolchains/iossim/iossim15/SDK/iPhoneSimulator15.4.sdk/" \
cd $BOOST_SRC_PATH/tools/build/; ./bootstrap.sh

cd $BOOST_SRC_PATH; ./tools/build/b2  \
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden " \
    cflags="-fPIC" \
    define=BOOST_THREAD_TEST=1 \
    toolset=clang-testiossim \
    target-os=iphone \
    architecture=x86 \
    variant=$VARIANT \
    --layout=versioned \
    threading=multi \
    threadapi=pthread \
    link=static \
    runtime-link=static \
    --stagedir=$BOOST_STAGE_PATH \
    --with-atomic \
    --with-chrono \
    --with-container \
    --with-date_time \
    --with-filesystem \
    --with-iostreams \
    --with-json \
    --with-stacktrace \
    --with-stacktrace \
    --with-thread \
    -d2
