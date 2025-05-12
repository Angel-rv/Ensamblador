section .data
    resultado db "Resultado: ", 0
    buffer db 10 dup(0)

section .text
    global _start

_start:
    mov rax, 5
    add rax, 3

    ; Convertir a carácter (solo si es <10)
    add rax, '0'
    mov [buffer], al

    ; Imprimir resultado
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 1
    syscall

    ; Salir
    mov rax, 60
    xor rdi, rdi
    syscall
