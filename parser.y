%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include "ts.h"
#include "tc.h"
int yylex(void);
int yyparse(void);
extern FILE *yyin;
tabla_simbolos ts;
tabla_cuadruplas tc;
void yyerror (char const *);
%}

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
%token <cval> OPMAS
%token <cval> OPPOR
%token <cval> OPELEV
%token <cval> OPDIV
%token <cval> OPDMOD
%token <sval> MINUSOP
%token <sval> MAYOROP
%token <sval> MENOROP
%token <sval> MAYORIGOP
%token <sval> MENORIGOP
%token <sval> IGUALOP
%token <sval> DISTINTOOP
%token <sval> YOP
%token <sval> OOP
%token <sval> BOOLEAN
%token <sval> CHARLIT
%token <sval> COMMENT
%token <sval> IDENTIFIER
%token <sval> IDENTIFIERB
%token <fval> REALLIT
%token <ival> INTLIT


//Types
%type <ival> lista_id
%type <ival> lista_d_var
%type <ival> d_tipo
%type <ival> exp_a//La id de la variable del resultado
%type <ival> expresion //La id de la variable del resultado
%type <ival> operando//La id de la variable del operando
%type <ival> aritop
%type <ival> M
%type <bool> exp_b
%type <ival> operandob
%type <ival> compop


%union {
	int ival;
	float fval;
	char *sval;
  	char cval;
	char *tipo;
	struct boolexp {
		tabla_enteros* true;
		tabla_enteros* false;
	}bool;
}

%% /* Grammar rules and actions follow.  */
desc_algoritmo:
RESERVEDWORDalgoritmo IDENTIFIER OPERATORDOTCOMMA cabecera_alg bloque COMMENT finAlgoritmo {
	printf("BISON: Encontre un algoritmo completo, enhorabuena\nAhora imprimo la TS:\n");
	imprimirTabla(&ts);
	printf("BISON:TS completa, imprimo la TC:\n");
	imprimirTablaCuadruplas(&tc,&ts);
}
;

cabecera_alg:
	decl_globales decl_a_f decl_ent_sal COMMENT{printf("BISON Algoritmo declarado, animo\n");}
;
decl_globales:
	declaracion_tipo decl_globales {printf("BISON: declaracion_tipo\n");}
	| declaracion_cte decl_globales {printf("BISON: declaracionConstante\n");}
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
	RESERVEDWORDvar lista_d_var RESERVEDWORDfvar OPERATORDOTCOMMA {
		printf("BISON: declaracion de variables terminada\n");
	}
;

lista_d_tipo:
	IDENTIFIER OPERATOREQUAL d_tipo OPERATORDOTCOMMA lista_d_tipo {printf("BISON: lista_d_tipo:%s\n",$1);}
	| %empty {}
;
d_tipo:
	RESERVEDWORDtupla lista_campos RESERVEDWORDftupla {printf("BISON: d_tipo\n");}
	| RESERVEDWORDtabla OPERATORINITARR expresion_t OPERATORDOTDOT expresion_t OPERATORENDARR RESERVEDWORDde d_tipo {
		printf("BISON: d_tipo\n");
		}
	| IDENTIFIER {printf("BISON: d_tipo\n");}
	| expresion_t OPERATORDOTDOT expresion_t {printf("BISON: d_tipo\n");}
	| RESERVEDWORDref d_tipo {printf("BISON: tipo ref encontrado\n");}
	| RESERVEDWORDentero {
		printf("BISON: tipo entero encontrado\n");
		$$=ENTERO;
		}
	| RESERVEDWORDbooleano {
		printf("BISON: tipo booleano encontrado\n");
		$$=BOOLEANO;
		}
	| RESERVEDWORDcaracter {
		printf("BISON: tipo caracte encontrado\n");
		$$=CHAR;
		}
	| RESERVEDWORDreal {
		printf("BISON: tipo real encontrado\n");
		$$=REAL;
		}
	| RESERVEDWORDcadena {
		printf("BISON: tipo cadena encontrado\n");
		$$=CADENA;
		}
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
		printf("BISON: Lista de var %d\n",$1);
		insertTipoToVars(&ts,-1,$1);
	}
	| lista_id OPERATORDOUBLEDOT IDENTIFIERB OPERATORDOTCOMMA lista_d_var {
			printf("BISON: Lista de var %d\n",$1);
			insertTipoToVars(&ts,BOOLEANO,$1);
		}
	| lista_id OPERATORDOUBLEDOT d_tipo OPERATORDOTCOMMA lista_d_var {
			printf("BISON: Lista de var %d, tipo: %d\n",$1,$3);
			insertTipoToVars(&ts,$3,$1);
		}
	| %empty {
			printf("BISON: Termina lista_d_var\n");
		}
