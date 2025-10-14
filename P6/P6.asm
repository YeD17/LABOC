%include "../LIB/pc_iox.inc"

section .text

    global _start

_start:
    ; Inciso a) 
    mov ebx, 0x5C4B2A60
    mov edx, 0x2208134
    add ebx, edx
    mov eax, ebx
    call pHex_dw  

    mov al, 10  
    call putchar

    ; Inciso b) 
    push bx    
    mov ax, bx
    call pHex_w

    mov al, 10
    call putchar

    ; Inciso c)
    mov al, bl       
    mov cl, 8    
    mul cl       
    mov [N], ax  
    call pHex_b  

    mov al, 10
    call putchar

    ; Inciso d) 
    inc word [N]
    call pHex_b

    mov al, 10
    call putchar

    ;Inciso e)
    pop bx
    mov ax, bx       
    mov dx, 0       
    mov bx, 0xFF      
    div bx            ;  AX = DX:AX / BX, DX = residuo
    call pHex_w

    mov al, 10        
    call putchar
    call pHex_w

    mov al, 10        
    call putchar

    ;Inciso f)
    add dx, [N]
    mov [N], dx
    dec byte [N]
    call pHex_w

    mov al, 10
    call putchar
    
    ; Registro de Bandera
    lahf            
    call pHex_b      

    mov al, 10       
    call putchar

    ;Inciso g)
    pop ax
    call pHex_w

    mov al, 10
    call putchar


    mov eax, 1  ; sys_exit
    int 0x80  

section .data
    N dw 0  