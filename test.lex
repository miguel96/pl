  int identifiers=0,err=0,coments=0,intLits=0,realLits=0,boolLits=0,charLits=0;

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
