grammar Calc;

// Regras do parser: começam com letra minúscula.
programa : comando* EOF ;

comando
    : ID '=' expr ';'         # Atribuicao
    | 'imprima' expr ';'      # Impressao
    ;

// A ordem das alternativas recursivas dá prioridade a * e / sobre + e -.
expr
    : '-' expr                    # Negativo
    | expr op=('*' | '/') expr     # MultiplicacaoDivisao
    | expr op=('+' | '-') expr     # SomaSubtracao
    | NUMERO                      # Numero
    | ID                          # Variavel
    | '(' expr ')'                # Parenteses
    ;

// Regras do lexer: começam com letra maiúscula.
NUMERO     : [0-9]+ ('.' [0-9]+)? ;
ID         : [a-zA-Z_] [a-zA-Z_0-9]* ;
COMENTARIO : '//' ~[\r\n]* -> skip ;
ESPACO     : [ \t\r\n]+ -> skip ;
