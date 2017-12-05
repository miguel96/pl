/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    RESERVEDWORDaccion = 258,
    RESERVEDWORDalgoritmo = 259,
    RESERVEDWORDbooleano = 260,
    RESERVEDWORDcadena = 261,
    RESERVEDWORDcaracter = 262,
    RESERVEDWORDconst = 263,
    RESERVEDWORDcontinuar = 264,
    RESERVEDWORDde = 265,
    RESERVEDWORDdev = 266,
    RESERVEDWORDdiv = 267,
    RESERVEDWORDent = 268,
    RESERVEDWORDentero = 269,
    RESERVEDWORDes = 270,
    RESERVEDWORDfaccion = 271,
    RESERVEDWORDfalgoritmo = 272,
    RESERVEDWORDfconst = 273,
    RESERVEDWORDffuncion = 274,
    RESERVEDWORDfmientras = 275,
    RESERVEDWORDfpara = 276,
    RESERVEDWORDfsi = 277,
    RESERVEDWORDftipo = 278,
    RESERVEDWORDftupla = 279,
    RESERVEDWORDfuncion = 280,
    RESERVEDWORDfvar = 281,
    RESERVEDWORDhacer = 282,
    RESERVEDWORDhasta = 283,
    RESERVEDWORDmientras = 284,
    RESERVEDWORDmod = 285,
    RESERVEDWORDno = 286,
    RESERVEDWORDo = 287,
    RESERVEDWORDpara = 288,
    RESERVEDWORDreal = 289,
    RESERVEDWORDref = 290,
    RESERVEDWORDsal = 291,
    RESERVEDWORDsi = 292,
    RESERVEDWORDtabla = 293,
    RESERVEDWORDtipo = 294,
    RESERVEDWORDtupla = 295,
    RESERVEDWORDvar = 296,
    RESERVEDWORDy = 297,
    OPERATORASIGN = 298,
    OPERATORDOT = 299,
    OPERATORDOTCOMMA = 300,
    OPERATORCOMMA = 301,
    OPERATORDOTDOT = 302,
    OPERATORDOUBLEDOT = 303,
    OPERATORTHEN = 304,
    OPERATORINITARR = 305,
    OPERATORENDARR = 306,
    OPERATOREQUAL = 307,
    OPERATORINITEND = 308,
    OPERATORINITPARENT = 309,
    OPERATORENPARENT = 310,
    OPMAS = 311,
    OPPOR = 312,
    OPELEV = 313,
    OPDIV = 314,
    OPDMOD = 315,
    MINUSOP = 316,
    COMPOP = 317,
    BOOLEAN = 318,
    CHARLIT = 319,
    COMMENT = 320,
    IDENTIFIER = 321,
    IDENTIFIERB = 322,
    REALLIT = 323,
    INTLIT = 324
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 14 "parser.y" /* yacc.c:1909  */

	int ival;
	float fval;
	char *sval;
  char cval;
	char *tipo;

#line 132 "parser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
