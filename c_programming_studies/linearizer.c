#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SEQ_BUFFER 128

void linearize(char *a) {
  FILE *fptr;
  fptr = fopen(a, "r");
  if (fptr == NULL) {
    printf(">>> Error reading file.\n");
    exit(1);
  }
  
  char buff[SEQ_BUFFER];
  int counter = 0;

  while (fgets(buff, SEQ_BUFFER, fptr)) {
    if (buff[0] == '>') {
      if (counter > 0) {
        printf("\n");
      }
      printf("%s", buff);
      counter++;
    } else {
      buff[strcspn(buff, "\n")] = '\0';
      printf("%s", buff);
    };
  };
  printf("\n");

  fclose(fptr);
  fprintf(stderr, ">>> Total sequences processed: %d\n", counter);

}

void help(char *a) {
  printf("A program to linearize FASTA sequences. It prints the sequences to stdout.\nOne can redirect the output to a file as folllows:\n");
  printf("\t%s <FASTA> > <OUT_FASTA>\n", a);
  printf("\t%s -h, --help\tshows this message and exits.", a);
  exit(1);
}

int main(int argc, char** argv){

  char *entrada = argv[1];

  if (argc != 2){
    printf(">>> Invalid input.\n");
    help(argv[0]);
    exit(1);
  } else if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) {
    help(argv[0]);
  }

  linearize(entrada);

  return 0;
}
