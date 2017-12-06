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
  tabla->tabla[tabla->nextquad][0] = op;
  tabla->tabla[tabla->nextquad][1] = op1;
  tabla->tabla[tabla->nextquad][2] = op2;
  tabla->tabla[tabla->nextquad][3] = dest;
  tabla->nextquad++;
  return 0;
}
void imprimirTupla(int op, char *op1, char *op2, char *dest) {
  switch (op)
  {
  case ASIGN:
    printf("%s:= %s\n", dest, op1);
    break;
  case MAS:
    printf("%s:= %s + %s\n",dest,op1,op2);
    break;
  case MENOS:
    printf("%s:= %s - %s\n",dest,op1,op2);
    break;
  case MULT:
    printf("%s:= %s * %s\n",dest,op1,op2);
    break;
  case DIV:
    printf("%s:= %s / %s\n",dest,op1,op2);
    break;
  case MOD:
    printf("%s:= %s mod %s\n",dest,op1,op2);
    break;
  case ELEV:
    printf("%s:= %s ^ %s\n",dest,op1,op2);
    break;
  }
}
void imprimirTablaCuadruplas(tabla_cuadruplas *tc, tabla_simbolos *ts) {
  printf("------>Codigo en 3 direcciones<-----\n");
  printExtraVars(ts,INPUTVAR);
  for (int i = 0; i < tc->nextquad; i++) {
    imprimirTupla(tc->tabla[i][0], getName(ts, tc->tabla[i][1]), getName(ts, tc->tabla[i][2]), getName(ts, tc->tabla[i][3]));
  }
  printExtraVars(ts,OUTPUTVAR);
}
