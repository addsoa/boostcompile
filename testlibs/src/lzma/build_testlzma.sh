
clang++ \
-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden \
-I/Users/bsl/zf/workspaces/testlibs/include \
-L/Users/bsl/zf/workspaces/testlibs/libs/maclibs \
./testlzma.cpp \
/Users/bsl/zf/workspaces/testlibs/libs/maclibs/liblzma.a  \
-o test_lzma


