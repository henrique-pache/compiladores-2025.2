#!/bin/bash

echo "Limpando arquivos antigos..."
rm -f src/Lexer.java 2>/dev/null
rm -f src/Parser.java 2>/dev/null
rm -f src/sym.java 2>/dev/null
rm -f src/*.class 2>/dev/null
rm -rf src/minijava/*.class 2>/dev/null
rm -f src/minijava/Lexer.java 2>/dev/null
rm -f src/minijava/Parser.java 2>/dev/null

echo "Gerando o analisador sintatico..."
java -jar ../jar/java-cup-11b.jar -parser Parser -symbols sym -destdir src parser.cup

echo "Gerando o analisador lexico..."
java -jar ../jar/jflex-full-1.8.2.jar -d src MiniJava.flex

echo "Copiando arquivos auxiliares..."
mkdir -p src/minijava
cp ASTNode.java src/minijava/ASTNode.java

echo "Compilando tudo..."
find src -name "*.java" -print0 | xargs -0 javac -cp "../jar/java-cup-11b-runtime.jar:src" -d src

if [ $? -ne 0 ]; then
    echo "Erro na compilacao!"
    exit 1
fi

echo "Compilacao realizada com sucesso!"
echo ""

echo "Executando..."
java -cp "../jar/java-cup-11b-runtime.jar:src" minijava.Main

echo ""
echo "Limpando arquivos temporarios..."
rm -f src/*.class 2>/dev/null
rm -rf src/minijava/*.class 2>/dev/null
rm -f src/Lexer.java 2>/dev/null
rm -f src/Parser.java 2>/dev/null
rm -f src/sym.java 2>/dev/null
rm -f src/minijava/ASTNode.java 2>/dev/null

echo "Pressione Enter para continuar..."
read