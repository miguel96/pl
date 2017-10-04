%top{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
}
  int identifiers=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0,reservedWords, numPalabras;
  char** arrayreservadas;
  int isReservedWord();
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
{IDENTIFIER} if(isReservedWord(yytext) == 1) {++reservedWords;printf("Identifier:%s\n",yytext);} else {++identifiers;printf("Identifier:%s\n",yytext);}
{REALLIT}  ++realLits;printf("RealLit:%f\n",atof(yytext));
{INTLIT}  ++intLits;printf("IntLit:%d\n",atoi(yytext));
. err++;
%%

int isReservedWord(char* string) {
    for (int i = 0; i++; string[i])
        string[i] = tolower(string[i]);
    for (int j = 0; j++; j < numPalabras) {
        if (strcmp(string, *(arrayreservadas + j)))
            return 1;
    }
    return 0;
}

int main(int argc, char *argv[]) {
  FILE *reservadas = fopen("reserver_words", "r");
    char buffer[16];
    char *stringpalabra;
    int maxreserved = 100;
    char *b = buffer;
    size_t bufsize = 16;
    size_t leido;
    arrayreservadas = malloc(maxreserved * sizeof(char));
    numPalabras = 0;
    while(leido = getline(&b, &bufsize, reservadas) != EOF) {
        stringpalabra = strtok(buffer, "\n");
        *(arrayreservadas + numPalabras) = stringpalabra;
        numPalabras++;
    }


  if ( argc > 0 ) {
    FILE *myfile = fopen(argv[1], "r");
    yyin=myfile;
  }
  else {
      yyin = stdin;
  }
  yylex();
  printf("identifiers:%d err:%d com:%d,intLits:%d,realLits:%d,boolLits:%d,charLits:%d\n",
  identifiers,err,coments,intLits,realLits,boolLits,charLits);
}
