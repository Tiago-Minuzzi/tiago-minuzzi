#include <stdio.h>
// Using type casting
int main()
{
    printf("The number of eggs for the day: ");

    int eggs;
    scanf("%i", &eggs);

    double dozen = (double) eggs / 12;

    printf("You have %f dozen of eggs.\n",dozen);
    return 0;
}
