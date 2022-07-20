
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PROGRAM = 258,
     END_PROGRAM = 259,
     ID = 260,
     NUMBER = 261,
     STRING = 262,
     VAR = 263,
     END_VAR = 264,
     INT = 265,
     IF = 266,
     END_IF = 267,
     ELSIF = 268,
     ELSE = 269,
     THEN = 270,
     REPEAT = 271,
     UNTIL = 272,
     END_REPEAT = 273,
     WHILE = 274,
     END_WHILE = 275,
     FOR = 276,
     END_FOR = 277,
     DO = 278,
     TO = 279,
     BY = 280,
     NEQUAL = 281,
     ASSIGN = 282
   };
#endif
/* Tokens.  */
#define PROGRAM 258
#define END_PROGRAM 259
#define ID 260
#define NUMBER 261
#define STRING 262
#define VAR 263
#define END_VAR 264
#define INT 265
#define IF 266
#define END_IF 267
#define ELSIF 268
#define ELSE 269
#define THEN 270
#define REPEAT 271
#define UNTIL 272
#define END_REPEAT 273
#define WHILE 274
#define END_WHILE 275
#define FOR 276
#define END_FOR 277
#define DO 278
#define TO 279
#define BY 280
#define NEQUAL 281
#define ASSIGN 282




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


