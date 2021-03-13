;  this code reads an input from keyboard and display it to the screen

section .data        ; data segment
    userMsg db 'Please enter a number:'
    lenUserMsg equ $-userMsg
    dispMsg db 'You have entered:'
    lenDispMsg equ $-dispMsg

section .bss         ; Uninitialized data
    num resb 5

section .text      ; code segment
    global _start

_start:   ;User prompt
    mov ebx,1
    mov ecx,userMsg
    mov edx, lenUserMsg
    mov eax,4
    int 0x80

    ;Read and store the user input
    mov ebx, 2
    mov ecx, num
    mov edx, 5   ; 5 bytes (numeric, 1 for sign ) of that information
    mov eax,3
    int 0x80

    ; output the message
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    mov eax,4
    int 0x80

    ; output the entered number
    mov ebx,1
    mov ecx,num
    mov edx,5
    mov eax,4
    int 0x80

    ;exit code
    mov eax,1
    mov ebx,0
    int 0x80

