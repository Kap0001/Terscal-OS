org 0x0
bits 16


; unlimited features there :)


%define ENDL 0x0D, 0x0A


start:

    pusha
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    popa

    ; print welcome message
    mov si, msg_hello
    call puts

    userinput:
        cmp al, 3fh
        je a

        cmp al, 9h
        je tab

        cmp al, 68h
        je help

        cmp al, 76h
        je ver

        cmp al, 1bh
        je reboot

        mov ah, 00
        int 16h

        mov ah, 0x0e
        int 0x10

        jmp userinput

        a:
            jmp start

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
            mov al, 'V'
            int 10h

            mov ah, 0x0e
            mov al, ':'
            int 10h

            mov ah, 0x0e
            mov al, ' '
            int 10h

            mov ah, 0x0e
            mov al, 'V'
            int 10h

            mov ah, 0x0e
            mov al, 'e'
            int 10h

            mov ah, 0x0e
            mov al, 'r'
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
            mov al, 'E'
            int 10h

            mov ah, 0x0e
            mov al, 'L'
            int 10h

            mov ah, 0x0e
            mov al, 'P'
            int 10h

            mov ah, 00
            int 16h

            mov ah, 0x0e
            int 10h

            call start


            ver:
                pusha
                mov ah, 0x00
                mov al, 0x03  ; text mode 80x25 16 colours
                int 0x10
                popa

                mov ah, 0x0e
                mov al, '1'
                int 10h

                mov ah, 0x0e
                mov al, '.'
                int 10h

                mov ah, 0x0e
                mov al, '4'
                int 10h

                mov ah, 00
                int 16h

                jmp start

        jmp userinput

        reboot:
        pusha
        mov ah, 0x00
        mov al, 0x03  ; text mode 80x25 16 colours
        int 0x10
        popa

        int 19h


se:
cli
hlt

.halt:
    cli
    hlt

;
; Prints a string to the screen
; Params:
;   - ds:si points to string
;
puts:
    ; save registers we will modify
    push si
    push ax
    push bx

.loop:
    lodsb               ; loads next character in al
    or al, al           ; verify if next character is null?
    jz .done

    mov ah, 0x0E        ; call bios interrupt
    mov bh, 0           ; set page number to 0
    int 0x10

    jmp .loop

.done:
    pop bx
    pop ax
    pop si    
    ret

msg_hello: db 'Welcome to TerscalOS! Type a command > ', 0
helpcommand: db 'Commands -> h = help', ENDL, 0
