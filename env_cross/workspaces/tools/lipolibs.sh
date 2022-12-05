#!/usr/bin/bash

LIPOTOOL=/home/user1/tools/toolchains/mac/macos12/bin/lipo

LIB_PATH=/home/user1/workspaces/libs/debug
TARGET_LIB_PATH=$LIB_PATH/fatios
IOS_PATH=$LIB_PATH/ios/ios15
SIM_PATH=$LIB_PATH/iossim/sim15

pushd $IOS_PATH
for aFile in `find  ./ -name "*.a"`
	do echo $aFile
	simFile=$SIM_PATH/$aFile
	echo "sim file $simFile"
	libName=`echo "$aFile" | rev | cut -d"/" -f1 | rev`
	dirName="$(dirname "$aFile")"
	echo "file name $libName"
	echo "dir name $dirName"
	mkdir -p $TARGET_LIB_PATH/$dirName
	$LIPOTOOL -create $aFile $simFile -o $TARGET_LIB_PATH/$dirName/$libName
done
popd
