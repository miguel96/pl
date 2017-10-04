completo: scanner.l
	flex scanner.l
	gcc lex.yy.c -lfl

gcc: lex.yy.c
	gcc lex.yy.c -lfl

clean: lex.yy.c a.out
	rm lex.yy.c
	rm a.out
