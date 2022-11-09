//
// Created by Acer on 2022/11/3.
//

#include "strgen.h"

#include <sstream>
#include <iterator>
#include <algorithm>

std::string StrGen::GenStr() {
    return "hello???";
}

std::string StrGen::GenVecStr(const std::vector<int>& data) {
    std::stringstream outputS;
    std::copy(data.begin(), data.end(), std::ostream_iterator<const int>(outputS, " "));

    return outputS.str();
}