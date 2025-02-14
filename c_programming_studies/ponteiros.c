#include <ctype.h>
#include <stdio.h>

int main(void) {

  char palavra[] = "za warudo";
  char *ptr = palavra;

  printf("%s\n", palavra);

  while (*ptr != '\0') {
    *ptr = toupper(*ptr);
    *ptr++;
  }

  printf("%s\n", palavra);

  return 0;
}
