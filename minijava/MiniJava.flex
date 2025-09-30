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

/* Comentários */
COMMENT_LINE = "//"[^\r\n]*
COMMENT_BLOCK = "/*"([^*]|"*"[^/])*"*/"

%%

/* Espaços em branco e comentários - ignorar */
{WHITESPACE}       {}
{COMMENT_LINE}     {}
{COMMENT_BLOCK}    {}

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
"length"           { System.out.println("RESERVADA, length"); }

/* System.out.println como token único */
"System.out.println" { System.out.println("RESERVADA, System.out.println"); }

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
.                  { 
                     throw new RuntimeException(
                         "ERRO: caractere não reconhecido '" + yytext() + 
                         "' na linha " + (yyline + 1) + 
                         ", coluna " + (yycolumn + 1)
                     ); 
                   }