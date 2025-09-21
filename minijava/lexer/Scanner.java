package minijava.lexer;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Scanner {
    private FileReader reader;
    private int currentChar;
    
    public Scanner(FileReader reader) throws IOException {
        this.reader = reader;
        this.currentChar = reader.read();
    }

    private Token readNumber() throws IOException {
        StringBuilder number = new StringBuilder();
        
        while (Character.isDigit((char)currentChar) || (char)currentChar == '.') {
            number.append((char)currentChar);
            currentChar = reader.read();
        }
        
        return new Token("NUMBER", Double.parseDouble(number.toString()));
    }
    
    public Token findToken() throws IOException {
        while (currentChar != -1) {
            if (Character.isWhitespace((char)currentChar)) {
                currentChar = reader.read();
                continue;
            }
            
            if (Character.isDigit((char)currentChar)) {
                return readNumber();
            }
            
            switch ((char)currentChar) {
                case '+':
                    currentChar = reader.read();
                    return new Token("PLUS", '+');
                case '-':
                    currentChar = reader.read();
                    return new Token("MINUS", '-');
                case '*':
                    currentChar = reader.read();
                    return new Token("TIMES", '*');
                case '/':
                    currentChar = reader.read();
                    return new Token("DIV", '/');
                case '(':
                    currentChar = reader.read();
                    return new Token("LPAREN", '(');
                case ')':
                    currentChar = reader.read();
                    return new Token("RPAREN", ')');
                default:
                    throw new RuntimeException("Caractere inválido: " + (char)currentChar);
            }
        }
        return new Token("EOF", "EOF");
    }
    
    public List<Token> tokenize() throws IOException {
        List<Token> tokens = new ArrayList<>();
        Token token;
        
        do {
            token = findToken();
            tokens.add(token);
        } while (token.getType() != "EOF");
        
        return tokens;
    }
}