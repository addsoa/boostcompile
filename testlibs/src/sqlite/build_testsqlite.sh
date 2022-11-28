
clang++ \
-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden \
-I/Users/bsl/zf/workspaces/testlibs/include \
-L/Users/bsl/zf/workspaces/testlibs/libs/maclibs \
./testsqlite.cpp \
/Users/bsl/zf/workspaces/testlibs/libs/maclibs/libsqlite.a  \
-o test_sqlite


