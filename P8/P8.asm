%include "../LIB/pc_iox.inc"


section .text

extern pBin_n, pBin_b, pBin_w, pBin_dw

global _start

_start:

; Inciso a)
    
mov edx, buffer

Secuencia1:
    mov edx, msgSecuencia1
    call puts
    xor al, al
    call getche
    cmp al, 10
    je Secuencia2

    cmp al, '0'
    jl Secuencia2
    cmp al, '9'
    jg Secuencia2

    cmp al, '5'
    jl esMenorQue5

    jmp Secuencia2

esMenorQue5:
    mov al, 10
    call putchar
    mov edx, msgMenor5
    call puts
    jmp Secuencia2

;Inciso b)

Secuencia2:

    mov al, 10
    call putchar
    mov edx, msgSecuencia2
    call puts
    xor al, al
    call getche
    cmp al, '0'
    jl finp8
    cmp al, '9'
    jg compararLetra
    jmp esNumero

compararLetra:
    cmp al, 'A'
    jl finp8
    cmp al, 'Z'
    jg finp8
    jmp esLetra

esNumero:
    mov al, 10
    call putchar    
    mov edx, msgEsNumero
    call puts
    jmp Secuencia3

esLetra:
    mov al, 10
    call putchar
    mov edx, msgEsLetra
    call puts
    jmp Secuencia3

;Inciso C)

Secuencia3:
    mov al, 10
    call putchar
    mov edx, msgSecuencia3
    call puts

    mov cx, 5        
    mov bx, 1          

triangulo_fila:
    cmp bx, cx
    jg fin_triangulo

    push cx            
    mov cx, bx         

imprimir_ast:
    mov al, '*'
    call putchar
    loop imprimir_ast

    mov al, 10        
    call putchar

    pop cx
    inc bx
    jmp triangulo_fila

fin_triangulo:
    jmp Secuencia4


;Inciso d)
Secuencia4:
    mov edx, msgSecuencia4
    call puts
    mov edx, msgCaracteres
    call puts

    mov ecx, 10        
    mov esi, buffer      

captura_loop:
    call getche        
    mov [esi], al      
    inc esi
    loop captura_loop

    mov al, 10
    call putchar
    mov edx, msgCaracteres
    call puts

    mov ecx, 10
    mov esi, buffer

mostrar_loop:
    mov al, [esi]
    call putchar
    mov al, 10
    call putchar
    inc esi
    loop mostrar_loop

    jmp finp8


finp8:
    mov eax, 1
    int 0x80


section .data
msgSecuencia1 db "Inicia la secuencia 1", 10, 0
msgSecuencia2 db "Inicia la secuencia 2", 10, 0
msgSecuencia3 db "Inicia la secuencia 3", 10, 0
msgSecuencia4 db "Inicia la secuencia 4", 10, 0

msgMenor5  db "El numero es menor que 5", 10, 0
msgEsLetra db "El caracter ingresado es una letra", 10, 0
msgEsNumero db "El caracter ingresado es un numero", 10, 0
msgCaracteres db "Caracteres capturados", 10, 0


section .bss
buffer resb 64