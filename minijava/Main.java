package minijava;
import java.io.FileReader;
import java.util.List;

import minijava.lexer.Scanner;
import minijava.lexer.Token;

public class Main {
    public Main() {
   }

    public static void main(String[] var0) throws Exception {
        FileReader entrada = new FileReader("entrada.txt");
        Scanner scanner = new Scanner(entrada);

        List<Token> tokens = scanner.tokenize();

        for (Token t : tokens) {
            System.out.println(t);
        }
    }
}
