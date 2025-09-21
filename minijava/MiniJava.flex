package minijava;

/* MiniJava.flex - Scanner para MiniJava */

%%

%public
%class MiniJavaScanner
%unicode
%line
%column
%char
%final
%type void

/* Identificadores */
ID_START   = [A-Za-z_]
ID_PART    = [A-Za-z_0-9]

/* Espaços em branco */
WHITESPACE = [ \t\r\n]+

/* Números inteiros */
INTEGER    = [0-9]+

%%

/* Espaços em branco - ignorar */
{WHITESPACE}       {}

/* Palavras reservadas */
"class"            { System.out.println("RESERVADA, class"); }
"public"           { System.out.println("RESERVADA, public"); }
"static"           { System.out.println("RESERVADA, static"); }
"void"             { System.out.println("RESERVADA, void"); }
"main"             { System.out.println("RESERVADA, main"); }
"String"           { System.out.println("RESERVADA, String"); }
"extends"          { System.out.println("RESERVADA, extends"); }
"return"           { System.out.println("RESERVADA, return"); }
"int"              { System.out.println("RESERVADA, int"); }
"boolean"          { System.out.println("RESERVADA, boolean"); }
"if"               { System.out.println("RESERVADA, if"); }
"else"             { System.out.println("RESERVADA, else"); }
"while"            { System.out.println("RESERVADA, while"); }
"true"             { System.out.println("RESERVADA, true"); }
"false"            { System.out.println("RESERVADA, false"); }
"this"             { System.out.println("RESERVADA, this"); }
"new"              { System.out.println("RESERVADA, new"); }
"System"           { System.out.println("RESERVADA, System"); }
"out"              { System.out.println("RESERVADA, out"); }
"println"          { System.out.println("RESERVADA, println"); }
"package"          { System.out.println("RESERVADA, package"); }

/* Números inteiros */
{INTEGER}          { System.out.println("NUMERO, " + yytext()); }

/* Identificadores */
{ID_START}{ID_PART}* { System.out.println("ID, " + yytext()); }

/* Operadores */
"&&"               { System.out.println("OPERADOR, &&"); }
"=="               { System.out.println("OPERADOR, =="); }
"!="               { System.out.println("OPERADOR, !="); }
"<="               { System.out.println("OPERADOR, <="); }
">="               { System.out.println("OPERADOR, >="); }
"<"                { System.out.println("OPERADOR, <"); }
"="                { System.out.println("OPERADOR, ="); }
"!"                { System.out.println("OPERADOR, !"); }
"+"                { System.out.println("OPERADOR, +"); }
"-"                { System.out.println("OPERADOR, -"); }
"*"                { System.out.println("OPERADOR, *"); }
"/"                { System.out.println("OPERADOR, /"); }

/* Delimitadores */
"("                { System.out.println("DELIMITADOR, ()"); }
")"                { System.out.println("DELIMITADOR, ()"); }
"{"                { System.out.println("DELIMITADOR, {}"); }
"}"                { System.out.println("DELIMITADOR, {}"); }
"["                { System.out.println("DELIMITADOR, []"); }
"]"                { System.out.println("DELIMITADOR, []"); }
"."                { System.out.println("DELIMITADOR, ."); }
","                { System.out.println("DELIMITADOR, ,"); }
";"                { System.out.println("DELIMITADOR, ;"); }

/* EOF */
<<EOF>>            { System.out.println("EOF"); return; }

/* Qualquer outro caractere → erro */
.                  { System.out.println("ERRO(" + yytext() + ")"); }