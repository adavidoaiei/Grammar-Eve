grammar Grammar-Eve;

options {
  language=Java;
}

// Rule to define the starting point of the grammar
assignDemo
    :   'driver' ID ':' process 'return' ';' EOF
    ;

// Rule to define the process block
process
    :   'process' ':' initializationSection executionSection verificationSection
    ;

// Rule to define the initialization section
initializationSection
    :   '** initialization statements' initializationStatement* 
    ;

// Rule to define the execution section
executionSection
    :   '** execute expression' executionStatement*
    ;

// Rule to define the verification section
verificationSection
    :   '** verification statements' verificationStatement*
    ;

// Rule to define an initialization statement
initializationStatement
    :   'new' ID ':=' expression ';'
    ;

// Rule to define an execution statement
executionStatement
    :   'let' ID ':=' expression ';'
    ;

// Rule to define a verification statement
verificationStatement
    :   'expect' expression ';'
    ;

// Rule to define an expression
expression
    :   primaryExpression (operator primaryExpression)*
    ;

// Rule to define primary expressions (ID, INT, FLOAT, PARENTHESES)
primaryExpression
    :   ID
    |   INT
    |   FLOAT
    |   '(' expression ')'
    ;

// Rule to define operators
operator
    :   '=='
    |   '+'
    ;

// Tokens for identifiers, integers, floats and comments
ID  :   ('a'..'z' | 'A'..'Z')+ ;
INT :   '0'..'9'+ ;
FLOAT : '0'..'9'+ '.' '0'..'9'+ ;

// Token for whitespaces (to be ignored)
WS  :   (' ' | '\t' | '\r' | '\n')+ {skip();} ;