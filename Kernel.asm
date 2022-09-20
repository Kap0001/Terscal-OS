[org 0x7c00]
[BITS 16]

stage1:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa

mov ah, 0x0e
mov al, 'W'
int 10h

mov ah, 0x0e
mov al, 'E'
int 10h

mov ah, 0x0e
mov al, 'L'
int 10h

mov ah, 0x0e
mov al, 'C'
int 10h

mov ah, 0x0e
mov al, 'O'
int 10h

mov ah, 0x0e
mov al, 'M'
int 10h

mov ah, 0x0e
mov al, 'E'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'T'
int 10h

mov ah, 0x0e
mov al, 'O'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'T'
int 10h

mov ah, 0x0e
mov al, 'E'
int 10h

mov ah, 0x0e
mov al, 'R'
int 10h

mov ah, 0x0e
mov al, 'S'
int 10h

mov ah, 0x0e
mov al, 'C'
int 10h

mov ah, 0x0e
mov al, 'A'
int 10h

mov ah, 0x0e
mov al, 'L'
int 10h

mov ah, 0x0e
mov al, '-'
int 10h

mov ah, 0x0e
mov al, 'O'
int 10h

mov ah, 0x0e
mov al, 'S'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, '>'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

userinput:
cmp al, 3fh
je a

cmp al, 9h
je tab

cmp al, 1bh
je reboot

cmp al, 62h
je se

cmp al, 68h
je _help

mov ah, 00
int 16h

mov ah, 0x0e
int 0x10

jmp userinput

a:
jmp boot

tab:
mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

jmp userinput

reboot:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa

jmp start


se:
cli
hlt


_help:
[org 0x7c00]
[bits 16]

help:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa

mov ah, 0x0e
mov al, 'C'
int 10h

mov ah, 0x0e
mov al, 'o'
int 10h

mov ah, 0x0e
mov al, 'm'
int 10h

mov ah, 0x0e
mov al, 'm'
int 10h

mov ah, 0x0e
mov al, 'a'
int 10h

mov ah, 0x0e
mov al, 'n'
int 10h

mov ah, 0x0e
mov al, 'd'
int 10h

mov ah, 0x0e
mov al, 's'
int 10h

mov ah, 0x0e
mov al, ':'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'E'
int 10h

mov ah, 0x0e
mov al, 'S'
int 10h

mov ah, 0x0e
mov al, 'C'
int 10h

mov ah, 0x0e
mov al, ':'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'R'
int 10h

mov ah, 0x0e
mov al, 'e'
int 10h

mov ah, 0x0e
mov al, 'b'
int 10h

mov ah, 0x0e
mov al, 'o'
int 10h
mov ah, 0x0e
mov al, 'o'
int 10h

mov ah, 0x0e
mov al, 't'
int 10h

mov ah, 0x0e
mov al, ','
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'H'
int 10h

mov ah, 0x0e
mov al, ':'
int 10h

mov ah, 0x0e
mov al, ' '
int 10h

mov ah, 0x0e
mov al, 'H'
int 10h

mov ah, 0x0e
mov al, 'e'
int 10h

mov ah, 0x0e
mov al, 'l'
int 10h

mov ah, 0x0e
mov al, 'p'
int 10h

mov ah, 00
int 16h

mov ah, 0x0e
int 10h

call stage1
