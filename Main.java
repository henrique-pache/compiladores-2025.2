import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader reader = new FileReader("entrada.txt");
        CalcScanner scanner = new CalcScanner(reader);

        while (!scanner.yyatEOF()) {
            scanner.yylex();  // imprime tokens no console
        }

        reader.close();
    }
}