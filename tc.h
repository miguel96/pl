#ifndef tc_aitor_miguel_h

#define tc_aitor_miguel_h

#define ASIGN 0
#define MAS 1
#define MENOS 2
#define MULT 3
#define DIV 4
#define MOD 5
#define ELEV 6
#define INPUT 7
#define OUTPUT 8
#define IGUAL 9
#define MENOR 10
#define MAYOR 11
#define MAYOROIG 12
#define MENOROIG 13
#define ASIGNVAL 14
#define SI 15
#define GOTO 16
#define FALSE 0
#define TRUE 1

#define VOID -1


#define INPUTVAR 0
#define OUTPUTVAR 1

typedef struct {
    int tabla[4][100];
    int nextquad;
} tabla_cuadruplas;

typedef struct nodo_tabla nodo_tabla;

struct nodo_tabla
{
    int value;
    nodo_tabla *next;
};

typedef struct
{
    nodo_tabla *first;
    nodo_tabla *last;
} tabla_enteros;

typedef struct
{
    tabla_enteros * true;
    tabla_enteros * false;
} boolop;
#endif
