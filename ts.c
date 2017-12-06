#include "ts.h"
#include <stdio.h>
#include <string.h>
int temps=0;
void init(tabla_simbolos *tabla) {
  printf("Init tabla simbolos");
  temps=0;
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
  sym.var.extra=-1;
  elem->sym=sym;
  elem->next=NULL;
     if (tabla->primero == NULL){
        tabla->primero=elem;
        tabla->ultimo=elem;
        tabla->size++;
        return elem->id;//Return id
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
          return elem->id; //Return id
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
  return insertVariable(tabla, sym);
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
int getId(tabla_simbolos *tabla, char *name) {
  elemento *elem= tabla->primero;
  while(elem!=NULL&&strcmp(name,elem->sym.var.nombre)!=0){
    elem=elem->next;
  }
  if(elem!=NULL){
    return elem->id;
  }
  return -1;
}
char * getName(tabla_simbolos *tabla, int id) {
  elemento *elem= tabla->primero;
  while(elem != NULL&&elem->id!=id) {
    elem=elem->next;
  }
  if(elem!=NULL){
    return elem->sym.var.nombre;
  }
  return "";
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
char *getExtraName(int extra){
  switch(extra){
    case 0: return "input";
    case 1: return "output";
  }    
}
int printExtraVars(tabla_simbolos *tabla,int extra) {
    elemento *elem = tabla->primero;
    while(elem != NULL) {
      if(elem->sym.var.extra==extra) {
        printf("%s %s\n",getExtraName(extra),elem->sym.var.nombre);
      }        
      elem=elem->next;
    }
}
int newTemp(tabla_simbolos *tabla,char *tipo){
  char str[10];
  sprintf(str, "temp%d", temps++);
  return insertVarTS(tabla,str,tipo);  
}
int setVarsExtra(tabla_simbolos *tabla,int extra){
  elemento *elem = tabla->primero;
  while(elem!=NULL) {
    if(elem->sym.var.extra<0){
      elem->sym.var.extra=extra;    
    }
    elem=elem->next;
  }
}