  int identifiers=0,err=0,coments=0,intLits=0;

DIGIT   [0-9]
NUMBER {DIGIT}{DIGIT}*
CHAR [a-zA-z]
SPACE [ ]|[\t]|[\n]
COMMENT "{"([^}]|"/}")*"}"
IDENTIFIER  {SPACE}{CHAR}({CHAR}|{DIGIT})*{SPACE}?
INTLIT [+|-]?{NUMBER}((e|E){NUMBER})?


%%
{COMMENT} ++coments;printf("Comment:%s\n",yytext);
{IDENTIFIER} ++identifiers;printf("Identifier:%s\n",yytext);
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
  printf("identifiers:%d err:%d com:%d,intLits:%d\n",identifiers,err,coments,intLits);
}
