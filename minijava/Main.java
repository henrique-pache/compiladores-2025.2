package minijava;

import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader reader = new FileReader("minijava/entradas/minijava_erro_1.txt");
//        FileReader reader = new FileReader("./entradas/minijava_erro_2.txt");
//        FileReader reader = new FileReader("./entradas/minijava_ok_1.txt");
//        FileReader reader = new FileReader("./entradas/minijava_ok_2.txt");
        MiniJavaScanner scanner = new MiniJavaScanner(reader);

        while (!scanner.yyatEOF()) {
            scanner.yylex();
        }

        reader.close();
    }
}