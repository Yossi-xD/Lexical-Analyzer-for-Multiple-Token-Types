CC = gcc
LEX = flex
TARGET = lexical_analyzer
SOURCE = lexical_analyzer.lex

all:
	$(LEX) $(SOURCE)
	$(CC) lex.yy.c -o $(TARGET)
	@echo "Done! Run with: ./$(TARGET) test_input.txt"

run: all
	./$(TARGET) test_input.txt

clean:
	rm -f lex.yy.c $(TARGET)
