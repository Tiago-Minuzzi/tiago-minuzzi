#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv){

  char *itens[] = {"foo", "bar", "xpto"};
  int n = sizeof(itens) / sizeof(itens[0]);

  srand(time(NULL));
  int i = rand() % n;

  printf("%s\n", itens[i]);

  return 0;

}
