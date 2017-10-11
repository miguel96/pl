/* Reverse polish notation calculator.  */
%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

// stuff from flex that bison needs to know about:
extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror (char const *);
%}
%define api.value.type {double}
%token NUM
%% /* Grammar rules and actions follow.  */
input:
%empty
| input line
;
line:
'\n'
| INTLIT '\n'      { printf ("%.10g\n", $1); }
;
INTLIT:
NUM           { $$ = $1;           }
| INTLIT INTLIT '+'   { $$ = $1 + $2;      }
| INTLIT INTLIT '-'   { $$ = $1 - $2;      }
| INTLIT INTLIT '*'   { $$ = $1 * $2;      }
| INTLIT INTLIT '/'   { $$ = $1 / $2;      }
| INTLIT INTLIT '^'   { $$ = pow ($1, $2); }  /* INTLITonentiation */
| INTLIT 'n'       { $$ = -$1;          }  /* Unary minus    */
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
  yylex();
  //printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d,reservadas:%d,operadores:%d\n",
  //identifiers,err,coments,intLits,realLits,boolLits,charLits,reservadas,operators);
}
