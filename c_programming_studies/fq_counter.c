#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE_LENGTH 256

int main(int argc, char **argv){
    FILE *f;
    char linha[MAX_LINE_LENGTH];

    if (argc != 2) {
        printf(">>> Error reading file.\n");
        printf("    Usage: %s FILE\n", argv[0]);
        exit(1);
    } else {
        int indice = 0;
        int total_bases = 0;
        int total_linhas = 0;

        char *nome = argv[1];

        f = fopen(nome, "r");

        while (fgets(linha, MAX_LINE_LENGTH, f)){
            indice++;
            if ((indice % 4) == 2) {
                // printf("%s", linha);
                // printf("%d\n", strlen(linha));
                total_bases += strlen(linha);
                total_linhas++;
            }
        }
        printf("%s\t%d\t%d\n", nome, total_linhas, total_bases);
    }

    fclose(f);
    return 0;
}
