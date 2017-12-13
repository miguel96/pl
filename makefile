completo: scanner.l parser.y
	bison -d -v parser.y
	flex scanner.l
	gcc -c lex.yy.c
	gcc -c ts.c
	gcc -c tc.c
	gcc parser.tab.c lex.yy.o ts.o tc.o -lfl -lm

gcc: lex.yy.c
	gcc lex.yy.c -lfl

clean: lex.yy.c a.out
	rm lex.yy.c
	rm a.out
