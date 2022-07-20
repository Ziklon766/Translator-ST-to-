%{

   typedef struct
   {
      char data[1024];
   } string;

   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>

   #define YYSTYPE string
   void yyerror(char *s);
   #include "y.tab.h"
%}

%option yylineno

%%

"PROGRAM" {
   printf("PROGRAM token\n");
   return PROGRAM;     
}

"END_PROGRAM" {    
   printf("END_PROGRAM token\n");
   return END_PROGRAM;     
}

"VAR" {    
   printf("VAR token\n");
   return VAR;    
}

"END_VAR" {    
   printf("END_VAR token\n");
   return END_VAR;    
}

"IF" {    
   printf("IF token\n");
   return IF;     
}

"THEN" {    
   printf("THEN token\n");
   return THEN;   
}

"ELSE" {    
   printf("ELSE token\n");
   return ELSE;   
}

"END_IF" {    
   printf("END_IF token\n");
   return END_IF;     
}

"FOR" {    
   printf("FOR token\n");
   return FOR;     
}

"TO" {    
   printf("TO token\n");
   return TO; 
}

"DO" {    
   printf("DO token\n");
   return DO; 
}

"BY" {    
   printf("BY token\n");
   return BY; 
}

"END_FOR" {    
   printf("END_FOR token\n");
   return END_FOR;     
}

"WHILE" {    
   printf("WHILE token\n");
   return WHILE;     
}

"END_WHILE" {    
   printf("END_WHILE token\n");
   return END_WHILE;     
}

"REPEAT" {    
   printf("REPEAT token\n");
   return REPEAT;     
}

"UNTIL" {    
   printf("UNTIL token\n");
   return UNTIL;     
}

"END_REPEAT" {    
   printf("END_REPEAT token\n");
   return END_REPEAT;     
}

"INT" {    
   printf("INT token\n");
   return INT;    
}

"<>" {    
   printf("NEQUAL token\n");
   return NEQUAL; 
}

":=" {    
   printf("ASSIGN token\n");
   return ASSIGN; 
}

[0-9]+ {
   printf("NUMBER token\n");
   strcpy(yylval.data, yytext);
   return NUMBER;
}

[a-z]([a-z]|[0-9])* { 
   printf("ID token\n");
   strcpy(yylval.data, yytext); 
   return ID;
}

[ \t\n]  {
   printf("whitespace token\n");
}

[- + ; ( ) * / = < > :] {  
   printf("OPERATIONS\n");
   return *yytext;  
}
%%

int yywrap()
{
   return 1;
}