;

lista_id:
	IDENTIFIER OPERATORCOMMA lista_id {
		printf("BISON: el id de la lista es: %d\n",$3);
		printf("BISON: ids en lista: .%s.\n",$1);
		insertVarSinTipo(&ts,$1);
		$$=$3;
	}
	| IDENTIFIERB OPERATORCOMMA lista_id {
		printf("BISON: declaracion de ids(BOOL)\n");
		insertVarSinTipo(&ts,$1);
		$$=$3;
	}
	| IDENTIFIER {
		printf("BISON: id en la lista: .%s. Termina la lista\n",$1);
		$$=newIdList(&ts);
		insertVarSinTipo(&ts,$1);
	}
	| IDENTIFIERB {
		printf("Identb %s\n",$1);
		insertVarSinTipo(&ts,$1);
		$$=newIdList(&ts);
	}
;
/**Variables ent sal No se si hay que delcararlas*/
decl_ent_sal:
	decl_ent {
		printf("BISON: declaracion entrada-salida (ent)\n");
	}
	| decl_ent decl_sal {
		printf("BISON: declaracion entrada-salida(ent)(sal)\n");
	}
	| decl_sal {
		printf("BISON: declaracion entrada-salida (sal)\n");
	}
	;
decl_ent:
	RESERVEDWORDent lista_d_var {
		printf("BISON: decl ent\n");
		setVarsExtra(&ts,$2,INPUTVAR);
	}
;
decl_sal:
	RESERVEDWORDsal lista_d_var {
		printf("BISON: decl sal\n");
		setVarsExtra(&ts,$2,OUTPUTVAR);
	}
;
/**Expresiones*/
exp_b:
	exp_b RESERVEDWORDy M exp_b {
		backpatch(&tc,$1.true,$3);
		$$.false=merge($1.false,$4.false);
		$$.true=$4.true;
		printf("BISON: exp_b (y)\n");

	}
	| exp_b RESERVEDWORDo M exp_b {
		backpatch(&tc,$1.true,$3);
		$$.true=merge($1.true,$4.true);
		$$.false=$4.false;
		printf("BISON: exp_b (o)\n");
	}
	| RESERVEDWORDno exp_b {
		printf("BISON: exp_b (no)\n");
		$$.true=$2.false;
		$$.false=$2.false;
	}
	| operandob {
		int nquad=nextquad(&tc);
		$$.true=makeList(nquad);
		$$.false=makeList(nquad+1);
		gen(&tc,SI,$1,VOID,VOID);
		gen(&tc,GOTO,VOID,VOID,VOID);
		printf("BISON: exp_b (operando) (NQUAD: %d)\n",nquad);
	}
	| BOOLEAN {
		printf("BISON: exp_b (booleano)\n");
	}
	| expresion compop expresion {
		int nquad=nextquad(&tc);
		$$.true=makeList(nquad);
		$$.false=makeList(nquad+1);
		gen(&tc,SI,$1,$3,VOID);
		printf("BISON: exp_b (comparacion)\n");
	}
	| OPERATORINITPARENT exp_b OPERATORENPARENT {
		printf("BISON: exp_b (parentesis)\n");
		$$.true=$2.true;
		$$.false=$2.false;
	}
;
compop:
	MAYOROP {
		printf("BISON: compop MAYOR\n");
		$$=MAYOR;
	}
	| MENOROP {
		printf("BISON: compop MENOR\n");
		$$=MENOR;
	}
	| MAYORIGOP {
		printf("BISON: compop MAYORIGOP\n");
		$$=MAYOROIG;
	}
	| MENORIGOP {
		printf("BISON: compop MENORIG\n");
		$$=MENOROIG;
	}
	| IGUALOP {
		printf("BISON: compop IGUALOP\n");
		$$=IGUAL;
	}
	| DISTINTOOP {
		printf("BISON: compop DISTINTOOP\n");
		$$=DISTINTO;
	}
