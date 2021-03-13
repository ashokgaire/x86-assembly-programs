global _start

section .data
        message:db "hello world"
        length equ $-message

section .text

_start:
      mov al,4 ;storing write syscall number
      mov bl,1  ;storing stdout
      mov ecx,message 
      mov dl,length
      int 0x80

      mov al,1 ;storing exit syscall number
      mov bl,0
      int 0x80
