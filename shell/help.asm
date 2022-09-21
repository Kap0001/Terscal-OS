[org 0x7c00]
[bits 16]

_help:

help:
mov ah, 0x0e
mov al 'S'
int 10h

;  dont need this, so just print S.
