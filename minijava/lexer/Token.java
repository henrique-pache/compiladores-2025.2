package minijava.lexer;

public class Token {
    private String type;
    private Object value;
    
    public Token(String type, Object value) {
        this.type = type;
        this.value = value;
    }
    
    public String getType() { return type; }
    public Object getValue() { return value; }
    
    @Override
    public String toString() {
        return type + "(" + value + ")";
    }
}