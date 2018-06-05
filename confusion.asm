;title	"Confusion"
;********************************************************
;* Filename: confusion.asm								*
;* Author: Resheph								*
;* Version: 1.0											*
;* Kernel: 3.18.6										*
;* ISA: x64												*
;* Dist: Kali Linux										*
;* Initial Date: 2015-20-06								*
;* Purpose: Assembly that confuses disassemblers							*
;********************************************************
; Compile and link using:	*
; nasm -f elf64 ./confusion.asm -o ./confusion.o -g -Z ./errors.log	*
; ld -o ./confusion ./confusion.o					*
; Notes: Linking is not important						*
;********************************************************
; Syscalls in /usr/include/x86_64-linux-gnu/asm/unistd_64.h
; Arguments in following order: rax containing the syscall
; rdi, rsi, rdx, r10, r8, r9

BITS 64
GLOBAL _start	; Entry point for ELF linker
DEFAULT REL
SECTION .data	; Initialized data
SECTION	.bss	; Uninitialized data. 
SECTION .text	; Code block.
_start:
	nop
	mov	rax, 2
	cmp rax, 3
	je	junk
	mov	rax, ok
	jmp	rax
junk:
	db	0xd8
ok:
	xor	rax, rax
	nop

exit:
	mov	rax,60		; Systemcall exit()
	mov	rbx,0		; Returncode to OS
	syscall
