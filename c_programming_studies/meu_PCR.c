#include <stdio.h>
#include <unistd.h>

int limiteDisparo1 = 45;
int limiteDisparo2 = 30;

float temperature = 40.2; // calcula a temperatura


void step01() {
    printf(">>> Step 01\n");
    printf("Disparo = %d\n",limiteDisparo1);
    printf("Temperatura: %.2f °C\n",temperature);

    if (temperature < limiteDisparo1) {
        printf("Baixo\n\n");
    } else {
        printf("Alto\n\n");
    }
    sleep(2);
}

void step02() {
    printf(">>> Step 02\n");
    printf("Disparo = %d\n",limiteDisparo2);
    printf("Temperatura: %.2f °C\n",temperature);

    if (temperature > limiteDisparo2) {
        printf("Alto\n\n");
    } else {
        printf("Baixo\n\n");
    }
    sleep(2);
}

void main(){
    printf("### Temperatura setada em %.2f ###\n\n",temperature);
    step01();
    step02();
    sleep(3);
    printf("Fim\n");
}
