#include "boosttest.h"

#include <string>
#include <iostream>

int main(int argc, char** argv) {
  auto s = boostbuildtest::Tester::Test();

  for (const auto& rc: s) {
    std::cout << rc << std::endl;
  }
}
