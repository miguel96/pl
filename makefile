completo: test.lex
	flex test.lex
	gcc lex.yy.c -lfl

flex: a.lex
	flex a.lex

gcc: lex.yy.c
	gcc lex.yy.c -lfl

clean: lex.yy.c a.out
	rm lex.yy.c
	rm a.out
