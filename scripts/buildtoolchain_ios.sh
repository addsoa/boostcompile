#!/bin/bash

TOOLCHAIN_PATH=/home/user1/tools/toolchains
SDK_SRC_PATH=/home/user1/tools/sdksrcs
CCTOOL_PATH=$SDK_SRC_PATH/cctools-ios-port/usage_examples/ios_toolchain/
PACKAGE_PATH=$SDK_SRC_PATH/packages
GIT_SRC_PATH=$SDK_SRC_PATH/git_packages/

cd $CCTOOL_PATH; \
	CCTOOLS_IOS_DEV=$GIT_SRC_PATH \
	TARGETDIR=$TOOLCHAIN_PATH/ios/ios15/ \
	./build.sh \
	$PACKAGE_PATH/iPhoneOS15.4.sdk.tar.xz \
	arm64

