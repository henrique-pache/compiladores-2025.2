package calculadora;
import java.io.FileReader;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader reader = new FileReader("calculadora/entradas/entrada.txt");
        // FileReader reader = new FileReader("calculadora/entradas/calc_erro_1.txt");
        // FileReader reader = new FileReader("calculadora/entradas/calc_ok_1.txt");
        // FileReader reader = new FileReader("calculadora/entradas/calc_ok_2.txt");
        CalcScanner scanner = new CalcScanner(reader);

        while (!scanner.yyatEOF()) {
            scanner.yylex();  // imprime tokens no console
        }

        reader.close();
    }
}