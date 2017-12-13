#include "tc.h"
#include "ts.c"
#include <stdio.h>
#include <string.h>

int initTable(tabla_cuadruplas *tabla) {
  tabla->nextquad = 0;
  return 0;
}
/**
op: operador;
op1: operando1;
op2: operando2;
dest: operando destino;
*/
int gen(tabla_cuadruplas *tabla, int op, int op1, int op2, int dest) {
  printf("Generating op:%d op1:%d op2:%d dest: %d\n",op,op1,op2,dest);
  tabla->tabla[tabla->nextquad][0] = op;
  tabla->tabla[tabla->nextquad][1] = op1;
  tabla->tabla[tabla->nextquad][2] = op2;
  tabla->tabla[tabla->nextquad][3] = dest;
  tabla->nextquad++;
  return 0;
}
void imprimirTupla(tabla_simbolos *ts, int i,int op, int op1, int op2, int dest) {
  switch (op) {
  case ASIGN:
    printf("%d %s:= %s\n",i, getName(ts,dest), getName(ts,op1));
    break;
  case MAS:
    printf("%d %s:= %s + %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case MENOS:
    printf("%d %s:= %s - %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case MULT:
    printf("%d %s:= %s * %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case DIV:
    printf("%d %s:= %s / %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case MOD:
    printf("%d %s:= %s mod %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case ELEV:
    printf("%d %s:= %s ^ %s\n",i,getName(ts,dest),getName(ts,op1),getName(ts,op2));
    break;
  case ASIGNVAL:
    printf("%d %s:= %d\n",i,getName(ts,dest),op1);
  }
}
void imprimirTablaCuadruplas(tabla_cuadruplas *tc, tabla_simbolos *ts) {
  printf("------>Codigo en 3 direcciones<-----\n");
  printExtraVars(ts,INPUTVAR);
  for (int i = 0; i < tc->nextquad; i++) {
    imprimirTupla(ts,i,tc->tabla[i][0],tc->tabla[i][1], tc->tabla[i][2], tc->tabla[i][3]);
  }
  printExtraVars(ts,OUTPUTVAR);
}

int* makeList(int a) {
     int * lista;
     lista = (int*)malloc(sizeof(int));
     lista[0] = a;
     return lista;
}
