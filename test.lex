<<<<<<< HEAD
  int identifiers=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0;
=======
%top{
    #include <stdio.h>
    #include <stdlib.h>
}
  int identifiers=0,err=0,coments=0,intLits=0,realLits=0;
>>>>>>> c8a122e7e7e4b3fde50d65666c1ce719e8448416

DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
BOOLEAN "verdadero"|"falso"
COMMENT "{"([^}]|"/}")*"}"
IDENTIFIER  {CHAR}({CHAR}|{DIGIT})*
AUX {NUMBER},{NUMBER}
REALLIT [+|-]?{NUMBER}"."{NUMBER}((e|E){NUMBER})?
INTLIT [+|-]?{NUMBER}((e|E){NUMBER})?
CHARLIT \"{CHAR}\"

%%
{AUX} ++realLits;printf("RealLit:%s\n",yytext);
{SPACE}{SPACE}*
{CHARLIT} ++charLits;printf("CharLit:%s\n",yytext);
{BOOLEAN} ++boolLits;printf("Boolean:%s\n",yytext);
{COMMENT} ++coments;printf("Comment:%s\n",yytext);
{IDENTIFIER} ++identifiers;printf("Identifier:%s\n",yytext);
{REALLIT}  ++realLits;printf("RealLit:%s\n",yytext);
{INTLIT}  ++intLits;printf("IntLit:%s\n",yytext);
. err++;
%%

int main(int argc, char *argv[]) {
  FILE *reservadas = fopen("reserver_words", "r");
    char buffer[16];
    int maxreserved = 100;
    char *b = buffer;
    size_t bufsize = 16;
    size_t palabra;
    char** arrayreservadas = malloc(maxreserved * sizeof(char));
    int i = 0;
    while(palabra = getline(&b, &bufsize, reservadas) != EOF) {
        *(arrayreservadas + i) = buffer;
        i++;
    }


  if ( argc > 0 ) {
    FILE *myfile = fopen(argv[1], "r");
    yyin=myfile;
  }
  else {
      yyin = stdin;
  }
  yylex();
<<<<<<< HEAD
  printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d\n",
  identifiers,err,coments,intLits,realLits,boolLits,charLits);
=======
  printf("identifiers:%d err:%d com:%d,intLits:%d\n,realLits:%d\n",identifiers,err,coments,intLits,realLits);
  
>>>>>>> c8a122e7e7e4b3fde50d65666c1ce719e8448416
}
