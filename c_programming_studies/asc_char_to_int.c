#include <stdio.h>

int main()
{
    char ASCII;
    printf("Enter a character: ");
    scanf("%c",&ASCII);
    printf("%i\n", ASCII);

    int integer;
    printf("Enter an integer between 0-127: ");
    scanf("%i", &integer);
    printf("%c\n", integer);
    
    return 0;
}
