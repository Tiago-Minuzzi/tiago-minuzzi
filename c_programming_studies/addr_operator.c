//include is used to add basic C libraries
#include <stdio.h>

/*
   Example taken from https://www.educba.com/address-operator-in-c/
 */

//main method is used to run C application
int main(void)
{
    //declaring 2 variables
    int first_number, second_number;
    //Asking user to enter integer input
    printf("Please enter any 2 integer number \n");
    //store the number with ampersand symbol
    scanf("%d\n%d",&first_number,&second_number);
    //displaying output to the end user
    printf("User enter numbers %d and %d ", first_number, second_number);

    return 0;
}
