%top{
    #include <stdio.h>
    #include "parser.tab.h"
}
  int identifiers=0,boolIdent=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0, reservadas = 0,operators=0;

DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
COMMENT "{"([^}]|"/}")*"}"
IDENTIFIERB "b"({CHAR}|{DIGIT})*
IDENTIFIER  {CHAR}({CHAR}|{DIGIT})*
AUX {NUMBER},{NUMBER}
REALLIT [+|-]?{NUMBER}"."{NUMBER}((e|E){NUMBER})?
INTLIT [+|-]?{NUMBER}((e|E){NUMBER})?
CHARLIT \"{CHAR}\"
BOOLEAN ?i:"verdadero"|"falso"
RESERVEDWORDaccion ?i:"accion"
RESERVEDWORDalgoritmo ?i:"algoritmo"
RESERVEDWORDbooleano ?i:"booleano"
RESERVEDWORDcadena ?i:"cadena"
RESERVEDWORDcaracter ?i:"caracter"
RESERVEDWORDconst ?i:"const"
RESERVEDWORDcontinuar ?i:"continuar"
RESERVEDWORDde ?i:"de"
RESERVEDWORDdev ?i:"dev"
RESERVEDWORDdiv ?i:"div"
RESERVEDWORDent ?i:"ent"
RESERVEDWORDentero ?i:"entero"
RESERVEDWORDes ?i:"e/s"
RESERVEDWORDfaccion ?i:"faccion"
RESERVEDWORDfalgoritmo ?i:"falgoritmo"
RESERVEDWORDfconst ?i:"fconst"
RESERVEDWORDffuncion ?i:"ffuncion"
RESERVEDWORDfmientras ?i:"fmientras"
RESERVEDWORDfpara ?i:"fpara"
RESERVEDWORDfsi ?i:"fsi"
RESERVEDWORDftipo ?i:"ftipo"
RESERVEDWORDftupla ?i:"ftupla"
RESERVEDWORDfuncion ?i:"funcion"
RESERVEDWORDfvar ?i:"fvar"
RESERVEDWORDhacer ?i:"hacer"
RESERVEDWORDhasta ?i:"hasta"
RESERVEDWORDmientras ?i:"mientras"
RESERVEDWORDmod ?i:"mod"
RESERVEDWORDno ?i:"no"
RESERVEDWORDo ?i:"o"
RESERVEDWORDpara ?i:"para"
RESERVEDWORDreal ?i:"real"
RESERVEDWORDref ?i:"ref"
RESERVEDWORDsal ?i:"sal"
RESERVEDWORDsi ?i:"si"
RESERVEDWORDtabla ?i:"tabla"
RESERVEDWORDtipo ?i:"tipo"
RESERVEDWORDtupla ?i:"tupla"
RESERVEDWORDvar ?i:"var"
RESERVEDWORDy ?i:"y"
OPERATORASIGN ":="
OPERATORDOTCOMMA ";"
OPERATORCOMMA ","
OPERATORDOT "."
OPERATORDOTDOT ".."
OPERATORDOUBLEDOT ":"
OPERATORTHEN "->"
OPERATORINITARR "["
OPERATORENDARR "]"
OPERATOREQUAL "="
OPERATORINITEND "[]"
OPERATORINITPARENT "("
OPERATORENPARENT ")"
ARITOP  "+"|"*"|"^"|"/"|"%"
MINUSOP "-"
COMPOP ">"|"<"|">="|"<="|"=="|"!="
LOGICOP "&"|"\|"

