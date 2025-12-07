package minijava;

import java.util.ArrayList;
import java.util.List;

public class ASTNode {
    private final String label;
    private Object value;
    private final List<ASTNode> children;

    public ASTNode(String label) {
        this.label = label;
        this.children = new ArrayList<>();
    }

    public ASTNode(String label, Object value) {
        this.label = label;
        this.value = value;
        this.children = new ArrayList<>();
    }

    public void addChild(ASTNode child) {
        if (child != null) {
            this.children.add(child);
        }
    }

    public String getLabel() {
        return label;
    }

    public Object getValue() {
        return value;
    }

    public List<ASTNode> getChildren() {
        return children;
    }

    public void print(int indent) {
        String indentation = "  ".repeat(indent);
        if (value != null) {
            System.out.println(indentation + label + ": " + value);
        } else {
            System.out.println(indentation + label);
        }
        for (ASTNode child : children) {
            child.print(indent + 1);
        }
    }
}
