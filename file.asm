; this code opens a file file.txt and write helloworld in it nd save it

section .text
   global _start

_start: 
    ; crcete the file
    mov ebx, file_name
    mov ecx,0777 ;read write and execute by all
    mov eax,8
    int 0x80

    mov [fd_out], eax

    ; write into file
    mov edx,len
    mov ecx,msg
    mov ebx, [fd_out]
    mov eax,4
    int 0x80

    ; close the fle
    mov eax,6
    mov ebx, [fd_out]

    ; write the messge indicating end of file write
    mov eax,4
    mov ebx,1
    mov ecx,msg_done
    mov edx, len_done
    int 0x80

    ;open the file for reading
    mov eax,5
    mov ebx, file_name
    mov ecx, 0
    mov edx, 0777
    int 0x80

    mov [fd_in], eax

    ; read from file
    mov eax,3
    mov ebx, [fd_in]
    mov ecx, info
    mov edx, 26
    int 0x80

    ; close the file
    mov eax, 6
    mov ebx, [fd_in]
    int 0x80

    ; print the info
    mov ebx ,1
    mov ecx,info
    mov edx,26
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80

section .data
file_name db 'myfile.txt'
msg db 'Hello World!'
len equ $-msg

msg_done db 'Written to file' 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in resb 1
info resb 26

