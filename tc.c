int initTable(tabla_cuadruplas *tabla){
  tabla.nextquad=0;
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
}
