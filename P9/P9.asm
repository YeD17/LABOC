%include "../LIB/pc_iox.inc"

section .text
    global _start

_start:
    
    mov edx, msgSolicitarN
    call puts
    mov ebx, N
    call capturarNumero      
    mov ecx, 0             
    mov cl, byte [N]       
    mov al, 10
    call putchar

    mov ebx, vector1
    call capturarVector
    mov al, 10
    call putchar
    
    mov ebx, vector2
    call capturarVector
    mov al, 10
    call putchar
    
    mov edx, msgVector1
    call puts
    mov ebx, vector1
    call desplegarHex
    
    mov edx, msgVector2
    call puts
    mov ebx, vector2
    call desplegarHex
    
    mov ebx, vector1
    mov edx, vector2
    call sumarVectores
    
    mov edx, msgSumaResultado
    call puts
    mov ebx, vector1
    call desplegarHex
    mov al, 10
    call putchar
    
    mov edx, msgProductoResultado
    call puts
    call pHex_dw
    mov al, 10
    call putchar
    
    mov eax, 1
    int 0x80

capturarNumero:
    pusha
    mov edi, ebx            
    call getche            
    sub al, '0'             
    mov [edi], al
    popa
    ret

; Inciso a) 
capturarVector:
    pusha
    cmp ecx, 10
    jg cv_fin
    mov edi, ebx        

cv_capturar_loop:
    call getch          
    cmp al, 10           
    je cv_fin
    
    cmp al, '0'
    jl cv_capturar_loop
    cmp al, '9'
    jg cv_capturar_loop
    
    sub al, '0'
    mov [edi], al
    inc edi
    
    loop cv_capturar_loop
    
cv_fin:
    popa
    ret

; Inciso B) 
desplegarHex:
    pusha
    cmp ecx, 10
    jg dh_fin
    mov esi, ebx
    
dh_mostrar_loop:
    mov al, byte [esi]      
    call pHex_b
    mov al, ' '
    call putchar
    
    inc esi
    loop dh_mostrar_loop
    
    mov al, 10
    call putchar
    
dh_fin:
    popa
    ret

; Inciso C) 
sumarVectores:
    pusha
    cmp ecx, 10
    jg sv_fin
    
    mov esi, ebx
    mov edi, edx
    
sv_sum_loop:
    mov al, [esi]
    add al, [edi]
    mov [esi], al
    
    inc esi
    inc edi
    loop sv_sum_loop
    
sv_fin:
    popa
    ret

; Inciso D)
productoEscalar:
    pusha
    xor eax, eax         
    cmp ecx, 10
    jg pe_fin
    
    mov esi, ebx         
    mov edi, edx         
    
pe_dot_loop:
    xor ebx, ebx
    xor edx, edx
    mov bl, [esi]        
    mov dl, [edi]        
    
    mov eax, edx
    mul ebx       
    add eax, ebx        
    
    inc esi              
    inc edi              
    loop pe_dot_loop     
    
pe_fin:
    popa
    ret

section .data
    msgSolicitarN        db "Introduce el valor de N: ", 0
    msgVector1           db "Vector 1: ", 0
    msgVector2           db "Vector 2: ", 0
    msgSumaResultado     db "Resultado suma: ", 0
    msgProductoResultado db "Producto escalar: ", 0

section .bss
    N resb 1        
    vector1 resb 20
    vector2 resb 20