# Compiladores 2025.2

Este projeto contém dois scanners desenvolvidos utilizando JFlex: um para uma calculadora simples e outro para a linguagem MiniJava. Abaixo estão as instruções detalhadas para executar cada um deles.

---

## Scanner da Calculadora

### O que foi feito:
Foi implementado um scanner para uma calculadora simples utilizando JFlex. O arquivo `Calc.flex` contém as definições das expressões regulares para os tokens reconhecidos. O scanner gerado é integrado ao programa principal em `Main.java`.

### Como executar:

1. **Gerar o scanner com JFlex:**

   Navegue até o diretório raiz do projeto e execute o comando abaixo para gerar o scanner a partir do arquivo `Calc.flex`:

   ```powershell
   java -jar jar\jflex-full-1.9.1.jar calculadora\Calc.flex
   ```

2. **Compilar os arquivos Java:**

   Compile os arquivos Java no diretório `calculadora`:

   ```powershell
   javac calculadora\*.java
   ```

3. **Executar o programa:**

   Execute o programa principal:

   ```powershell
   java calculadora.Main
   ```

   Para alterar a entrada avaliada, edite o caminho do arquivo de entrada em `calculadora/Main.java`.

---

## Scanner de MiniJava

### O que foi feito:
Foi implementado um scanner para a linguagem MiniJava utilizando JFlex. O arquivo `MiniJava.flex` contém as definições das expressões regulares para os tokens reconhecidos. O scanner gerado é integrado ao programa principal em `Main.java`.

### Como executar:

#### Usando comandos manuais:

1. **Gerar o scanner com JFlex:**

   Navegue até o diretório raiz do projeto e execute o comando abaixo para gerar o scanner a partir do arquivo `MiniJava.flex`:

   ```powershell
   java -jar jar\jflex-full-1.9.1.jar minijava\MiniJava.flex
   ```

2. **Compilar os arquivos Java:**

   Compile os arquivos Java no diretório `minijava`:

   ```powershell
   javac minijava\*.java
   ```

3. **Executar o programa:**

   Execute o programa principal:

   ```powershell
   java minijava.Main
   ```

   Para alterar a entrada avaliada, edite o caminho do arquivo de entrada em `minijava/Main.java`.

#### Usando os scripts `.bat` ou `.sh`:

1. **Windows:**

   Execute o arquivo `run.bat` localizado no diretório `minijava`:

   ```powershell
   .\minijava\run.bat
   ```

2. **Linux/Mac:**

   Execute o arquivo `run.sh` localizado no diretório `minijava`:

   ```bash
   ./minijava/run.sh
   ```

Esses scripts automatizam os passos de geração, compilação e execução do scanner.

---

Certifique-se de que o JDK está instalado e configurado corretamente no sistema. Além disso, o arquivo `jflex-full-1.9.1.jar` deve estar presente no diretório `jar` do projeto.
