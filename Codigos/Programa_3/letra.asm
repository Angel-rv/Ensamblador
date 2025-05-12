section .data
    letra db 'X'  ; Definimos la letra a mostrar

section .text
    global _start

_start:
    ; Imprimir la letra "X"
    mov rax, 1         ; syscall para escribir
    mov rdi, 1         ; file descriptor (stdout)
    mov rsi, letra     ; dirección de la letra
    mov rdx, 1         ; longitud (1 carácter)
    syscall

    ; Salir del programa
    mov rax, 60        ; syscall para terminar
    xor rdi, rdi       ; código de salida 0
    syscall
