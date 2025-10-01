#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

int main(int argc, char *argv[]) {
  
  int n;
  mpz_t a, b, temp;

  mpz_init_set_ui(a, 0);
  mpz_init_set_ui(b, 1);
  mpz_init(temp);

  if (argc != 2){
    printf("Número de argumentos inválidos!\n");
    exit(42);
  }

  n = atoi(argv[1]);

  for(int i = 0; i <= n; i++){
    mpz_add(temp, a, b);
    mpz_set(a, b);
    mpz_set(b, temp);

    gmp_printf("%Zd\n", a);
  }

    mpz_clear(a);
    mpz_clear(b);
    mpz_clear(temp);

  return 0;
}
