#include <stdio.h>
#include <regex.h>

void main() {

    regex_t regex;
    int comp;

    // compile regular expression
    comp = regcomp(&regex,"^tc.*ct[ag][ag]$",0);

    char *sequencias[] = { "tctgactgtagcctaa", "cttagctgactatagcctaa", "tctgactgtagctgagcggaact", "tctttaaagggcccctga" };
    int tamanho = sizeof(sequencias) / sizeof(sequencias[0]);

    for(int i = 0; i < tamanho; i++) {
        comp = regexec(&regex, sequencias[i], 0, NULL, 0); // execute regular expression
        if (!comp) {
            printf("Com match\n");
            printf("%s\n\n",sequencias[i]);
        } else {
            printf("Sem match\n");
            printf("%s\n\n",sequencias[i]);
        }
    }

    regfree(&regex); // free memory allocated by pattern
}
