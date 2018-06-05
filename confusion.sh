#!/bin/bash
nasm -f elf64 ./confusion.asm -o ./confusion.o -g
ld -o ./confusion ./confusion.o
strip ./confusion
