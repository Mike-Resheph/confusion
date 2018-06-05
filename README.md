# confusion
A small piece of x64 assembly that may throw off disassemblers like objdump.
It is nothing more than an example but sometimes it works. It is also doable in x86.

It works by having a jump instruction point to a byte in .text that is not actually machinecode at a place execution will never happen. Objdump will expect this to be code because - why else would you have a jump instruction to that location?

## The actual assembly:
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
	mov	rax,60
	mov	rbx,0
	syscall

## Output from Objdump:
root@kalibox:~/code/assembly/x64/confusion# objdump -d -M intel confusion

confusion:     file format elf64-x86-64


Disassembly of section .text:

0000000000400080 <.text>:
  400080:	90                   	nop
  400081:	b8 02 00 00 00       	mov    eax,0x2
  400086:	48 83 f8 03          	cmp    rax,0x3
  40008a:	74 0c                	je     0x400098
  40008c:	48 b8 99 00 40 00 00 	movabs rax,0x400099
  400093:	00 00 00 
  400096:	ff e0                	jmp    rax
  400098:	d8 48 31             	fmul   DWORD PTR [rax+0x31]
  40009b:	c0 90 b8 3c 00 00 00 	rcl    BYTE PTR [rax+0x3cb8],0x0
  4000a2:	bb 00 00 00 00       	mov    ebx,0x0
  4000a7:	0f 05                	syscall 
