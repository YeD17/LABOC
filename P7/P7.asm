%include "../LIB/pc_iox.inc"

section .text

    extern pBin_n, pBin_b, pBin_w, pBin_dw

    global _start

_start:
    ; Inciso a) 
    mov eax, 0x22446688
    ror eax, 4
    call pHex_dw 
    mov al, 10
    call putchar    


    ; Inciso b) 
    mov cx, 0x3F48 
    shl cx, 3 
    mov ax, cx
    call pHex_w

    mov al, 10
    call putchar


    ; Inciso c)
    mov eax, 0x20D685F3  
    xor esi, 0x40042021
    mov eax, esi
    call pBin_dw 

    mov al, 10 
    call putchar

    ; Inciso d) 
    push esi

    mov al, 10
    call putchar

    ;Inciso e)
    mov ch, 0xA7
    mov al, 0x48
    or ch, al
    mov al, ch
    call pBin_b
    mov al,10
    call putchar

    ;Inciso f)
    mov bp, 0x67DA
    mov ax, 0x2398
    and bp, ax
    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar

    ;Inciso g) 
    mov bp, ax
    shr bp, 3
    call pBin_w
    mov al, 10
    call putchar

    ;Inciso h)
    mov ebx, 0xFFFFFFFF
    shr ebx, 6 
    mov eax, ebx
    call pBin_dw
    mov al, 10
    call putchar

    ;Inciso i)
    shl cx, 3
    mov ax, cx
    call pHex_w
    mov al, 10
    call putchar 

    ;Inciso j)
    pop esi

    ;inciso k)
    shl esi, 3
    shl esi, 1
    mov esi, eax
    call pBin_dw
    mov al, 10
    call putchar


section .data