section .data
    mensaje db "Introduce una letra: ", 0
    resultado db "Letra mayúscula: ", 0
    salto db 10

section .bss
    letra resb 2

section .text
    global _start

_start:
    ; Mostrar mensaje
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje
    mov rdx, 22
    syscall

    ; Leer un carácter
    mov rax, 0
    mov rdi, 0
    mov rsi, letra
    mov rdx, 2
    syscall

    ; Convertir a mayúscula (ASCII)
    mov al, [letra]
    cmp al, 'a'
    jl mostrar
    cmp al, 'z'
    jg mostrar
    sub al, 32
    mov [letra], al

mostrar:
    ; Mostrar resultado
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 20
    syscall

    ; Imprimir letra
    mov rax, 1
    mov rdi, 1
    mov rsi, letra
    mov rdx, 1
    syscall

    ; Salto de línea
    mov rax, 1
    mov rdi, 1
    mov rsi, salto
    mov rdx, 1
    syscall

    ; Salir
    mov rax, 60
    xor rdi, rdi
    syscall

