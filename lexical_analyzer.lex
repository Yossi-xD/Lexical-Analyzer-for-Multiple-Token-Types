%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int line_number = 1;

void report_token(const char* type, const char* lexeme) {
    printf("Line %3d: %-15s -> \"%s\"\n", line_number, type, lexeme);
}
%}

%option noyywrap

/* Regular Expression Definitions */
DIGIT           [0-9]
LETTER          [a-zA-Z]
UNDERSCORE      _
SIGN            [+-]?
EXPONENT        [eE][+-]?{DIGIT}+

/* Integer definition */
INTEGER         {SIGN}{DIGIT}+

/* Float definition */
FLOAT           {SIGN}{DIGIT}+\.{DIGIT}+{EXPONENT}?|{SIGN}{DIGIT}+{EXPONENT}

/* Identifier definition - FIXED: allows underscore at start */
ID              [_a-zA-Z][_a-zA-Z0-9]*

/* Keywords */
KEYWORD         if|while|for|switch|case|break|continue

/* Phone number definitions */
PHONE           ([0-9]{2,3}-[0-9]{3}-[0-9]{4})|(\+[0-9]{1,3}-[0-9]{2,3}-[0-9]{3}-[0-9]{4})

/* Email definitions */
EMAIL           [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?

/* Address definitions */
ADDRESS         [0-9]+[ \t]+[a-zA-Z0-9\.,' \t-]+,[a-zA-Z\.,' \t-]+,[a-zA-Z\.,' \t-]+,[a-zA-Z\.,' \t-]+

/* Whitespace and comments */
WHITESPACE      [ \t\r]+
NEWLINE         \n
COMMENT         "//"[^\n]*

%%

{INTEGER}       { report_token("INTEGER", yytext); }
{FLOAT}         { report_token("FLOAT", yytext); }
{KEYWORD}       { report_token("KEYWORD", yytext); }
{ADDRESS}       { report_token("ADDRESS", yytext); }
{ID}            { report_token("IDENTIFIER", yytext); }
{PHONE}         { report_token("PHONE_NUMBER", yytext); }
{EMAIL}         { report_token("EMAIL_ADDRESS", yytext); }
{COMMENT}       { /* Skip comments */ }
{WHITESPACE}    { /* Skip whitespace */ }
{NEWLINE}       { line_number++; }
.               { report_token("UNKNOWN", yytext); }

%%

int main(int argc, char** argv) {
    printf("\n=== LEXICAL ANALYSIS REPORT ===\n\n");
    
    if (argc > 1) {
        extern FILE* yyin;
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            fprintf(stderr, "Error: Cannot open file %s\n", argv[1]);
            return 1;
        }
    }
    
    yylex();
    
    printf("\n=== END OF ANALYSIS ===\n");
    return 0;
}