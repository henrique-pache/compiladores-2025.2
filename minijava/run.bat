@echo off

echo Limpando arquivos antigos...
del src\Lexer.java 2>nul
del src\Parser.java 2>nul
del src\sym.java 2>nul
del src\*.class 2>nul
del src\minijava\*.class 2>nul
del src\minijava\Lexer.java 2>nul
del src\minijava\Parser.java 2>nul

echo Gerando o analisador sintatico...
java -jar ..\jar\java-cup-11b.jar -parser Parser -symbols sym -destdir src parser.cup

echo Gerando o analisador lexico...
java -jar ..\jar\jflex-full-1.8.2.jar -d src MiniJava.flex

echo Copiando arquivos auxiliares...
if not exist src\minijava mkdir src\minijava
copy ASTNode.java src\minijava\ASTNode.java >nul

echo Compilando tudo...
setlocal enabledelayedexpansion
set "FILES="
for /r src %%f in (*.java) do (
    set "FILES=!FILES! "%%f""
)
javac -cp "..\jar\java-cup-11b-runtime.jar;src" -d src !FILES!

if errorlevel 1 (
    echo Erro na compilacao!
    pause
    exit /b 1
)

echo Compilacao realizada com sucesso!
echo.

echo Executando...
java -cp "..\jar\java-cup-11b-runtime.jar;src" minijava.Main

pause

del src\*.class 2>nul
del src\minijava\*.class 2>nul
del src\Lexer.java 2>nul
del src\Parser.java 2>nul
del src\sym.java 2>nul
del src\minijava\ASTNode.java 2>nul