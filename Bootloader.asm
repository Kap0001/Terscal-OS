org			0x7c00
BITS 		16

start:
pusha
mov ah, 0x00
mov al, 0x03  ; text mode 80x25 16 colours
int 0x10
popa

mov ah, 0x0e
mov al, 'B'
int 0x10

mov ah, 0x0e
mov al, 'O'
int 0x10

mov ah, 0x0e
mov al, 'O'
int 0x10

mov ah, 0x0e
mov al, 'T'
int 0x10

mov ah, 0x0e
mov al, 'I'
int 0x10

mov ah, 0x0e
mov al, 'N'
int 0x10

mov ah, 0x0e
mov al, 'G'
int 0x10


mov ah, 00
int 16h

mov ah, 0x0e
int 0x10

cmp al, 1bh
je boot


boot:
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


	k:

	cmp al, 3fh
	je a

  cmp al, 9h
	je tab

  cmp al, 1bh
	je reboot

	mov ah, 00
	int 16h

	mov ah, 0x0e
	int 0x10

	jmp k

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

  jmp k

  reboot:
  pusha
  mov ah, 0x00
  mov al, 0x03  ; text mode 80x25 16 colours
  int 0x10
  popa

  mov ah, 0x0e
  mov al, 'A'
  int 10h

  mov ah, 0x0e
  mov al, 'r'
  int 10h

  mov ah, 0x0e
  mov al, 'e'
  int 10h

  mov ah, 0x0e
  mov al, ' '
  int 10h

  mov ah, 0x0e
  mov al, 'Y'
  int 10h

  mov ah, 0x0e
  mov al, 'o'
  int 10h

  mov ah, 0x0e
  mov al, 'u'
  int 10h

  mov ah, 0x0e
  mov al, ' '
  int 10h

  mov ah, 0x0e
  mov al, 'S'
  int 10h

  mov ah, 0x0e
  mov al, 'u'
  int 10h

  mov ah, 0x0e
  mov al, 'r'
  int 10h

  mov ah, 0x0e
  mov al, 'e'
  int 10h

  mov ah, 0x0e
  mov al, ' '
  int 10h

  mov ah, 0x0e
  mov al, 'T'
  int 10h

  mov ah, 0x0e
  mov al, 'o'
  int 10h

  mov ah, 0x0e
  mov al, ' '
  int 10h

  mov ah, 0x0e
  mov al, 'r'
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
  mov al, '?'
  int 10h

  mov ah, 0x0e
  mov al, ' '
  int 10h

  mov ah, 0x0e
  mov al, 'Y'
  int 10h

  mov ah, 0x0e
  mov al, '/'
  int 10h

  mov ah, 0x0e
  mov al, 'N'
  int 10h

  mov ah, 00
	int 16h

	mov ah, 0x0e
	int 0x10

  cmp al, 59h
  je start

  cmp al, 79h
  je start


  cmp al, 4eh
  je boot

  cmp al, 6eh
  je boot


times 510-($-$$) db 0
dw 0XAA55
