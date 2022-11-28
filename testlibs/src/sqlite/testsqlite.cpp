#include <sqlite/sqlite3.h>
#include <stdio.h>

int main() {
  int rc = sqlite3_stricmp("222", "222");
  printf("Result = %d \n", rc);
}
