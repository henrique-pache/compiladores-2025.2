# Compiladores 2025.2

IDE escolhida: VS Code

### Para executar o Scanner da Calculadora:

1. Gerar o scanner com JFlex

```bash
java -jar jflex-full-1.9.1.jar calculadora/Calc.flex
```

2. Compilar

```bash
javac calculadora/*.java
```

3. Executar

```bash
java calculadora.Main
```

Para trocar a entrada avalida, troque o caminho em: `calculadora/Main.java`

### Para executar o Scanner de Minijava:

1. Gerar o scanner com JFlex

```bash
java -jar jflex-full-1.9.1.jar minijava/MiniJava.flex
```

2. Compilar

```bash
javac minijava/*.java
```

3. Executar

```bash
java minijava/Main
```

Para trocar a entrada avalida, troque o caminho em: `minijava/Main.java`
