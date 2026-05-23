// main.c
#include <stdio.h>
#include "lex.yy.c"

extern int yylex();
extern FILE* yyin;

int main(int argc, char** argv) {
    printf("\n=== Lexical Analysis Report ===\n");
    printf("Analyzing input...\n\n");
    
    if (argc > 1) {
        FILE* file = fopen(argv[1], "r");
        if (!file) {
            fprintf(stderr, "Error: Cannot open file %s\n", argv[1]);
            return 1;
        }
        yyin = file;
    }
    
    yylex();
    
    printf("\n=== Analysis Complete ===\n");
    return 0;
}