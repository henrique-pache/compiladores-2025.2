@echo off
REM Ir para a pasta do script
cd /d "%~dp0"

REM Compila tudo 
call run.bat

pause

echo.
echo ===========================================
echo Rodando todos os testes de MiniJava...
echo ===========================================
echo.

for %%F in (entradas\*.txt) do (
    echo.
    echo -------------------------------------------
    echo Arquivo: %%F
    echo -------------------------------------------
    java -cp "..\jar\java-cup-11b-runtime.jar;src" minijava.Main < "%%F"
)

echo.
echo ===========================================
echo Fim dos testes
echo ===========================================
pause