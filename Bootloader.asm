org			0x7c00
BITS 		16

start:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa

jmp boot


boot:
	call stage1

	call userinput

	%include "Kernel.asm"



times 510-($-$$) db 0
dw 0XAA55
