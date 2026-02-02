global _start

section .data
    msg_good db "Good Job!", 10
    len_good equ $ - msg_good

    msg_bad  db "Bad Password!", 10
    len_bad  equ $ - msg_bad

    mss db \
        0x56,0x4F,0x60,0x43,0x50,0x4F,0x60,0x45, \
        0x46,0x43,0x56,0x55,0x60,0x57,0x53,0x4E

section .bss
    input resb 32

section .text

_start:
    mov eax, 3 
    mov ebx, 0          
    mov ecx, input
    mov edx, 32
    int 0x80

    mov esi, input


    xor edi, edi 
    mov ecx, 16  

check_loop:
    mov al, [esi + edi] 
    add al, 1              
    cmp al, [mss + edi]
    jne npasswd

    inc edi
    loop check_loop

    cmp byte [esi + 16], 0x0a
    je bpasswd
    cmp byte [esi + 16], 0x00
    je bpasswd

    jmp npasswd

bpasswd:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_good
    mov edx, len_good
    int 0x80

    mov eax, 1
    mov ebx, 0
    int 0x80

npasswd:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_bad
    mov edx, len_bad
    int 0x80

    mov eax, 1
    mov ebx, 1
    int 0x80
