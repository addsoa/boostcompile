./tools/build/b2  cxxflags="-fPIC -std=c++11 -fvisibility=hidden -fvisibility-inlines-hidden" cflags=-fPIC define=BOOST_THREAD_TEST=1 \
         toolset=clang target-os=darwin architecture=x86 variant=release \
        --build-dir=/Users/bsl/zf/workspaces/boost_1_75_0/build --stagedir=/Users/bsl/zf/workspaces/lib/darwin \
        threading=multi link=static runtime-link=static \
        --with-atomic \
        --with-chrono \
        --with-container \
        --with-date_time \
        --with-filesystem \
        --with-iostreams \
        --with-json \
        --with-stacktrace \
        --with-thread \
        -d2

