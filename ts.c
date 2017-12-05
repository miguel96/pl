#include "ts.h"
#include <stdio.h>
#include <string.h>

void init(tabla_simbolos *tabla) {
  tabla->size = 0;
  tabla->primero = NULL;
  tabla->ultimo = tabla->primero;
}

int insertVariable(tabla_simbolos *tabla, symbol sym) {
  printf("entra insertVar\n");
  elemento *elem;
  elem = (elemento *) malloc(sizeof(elemento));
  elem->id=tabla->size;
  elem->tipo=SIM_VARIABLE;
  elem->sym=sym;
  elem->next=NULL;
     if (tabla->primero == NULL){
        tabla->primero=elem;
        tabla->ultimo=elem;
        tabla->size++;
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
          printf("Tamalo tabla:%d\n",tabla->size);
          return 1;
     }
   }

int nombreUsado(tabla_simbolos *tabla, char *nombre) {
    return buscaNombre(tabla, nombre) != NULL;
}

elemento *buscaNombre(tabla_simbolos *tabla, char *nombre) {
    elemento *temp = tabla->primero;
    while (temp != NULL) {
        if (strcmp(temp->sym.var.nombre, nombre) == 0 && temp->tipo == SIM_VARIABLE ) // podemos tener una función y una variable con el mismo nombre?
          break;
        temp=temp->next;
    }
    return temp;
}

int insertVarTS(tabla_simbolos *tabla, char *identificador, char *tipo) {
  printf("insertando ident %s, tipo %s\n",identificador,tipo);
  symbol sym;
  sym.var.nombre=strdup(identificador);
  sym.var.tp = strdup(tipo);
  insertVariable(tabla, sym);
}

int insertVarSinTipo(tabla_simbolos *tabla, char *identificador) {
  return insertVarTS(tabla,identificador,"vacio");
}

int insertTipoToVars(tabla_simbolos *tabla, char *tipo) {
  elemento *elem = tabla->primero;
  while (elem != NULL) {
    printf("%d---> %s:%s;", elem->id, elem->sym.var.nombre, elem->sym.var.tp);
    if(strcmp(elem->sym.var.tp,"vacio")==0) {
      elem->sym.var.tp=tipo;
    }
    elem=elem->next;
  }
}

void imprimirTabla(tabla_simbolos *tabla) {
     elemento *elem = tabla->primero;
     printf("\n");
     printf("\nVoy a imprimir la tabla, tamaño %d\n",tabla->size);
     while (elem != NULL) {
          printf("\t%d---> %s:%s\n", elem->id, elem->sym.var.nombre, elem->sym.var.tp);
          elem=elem->next;
     }
     printf("\nHe terminado de imprimit la tabla, tamaño %d\n",tabla->size);
}
