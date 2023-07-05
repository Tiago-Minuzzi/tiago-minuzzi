#include <stdio.h>
#include <stdbool.h>
#include <unistd.h>

int tolerancia = 1;

bool halter = false;
bool halter_ciclo = false;

int ti = 85;

int temp_des = 94;
int temp_ane = 55;
int temp_ext = 72;
int temp_man = 4;

int controlador(int target_temp, int *t0, int timef) {
    
    if ( *t0 == target_temp ) {
        int time0 = 1;
        if (timef == -1) {
            time0 = 0;
        }
        printf("Mantendo. T: %d\n",*t0); 
        do { 
            printf("Tempo: %d\n",time0); 
            if (time0 == timef) {
                return 1; }
            time0++; 
            usleep(.5 * 1000000); } while (time0 <= timef); }
    else if ( *t0 <= (target_temp - tolerancia) ) { 
        printf("Aumentando. T: %d\n",*t0);
        (*t0) += 1; 
        usleep(.3 * 1000000); }
    else if ( *t0 >= (target_temp + tolerancia) ) {
        printf("Diminuindo. T: %d\n",*t0);
        (*t0) -= 1; 
        usleep(.3 * 1000000); }

    return 0;

}

void main() {

    bool verdadeiro = true;
    
    if (halter == false) {
        printf("### Rodando etapa incial\n");
    }

    int ci = 1;
    int ciclos = 3;

    while (verdadeiro) {
        // ++++++++++++++++++++++++++++++++++++++++++++++++
        

        if (halter == false) {
            int f0 = controlador(temp_des, &ti, 5);
            if (f0 == 1) {
                halter = true; 
            } 

        } else if (halter_ciclo == false) {

            while(ci <= ciclos){
                printf(">>> Ciclo %d\n",ci);
                printf("--- Denaturation step---\n");
                while(controlador(temp_des,&ti, 7) == 0){}
                printf("--- Annealing step---\n");
                while(controlador(temp_ane,&ti, 10) == 0){}
                printf("--- Extension step---\n");
                while(controlador(temp_ext,&ti, 5) == 0){}
                ci++;
            } 


            if ( ci > ciclos) {
                halter_ciclo = true;
                printf("### Finalizando\n");
            }

        } else { 
            controlador(temp_man, &ti, -1);
            }



        // ++++++++++++++++++++++++++++++++++++++++++++++++
    }
}
