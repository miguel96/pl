/* Reverse polish notation calculator.  */
%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
int yylex();
int yyparse();
FILE *yyin;

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
%% /* Grammar rules and actions follow.  */
algoritmo:
cabeceraAlgoritmo precondicion cuerpo postcondicion finAlgoritmo {printf("BISON: Encontre un algoritmo completo, enhorabuena\n");}
;
cabeceraAlgoritmo:
declaracionAlgoritmo variablesAlgoritmo {printf("BISON Algoritmo declarado, animo\n");}
;
declaracionAlgoritmo:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA {printf("BISON:Start algoritmo: %s",$2);}
;
variablesAlgoritmo:
//TODO variables algoritmo
;
precondicion:
//TODO comentario PREC
;
cuerpo:
//TODO el cuerpo
;
postcondicion:
//TODO postcondicion
;
finAlgoritmo:
RESERVEDWORDfalgoritmo {printf("BISON:fin de algoritmo correcto\n");}
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
