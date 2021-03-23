#include <stdio.h>

int main()
{
    char name[31]; //maximum chars are 30. Strings need a char at the end to terminate, that's why it is 31
    printf("Type your name: ");
    scanf("%s",name); //for arrays (name is an array in this case) the & is not needed in scanf.
    printf("Hello, %s\n",name);
    return 0;
}
