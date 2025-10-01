CC = gcc
CCFLAGS = -Wall -g
TARGET = hello

TARGET: hello.c
	@echo "Criando o programa 'hello'"
	$(CC) $(CCFLAGS) -o $(TARGET) hello.c

clean:
	@echo "Removendo $(TARGET)"
	rm -f hello
