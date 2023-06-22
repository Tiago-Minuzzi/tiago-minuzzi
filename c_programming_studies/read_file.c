#include <stdio.h>
#include <regex.h>

#define MAX_LINES 100
#define MAX_LEN 50

int main(void) {

    char linhas[MAX_LINES][MAX_LEN];

    FILE *arquivo; // Create a file pointer variable to allow us to access the file

    arquivo = fopen("arquivo.txt","r");

    if (arquivo == NULL) {
        printf("Erro ao abrir o arquivo\n");
        return 1; 
    }

    int linha = 0;

    while(!feof(arquivo) && !ferror(arquivo)) {
        if (fgets(linhas[linha], MAX_LEN, arquivo) != NULL) {
            linha++;
        }

    }
    fclose(arquivo);

    regex_t regex;
    int reit;
    reit = regcomp(&regex,"^tc.*ct[ag][ag]\n$",0);

    for (int i = 0; i < linha; i++) {
        reit = regexec(&regex, linhas[i], 0, NULL, 0);
        int indice = i + 1;

        if (!reit) {
            printf("Com match\n");
            printf("Seq %d - %s\n",indice,linhas[i]);
        } else {
            printf("Sem match\n");
            printf("Seq %d - %s\n",indice,linhas[i]);
        }
    }

    regfree(&regex);

    return 0;
}
