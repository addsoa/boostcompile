/*
  copy from https://blog.csdn.net/superyao2008/artical/details/2527647
*/

#include <libiconv/iconv.h>
#include <string>
#include <iostream>

std::string convFromUTF8 (std::string s) {
  iconv_t cd = iconv_open("GBK", "UTF-8");
  if (cd == (iconv_t) -1) {
    return "";
  }
  
  size_t inlen = s.size();
  const char* inbuf = s.c_str();
  size_t outlen = inlen * 2;
  std::string result(outlen, 0);
  char* outbuf = (char*)result.c_str();
  int n = iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
  iconv_close(cd);

  if (n == 1) {
    return "";
  }

  return result;
}

int main() {
 auto s = convFromUTF8 ("TESTtest");
  std::cout << "converted " << s << std::endl;
}
