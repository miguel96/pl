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
%token <sval> OPERATORDOT
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
%token <sval> MINUSOP
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
desc_algoritmo:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA cabecera_alg bloque postcondicion finAlgoritmo {printf("BISON: Encontre un algoritmo completo, enhorabuena\n");}
;

cabecera_alg:
decl_globales decl_a_f decl_ent_sal COMMENT{printf("BISON Algoritmo declarado, animo\n");}
;
decl_globales:
declaracion_tipo decl_globales {printf("BISON: declaracion_tipo");}
| declaracion_cte decl_globales {printf("BISON: declaracionConstante");}
| %empty {}
;
decl_a_f:
accion_d decl_a_f {printf("BISON: decl_a_f (accion");}
| funcion_d decl_a_f {printf("BISON: decl_a_f (funcion)");}
| %empty {printf("BISON: decl_a_f (empty)");}
;
declaracion_cte:
RESERVEDWORDconst lista_d_cte RESERVEDWORDfconst {printf("BISON: decl_cte");}
;

declaracion_tipo:
RESERVEDWORDtipo lista_d_tipo RESERVEDWORDftipo OPERATORDOTCOMMA {printf("BISON: declaracion de tipo");}
;
lista_d_tipo:
IDENTIFIER OPERATOREQUAL d_tipo OPERATORDOTCOMMA lista_d_tipo {printf("BISON: lista_d_tipo:%s",$1);}
| %empty {}
;
d_tipo:
RESERVEDWORDtupla lista_campos RESERVEDWORDftupla {printf("BISON: d_tipo");}
| RESERVEDWORDtabla OPERATORINITARR expresion_t OPERATORDOTDOT expresion_t OPERATORENDARR RESERVEDWORDde d_tipo {printf("BISON: d_tipo");}
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
IDENTIFIER OPERATORDOUBLEDOT dtipo OPERATORDOTCOMMA lista_campos {printf("Lista de campos\n");}
| %empty {}
;
lista_d_cte:
IDENTIFIER OPERATOREQUAL INTLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (intlit)");}
|IDENTIFIER OPERATOREQUAL REALLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (reallit)");}
|IDENTIFIER OPERATOREQUAL CHARLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (charlit)");}
|IDENTIFIER OPERATOREQUAL BOOLEAN OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (boolean)");}
| %empty {}
;

lista_d_var:
lista_id OPERATORDOUBLEDOT IDENTIFIER OPERATORDOTCOMMA lista_d_var {printf("Lista de var\n");}
| lista_id OPERATORDOUBLEDOT d_tipo OPERATORDOTCOMMA lista_d_var {printf("Lista de var\n");}
| %empty {printf("Lista vacia de var\n");}
;
lista_id:
IDENTIFIER OPERATORCOMMA lista_id
| IDENTIFIER
;
/**Variables ent sal No se si hay que delcararlas*/
decl_ent_sal:
decl_ent {printf("BISON: declaracion entrada-salida (ent)");}
| decl_ent decl_sal {printf("BISON: declaracion entrada-salida(ent)(sal)");}
| decl_sal {printf("BISON: declaracion entrada-salida (sal)");}
;
decl_ent:
RESERVEDWORDent lista_d_var {printf("BISON: decl ent");}
;
decl_sal:
RESERVEDWORDsal lista_d_var {printf("BISON: decl sal");}
;
/**EXpresiones*/
expresion:
exp_a {printf("BISON: expresTion (exp_a)");}
| exp_b {printf("BISON: expresion (exp_b)");}
| funcion_ll {printf("BISON: expresion (funcion_ll)");}
;

exp_a:
exp_a ARITOP exp_a {printf("BISON: exp_a (aritop)");}
| exp_a MINUSOP exp_a {printf("BISON: exp_a (minusop)");}
| exp_a RESERVEDWORDmod exp_a {printf("BISON: exp_a (mod)");}
| exp_a RESERVEDWORDdiv exp_a {printf("BISON: exp_a (div)");}
| OPERATORINITPARENT exp_a OPERATORENPARENT {printf("BISON: exp_a (parentesis)");}
| operando {printf("BISON: exp_a (operando)");}
| REALLIT {printf("BISON: exp_a (lit numerico (real))");}
| MINUSOP exp_a {printf("BISON: exp_a (lit numerico (-exp_a))");}
;

exp_b:
exp_b RESERVEDWORDy exp_b {}
| exp_b RESERVEDWORDo exp_b {}
| RESERVEDWORDno exp_b {}
| operando {}
| BOOLEAN {}
| expresion COMPOP expresion {}
| OPERATORINITPARENT exp_b OPERATORENPARENT {}
;

operando:
IDENTIFIER {}
| operando OPERATORDOT operando {}
| operando OPERATORINITARR expresion OPERATORENDARR {}
| operando RESERVEDWORDref {}
;

precondicion:
COMMENTPREC {printf("BISON: precondicion detectada, ¡Bien hecho!");}
;

bloque:
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
| declaracion_cte declaraciones {}
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
RESERVEDWORDaccion a_cabecera bloque RESERVEDWORDfaccion {}
;

funcion_d:
RESERVEDWORDfuncion f_cabecera bloque RESERVEDWORDdev expresion RESERVEDWORDffuncion {}
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
