
clang++ \
-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden \
-I/Users/bsl/zf/workspaces/testlibs/include \
-L/Users/bsl/zf/workspaces/testlibs/libs/maclibs \
./testclipper.cpp \
/Users/bsl/zf/workspaces/testlibs/libs/maclibs/libclipper.a  \
-o test_clipper


