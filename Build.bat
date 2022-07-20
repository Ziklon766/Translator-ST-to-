
flex kurs.l
bison -dy -v kurs.y
gcc lex.yy.c y.tab.c -o kurs.exe

kurs.exe
pause