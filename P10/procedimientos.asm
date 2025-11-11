section .text
    global suma
    global strlen
    global getBit
    
suma:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov edx, [ebp + 12]
    add eax, edx
    jmp fin


strlen:
    push ebp
    mov ebp, esp
    mov eax, 0
loop:
    mov cl, [ebp + 8 + eax]
    cmp cl, 0
    je fin
    inc eax
    jmp loop

getBit:
   
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    mov edx, 1
    shl edx, cl
    and eax, edx
    cmp eax, 0
    je fin
    mov eax, 1


fin:
    mov esp, ebp
    pop ebp
    ret

