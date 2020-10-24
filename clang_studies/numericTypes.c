#include <stdio.h>
/*
Conversion characters
---------------------
%f = Decimal notation
%e = Scientific notation
%g = Computer decides
    < -4
    >5

*/

int main()
{
    printf("How many dogs do you have: ");
    double dogs;
    scanf("%lf", &dogs); // %lf can read decimal and scientific notation
    
    printf("Decimal: %f\n",dogs);
    printf("Scientific: %e\n",dogs);
    printf("Comp: %g\n",dogs);
    
    return 0;
}
