%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "ts.c"

int yylex(void);
int yyparse(void);
extern FILE *yyin;
tabla_simbolos ts;

void yyerror (char const *);
%}
%union {
	int ival;
	float fval;
	char *sval;
  char cval;
	char *tipo;
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
//%token <sval> LOGICOP
%token <sval> BOOLEAN
//%token <sval> AUX
//%token <sval> SPACE
%token <sval> CHARLIT
%token <sval> COMMENT
%token <sval> IDENTIFIER
%token <sval> IDENTIFIERB
%token <fval> REALLIT
%token <ival> INTLIT


//Types
%type <tipo> lista_id
%type <tipo> lista_d_var
%type <tipo> d_tipo
%% /* Grammar rules and actions follow.  */
desc_algoritmo:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA cabecera_alg bloque COMMENT finAlgoritmo {printf("BISON: Encontre un algoritmo completo, enhorabuena\n");}
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
accion_d decl_a_f {printf("BISON: decl_a_f (accion\n");}
| funcion_d decl_a_f {printf("BISON: decl_a_f (funcion)\n");}
| %empty {}
;
declaracion_cte:
RESERVEDWORDconst lista_d_cte RESERVEDWORDfconst {printf("BISON: decl_cte\n");}
;

declaracion_tipo:
RESERVEDWORDtipo lista_d_tipo RESERVEDWORDftipo OPERATORDOTCOMMA {printf("BISON: declaracion de tipo\n");}
;

declaracion_var:
RESERVEDWORDvar lista_d_var RESERVEDWORDfvar OPERATORDOTCOMMA {printf("BISON: declaracion de variables\n");}
;

lista_d_tipo:
IDENTIFIER OPERATOREQUAL d_tipo OPERATORDOTCOMMA lista_d_tipo {printf("BISON: lista_d_tipo:%s\n",$1);}
| %empty {}
;
d_tipo:
RESERVEDWORDtupla lista_campos RESERVEDWORDftupla {printf("BISON: d_tipo\n");}
| RESERVEDWORDtabla OPERATORINITARR expresion_t OPERATORDOTDOT expresion_t OPERATORENDARR RESERVEDWORDde d_tipo {printf("BISON: d_tipo\n");}
| IDENTIFIER {printf("BISON: d_tipo\n");}
| expresion_t OPERATORDOTDOT expresion_t {printf("BISON: d_tipo\n");}
| RESERVEDWORDref d_tipo {printf("BISON: d_tipo\n");}
| RESERVEDWORDentero {printf("BISON: d_tipo\n");}
| RESERVEDWORDbooleano {printf("BISON: d_tipo\n");}
| RESERVEDWORDcaracter {printf("BISON: d_tipo\n");}
| RESERVEDWORDreal {printf("BISON: d_tipo\n");}
| RESERVEDWORDcadena {printf("BISON: d_tipo\n");}
;
expresion_t:
expresion {printf("Expression:_t\n");}
|CHARLIT {printf("Expression_t with c+%s\n",$1);}
;
lista_campos:
IDENTIFIER OPERATORDOUBLEDOT d_tipo OPERATORDOTCOMMA lista_campos {printf("Lista de campos\n");}
| %empty {}
;
lista_d_cte:
IDENTIFIER OPERATOREQUAL INTLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (intlit)\n");}
|IDENTIFIER OPERATOREQUAL REALLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (reallit)\n");}
|IDENTIFIER OPERATOREQUAL CHARLIT OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (charlit)\n");}
|IDENTIFIERB OPERATOREQUAL BOOLEAN OPERATORDOTCOMMA lista_d_cte {printf("BISON lista_d_cte (boolean)\n");}
| %empty {}
;

lista_d_var:
lista_id OPERATORDOUBLEDOT IDENTIFIER OPERATORDOTCOMMA lista_d_var {
			printf("BISON: Lista de var\n");
			insertVarTS(&ts,$1,$3);
		}
| lista_id OPERATORDOUBLEDOT IDENTIFIERB OPERATORDOTCOMMA lista_d_var {
			printf("BISON: Lista de var\n");
			insertVarTS(&ts,$1,$3);
		}
| lista_id OPERATORDOUBLEDOT d_tipo OPERATORDOTCOMMA lista_d_var {
		printf("BISON: Lista de var\n");
		insertVarTS(&ts,$1,$3);
	}
| %empty {
		printf("BISON: Lista vacia de var\n");
	}
;

lista_id:
IDENTIFIER OPERATORCOMMA lista_id {
		printf("BISON: en la lista habia: .%s.\n",$3);
		printf("BISON: ids en lista: .%s.\n",$1);
		insertVarTS(&ts,$1,$3);
		$$=$1;
	}
| IDENTIFIERB OPERATORCOMMA lista_id {
		printf("BISON: declaracion de ids(BOOL)");
		insertVarTS(&ts,$1,$3);
		$$=$1;
}
| IDENTIFIER {
		printf("BISON: id en la lista: .%s.\n",$1);
		$$=$1;
	}
| IDENTIFIERB {
		printf("Identb %s",$1);
		$$=$1;
	}
;
/**Variables ent sal No se si hay que delcararlas*/
decl_ent_sal:
decl_ent {printf("BISON: declaracion entrada-salida (ent)\n");}
| decl_ent decl_sal {printf("BISON: declaracion entrada-salida(ent)(sal)\n");}
| decl_sal {printf("BISON: declaracion entrada-salida (sal)\n");}
;
decl_ent:
RESERVEDWORDent lista_d_var {printf("BISON: decl ent\n");}
;
decl_sal:
RESERVEDWORDsal lista_d_var {printf("BISON: decl sal\n");}
;
/**EXpresiones*/
exp_b:
exp_b RESERVEDWORDy exp_b {printf("BISON: exp_b (y)\n");}
| exp_b RESERVEDWORDo exp_b {printf("BISON: exp_b (o)\n");}
| RESERVEDWORDno exp_b {printf("BISON: exp_b (no)\n");}
| operandob {printf("BISON: exp_b (operando)\n");}
| BOOLEAN {printf("BISON: exp_b (booleano)\n");}
| expresion COMPOP expresion {printf("BISON: exp_b (comparacion)\n");}
| OPERATORINITPARENT exp_b OPERATORENPARENT {printf("BISON: exp_b (parentesis)\n");}
;
expresion:
exp_a {printf("BISON: expresion (exp_a)\n");}
| exp_b {printf("BISON: expresion (exp_b)\n");}
| funcion_ll {printf("BISON: expresion (funcion_ll)\n");}
;

exp_a:
exp_a ARITOP exp_a {printf("BISON: exp_a (aritop)\n");}
| exp_a MINUSOP exp_a {printf("BISON: exp_a (minusop)\n");}
| exp_a RESERVEDWORDmod exp_a {printf("BISON: exp_a (mod)\n");}
| exp_a RESERVEDWORDdiv exp_a {printf("BISON: exp_a (div)\n");}
| OPERATORINITPARENT exp_a OPERATORENPARENT {printf("BISON: exp_a (parentesis)\n");}
| operando {printf("BISON: exp_a (operando)\n");}
| REALLIT {printf("BISON: exp_a (lit numerico (real))\n");}
| MINUSOP exp_a {printf("BISON: exp_a (lit numerico (-exp_a))\n");}
;


operando:
IDENTIFIER {printf("BISON: operando (identificador)\n");}
| operando OPERATORDOT operando {printf("BISON: operando (punto)\n");}
| operando OPERATORINITARR expresion OPERATORENDARR {printf("BISON: operando (expresion entre corchetes)\n");}
| operando RESERVEDWORDref {printf("BISON: operando (ref)\n");}
;

operandob:
IDENTIFIERB {printf("BISON: operando (identificadorb)\n");}
;

bloque:
declaraciones instrucciones {printf("BISON: bloque algoritmo\n");}
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
instruccion OPERATORDOTCOMMA instrucciones {
	printf("BISON: instrucciones\n");
}
| instruccion {
	printf("BISON: instruccion\n");
}
| %empty {
	printf("BISON: Instrucciones terminadas\n");
}
;

instruccion:
RESERVEDWORDcontinuar {}
| asignacion {
	printf("BISON: encontrada asignacion\n");
}
| alternativa {
	printf("BISON: encontrada alternativa\n");
}
| iteracion {
	printf("BISON: encontrada iteracion\n");
}
| accion_ll {
	printf("BISON: encontrada accion_ll\n");
}
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

it_cota_fija:
RESERVEDWORDpara IDENTIFIER OPERATORASIGN expresion RESERVEDWORDhasta expresion RESERVEDWORDhacer instrucciones RESERVEDWORDfpara {printf("BISON: it_cota_fija\n");}
;

it_cota_exp:
RESERVEDWORDmientras expresion RESERVEDWORDhacer instrucciones RESERVEDWORDfmientras {}
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
