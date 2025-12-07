package minijava;

import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) {
        try {
            // Lê o conteúdo do arquivo como String
            String codigo = new String(
                Files.readAllBytes(Paths.get("entradas/minijava_ok_5.txt"))
            );

            System.out.println("=== CÓDIGO FONTE ===");
            System.out.println(codigo);
            
            // ---------- Análise Léxica ----------
            System.out.println("\n=== ANÁLISE LÉXICA ===");
            System.out.println("==================================");
            Lexer lexer = new Lexer(new StringReader(codigo));
            Symbol s = lexer.next_token();
            int tokenCount = 0;
            while (s != null && s.sym != 0) {
                String symbolName = getSymbolName(s.sym);
                System.out.printf("ID %2d (%s) = %s\n", s.sym, symbolName, s.value != null ? s.value : "null");
                tokenCount++;
                s = lexer.next_token();
            }
            System.out.println("Total de tokens: " + tokenCount);

            // ---------- Análise Sintática ------------ 
            System.out.println("\n=== ANÁLISE SINTÁTICA ===");
            Lexer scanner = new Lexer(new StringReader(codigo));
            Parser parser = new Parser(scanner, new java_cup.runtime.DefaultSymbolFactory());
            try {
                Symbol result = parser.parse();
                System.out.println(result);
                System.out.println("\n✓ Parse realizado com SUCESSO!");
                if (result != null && result.value != null) {
                    System.out.println("Resultado: " + result.value);
                }
            } catch (Exception e) {
                System.out.println("\n✗ Erro durante o parsing: " + e.getMessage());
                e.printStackTrace();
            }

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private static String getSymbolName(int symId) {
        return switch(symId) {
            case 0 -> "EOF";
            case 1 -> "error";
            case 2 -> "CLASS";
            case 3 -> "PUBLIC";
            case 4 -> "STATIC";
            case 5 -> "VOID";
            case 6 -> "MAIN";
            case 7 -> "STRING";
            case 8 -> "EXTENDS";
            case 9 -> "RETURN";
            case 10 -> "INT";
            case 11 -> "BOOLEAN";
            case 12 -> "IF";
            case 13 -> "ELSE";
            case 14 -> "WHILE";
            case 15 -> "TRUE";
            case 16 -> "FALSE";
            case 17 -> "THIS";
            case 18 -> "NEW";
            case 19 -> "LENGTH";
            case 20 -> "SYSTEM_OUT_PRINTLN";
            case 21 -> "AND";
            case 22 -> "EQ_EQ";
            case 23 -> "NOT_EQ";
            case 24 -> "LEQ";
            case 25 -> "GEQ";
            case 26 -> "LT";
            case 27 -> "GT";
            case 28 -> "PLUS";
            case 29 -> "MINUS";
            case 30 -> "TIMES";
            case 31 -> "DIVIDE";
            case 32 -> "ASSIGN";
            case 33 -> "NOT";
            case 34 -> "LPAREN";
            case 35 -> "RPAREN";
            case 36 -> "LBRACE";
            case 37 -> "RBRACE";
            case 38 -> "LBRACKET";
            case 39 -> "RBRACKET";
            case 40 -> "DOT";
            case 41 -> "COMMA";
            case 42 -> "SEMICOLON";
            case 43 -> "INTEGER_LITERAL";
            case 44 -> "IDENTIFIER";
            default -> "UNKNOWN";
        };
    }
}


