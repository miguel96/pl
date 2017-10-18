/* Reverse polish notation calculator.  */
%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int yylex(void);
int yyparse(void);
extern FILE *yyin;

void yyerror (char const *);
%}

%union {
	int ival;
	float fval;
	char *sval;
  char cval;
}


%token <ival> INTLIT
%token <sval> ARITOP
%token <sval> RESERVEDWORDalgoritmo
%token <sval> RESERVEDWORDfalgoritmo
%token <sval> IDENTIFIER
%token <sval> OPERATORDOTCOMMA
%token <sval> COMMENTPREC
%token <sval> COMMENTPOST
%% /* Grammar rules and actions follow.  */
algoritmo:
cabeceraAlgoritmo precondicion cuerpo postcondicion finAlgoritmo {printf("BISON: Encontre un algoritmo completo, enhorabuena\n");}
;

cabeceraAlgoritmo:
declaracionAlgoritmo declaracionGlobales declaracionAccionesFunciones declaracionEntradaSalida{printf("BISON Algoritmo declarado, animo\n");}
;
declaracionAlgoritmo:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA {printf("BISON:Start algoritmo: %s",$2);}
;
declaracionGlobales:
declaracion_tipo declaracionGlobales {printf("BISON: declaracion_tipo");}
| declaracionConstante declaracionGlobales {printf("BISON: declaracionConstante");}
| %empty {}
;
declaracion_tipo:
RESERVERWORDtipo lista_d_tipo RESERVERWORDFtipo OPERATORDOTCOMMA {printf("BISON: declaracion de tipo");}
;
lista_d_tipo:
IDENTIFIER OPERATOREQUAL d_tipo OPERATORDOTCOMMA lista_d_tipo {printf("BISON: lista_d_tipo:%s",$1);}
| %empty {}
;
d_tipo:
RESERVEDWORDtupla lista_campos RESERVEDWORDftupla {printf("BISON: d_tipo");}
| RESERVERWORDtabla OPERATORINITARR expresion_t RESERVEDWORDDOTDOT expresion_t OPERATORENDARR RESERVEDWORDde d_tipo {printf("BISON: d_tipo");}
| IDENTIFIER {printf("BISON: d_tipo");}
| expresion_t OPERATORDOTDOT expresion_t {printf("BISON: d_tipo");}
| RESERVEDWORDref d_tipo {printf("BISON: d_tipo");}
| RESERVEDWORDentero {printf("BISON: d_tipo");}
| RESERVEDWORDbooleano {printf("BISON: d_tipo");}
| RESERVEDWORDcaracter {printf("BISON: d_tipo");}
| RESERVEDWORDreal {printf("BISON: d_tipo");}
| RESERVEDWORDcadena {printf("BISON: d_tipo");}
;
expresion_t:
expresion {printf("Expression:_t+%s\n",$1);}
|CHARLIT {printf("Expression_t with c+%c",$1);}
;
lista_campos:
IDENTIFIER /OPERATORDOUBLEDOT dtipo OPERATORDOTCOMMA lista_campos {printf("Lista de campos\n");}
| %empty {}
;
variablesAlgoritmo:
//TODO variables algoritmo
;

precondicion:
COMMENTPREC {printf("BISON: precondicion detectada, ¡Bien hecho!");}
;

cuerpo:
declaraciones instrucciones
;

postcondicion:
COMMENTPOST {printf("BISON: postcondicion detectada, ¡Bien hecho!");}
;

finAlgoritmo:
RESERVEDWORDfalgoritmo OPERATORDOT {printf("BISON:fin de algoritmo correcto\n");}
;

declaraciones:
declaracion_tipo {}
| declaracion_const {}
| declaracion_var declaraciones | %empty
;

instrucciones:
//TODO
;

%%
void yyerror(char const * error){
  printf("Error:%s\n",error);
  exit(-1);
}

int main(int argc, char *argv[]) {

  if ( argc > 0 ) {
    FILE *myfile = fopen(argv[1], "r");
    yyin=myfile;
  }
  else {
      yyin = stdin;
  }

  do{
    printf("%s\n","parsing" );
    yyparse();
  } while(!feof(yyin));
  //printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d,reservadas:%d,operadores:%d\n",
  //identifiers,err,coments,intLits,realLits,boolLits,charLits,reservadas,operators);
}
