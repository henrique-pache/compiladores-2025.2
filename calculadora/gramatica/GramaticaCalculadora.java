package calculadora.gramatica;

import java.util.*;

/**
 * Gramática da Calculadora:
 * E -> E + T | E - T | T
 * T -> T * F | T / F | F
 * F -> ( E ) | num
 * 
 * Gramática equivalente sem recursão à esquerda:
 * E  -> T E'
 * E' -> + T E' | - T E' | ε
 * T  -> F T'
 * T' -> * F T' | / F T' | ε
 * F  -> ( E ) | num
 */
public class GramaticaCalculadora {
    
    private Map<String, List<String[]>> producoes;
    private Set<String> naoTerminais;
    private Set<String> terminais;
    private Map<String, Set<String>> first;
    private Map<String, Set<String>> follow;
    
    public GramaticaCalculadora() {
        inicializarGramatica();
        calcularFirst();
        calcularFollow();
    }
    
    private void inicializarGramatica() {
        producoes = new HashMap<>();
        naoTerminais = new HashSet<>(Arrays.asList("E", "E'", "T", "T'", "F"));
        terminais = new HashSet<>(Arrays.asList("+", "-", "*", "/", "(", ")", "num", "$"));
        
        // E -> T E'
        producoes.put("E", Arrays.asList(new String[]{"T", "E'"}));
        
        // E' -> + T E' | - T E' | ε
        producoes.put("E'", Arrays.asList(
            new String[]{"+", "T", "E'"},
            new String[]{"-", "T", "E'"},
            new String[]{"ε"}
        ));
        
        // T -> F T'
        producoes.put("T", Arrays.asList(new String[]{"F", "T'"}));
        
        // T' -> * F T' | / F T' | ε
        producoes.put("T'", Arrays.asList(
            new String[]{"*", "F", "T'"},
            new String[]{"/", "F", "T'"},
            new String[]{"ε"}
        ));
        
        // F -> ( E ) | num
        producoes.put("F", Arrays.asList(
            new String[]{"(", "E", ")"},
            new String[]{"num"}
        ));
    }
    
    private void calcularFirst() {
        first = new HashMap<>();
        
        // Inicializar FIRST para terminais
        for (String t : terminais) {
            first.put(t, new HashSet<>(Arrays.asList(t)));
        }
        
        // Inicializar FIRST para não-terminais
        for (String nt : naoTerminais) {
            first.put(nt, new HashSet<>());
        }
        
        // Calcular FIRST iterativamente
        boolean mudou = true;
        while (mudou) {
            mudou = false;
            for (String nt : naoTerminais) {
                for (String[] producao : producoes.get(nt)) {
                    Set<String> antes = new HashSet<>(first.get(nt));
                    first.get(nt).addAll(calcularFirstProducao(producao));
                    if (!first.get(nt).equals(antes)) {
                        mudou = true;
                    }
                }
            }
        }
    }
    
    private Set<String> calcularFirstProducao(String[] producao) {
        Set<String> resultado = new HashSet<>();
        
        if (producao[0].equals("ε")) {
            resultado.add("ε");
            return resultado;
        }
        
        for (String simbolo : producao) {
            Set<String> firstSimbolo = first.get(simbolo);
            resultado.addAll(firstSimbolo);
            resultado.remove("ε");
            
            if (!firstSimbolo.contains("ε")) {
                break;
            }
        }
        
        return resultado;
    }
    
    private void calcularFollow() {
        follow = new HashMap<>();
        
        for (String nt : naoTerminais) {
            follow.put(nt, new HashSet<>());
        }
        
        follow.get("E").add("$");
        
        boolean mudou = true;
        while (mudou) {
            mudou = false;
            for (String nt : naoTerminais) {
                for (String[] producao : producoes.get(nt)) {
                    mudou |= atualizarFollow(nt, producao);
                }
            }
        }
    }
    
    private boolean atualizarFollow(String ladoEsquerdo, String[] producao) {
        boolean mudou = false;
        
        for (int i = 0; i < producao.length; i++) {
            String simbolo = producao[i];
            
            if (naoTerminais.contains(simbolo)) {
                Set<String> antes = new HashSet<>(follow.get(simbolo));
                
                if (i < producao.length - 1) {
                    Set<String> firstProximo = calcularFirstProducao(
                        Arrays.copyOfRange(producao, i + 1, producao.length)
                    );
                    follow.get(simbolo).addAll(firstProximo);
                    follow.get(simbolo).remove("ε");
                    
                    if (firstProximo.contains("ε")) {
                        follow.get(simbolo).addAll(follow.get(ladoEsquerdo));
                    }
                } else {
                    follow.get(simbolo).addAll(follow.get(ladoEsquerdo));
                }
                
                if (!follow.get(simbolo).equals(antes)) {
                    mudou = true;
                }
            }
        }
        
        return mudou;
    }
    
    public void imprimirFirst() {
        System.out.println("=== FIRST ===");
        for (String nt : naoTerminais) {
            System.out.println("FIRST(" + nt + ") = " + first.get(nt));
        }
    }
    
    public void imprimirFollow() {
        System.out.println("\n=== FOLLOW ===");
        for (String nt : naoTerminais) {
            System.out.println("FOLLOW(" + nt + ") = " + follow.get(nt));
        }
    }
    
    public Map<String, Set<String>> getFirst() {
        return first;
    }
    
    public Map<String, Set<String>> getFollow() {
        return follow;
    }
    
    public Map<String, List<String[]>> getProducoes() {
        return producoes;
    }
}