M:
	%empty {
		$$=nextquad(&tc);
		printf("Found M:%d\n",$$);
	}
	;
expresion:
	exp_a {
		printf("BISON: expresion (exp_a)\n");
	}
	| exp_b {
		printf("BISON: expresion (exp_b)\n");
	}
	| funcion_ll {
		printf("BISON: expresion (funcion_ll)\n");
	}
	;

exp_a:
exp_a aritop exp_a {
	printf("BISON: exp_a (aritop)\n");
	int idTempVar;
	idTempVar=newTemp(&ts,ENTERO);
	gen(&tc,$2,$1,$3,idTempVar);
	$$=idTempVar;
	printf("Nueva temporal id:%d",idTempVar);
}
| exp_a MINUSOP exp_a {
	printf("BISON: exp_a (aritop)\n");
	int idTempVar;
	idTempVar=newTemp(&ts,ENTERO);
	gen(&tc,MENOS,$1,$3,idTempVar);
	$$=idTempVar;
}
| exp_a RESERVEDWORDmod exp_a {
	printf("BISON: exp_a (aritop)\n");
	int idTempVar;
	idTempVar=newTemp(&ts,ENTERO);
	gen(&tc,MOD,$1,$3,idTempVar);
	$$=idTempVar;
}
| exp_a RESERVEDWORDdiv exp_a {
	int idTempVar;
	printf("BISON: exp_a (aritop)\n");
	idTempVar=newTemp(&ts,ENTERO);
	gen(&tc,DIV,$1,$3,idTempVar);
	$$=idTempVar;
}
| OPERATORINITPARENT exp_a OPERATORENPARENT {
	printf("BISON: exp_a (parentesis)\n");
}
| operando {
	printf("BISON: exp_a (operando:id->%d)\n",$1);
}
| REALLIT {
	printf("BISON: exp_a (lit numerico (real))\n");
}
| INTLIT {
	int idTempVar;
	printf("BISON: exp_a (int lit: %d)\n",$1);
	idTempVar=newTemp(&ts,ENTERO);
	gen(&tc,ASIGNVAL,$1,VOID,idTempVar);
	$$=idTempVar;
	printf("Nueva temporal id:%d",idTempVar);
}
| MINUSOP exp_a {
	printf("BISON: exp_a (lit numerico (-exp_a))\n");
}
;


operando:
	IDENTIFIER {
		printf("BISON: operando (identificador:%s) \n",$1);
		$$=getId(&ts,$1);
	}
	| operando OPERATORDOT operando {
		printf("BISON: operando (punto)\n");
	}
	| operando OPERATORINITARR expresion OPERATORENDARR {
		printf("BISON: operando (expresion entre corchetes)\n");
	}
	| operando RESERVEDWORDref {
		printf("BISON: operando (ref)\n");
	}
;

operandob:
	IDENTIFIERB {
		printf("BISON: operando (identificadorb)\n");
		//TODO: asignar valor
		$$=newTemp(&ts,BOOLEANO);
	}
;

bloque:
	declaraciones instrucciones {
		printf("BISON: bloque algoritmo\n");
	}
;


finAlgoritmo:
	RESERVEDWORDfalgoritmo OPERATORDOT {
		printf("BISON:fin de algoritmo correcto\n");
	}
;

declaraciones:
	declaracion_tipo declaraciones {
		printf("BISON: Declaracion tipo\n");
	}
	| declaracion_cte declaraciones {
		printf("BISON: declaracion cte\n");
	}
	| declaracion_var declaraciones {
		printf("BISON: declaracion var\n");
	}
	| %empty {}
;

instrucciones:
	instruccion OPERATORDOTCOMMA instrucciones {
		printf("BISON: instrucciones\n");
	}
	| instruccion {
		printf("BISON: ultima instruccion\n");
	}
	| %empty {
		printf("BISON: Instrucciones terminadas\n");
	}
;

