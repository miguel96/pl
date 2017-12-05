int initTable(tabla_cuadruplas *tabla){
  tabla.nextquad=0;
  return 0;
}
/**
op: operador;
op1: operando1;
op2: operando2;
dest: operando destino;
*/
int gen(tabla_cuadruplas *tabla, int op,int op1,int op2,int dest) {
    int[4] tupla=tabla->tabla[tabla.nextquad];
    tupla[0]=op;
    tupla[1]=op1;
    tupla[2]=op2;
    tupla[3]=dest;
    tabla->nextquad++;
    return 0;
}

void imprimirTablaCuadruplas(tabla_cuadruplas *tabla) {
     printf("------>Tabla de Cuádruplas<-----\n", );
     for(int i = 0; i < tabla->nextquad) {
          printf("%i\t%i\t%i\t%i\n\n",tabla->tabla[i][0],tabla->tabla[i][1],tabla->tabla[i][2],tabla->tabla[i][3] );
     }
}
