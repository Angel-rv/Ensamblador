section .data
    buffer db 0

section .text
    global _start

_start:
    ; Leer un carácter desde el teclado
    mov rax, 0            ; syscall para leer (sys_read)
    mov rdi, 0            ; file descriptor (stdin)
    mov rsi, buffer       ; dirección del buffer
    mov rdx, 1            ; leer 1 byte
    syscall

    ; Imprimir el carácter leído
    mov rax, 1            ; syscall para escribir (sys_write)
    mov rdi, 1            ; file descriptor (stdout)
    mov rsi, buffer       ; dirección del buffer
    mov rdx, 1            ; longitud (1 carácter)
    syscall

    ; Salir del programa
    mov rax, 60           ; syscall para terminar
    xor rdi, rdi          ; código de salida 0
    syscall

	;...
