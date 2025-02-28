#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_READ_LEN 256

/*
 * Uso:
 *        ./extract_reads arquivo.fq
 * 
 * Também pode ser usado em pipe como em:
 *        cat arquivo.fq | ./extract_reads
 *
 * Caso o arquivo esteja em formato compactado gzip, recomenda-se usar zcat como em:
 *        ./extract_reads <(zcat arquivo.fq.gz)
 *                        ou
 *        zcat arquivo.fq.gz | ./extract_reads
 */

void help_message(const char *nome_programa){
  printf(">>> Uso:\n");
  printf("\t%s <arquivo(s).fq>\n", nome_programa);
  printf("\tou\n");
  printf("\t(z)cat <arquivo(s).fq(.gz) | %s -\n", nome_programa);
}

void ler_linhas(FILE *f){
  char linha[MAX_READ_LEN];
  size_t contador = 0;

  while(fgets(linha, MAX_READ_LEN, f)){
    contador++;
    if((contador % 4) == 2){
      printf("%s", linha);
    }
  }
}

int main(int argc, char **argv){
  FILE *arquivo;

  if(argc >= 2 && strcmp(argv[1], "--help") == 0){
    help_message(argv[0]);
    return 0;
  } else if(argc == 2 && strcmp(argv[1], "-") == 0){
    arquivo = stdin;
    ler_linhas(arquivo);
  } else if(argc >= 2) {
    for(int i = 1;i < argc;i++){
      arquivo = fopen(argv[i], "r");
      ler_linhas(arquivo);
    }
  } else if(argv[1] == NULL){
    help_message(argv[0]);
    return 0;
  }

  if(argc >= 2){
    fclose(arquivo);
  }

  return 0;
}
