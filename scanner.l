%top{
    #include <stdio.h>
    #include "parser.tab.h"
}
  int identifiers=0,boolIdent=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0, reservadas = 0,operators=0;

  char *parseString(char *toParse) {
    char* solucion=(char *) malloc((strlen(yytext)+1)*sizeof(char));
    strcpy(solucion,toParse);
    solucion[strlen(solucion)]='\0';
    return solucion;
  }

DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
COMMENT "{"([^}]|"/}")*"}"
PREC "{"Prec:([^}]|"/}")*"}"
POST "{"Post:([^}]|"/}")*"}"
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
OPMAS "+"
OPPOR "*"
OPELEV "^"
OPDIV "/"
OPDMOD "%"
MINUSOP "-"
COMPOP ">"|"<"|">="|"<="|"=="|"!="
LOGICOP "&"|"\|"

%%
{RESERVEDWORDaccion} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDaccion;
{RESERVEDWORDalgoritmo} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDalgoritmo;
{RESERVEDWORDbooleano} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDbooleano;
{RESERVEDWORDcadena} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDcadena;
{RESERVEDWORDcaracter} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDcaracter;
{RESERVEDWORDconst} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDconst;
{RESERVEDWORDcontinuar} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDcontinuar;
{RESERVEDWORDde} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDde;
{RESERVEDWORDdev} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDdev;
{RESERVEDWORDdiv} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDdiv;
{RESERVEDWORDent} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDent;
{RESERVEDWORDentero} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDentero;
{RESERVEDWORDes} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDes;
{RESERVEDWORDfaccion} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfaccion;
{RESERVEDWORDfalgoritmo} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfalgoritmo;
{RESERVEDWORDfconst} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfconst;
{RESERVEDWORDffuncion} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDffuncion;
{RESERVEDWORDfmientras} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfmientras;
{RESERVEDWORDfpara} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfpara;
{RESERVEDWORDfsi} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfsi;
{RESERVEDWORDftipo} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDftipo;
{RESERVEDWORDftupla} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDftupla;
{RESERVEDWORDfuncion} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfuncion;
{RESERVEDWORDfvar} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDfvar;
{RESERVEDWORDhacer} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDhacer;
{RESERVEDWORDhasta} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDhasta;
{RESERVEDWORDmientras} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDmientras;
{RESERVEDWORDmod} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDmod;
{RESERVEDWORDno} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDno;
{RESERVEDWORDo} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDo;
{RESERVEDWORDpara} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDpara;
{RESERVEDWORDreal} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDreal;
{RESERVEDWORDref} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDref;
{RESERVEDWORDsal} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDsal;
{RESERVEDWORDsi} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDsi;
{RESERVEDWORDtabla} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDtabla;
{RESERVEDWORDtipo} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDtipo;
{RESERVEDWORDtupla} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDtupla;
{RESERVEDWORDvar} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDvar;
{RESERVEDWORDy} reservadas++;yylval.sval=parseString(yytext);return RESERVEDWORDy;
{OPERATORASIGN} operators++;yylval.sval=parseString(yytext);return OPERATORASIGN;
{OPERATORDOT} operators++;yylval.cval=yytext[0];return OPERATORDOT;
{OPERATORDOTCOMMA} operators++;yylval.cval=yytext[0];return OPERATORDOTCOMMA;
{OPERATORCOMMA} operators++;yylval.cval=yytext[0];return OPERATORCOMMA;
{OPERATORDOTDOT} operators++;yylval.sval=parseString(yytext);return OPERATORDOTDOT;
{OPERATORDOUBLEDOT} operators++;yylval.cval=yytext[0];return OPERATORDOUBLEDOT;
{OPERATORTHEN} operators++;yylval.cval=yytext[0];return OPERATORTHEN;
{OPERATORINITARR} operators++;yylval.cval=yytext[0];return OPERATORINITARR;
{OPERATORENDARR} operators++;yylval.cval=yytext[0];return OPERATORENDARR;
{OPERATOREQUAL} operators++;yylval.cval=yytext[0];return OPERATOREQUAL;
{OPERATORINITEND} operators++;yylval.sval=parseString(yytext);return OPERATORINITEND;
{OPERATORINITPARENT} operators++;yylval.cval=yytext[0];return OPERATORINITPARENT;
{OPERATORENPARENT} operators++;yylval.cval=yytext[0];return OPERATORENPARENT;
{OPMAS}  operators++;yylval.cval=yytext[0];return OPMAS;
{OPPOR} operators++;yylval.cval=yytext[0];return OPPOR;
{OPELEV} operators++;yylval.cval=yytext[0];return OPELEV;
{OPDIV} operators++;yylval.cval=yytext[0];return OPDIV;
{OPDMOD} operators++;yylval.cval=yytext[0];return OPDMOD;
{MINUSOP} operators++;yylval.cval=yytext[0];return MINUSOP;
{COMPOP} operators++;yylval.cval=yytext[0];return COMPOP;
{BOOLEAN} ++boolLits;yylval.sval=yytext;return BOOLEAN;
{SPACE}{SPACE}*;
{CHARLIT} ++charLits;yylval.sval=yytext;return CHARLIT ;
{PREC} ++coments;yylval.sval=parseString(yytext);return COMMENT;
{POST} ++coments;yylval.sval=parseString(yytext);return COMMENT;
{COMMENT} ++coments;//No return anything
{IDENTIFIERB} ++boolIdent;yylval.sval=parseString(yytext);return IDENTIFIER;
{IDENTIFIER} ++identifiers;yylval.sval=parseString(yytext);return IDENTIFIER;
{REALLIT} ++realLits;yylval.sval=yytext;return REALLIT;
{INTLIT} ++intLits;yylval.ival=atoi(yytext);return INTLIT;
%%
