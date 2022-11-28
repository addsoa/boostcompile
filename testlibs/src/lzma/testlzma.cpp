#include <lzma/Alloc.h>
#include <stdio.h>

int main() {
  void* buf = MyAlloc(1024);
  MyFree(buf);
  printf("End of test \n");
}
