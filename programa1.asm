section .data
    msg db "Hola mundo", 0xA
    len equ $ - msg

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov eax, 4      ; syscall: write
    mov ebx, 1      ; file descriptor: stdout
    mov ecx, msg    ; pointer to message
    mov edx, len    ; message length
    int 0x80        ; call kernel

    ; exit(0)
    mov eax, 1      ; syscall: exit
    xor ebx, ebx    ; status 0
    int 0x80

