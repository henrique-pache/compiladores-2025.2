import java.io.StringReader;

public class Main {
    public static void main(String[] args) throws Exception {
        String input = "3 + 4.5 * (2 ** 3)";
        CalcScanner scanner = new CalcScanner(new StringReader(input));
        scanner.yylex();  // imprime tokens no console
    }
}