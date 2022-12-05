# $1:  build target

if [ $# -ne  1 ]
then
	echo "unknow build type: BUILD_MAC_LIB/BUILD_IOS_LIB/BUILD_IOSSIM_LIB/BUILD_ANDROID_LIB"
	exit 1
fi

TARGET_PATH=""
BUILD_TYPE=$1

if [ $BUILD_TYPE = "BUILD_MAC_LIB" ]
then
	echo "build for mac"
	TARGET_PATH=/home/user1/workspaces/libs/debug/mac
elif [ $BUILD_TYPE = "BUILD_IOS_LIB" ]
then
	echo "build for ios"
	TARGET_PATH=/home/user1/workspaces/libs/debug/ios/ios15
elif [ $BUILD_TYPE = "BUILD_IOSSIM_LIB" ]
then
       	echo "build for iossim"
       	TARGET_PATH=/home/user1/workspaces/libs/debug/iossim/sim15 
elif [ $BUILD_TYPE = "BUILD_ANDROID_LIB" ]
then 
	echo "build for android"
	TARGET_PATH=/home/user1/workspaces/libs/debug/android/r21
else
	echo "unknow build type: BUILD_MAC_LIB/BUILD_IOS_LIB/BUILD_IOSSIM_LIB/BUILD_ANDROID_LIB"
	exit 1
fi

mkdir -p $TARGET_PATH
echo "copy all libraries into $TARGET_PATH"


WORKSPACE_PATH=/home/user1/workspaces

BOOST_SRC_PATH=$WORKSPACE_PATH/boost_1_75_0
BOOST_TARGET_PATH=$TARGET_PATH/boost75
mkdir -p $BOOST_TARGET_PATH

mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_atomic*.a $BOOST_TARGET_PATH/libboost_atomic.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_chrono*.a $BOOST_TARGET_PATH/libboost_chrono.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_container*.a $BOOST_TARGET_PATH/libboost_container.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_date_time*.a $BOOST_TARGET_PATH/libboost_date_time.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_filesystem*.a $BOOST_TARGET_PATH/libboost_filesystem.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_iostreams*.a $BOOST_TARGET_PATH/libboost_iostreams.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_json*.a $BOOST_TARGET_PATH/libboost_json.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_stacktrace_basic*.a $BOOST_TARGET_PATH/libboost_stacktrace_basic.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_stacktrace_noop*.a $BOOST_TARGET_PATH/libboost_stacktrace_noop.a
mv /home/user1/workspaces/boost_1_75_0/stage/lib/libboost_thread*.a $BOOST_TARGET_PATH/libboost_thread.a

CLIPPER_SRC_PATH=$WORKSPACE_PATH/clipper/build
CLIPPER_TARGET_PATH=$TARGET_PATH
mv $CLIPPER_SRC_PATH/libclipper.a $CLIPPER_TARGET_PATH

LIBICONV_SRC_PATH=$WORKSPACE_PATH/libiconv/build
LIBICONV_TARGET_PATH=$TARGET_PATH
mv $LIBICONV_SRC_PATH/libiconv.a $LIBICONV_TARGET_PATH

LIBMODBUS_SRC_PATH=$WORKSPACE_PATH/libmodbus/build/lib
LIBMODBUS_TARGET_PATH=$TARGET_PATH
mv $LIBMODBUS_SRC_PATH/libmodbus.a $LIBMODBUS_TARGET_PATH

LZMA_SRC_PATH=$WORKSPACE_PATH/lzma/build
LZMA_TARGET_PATH=$TARGET_PATH/
mv $LZMA_SRC_PATH/liblzma.a $LZMA_TARGET_PATH

SQLITE_SRC_PATH=$WORKSPACE_PATH/sqlite/build
SQLITE_TARGET_PATH=$TARGET_PATH/
mv $SQLITE_SRC_PATH/libsqlite.a $SQLITE_TARGET_PATH

OPENCV_SRC_PATH=$WORKSPACE_PATH/opencv-4.x/build
OPENCV_TARGET_PATH=$TARGET_PATH/opencv/
mkdir -p $OPENCV_TARGET_PATH
mkdir -p $OPENCV_TARGET_PATH/3rdparty
mv $OPENCV_SRC_PATH/lib/*.a $OPENCV_TARGET_PATH/
mv $OPENCV_SRC_PATH/3rdparty/lib/*.a $OPENCV_TARGET_PATH/3rdparty/
pushd $OPENCV_TARGET_PATH/3rdparty/
for files in `ls liblib*.a`
 do echo "$files"
 mv $files `echo $files | sed 's/liblib/lib/'`
done
popd

echo "end of move "
