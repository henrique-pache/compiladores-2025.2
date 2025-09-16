# Calculadora com JFlex

Este projeto implementa um **scanner para uma calculadora simples** usando **JFlex 1.9** e **Java 1.9**. Ele reconhece números inteiros, números de ponto flutuante e operadores matemáticos básicos (`+`, `-`, `*`, `/`, `//`, `^`, `(`, `)`).

---

## Estrutura do Projeto

```
compiladores-2025.2/
├── Calc.flex          # Arquivo fonte JFlex
├── CalcScanner.java   # Scanner gerado pelo JFlex
├── Main.java          # Programa principal para testar o scanner
├── entrada.txt        # Arquivo de entrada com expressões matemáticas
├── java-cup-11b.jar   # Runtime do Java CUP (se necessário)
└── README.md
```

---

## Pré-requisitos

* Java 1.9 (ou superior)
* JFlex 1.9 (JAR)
* Terminal/Console (Mac/Linux/Windows)

---

## Passo 1: Criar o arquivo de entrada

Crie um arquivo chamado `entrada.txt` no diretório do projeto com uma expressão matemática, por exemplo:

```
3 + 4.5 * (2 ** 3)
```

---

## Passo 2: Gerar o scanner com JFlex

```bash
# No diretório do projeto
java -jar jflex-1.9.1.jar Calc.flex
```

Isso irá gerar o arquivo `CalcScanner.java`.

> ⚠️ Se você estiver usando regras que dependem de Java CUP, certifique-se de incluir o JAR do CUP no classpath. Caso contrário, o scanner simples funciona sem CUP.

---

## Passo 3: Compilar os arquivos Java

```bash
# Compila todos os arquivos Java
javac *.java
```

Isso irá gerar os `.class` correspondentes: `CalcScanner.class` e `Main.class`.

---

## Passo 4: Executar o programa principal

```bash
# Executa o programa
java Main
```

O scanner irá ler `entrada.txt` e imprimir os tokens reconhecidos, por exemplo:

```
INT(3)
PLUS
FLOAT(4.5)
TIMES
LPAREN
INT(2)
POW
INT(3)
RPAREN
```

* Qualquer caractere não reconhecido será mostrado como `ERRO(x)`.

---

## Passo 5: Customizações (opcional)

* **Ignorar letras/variáveis não reconhecidas**:

No arquivo `Calc.flex`, adicione:

```jflex
[a-zA-Z]+ { /* ignora letras */ }
```

* **Adicionar suporte a variáveis**:

```jflex
[a-zA-Z][a-zA-Z0-9]* { System.out.println("ID(" + yytext() + ")"); }
```

---

## Dicas

* Sempre que modificar o `.flex`, **gere novamente o scanner** com JFlex antes de compilar.
* Para compatibilidade, execute com **Java 1.9**, pois versões mais novas podem ter problemas com a sintaxe do scanner antigo.
* O programa agora lê diretamente do arquivo `entrada.txt` e encerra normalmente após processar a expressão.

---

## Links úteis

* [JFlex](https://jflex.de/)
* [Java CUP](https://www2.cs.tum.edu/projects/cup/)

---

Feito com ❤️ para a disciplina de compiladores 2025.2 da Universidade Federal Fluminense.
