package minijava;
import java.io.FileReader;
import minijava.lexer.Scanner;

public class Main {
    public Main() {
   }

    public static void main(String[] var0) throws Exception {
        FileReader entrada = new FileReader("entrada.txt");
        Scanner scanner = new Scanner(entrada);
    }
}
