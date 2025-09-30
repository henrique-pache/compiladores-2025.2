/* Calc.flex - Scanner para uma calculadora simples usando JFlex 1.9 */

%%

%class CalcScanner
%unicode
%public
%line
%column
%final
%type void   // <-- faz yylex() não depender de Yytoken

DIGITO      = [0-9]
INT         = {DIGITO}+
FLOAT       = {DIGITO}+ "." {DIGITO}+

%%

/* Números */
{FLOAT}     { System.out.println("FLOAT(" + yytext() + ")"); }
{INT}       { System.out.println("INT(" + yytext() + ")"); }

/* Operadores */
"("         { System.out.println("LPAREN"); }
")"         { System.out.println("RPAREN"); }
"+"         { System.out.println("PLUS"); }
"-"         { System.out.println("MINUS"); }
"**"        { System.out.println("POW"); }
"//"        { System.out.println("INTDIV"); }
"*"         { System.out.println("TIMES"); }
"/"         { System.out.println("DIV"); }

/* Ignorar espaços em branco */
[ \t\r\n]+  { /* ignora */ }

/* Qualquer outro caractere → erro */
.           { System.out.println("ERRO(" + yytext() + ")"); }
