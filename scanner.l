%top{
    #include <stdio.h>
}
  int identifiers=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0, reservadas = 0,operators=0;
  
DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
COMMENT "{"([^}]|"/}")*"}"
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
RESERVEDWORDes ?i:"es"
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
OPERATORDOTDOT ".."
OPERATORDOUBLEDOT ":"
OPERATORTHEN "->"
OPERATORINITARR "["
OPERATORENDARR "]"
OPERATOREQUAL "="
OPERATORINITEND "[]"
OPERATORINITPARENT "("
OPERATORENPARENT ")"
ARITOP  "+"|"-"|"*"|"^"|"/"|"%"
COMPOP ">"|"<"|">="|"<="|"=="|"!="
LOGICOP "&"|"\|"

%%
{RESERVEDWORDaccion}
{RESERVEDWORDalgoritmo}
{RESERVEDWORDbooleano}
{RESERVEDWORDcadena}
{RESERVEDWORDcaracter}
{RESERVEDWORDconst}
{RESERVEDWORDcontinuar}
{RESERVEDWORDde}
{RESERVEDWORDdev}
{RESERVEDWORDdiv}
{RESERVEDWORDent}
{RESERVEDWORDentero}
{RESERVEDWORDes}
{RESERVEDWORDfaccion}
{RESERVEDWORDfalgoritmo}
{RESERVEDWORDfconst}
{RESERVEDWORDffuncion}
{RESERVEDWORDfmientras}
{RESERVEDWORDfpara}
{RESERVEDWORDfsi}
{RESERVEDWORDftipo}
{RESERVEDWORDftupla}
{RESERVEDWORDfuncion}
{RESERVEDWORDfvar}
{RESERVEDWORDhacer}
{RESERVEDWORDhasta}
{RESERVEDWORDmientras}
{RESERVEDWORDmod}
{RESERVEDWORDno}
{RESERVEDWORDo}
{RESERVEDWORDpara}
{RESERVEDWORDreal}
{RESERVEDWORDref}
{RESERVEDWORDsal}
{RESERVEDWORDsi}
{RESERVEDWORDtabla}
{RESERVEDWORDtipo}
{RESERVEDWORDtupla}
{RESERVEDWORDvar}
{RESERVEDWORDy}
{OPERATORASIGN} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORDOTCOMMA} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORCOMMA} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORDOTDOT} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORDOUBLEDOT} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORTHEN} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORINITARR} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORENDARR} operators++;printf("OPERATOR %s\n",yytext);
{OPERATOREQUAL} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORINITEND} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORINITPARENT} operators++;printf("OPERATOR %s\n",yytext);
{OPERATORENPARENT} operators++;printf("OPERATOR %s\n",yytext);
{ARITOP} operators++;printf("ARITOP %s\n",yytext);
{COMPOP} operators++;printf("COMPOP %s\n",yytext);
{LOGICOP} operators++;printf("LOGICOP %s\n",yytext);
{BOOLEAN} ++boolLits;printf("Boolean:%s\n",yytext);
{AUX} ++realLits;printf("RealLit:%s\n",yytext);
{SPACE}{SPACE}*
{CHARLIT} ++charLits;printf("CharLit:%s\n",yytext);
{COMMENT} ++coments;printf("Comment:%s\n",yytext);
{IDENTIFIER} ++identifiers;printf("Identifier:%s\n",yytext);
{REALLIT}  ++realLits;printf("RealLit:%f\n",atof(yytext));
{INTLIT}  ++intLits;printf("IntLit:%d\n",atoi(yytext));
. err++;printf("Err:%s\n",yytext);

%%


int main(int argc, char *argv[]) {

  if ( argc > 0 ) {
    FILE *myfile = fopen(argv[1], "r");
    yyin=myfile;
  }
  else {
      yyin = stdin;
  }
  yylex();
  printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d,reservadas:%d,operadores:%d\n",
  identifiers,err,coments,intLits,realLits,boolLits,charLits,reservadas,operators);
}
