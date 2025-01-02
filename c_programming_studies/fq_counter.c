#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int main(int argc, char **argv){
    FILE *f;
    char linha[MAX_LINE_LENGTH];

    int indice = 0;
    int total_bases = 0;
    int total_linhas = 0;
    size_t read_len = 0;

    if (argc > 2) {
        printf(">>> Error reading file.\n");
        printf("    Usage: %s FILE\n", argv[0]);
        exit(1);
    }

    if (argc == 2) {
        f = fopen(argv[1], "r");
    } else {
        f = stdin;
    }

    while (fgets(linha, MAX_LINE_LENGTH, f)){
        indice++;
        if ((indice % 4) == 2) {
            read_len = strlen(linha);
            total_bases += read_len;
            total_linhas++;
        }
    }
    if (argv[1] == NULL) {
      printf("%d\t%d\n", total_linhas, total_bases);
    } else {
      printf("%s\t%d\t%d\n", argv[1], total_linhas, total_bases);
    }

    if (argc == 2) {
        fclose(f);
    }

    return 0;
}
