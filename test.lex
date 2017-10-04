%top{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
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
OPERATOR ":="|";"|","|".."|":"|"->"|"[]"|"="|"["|"]"|"+"|"-"|"*"|"^"|"/"|"%"|">"|"<"|">="|"<="|"&"|"\|"|"!="|"=="
CHARLIT \"{CHAR}\"
BOOLEAN "verdadero"|"falso"
RESERVEDWORD ?i:"accion"|"algoritmo"|"booleano"|"cadena"|"caracter"|"const"|"continuar"|"de"|"dev"|"div"|"ent"|"entero"|"es"|"faccion"|"falgoritmo"|"falso"|"fconst"|"ffuncion"|"fmientras"|"fpara"|"fsi,"|"ftipo"|"ftupla"|"funcion"|"fvar"|"hacer"|"hasta"|"mientras"|"mod"|"no"|"o"|"para"|"real"|"ref"|"sal"|"si"|"tabla"|"tipo"|"tupla"|"var"|"verdadero"|"y"

%%
{RESERVEDWORD} ++reservadas;printf("Reservada:%s\n",yytext);
{OPERATOR} ++operators;printf("Operador:%s\n", yytext);
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