instruccion:
	RESERVEDWORDcontinuar {
		printf("BISON: continuar (resWord)\n");
	}
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
	operando OPERATORASIGN expresion {
		printf("BISON: asignacion\n");
		gen(&tc,ASIGN,$3,VOID,$1);
	}
;

alternativa:
	RESERVEDWORDsi expresion OPERATORTHEN instrucciones lista_opciones RESERVEDWORDfsi {
		printf("BISON: alternativa\n");
	}
;

iteracion:
	it_cota_fija {
		printf("BISON: It cota fija\n");
	}
	| it_cota_exp {
		printf("BISON: It cota exp\n");
	}
;

it_cota_fija:
	RESERVEDWORDpara IDENTIFIER OPERATORASIGN expresion RESERVEDWORDhasta expresion RESERVEDWORDhacer instrucciones RESERVEDWORDfpara {
		printf("BISON: it_cota_fija in\n");
	}
;

it_cota_exp:
	RESERVEDWORDmientras expresion RESERVEDWORDhacer instrucciones RESERVEDWORDfmientras {
		printf("BISON: it_cota_exp in\n");
	}
;
funcion_ll:
	IDENTIFIER OPERATORINITPARENT l_ll OPERATORENPARENT {
		printf("BISON: funcion_ll\n");
	}
;
/***********************por qué***************************************/
accion_ll:
	IDENTIFIER OPERATORINITPARENT l_ll OPERATORENPARENT {
		printf("BISON: accion_ll\n");
	}
;

l_ll:
	expresion OPERATORCOMMA l_ll {
		printf("BISON: l_ll\n");
	}
	| expresion {
		printf("BISON: expresion\n");
	}
;

lista_opciones:
	OPERATORINITEND expresion OPERATORTHEN instrucciones lista_opciones {
		printf("BISON: lista opciones\n");
	}
	| %empty {}
;

accion_d:
	RESERVEDWORDaccion a_cabecera bloque RESERVEDWORDfaccion {
		printf("BISON: accion_d\n");
	}
;

funcion_d:
	RESERVEDWORDfuncion f_cabecera bloque RESERVEDWORDdev expresion RESERVEDWORDffuncion {
		printf("BISON: funcion_d\n");
	}
;

a_cabecera:
	IDENTIFIER OPERATORINITPARENT d_par_form OPERATORENPARENT OPERATORDOTCOMMA {
		printf("BISON: a_cabecera\n");
	}
;

f_cabecera:
	IDENTIFIER OPERATORINITPARENT lista_d_var OPERATORENPARENT RESERVEDWORDdev d_tipo OPERATORDOTCOMMA {
		printf("BISON: f_cabecera\n");
	}
;

d_par_form:
	d_p_form OPERATORDOTCOMMA d_par_form {
		printf("BISON: d_par_form\n");
	}
	| %empty {}
;

d_p_form:
	RESERVEDWORDent lista_id OPERATORDOUBLEDOT  d_tipo {
		printf("BISON: d_p_form ent\n");
	}
	| RESERVEDWORDsal lista_id OPERATORDOUBLEDOT  d_tipo {
		printf("BISON: d_p_form sal\n");
	}
	| RESERVEDWORDes lista_id OPERATORDOUBLEDOT  d_tipo {
		printf("BISON: d_p_form\n");
	}
;
aritop:
	OPMAS {
		printf("BISON: opmas\n");
		$$=MAS;
	}
	| OPPOR {
		printf("BISON: opmult\n");
		$$=MULT;
	}
	| OPELEV {
		printf("BISON: opelev\n");
		$$=ELEV;
	}
	| OPDIV {
		printf("BISON: opdiv\n");
		$$=DIV;
	}
	| OPDMOD {
		printf("BISON: opmod\n");
		$$=MOD;
	}
%%
void yyerror(char const * error){
  printf("Error:%s\n",error);
  exit(-1);
}

int main(int argc, char *argv[]) {
	init(&ts);
	initTable(&tc);
  if ( argc > 0 ) {
    FILE *myfile = fopen(argv[1], "r");
    yyin=myfile;
  }
  else {
      yyin = stdin;
  }

  do{
    yyparse();
  } while(!feof(yyin));
  //printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d,reservadas:%d,operadores:%d\n",
  //identifiers,err,coments,intLits,realLits,boolLits,charLits,reservadas,operators);
}
