# confusion
A small piece of x64 assembly that may throw off disassemblers like objdump.
It is nothing more than an example but sometimes it works. It is also doable in x86.

It works by having a jump instruction point to a byte in .text that is not actually machinecode at a place execution will never happen. Objdump will expect this to be code because - why else would you have a jump instruction to that location?

