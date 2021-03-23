#include <stdio.h>

// Calculate radius from user input
int main()
{
    int radius; // Distance from outside to center of the circle
    printf("Please enter a radius: ");
    scanf("%ii\n", &radius); // scanf can alter the value of radius. The ampersand is needed to alter it.

    double area = 3.14159 * (radius * radius); 
    printf("The area of the circle with %i radius is: %f\n", radius, area);
    return 0;
}
