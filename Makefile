# Makefile to build the project

# Flags to pass to GCC
CFLAGS = -g -Wall -pedantic -O2 -std=c99

# Flags to pass to nasm
AFLAGS = -g -f elf64

PROG = hash
OBJECTS = hash.o hash1.o

# Default target - what gets built if you just run "make"
all: $(PROG)

# To make the executable, link all the objects together
$(PROG): $(OBJECTS)
	gcc $(CFLAGS) -o $(PROG) $(OBJECTS)

# To compile a C file, use GCC
%.o: %.c
	gcc $(CFLAGS) -c $<

# To compile an assembler file, use nasm
%.o: %.s
	nasm $(AFLAGS) $<

# Clean up compiled files
clean:
	rm -f $(PROG) $(OBJECTS)
