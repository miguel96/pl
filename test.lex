  int identifiers=0,err=0,coments=0,intLits=0,realLits=0;

DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ \t\n]
COMMENT "{"([^}]|"/}")*"}"
IDENTIFIER  {CHAR}({CHAR}|{DIGIT})*
AUX {NUMBER},{NUMBER}
REALLIT [+|-]?{NUMBER}","{NUMBER}((e|E){NUMBER})?
INTLIT [+|-]?{NUMBER}((e|E){NUMBER})?

%%
{AUX} ++realLits;printf("RealLit:%s\n",yytext);
{SPACE}{SPACE}*
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
  printf("identifiers:%d err:%d com:%d,intLits:%d\n,realLits:%d\n",identifiers,err,coments,intLits,realLits);
}
