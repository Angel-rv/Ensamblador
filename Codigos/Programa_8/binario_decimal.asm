section .data
    binario db "1101", 0   ; Número binario predefinido

section .text
    global _start

_start:
    ; Imprimir el número binario
    mov rax, 1            ; syscall para escribir
    mov rdi, 1            ; file descriptor (stdout)
    mov rsi, binario      ; dirección del binario
    mov rdx, 4            ; longitud del número binario (4 caracteres)
    syscall

    ; Salir del programa
    mov rax, 60           ; syscall para terminar
    xor rdi, rdi          ; código de salida 0
    syscall
