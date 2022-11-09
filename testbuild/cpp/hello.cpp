#include <string>
#include <vector>
#include <iostream>

#include "strgen.h"
#include "strgentemp.hpp"

#include "sharedlibtest/foo.h"

#include "staticboosttest/boosttest.h"

int main() {
    auto newHello = GenStrTemp::GenStr(boostbuildtest::Tester::Test(), "\n");
    std::cout << newHello << std::endl;

    return 0;
}
