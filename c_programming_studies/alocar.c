#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {

  // Inicializar variáveis
  char **conjunto = NULL;
  char palavra[100];
  int idx = 0;

  while (1) {
    printf("Digite uma palavra: ");
    scanf("%s", palavra);
    if (strcmp(palavra, "quit") == 0) {
      break;
    }

    // Realocar espaço para o array
    conjunto = realloc(conjunto, (idx + 1) * sizeof(char *));
    if (conjunto == NULL) {
      printf("Erro ao alocar espaço!");
      return 1;
    }

    // Realocar espaço para palavra
    conjunto[idx] = malloc((strlen(palavra) + 1) * sizeof(char));
    if (conjunto[idx] == NULL) {
      printf("Erro ao alocar palavra!");
      return 1;
    }

    // Copiar palavra para o array
    strcpy(conjunto[idx], palavra);
    idx++;
  }

  printf("Palavras inseridas:\n");
  for (int j = 0; j < idx; j++) {
    printf("%s\n", conjunto[j]);
    free(conjunto[j]);
  }

  // Liberar memória
  free(conjunto);
  return 0;
}
