#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int main(int argc, char **argv){
    FILE *f;
    char linha[MAX_LINE_LENGTH];

    if (argc != 2) {
        printf(">>> Error reading argument.\n");
        printf("    Usage: %s <ARGUMENT>\n", argv[0]);
        exit(1);
    } else {
        int indice = 0;
        int total_linhas = 0;
        int total_bases = 0;

        f = fopen(argv[1], "r");

        while (fgets(linha, MAX_LINE_LENGTH, f)){
            indice++;
            if ((indice % 4) == 2) {
                // printf("%s", linha);
                // printf("%d\n", strlen(linha));
                total_linhas++;
                total_bases += strlen(linha);
            }
        }
        printf("%d\t%d\n", total_linhas, total_bases);
    }

    fclose(f);
    return 0;
}
