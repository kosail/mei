pub const TokenType = enum {
    NEWLINE, // \n
    INDENT, // identation++
    DEDENT, // identation--
    SEMICOLON, // ;
    COMMA, // ,
    COLON, // :

    LPAREN, // (
    RPAREN, // )
    LBRACKET, // [
    RBRACKET, // ]
    LBRACE, // {
    RBRACE, // }

    IDENTIFIER,
    INT_LITERAL,
    FLOAT_LITERAL,
    STRING_LITERAL,
    BOOL_LITERAL,
    NULL_LITERAL,

    PLUS,
    MINUS,
    STAR,
    SLASH,
    BACKSLASH,
    PERCENT,

    ARROW, // -> (for return types in functions)
    ASSIGN, // =
    EQ, // ==
    NEQ, // !=
    LT, // <
    LTE, // <=
    GT, // >
    GTE, // >=

    AND,
    OR,
    NOT,

    FN, // function
    RETURN,
    IF,
    ELSE,
    WHILE,
    VAR, // variable
    CONST, // constant
    TRY,
    CATCH,

    // To help identifiers to match explicit typing.
    TYPE_INT, // int
    TYPE_FLOAT, // float
    TYPE_BOOL, // boolean
    TYPE_STRING, // string
    TYPE_NOTHING, // nothing (AKA void)

    LINE_COMMENT, // //comment
    BLOCK_COMMENT, // /* comment */
};
