#include <jni.h>
#include <string>
#include <vector>

#include "strgen.h"
#include "strgentemp.hpp"

#include "sharedlibtest/foo.h"
//#include "boosttest/atomictest.h"

//#include <boost/atomic.hpp>

#include "staticboosttest/boosttest.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_testnc0_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {

    auto newHello = GenStrTemp::GenStr(boostbuildtest::Tester::Test(), "\n");

//    std::string newHello {"End of test"};
    return env->NewStringUTF(newHello.c_str());
}