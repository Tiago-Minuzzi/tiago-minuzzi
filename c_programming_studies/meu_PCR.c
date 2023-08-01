#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>

int ci = 1;
int ciclos = 3;

bool halter = false;
bool halter_ciclo = false;

int ti = 85;
int tolerancia = 1;

float temp_des = 94;
float temp_ane = 55;
float temp_ext = 72;
float temp_man = 4;

int time_des = 7;
int time_ane = 10;
int time_ext = 8;
int time_man = -1;

int controlador(int target_temp, int *t0, int timef, int ciclo) {
    
    if ( *t0 <= (target_temp - tolerancia) ) { 
        printf("Aumentando. T: %d\n",*t0);
        (*t0) += 1; 
        usleep(.1 * 1000000); 
    } else if ( *t0 >= (target_temp + tolerancia) ) {
        printf("Diminuindo. T: %d\n",*t0);
        (*t0) -= 1; 
        usleep(.1 * 1000000); 
    } else {
        int time0 = 1;
        if (timef == -1) {
            time0 = 0;
        }
        printf("Mantendo. T: %d\n",*t0); 
        do { 
            printf("- Ciclo: %d -> Tempo: %d\n",ciclo,time0);
            if (time0 == timef) {
                return 1; }
            time0++; 
            usleep(.5 * 1000000); 
        } while (time0 <= timef);
    }

    return 0;

}

void main() {

    bool verdadeiro = true;
    
    if (halter == false) {
        printf("### Rodando etapa incial\n");
    }


    while (verdadeiro) {
        // ++++++++++++++++++++++++++++++++++++++++++++++++
        

        if (halter == false) {
            int f0 = controlador(temp_des, &ti, 5, 0);
            if (f0 == 1) {
                halter = true; 
            } 

        } else if (halter_ciclo == false) {

            while(ci <= ciclos){
                printf(">>> Ciclo %d\n",ci);
                printf("--- Denaturation step ---\n");
                while(controlador(temp_des,&ti, time_des, ci) == 0);
                printf("--- Annealing step ---\n");
                while(controlador(temp_ane,&ti, time_ane, ci) == 0);
                printf("--- Extension step ---\n");
                while(controlador(temp_ext,&ti, time_ext, ci) == 0);
                ci++;
            } 


            if ( ci > ciclos) {
                halter_ciclo = true;
                printf("### Finalizando\n");
            }

        } else { 
            controlador(temp_man, &ti, time_man, 0);
            }



        // ++++++++++++++++++++++++++++++++++++++++++++++++
    }
}
