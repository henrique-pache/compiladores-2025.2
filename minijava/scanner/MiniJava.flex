package minijava;

import java_cup.runtime.*;


/* MiniJava.flex - Scanner para MiniJava */

%%

%public
%class MiniJavaScanner
%unicode
%line
%column
%char
%final
%cup
%type Symbol

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

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
"class"            { return symbol(sym.CLASS); }
"public"           { return symbol(sym.PUBLIC); }
"static"           { return symbol(sym.STATIC); }
"void"             { return symbol(sym.VOID); }
"main"             { return symbol(sym.MAIN); }
"String"           { return symbol(sym.STRING); }
"extends"          { return symbol(sym.EXTENDS); }
"return"           { return symbol(sym.RETURN); }
"int"              { return symbol(sym.INT); }
"boolean"          { return symbol(sym.BOOLEAN); }
"if"               { return symbol(sym.IF); }
"else"             { return symbol(sym.ELSE); }
"while"            { return symbol(sym.WHILE); }
"true"             { return symbol(sym.TRUE); }
"false"            { return symbol(sym.FALSE); }
"this"             { return symbol(sym.THIS); }
"new"              { return symbol(sym.NEW); }
"length"           { return symbol(sym.LENGTH); }

/* System.out.println como token único */
"System.out.println" { return symbol(sym.SYSTEM_OUT_PRINTLN); }

/* Números inteiros */
{INTEGER}          { return symbol(sym.INTEGER_LITERAL, new Integer(yytext())); }

/* Identificadores */
{ID_START}{ID_PART}* { return symbol(sym.IDENTIFIER, yytext()); }

/* Operadores */
"&&"               { return symbol(sym.AND); }
"=="               { return symbol(sym.EQ_EQ); }
"!="               { return symbol(sym.NOT_EQ); }
"<="               { return symbol(sym.LEQ); }
">="               { return symbol(sym.GEQ); }
"<"                { return symbol(sym.LT); }
"="                { return symbol(sym.ASSIGN); }
"!"                { return symbol(sym.NOT); }
"+"                { return symbol(sym.PLUS); }
"-"                { return symbol(sym.MINUS); }
"*"                { return symbol(sym.TIMES); }
"/"                { return symbol(sym.DIVIDE); }

/* Delimitadores */
"("                { return symbol(sym.LPAREN); }
")"                { return symbol(sym.RPAREN); }
"{"                { return symbol(sym.LBRACE); }
"}"                { return symbol(sym.RBRACE); }
"["                { return symbol(sym.LBRACKET); }
"]"                { return symbol(sym.RBRACKET); }
"."                { return symbol(sym.DOT); }
","                { return symbol(sym.COMMA); }
";"                { return symbol(sym.SEMICOLON); }

/* EOF */
<<EOF>>            { return null; }

/* Qualquer outro caractere → erro */
.                  { 
                     throw new RuntimeException(
                         "ERRO: caractere não reconhecido '" + yytext() + 
                         "' na linha " + (yyline + 1) + 
                         ", coluna " + (yycolumn + 1)
                     ); 
                   }