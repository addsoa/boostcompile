//
// Created by Acer on 2022/11/3.
//

#ifndef TESTNC0_FOO_H
#define TESTNC0_FOO_H

#include <string>
#include <vector>
#include <ostream>

class Foo {
private:
    const int index;
    float value;

public:
    Foo(int i, float v = 0);
    ~Foo() = default;
    //other ctors

    static std::vector<Foo> GenFoos(int startIndex, std::size_t num, float v);

    friend std::ostream& operator << (std::ostream& os, const Foo& foo);
};

//std::ostream& operator<< (std::ostream& os, const Foo& foo) {
//    os << foo.index << " = " << foo.value << std::endl;
//    return os;
//}


#endif //TESTNC0_FOO_H
