#!/bin/bash

VARIANT="release"
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
#BOOST_STAGE_PATH=/home/user1/workspaces/libs/mac/boost75/
BOOST_STAGE_PATH=${BOOST_SRC_PATH}/stage

cd $BOOST_SRC_PATH/tools/build/; ./bootstrap.sh

#cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility-inlines-hidden " \
cd $BOOST_SRC_PATH; ./tools/build/b2  \
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden " \
    cflags=-fPIC define=BOOST_THREAD_TEST=1 \
    toolset=clang-testmac \
    target-os=darwin \
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
    --with-thread \
    -d2
