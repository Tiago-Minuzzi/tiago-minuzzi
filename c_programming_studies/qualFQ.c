#include <stdio.h>
#include <stdlib.h>

#define MAX_LINE_LEN 300
#define PHRED_OFFSET 33
#define PHRED_MAX 41

int main(int argc, char **argv)
{
    FILE *f;

    if (argc != 2) {
        printf(">>> Invalid number of arguments!");
        printf("Usage:\n\t%s <FASTQ>\n", argv[0]);
        exit(1);
    }

    f = fopen(argv[1],  "r");
    if(!f){
        printf(">>> File not found!\n");
        exit(1);
    }

    char buff[MAX_LINE_LEN];
    int phredCounter[MAX_LINE_LEN][PHRED_MAX] = {0}; // inicializa para não deixar lixo na memória. A matriz vai conter zeros.

    int counter = 1;
    int lineIndex = 0;
    int andBit = 3;

    while (fgets(buff, MAX_LINE_LEN, f)) {
        int i = 0;

        if(counter == lineIndex){
            while(buff[i] != '\0' && buff[i] != '\n'){
                int phred = buff[i] - PHRED_OFFSET;
                if (phred >= 0 && phred < PHRED_MAX) {
                    phredCounter[i][phred]++;
                }
                i++;
            }
        }
        counter = (counter + 1) & andBit;
    }

    printf("pos,phred,count\n");
    for(int i = 0; i < MAX_LINE_LEN; i++){
        for (int j = 0; j < PHRED_MAX; j++) {
            if (phredCounter[i][j] > 0) {
                printf("%d,%d,%d\n", i, j, phredCounter[i][j]);
                // printf("%d,%c,%d\n", i, j + 33, phredCounter[i][j]); // printar ASCII character
            }
        }
    }

    fclose(f);
}