%%
{RESERVEDWORDaccion} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDaccion;
{RESERVEDWORDalgoritmo} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDalgoritmo;
{RESERVEDWORDbooleano} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDbooleano;
{RESERVEDWORDcadena} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDcadena;
{RESERVEDWORDcaracter} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDcaracter;
{RESERVEDWORDconst} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDconst;
{RESERVEDWORDcontinuar} reservadas++;printf("RESERVADA: %s\n",yytext);return RESERVEDWORDcontinuar;
{RESERVEDWORDde} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDde;
{RESERVEDWORDdev} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDdev;
{RESERVEDWORDdiv} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDdiv;
{RESERVEDWORDent} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDent;
{RESERVEDWORDentero} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDentero;
{RESERVEDWORDes} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDes;
{RESERVEDWORDfaccion} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfaccion;
{RESERVEDWORDfalgoritmo} reservadas++;printf("RESERVADA: %s\n",yytext);return RESERVEDWORDfalgoritmo;
{RESERVEDWORDfconst} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfconst;
{RESERVEDWORDffuncion} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDffuncion;
{RESERVEDWORDfmientras} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfmientras;
{RESERVEDWORDfpara} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfpara;
{RESERVEDWORDfsi} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfsi;
{RESERVEDWORDftipo} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDftipo;
{RESERVEDWORDftupla} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDftupla;
{RESERVEDWORDfuncion} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDfuncion;
{RESERVEDWORDfvar} reservadas++;printf("RESERVADA: %s\n",yytext);return RESERVEDWORDfvar;RESERVEDWORDfvar;
{RESERVEDWORDhacer} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDhacer;
{RESERVEDWORDhasta} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDhasta;
{RESERVEDWORDmientras} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDmientras;
{RESERVEDWORDmod} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDmod;
{RESERVEDWORDno} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDno;
{RESERVEDWORDo} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDo;
{RESERVEDWORDpara} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDpara;
{RESERVEDWORDreal} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDreal;
{RESERVEDWORDref} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDref;
{RESERVEDWORDsal} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDsal;
{RESERVEDWORDsi} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDsi;
{RESERVEDWORDtabla} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDtabla;
{RESERVEDWORDtipo} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDtipo;
{RESERVEDWORDtupla} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDtupla;
{RESERVEDWORDvar} reservadas++;printf("RESERVADA: %s\n",yytext);return RESERVEDWORDvar;RESERVEDWORDvar;
{RESERVEDWORDy} reservadas++;printf("RESERVADA: %s\n",yytext);yylval.sval=yytext;return RESERVEDWORDy;
{OPERATORASIGN} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORASIGN;
{OPERATORDOT} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORDOT;
{OPERATORDOTCOMMA} operators++;printf("OPERATOR %s\n",yytext);return OPERATORDOTCOMMA;
{OPERATORCOMMA} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORCOMMA;
{OPERATORDOTDOT} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORDOTDOT;
{OPERATORDOUBLEDOT} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORDOUBLEDOT;
{OPERATORTHEN} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORTHEN;
{OPERATORINITARR} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORINITARR;
{OPERATORENDARR} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORENDARR;
{OPERATOREQUAL} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATOREQUAL;
{OPERATORINITEND} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORINITEND;
{OPERATORINITPARENT} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORINITPARENT;
{OPERATORENPARENT} operators++;printf("OPERATOR %s\n",yytext);yylval.sval=yytext;return OPERATORENPARENT;
{ARITOP} operators++;printf("ARITOP %s\n",yytext);yylval.sval=yytext;return ARITOP;
{MINUSOP} operators++;printf("MINUSOP %s\n",yytext),yylval.sval=yytext;return MINUSOP;
{COMPOP} operators++;printf("COMPOP %s\n",yytext);yylval.sval=yytext;return COMPOP;
{BOOLEAN} ++boolLits;printf("Boolean:%s\n",yytext);yylval.sval=yytext;return BOOLEAN;
{SPACE}{SPACE}*;
{CHARLIT} ++charLits;printf("CharLit:%s\n",yytext);yylval.sval=yytext;return CHARLIT ;
{COMMENT} ++coments;printf("Comment:%s\n",yytext);return COMMENT;
{IDENTIFIERB} ++boolIdent;printf("BoolIdent:%s\n",yytext);return IDENTIFIERB;
{IDENTIFIER} ++identifiers;printf("Identifier:%s\n",yytext);yylval.sval=yytext;return IDENTIFIER;
{REALLIT} ++realLits;printf("RealLit:%f\n",atof(yytext));yylval.sval=yytext;return REALLIT;
{INTLIT} ++intLits;printf("IntLit:%d\n",atoi(yytext));yylval.ival=atoi(yytext);return INTLIT;
%%
