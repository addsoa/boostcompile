//
// Created by Acer on 2022/11/3.
//

#ifndef TESTNC0_STRGEN_H
#define TESTNC0_STRGEN_H

#include <string>
#include <vector>
//struct AtomicDummy {
//    char a[128];
//};

class StrGen {
public:
   static std::string GenStr() ;

   static std::string GenVecStr (const std::vector<int>& data);
};




#endif //TESTNC0_STRGEN_H
