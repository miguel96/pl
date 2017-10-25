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

%token <sval> RESERVEDWORDaccion
%token <sval> RESERVEDWORDalgoritmo
%token <sval> RESERVEDWORDbooleano
%token <sval> RESERVEDWORDcadena
%token <sval> RESERVEDWORDcaracter
%token <sval> RESERVEDWORDconst
%token <sval> RESERVEDWORDcontinuar
%token <sval> RESERVEDWORDde
%token <sval> RESERVEDWORDdev
%token <sval> RESERVEDWORDdiv
%token <sval> RESERVEDWORDent
%token <sval> RESERVEDWORDentero
%token <sval> RESERVEDWORDes
%token <sval> RESERVEDWORDfaccion
%token <sval> RESERVEDWORDfalgoritmo
%token <sval> RESERVEDWORDfconst
%token <sval> RESERVEDWORDffuncion
%token <sval> RESERVEDWORDfmientras
%token <sval> RESERVEDWORDfpara
%token <sval> RESERVEDWORDfsi
%token <sval> RESERVEDWORDftipo
%token <sval> RESERVEDWORDftupla
%token <sval> RESERVEDWORDfuncion
%token <sval> RESERVEDWORDfvar
%token <sval> RESERVEDWORDhacer
%token <sval> RESERVEDWORDhasta
%token <sval> RESERVEDWORDmientras
%token <sval> RESERVEDWORDmod
%token <sval> RESERVEDWORDno
%token <sval> RESERVEDWORDo
%token <sval> RESERVEDWORDpara
%token <sval> RESERVEDWORDreal
%token <sval> RESERVEDWORDref
%token <sval> RESERVEDWORDsal
%token <sval> RESERVEDWORDsi
%token <sval> RESERVEDWORDtabla
%token <sval> RESERVEDWORDtipo
%token <sval> RESERVEDWORDtupla
%token <sval> RESERVEDWORDvar
%token <sval> RESERVEDWORDy
%token <sval> OPERATORASIGN
%token <sval> OPERATORDOTCOMMA
%token <sval> OPERATORCOMMA
%token <sval> OPERATORDOTDOT
%token <sval> OPERATORDOUBLEDOT
%token <sval> OPERATORTHEN
%token <sval> OPERATORINITARR
%token <sval> OPERATORENDARR
%token <sval> OPERATOREQUAL
%token <sval> OPERATORINITEND
%token <sval> OPERATORINITPARENT
%token <sval> OPERATORENPARENT
%token <sval> ARITOP
%token <sval> COMPOP
%token <sval> LOGICOP
%token <sval> BOOLEAN
%token <sval> AUX
%token <sval> SPACE
%token <sval> CHARLIT
%token <sval> COMMENTPREC
%token <sval> COMMENTPOST
%token <sval> COMMENT
%token <sval> IDENTIFIER
%token <fval> REALLIT
%token <ival> INTLIT

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
declaracion_tipo declaraciones {}
| declaracion_const declaraciones {}
| declaracion_var declaraciones {}
| %empty {}
;

instrucciones:
instruccion OPERATORDOTCOMMA instrucciones {}
| instruccion {}
;

instruccion:
RESERVEDWORDcontinuar {}
| asignacion {}
| alternativa {}
| iteracion {}
| accion_ll {}
;

asignacion:
operando OPERATORASIGN expresion {}
;

alternativa:
RESERVEDWORDsi expresion OPERATORTHEN instrucciones lista_opciones RESERVEDWORDfsi {}
;

iteracion:
it_cota_fija {}
| it_cota_exp {}
;

funcion_ll:
IDENTIFIER OPERATORINITPARENT l_ll OPERATORENPARENT {}
;
/***********************por qué***************************************/
accion_ll:
IDENTIFIER OPERATORINITPARENT l_ll OPERATORENPARENT {}
;

l_ll:
expresion OPERATORCOMMA l_ll {}
| expresion {}
;

lista_opciones:
OPERATORINITEND expresion OPERATORTHEN instrucciones lista_opciones {}
| %empty {}
;

accion_d:
RESERVEDWORDaccion a_cabecera cuerpo RESERVEDWORDfaccion {}
;

funcion_d:
RESERVEDWORDfuncion f_cabecera cuerpo RESERVEDWORDdev expresion RESERVEDWORDffuncion {}
;

a_cabecera:
IDENTIFIER OPERATORINITPARENT d_par_form OPERATORENPARENT OPERATORDOTCOMMA {}
;

f_cabecera:
IDENTIFIER OPERATORINITPARENT lista_d_var OPERATORENPARENT RESERVEDWORDdev d_tipo OPERATORDOTCOMMA {}
;

d_par_form:
d_p_form OPERATORDOTCOMMA d_par_form {}
| %empty {}
;

d_p_form:
RESERVEDWORDent lista_id OPERATORDOUBLEDOT  d_tipo {}
| RESERVEDWORDsal lista_id OPERATORDOUBLEDOT  d_tipo {}
| RESERVEDWORDes lista_id OPERATORDOUBLEDOT  d_tipo {}
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
