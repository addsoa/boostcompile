//
// Created by Acer on 2022/11/3.
//

#include "foo.h"

Foo::Foo(int i, float v): index(i), value(v) {}

std::vector<Foo> Foo::GenFoos(int startIndex, std::size_t num, float v) {
    std::vector<Foo> rc;
    for (std::size_t i = 0; i < num; ++ i) {
        rc.emplace_back(startIndex + i, v);
    }

    return rc;
}

std::ostream& operator<< (std::ostream& os, const Foo& foo) {
    os << foo.index << " = " << foo.value << std::endl;
    return os;
}