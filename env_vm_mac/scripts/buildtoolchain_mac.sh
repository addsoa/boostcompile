#!/bin/bash

OSXROSS_PATH=/home/user1/tools/sdksrcs/osxcross-master

cd $OSXROSS_PATH; \
	BUILD_DIR=$OSXROSS_PATH/build \
	TARGET_DIR=/home/user1/tools/toolchains/mac/macos12 \
	SDK_DIR=/home/user1/tools/sdksrcs/osxcross-master/tarballs \
	GIT_SRC_PATH=/home/user1/tools/sdksrcs/git_packages \
	./build.sh
