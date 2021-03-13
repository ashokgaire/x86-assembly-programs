; the equ directive
; constant_name equ expression

SYS_EXIT equ 1
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1
section .text
   msg1 db "Enter a digit" ,0xA,0xD
   len1 equ $-msg1

   msg2 db "Please enter a second digit", 0xA,0xD
   len2 equ $-msg2

   msg3 db "The sum is:"
   len3 equ $-msg3

segment .bss
     num1 resb 2
     num2 resb 2
     res resb 1

section .text
    global _start

_start:
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    mov eax,4
    int 0x80

    mov ebx,1
    mov ecx,num1
    mov edx,2
    mov eax,3
    int 0x80

    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    mov eax,4
    int 0x80

    mov ebx,1
    mov ecx,num2
    mov edx,2
    mov eax,3
    int 0x80

    mov ebx,1
    mov ecx,msg3
    mov edx,len3
    mov eax,4
    int 0x80

    ; moving the first number to eax register and second number to ebx register
    ;and subtracting ascii '0' to convert it into a decimal number
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    ; add eax and ebx
    add eax,ebx
    ;add '0' to convert the sum from decimalto ASCII
    add eax, '0'

    ;storing the sum in memory location res
    mov [res], eax

    ;printing the sum

    mov ebx,1
    mov ecx,res
    mov edx,1
    mov eax,4
    int 0x80

exit:
mov eax,1
mov ebx,ebx
int 0x80
