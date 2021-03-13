global main
section .data
    message:db "hello world",0xA
    
section .text

main:
      mov ebx,1
      mov ecx,message
      mov edx,12
      mov eax,4
      int 0x80

      mov eax,1
      int 0x80

