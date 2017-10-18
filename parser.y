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
%token <sval> IDENTIFIER
%token <sval> OPERATORDOTCOMMA
%type <ival> exp
%% /* Grammar rules and actions follow.  */
input:
%empty
| input line
;
line:
'\n'
| exp '\n'      { printf ("%d\n", $1); }
;
exp:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA {printf("BISON:Start algoritmo: %s",$2);}
| INTLIT           { $$ = $1;          }
| exp ARITOP exp   {printf("%d %s %d\n", $1,$2,$3);}
| exp 'n'       { $$ = -$1;          }  /* Unary minus    */
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
