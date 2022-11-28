//
// Created by Acer on 2022/11/3.
//
#include "boosttest.h"

#include <boost/atomic.hpp>
#include <boost/contract.hpp>
#include <boost/date_time.hpp>
#include <boost/filesystem.hpp>
#include <boost/iostreams/filter/zlib.hpp>
#include <boost/container/pmr/unsynchronized_pool_resource.hpp>
#include <boost/json.hpp>
#include <boost/stacktrace.hpp>
//#include <boost/thread.hpp>

namespace boostbuildtest {
    std::string Tester::TestAtomic() {
        AtomicDummy dummy{};
        boost::atomic<AtomicDummy> aDummy;

        //lib required
        aDummy = dummy;
        aDummy.value();

        return "Atomic tested";
    }

    std::string Tester::TestChrono() {
        return "Nothing tested for chrono";
    }

    std::string Tester::TestContainer() {
        boost::container::pmr::unsynchronized_pool_resource dummy;

        return "Container tested";
    }

    std::string Tester::TestDateTime() {
        auto dummy = boost::date_time::nth_as_str(1);
        return "Date_time " + std::string(dummy) + " tested";
    }

    std::string Tester::TestFileSystem() {
        boost::filesystem::path curPath("/home/user1/test1/test2/test3");
        auto pPath = curPath.parent_path();

        return "Filesystem " + pPath.begin()->string() + " tested";
    }

    std::string Tester::TestIOStreams() {
        boost::iostreams::zlib_error a(-1);
        return "IOStreams tested";
    }

    std::string Tester::TestJson() {
        const static std::string prefix{"Jason tested: "};
        const boost::json::value value = boost::json::parse("{ \"test\": true }");
        try {
            auto sv = boost::json::value_to<std::string>(value.at("test"));
            return prefix + sv;
        } catch (...) {
            return prefix + "Not a string";
        }
    }

/*
    std::string Tester::TestStacktrace() {
        boost::stacktrace::stacktrace t;

        return "Stacktrace tested";
    }
*/

    std::string Tester::TestStacktraceNoop() {
       boost::stacktrace::frame f;

        return "Stacktrace noop tested";
    }
//
//    void ThreadDummyFunc::operator()() {
//        //nothing
//    }
//
    void ThreadDummyData::run() {
        std::string a{"do nothing"};
    }

    std::string Tester::TestThread() {
        ThreadDummyData d;

        return "Thread tested";
    }

    std::vector<std::string> Tester::Test() {
        std::vector<std::string> rc;

        rc.push_back(TestAtomic());
        rc.push_back(TestChrono());
        rc.push_back(TestContainer());
        rc.push_back(TestDateTime());
        rc.push_back(TestFileSystem());
        rc.push_back(TestIOStreams());
        rc.push_back(TestJson());
//        rc.push_back(TestStacktrace());
        rc.push_back(TestStacktraceNoop());
        rc.push_back(TestThread());

        return rc;
    }
}
