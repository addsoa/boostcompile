clang++ \
-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden \
-I/Users/bsl/zf/workspaces/testlibs/include/modbus \
-L/Users/bsl/zf/workspaces/testlibs/libs/maclibs \
./testmodbus.cpp \
/Users/bsl/zf/workspaces/testlibs/libs/maclibs/libmodbus.a  \
-o test_modbus


