%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<ctype.h>

    extern int yylineno;
    extern int yylex();
    extern FILE *yyin;
    extern FILE *yyout;

    char* findvar(char* b)
    {
        static char buf[64];
        int i = 0;
        for (i = 0; i < 32; ++i)
        {
            if (b[i] != '=')
                buf[i] = b[i];
            else
            {
                buf[i] = '\0';
                return buf;
            }
        }
    }

    void yyerror (char *s) 
    {
        fprintf (stdout, "%s\n", s);
    }

    struct table
    {
        char name[10];
        int val;
    } syms[53];

    int SIZE_OF_ID_TABLE = 0;

    /* ------------------ YYSTYPE ------------------ */

    typedef struct
    {
        char str[1024];
        int number;
    } YYSTYPE;
    #define YYSTYPE YYSTYPE

    char gbuf[64];
%}

%token PROGRAM END_PROGRAM
%token ID NUMBER STRING VAR END_VAR INT
%token IF END_IF ELSIF ELSE THEN 
%token REPEAT UNTIL END_REPEAT WHILE END_WHILE FOR END_FOR DO TO BY
%token NEQUAL ASSIGN

%type<str> ID NUMBER STRING operations operation expression term value start declaration declarations assignment

%start start

%%

start: PROGRAM operations END_PROGRAM                                        { fprintf(yyout, "#include <stdio.h>\n#include <stdlib.h>\n\nint main(){\n %s \n}", $2); }
;

operations:                                                                 {  } 
|       operation                                                           { strcpy($$, $1); }
|       operations operation                                                { strcpy($$,$1); strcat($$,$2); }
;

operation:     assignment                                                          { strcpy($$, $1); }
|       expression ';'                                                      { strcpy($$, $1); strcat($$, ";\n"); }

|       IF expression THEN operations ELSE operations END_IF ';'  { strcpy($$, "if ("); strcat($$, $2); strcat($$, "){\n"); strcat($$, $4); strcat($$, "} else {\n"); strcat($$, $6); strcat($$, "}\n"); }
|       IF expression THEN operation END_IF ';'                     { strcpy($$, "if ("); strcat($$, $2); strcat($$, "){\n"); strcat($$, $4); strcat($$, "}\n"); }

|       FOR assignment TO expression BY expression DO operations END_FOR ';'  { strcpy(gbuf,findvar($2)); strcpy($$, "for ("); strcat($$, $2); strcat($$, "; "); strcat($$, gbuf); strcat($$, " < "); strcat($$, $4); strcat($$, "; "); strcat($$, gbuf); strcat($$, "="); strcat($$, gbuf); if(atoi($6) > 0) {strcat($$, "+");} strcat($$, $6); strcat($$, ") {\n"); strcat($$, $8); strcat($$, "}\n"); }
|       REPEAT operations UNTIL expression ';' END_REPEAT ';'          {  strcpy($$, "do {\n");  strcat($$, $2); strcat($$, "} while ("); strcat($$, $4); strcat($$, ");\n"); }
|       WHILE expression DO operations END_WHILE ';'                       { strcpy($$, "while ("); strcat($$, $2); strcat($$, "){\n"); strcat($$, $4); strcat($$, "}\n");}

|       VAR declarations END_VAR                                             { strcpy($$, $2); }
;

expression:   term                                                          { }
|       expression '+' term                                                 { strcpy($$,$1); strcat($$, "+"); strcat($$, $3); }
|       expression '-' term                                                 { strcpy($$,$1); strcat($$, "-"); strcat($$, $3); }
|       expression NEQUAL expression                                        {  strcpy($$,$1); strcat($$, "!="); strcat($$, $3); }
|       assignment                                                          {  strcpy($$, $1); }
|       ID '=' expression                                            {  strcpy($$, $1); strcat($$, "="); strcat($$, $3); }
;

assignment: ID ASSIGN expression                                            { strcpy($$, $1); strcat($$, "="); strcat($$, $3); }
;

term:   value                                 
|       term '*' value                                                      { strcat($$, "*"); strcat($$, $3); }
|       term '/' value                                                      { strcat($$, "/"); strcat($$, $3); }
;

value:  NUMBER                                                              { strcpy($$,$1); }
|       '-' value                                                           { strcpy($$,"-"); strcat($$, $2); }
|       '(' expression ')'                                                  { strcpy($$, $2); }
|       ID                                                                  { strcpy($$, $1); }
;

declarations:                                                               { }
|       declaration                                                         { strcpy($$, $1); }
|       declarations declaration                                            { strcpy($$,$1); strcat($$,$2); }
;

declaration: ID ':' INT ';'                                                { strcpy($$, "int "); strcat($$, $1); strcat($$, ";\n"); }
;

%%
int main() { 
    yyin = fopen("source.txt","r");
    yyout = fopen("result.txt","w");
    yyparse();
    fclose(yyin);
    fclose(yyout);  
}