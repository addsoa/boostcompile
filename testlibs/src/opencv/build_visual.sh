OPCV_LIB_PATH=/Users/bsl/zf/workspaces/testlibs/libs/maclibs/opencv

#--sysroot=/home/user1/tools/toolchains/mac/macos12/SDK/MacOSX12.3.sdk  \

clang++ \
-std=c++11 \
-I/Users/bsl/zf/workspaces/testlibs/include \
-fsigned-char \
-W -Wall -Wreturn-type -Wnon-virtual-dtor -Waddress -Wsequence-point -Wformat -Wformat-security -Wmissing-declarations \
-Wmissing-prototypes -Wstrict-prototypes -Wundef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo \
-Wuninitialized -Winconsistent-missing-override -Wno-delete-non-virtual-dtor -Wno-unnamed-type-template-args \
-Wno-comment -Wno-deprecated-enum-enum-conversion -Wno-deprecated-anon-enum-enum-conversion \
-fdiagnostics-show-option -Wno-long-long -Qunused-arguments -Wno-semicolon-before-method-body \
-ffunction-sections -fdata-sections  -fvisibility=hidden -fvisibility-inlines-hidden \
-O3 -DNDEBUG  -DNDEBUG -Wl,-headerpad_max_install_names   -Wl,-dead_strip \
./opencv_visualisation.cpp \
-o ./opencv_visualisation \
 $OPCV_LIB_PATH/libopencv_highgui.a \
 $OPCV_LIB_PATH/libopencv_imgproc.a \
 $OPCV_LIB_PATH/libopencv_videoio.a \
 $OPCV_LIB_PATH/libopencv_imgcodecs.a \
 -framework Accelerate \
 -framework AVFoundation \
 -framework CoreGraphics -framework CoreMedia \
 -framework CoreVideo -framework QuartzCore \
 $OPCV_LIB_PATH/libopencv_imgproc.a \
 $OPCV_LIB_PATH/libopencv_core.a \
 -framework OpenCL \
 -framework Accelerate \
 -lm -ldl \
 $OPCV_LIB_PATH/3rdparty/libittnotify.a \
 -ldl \
 $OPCV_LIB_PATH/3rdparty/liblibjpeg-turbo.a \
 $OPCV_LIB_PATH/3rdparty/liblibwebp.a \
 $OPCV_LIB_PATH/3rdparty/liblibpng.a \
 $OPCV_LIB_PATH/3rdparty/liblibtiff.a \
 $OPCV_LIB_PATH/3rdparty/liblibopenjp2.a \
 -lm \
 $OPCV_LIB_PATH/3rdparty/libIlmImf.a \
 -framework AppKit \
 $OPCV_LIB_PATH/3rdparty/libzlib.a \
 -framework Cocoa
