#!/bin/bash

BOOST_SRC_PATH=/home/user1/workspaces/boost_1_75_0/
BOOST_STAGE_PATH=/home/user1/workspaces/libs/android/boost75/

cd $BOOST_SRC_PATH/tools/build/; ./bootstrap.sh

cd $BOOST_SRC_PATH; ./tools/build/b2  \
    cxxflags=-fPIC cflags=-fPIC define=BOOST_THREAD_TEST=1 \
    toolset=clang-testandroid \
    target-os=android \
    architecture=arm \
    variant=release \
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

