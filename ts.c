#include "ts.h"

void init(tabla_simbolos *tabla) {
  tabla->size = 0;
  tabla->primero = NULL;
  tabla->ultimo = tabla->primero;
}

int insertVariable(tabla_simbolos *tabla, symbol sym) {
  elemento *elem;
  elem->id=tabla->size;
  elem->tipo=SIM_VARIABLE;
  elem->sym=sym;
  elem->next=NULL;
  struct elemento *next;
     if (tabla->primero == NULL){
        tabla->primero=elem;
        tabla->ultimo=elem;
        return 1;
     }
     else {
          if (nombreUsado(tabla, sym.var.nombre)){
               return -1;
          }
          elemento *aux = tabla->ultimo;
          aux->next = elem;
          tabla->ultimo = elem;
          tabla->size++;
          return 1;
     }
}


int nombreUsado(tabla_simbolos *tabla, char *nombre) {
    return get_var(tabla, nombre) != NULL;
}

elemento *buscaNombre(tabla_simbolos *tabla, char *nombre) {
    elemento *temp = table->sym_list;
    while (temp != NULL) {
        if (strcmp(temp->sym.var.nombre, nombre) == 0 && temp->tipo == SIM_VARIABLE ) // podemos tener una función y una variable con el mismo nombre?
          break;
    }
    return temp;
}

int insertVarTS(tabla_simbolos *tabla, char *identificador, tipo_variable *tipo) {
     symbol *sym;
     sym->var.nombre=identificador;
     sym->var.tp = tipo;
}

void imprimirTabla(tabla_simbolos *tabla) {
     elemento *elem = tabla->primero;
     while (elem != NULL) {
          printf("%d---> %s:%s;", elem->id, elem->sym.var.nombre, elem->sym.var.tp);
     }
}
