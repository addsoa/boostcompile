sim_sdk_path=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk
stage_path=/Users/bsl/zf/workspaces/lib/darwin/iphone/lib
build_path=/Users/bsl/zf/workspaces/build

./tools/build/b2 \
        --toolset=darwin-testiphonesim architecture=x86 target-os=iphone \
        link=static runtime-link=static \
        variant=release \
        --with-stacktrace \
         -d2