;e) direccionamiento relativo a	base mas índice reemplace la letra z de	la cadena msg por la letra Z
%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ;referencia para inicio de programa
	
_start:    
 
    mov edx, msg        ; cadena original
    call puts

    
	mov ebx, msg
	mov esi, 20
	mov edi, 5	
	add esi, edi	
    mov byte [ebx + esi], 'Z'

	mov edx, msg
	call puts	


	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 