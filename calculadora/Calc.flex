/* Calc.flex - Scanner para uma calculadora simples usando JFlex 1.9 */

package calculadora;

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

/* EOF */
<<EOF>>            { System.out.println("EOF"); return; }

/* Qualquer outro caractere → erro */
.                  { 
                     throw new RuntimeException(
                         "ERRO: caractere não reconhecido '" + yytext() + 
                         "' na linha " + (yyline + 1) + 
                         ", coluna " + (yycolumn + 1)
                     ); 
                   }