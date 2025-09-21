package minijava.lexer;

import java.io.FileReader;
import java.io.IOException;

public class Scanner {
    private FileReader reader;
    private int currentChar;
    
    public Scanner(FileReader reader) throws IOException {
        this.reader = reader;
        this.currentChar = reader.read();
    }
}
