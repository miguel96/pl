%top{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
}
  int identifiers=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0, reservadas = 0,operators=0;
  char** arrayreservadas;
  int isReservedWord();
DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
COMMENT "{"([^}]|"/}")*"}"
IDENTIFIER  {CHAR}({CHAR}|{DIGIT})*
AUX {NUMBER},{NUMBER}
REALLIT [+|-]?{NUMBER}"."{NUMBER}((e|E){NUMBER})?
INTLIT [+|-]?{NUMBER}((e|E){NUMBER})?
RESERVEDWORD ?i:"accion"|"algoritmo"|"booleano"|"cadena"|"caracter"|"const"|"continuar"|"de"|"dev"|"div"|"ent"|"entero"|"es"|"faccion"|"falgoritmo"|"falso"|"fconst"|"ffuncion"|"fmientras"|"fpara"|"fsi,"|"ftipo"|"ftupla"|"funcion"|"fvar"|"hacer"|"hasta"|"mientras"|"mod"|"no"|"o"|"para"|"real"|"ref"|"sal"|"si"|"tabla"|"tipo"|"tupla"|"var"|"verdadero"|"y"
OPERATOR ":="|";"|","|".."|":"|"->"|"[]"|"="|"["|"]"|"+"|"-"|"*"|"^"|"/"|"%"|">"|"<"|">="|"<="|"&"|"\|"|"!="|"=="
CHARLIT \"{CHAR}\"
BOOLEAN "verdadero"|"falso"

%%
{OPERATOR} ++operators;printf("Operadores:%s\n", yytext);
{BOOLEAN} ++boolLits;printf("Boolean:%s\n",yytext);
{RESERVEDWORD} ++reservadas;printf("Reservada:%s\n",yytext);
{AUX} ++realLits;printf("RealLit:%s\n",yytext);
{SPACE}{SPACE}*
{CHARLIT} ++charLits;printf("CharLit:%s\n",yytext);
{COMMENT} ++coments;printf("Comment:%s\n",yytext);
{IDENTIFIER} ++identifiers;printf("Identifier:%s\n",yytext);
{REALLIT}  ++realLits;printf("RealLit:%s\n",yytext);
{INTLIT}  ++intLits;printf("IntLit:%s\n",yytext);
. err++;
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
