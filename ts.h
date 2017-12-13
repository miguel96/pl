#ifndef ts_aitor_miguel_h

#define ts_aitor_miguel_h

#define VACIO -1
#define ENTERO 0
#define REAL 1
#define BOOLEANO 2
#define CHAR 3
#define CADENA 4

typedef enum { //Esto para un futuro
    SIM_VARIABLE,
    SIM_TIPO,
    SIM_FUNCION
} tipo_sim;

typedef struct {
  char *nombre;
  int tp;
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
void init(tabla_simbolos *tabla);
int insertVariable(tabla_simbolos *tabla, symbol sym);
int insertVarTS(tabla_simbolos *tabla, char *identificador, int tipo);
int insertVarSinTipo(tabla_simbolos *tabla, char *identificador);
int insertTipoToVars(tabla_simbolos *tabla, int tipo,int idLista);
int getId(tabla_simbolos *tabla, char *name);
char * getName(tabla_simbolos *tabla, int id);
char *getTipo(int tipo);
void imprimirTabla(tabla_simbolos *tabla);
char *getExtraName(int extra);
int printExtraVars(tabla_simbolos *tabla,int extra);
int newTemp(tabla_simbolos *tabla,int tipo);
int setVarsExtra(tabla_simbolos *tabla,int listId,int extra);
int setVarsId(tabla_simbolos *tabla, int id);
int newIdList(tabla_simbolos *tabla);


#endif
