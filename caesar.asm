secton .text
   global_start

_start:
    mov ecx,len
    mov esi,s1
    mov edi,s2

loop_here:
    lodsb
    add al,02
    stosp
    loop loop_here
    cld
    rep movsb

    mov edx,20
    mov ecx,s2
    mov ebx,1
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80

section .data
s1 db 'password', 0 ; source
len equ $-s1

secction .bss
s2 resb 10       ;destintaion
