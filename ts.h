#ifndef ts_aitor_miguel_h

#define ts_aitor_miguel_h

#define ENTERO 0
#define REAL 1
#define BOOLEAN 2
#define CHAR 3
#define CADENA 4

typedef enum { //Esto para un futuro
    SIM_VARIABLE,
    SIM_TIPO,
    SIM_FUNCION
} tipo_sim;

typedef struct {
  char *nombre;
  char *tp;
  int extra;
  int idLista;
} variable;

typedef union {
    variable var;
    //funcion fun; Ya lo haremos si llegamos
    //tipo tip; Ya lo haremos si llegamos;
} symbol;
typedef struct elemento elemento;
struct elemento {
    int id;
    tipo_sim tipo;
    symbol sym;
    elemento *next;
};

typedef struct {
    int size;
    elemento *primero;
    elemento *ultimo;
} tabla_simbolos;

elemento *buscaNombre(tabla_simbolos *tabla, char *nombre);
int nombreUsado(tabla_simbolos *tabla, char *nombre);


#endif
