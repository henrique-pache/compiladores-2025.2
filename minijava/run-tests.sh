#!/usr/bin/env bash

# Ir para a pasta do script
cd "$(dirname "$0")"

# Compila tudo
./run.sh

echo
echo "==========================================="
echo "Rodando todos os testes de MiniJava..."
echo "==========================================="
echo

for f in entradas/*.txt; do
  echo
  echo "-------------------------------------------"
  echo "Arquivo: $f"
  echo "-------------------------------------------"
  java -cp "../jar/java-cup-11b-runtime.jar:src" minijava.Main < "$f"
done

echo
echo "==========================================="
echo "Fim dos testes"
echo "==========================================="