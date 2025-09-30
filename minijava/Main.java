package minijava;

import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader reader = new FileReader("minijava/Entrada.java");
        MiniJavaScanner scanner = new MiniJavaScanner(reader);

        while (!scanner.yyatEOF()) {
            scanner.yylex();
        }

        reader.close();
    }
}