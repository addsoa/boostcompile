//
// Created by Acer on 2022/11/3.
//

#ifndef TESTNC0_BOOSTTEST_H
#define TESTNC0_BOOSTTEST_H

#include <string>
#include <vector>

#include <boost/thread.hpp>

namespace boostbuildtest {
    struct AtomicDummy {
        char a[128];
    };

    struct ThreadDummyData: public boost::detail::thread_data_base {
        virtual ~ThreadDummyData() = default;
        virtual void run();
    };


    //TODO: noexcept
    class Tester {
    private:
        static std::string TestAtomic();
        static std::string TestChrono();
        static std::string TestContainer();
        static std::string TestDateTime();
        static std::string TestFileSystem();
        static std::string TestIOStreams();
        static std::string TestJson();
//        static std::string TestStacktrace();
        static std::string TestStacktraceNoop();
        static std::string TestThread();

    public:
        static std::vector<std::string> Test() ;
    };
}

#endif //TESTNC0_BOOSTTEST_H
