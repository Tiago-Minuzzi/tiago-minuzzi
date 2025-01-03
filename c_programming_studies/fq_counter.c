#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int main(int argc, char **argv) {
  FILE *f;
  char *entrada;
  char linha[MAX_LINE_LENGTH];

  int indice = 0;
  size_t total_bases = 0;
  size_t total_linhas = 0;
  size_t read_len = 0;

  entrada = argv[1];

  if (argc > 2) {
    printf(">>> Error reading file.\n");
    printf("    Usage: %s FILE\n", argv[0]);
    exit(1);
  }

  if (argc == 2) {
    f = fopen(entrada, "r");
  } else {
    f = stdin;
  }

  while (fgets(linha, MAX_LINE_LENGTH, f)) {
    indice++;
    if ((indice % 4) == 2) {
      read_len = strlen(linha) - 1;
      total_bases += read_len;
      total_linhas++;
    }
  }
  if (argc < 2) {
    printf("%d\t%lld\n", total_linhas, total_bases);
  } else {
    printf("%s\t%d\t%lld\n", entrada, total_linhas, total_bases);
  }

  if (argc == 2) {
    fclose(f);
  }

  return 0;
}
