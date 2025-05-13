section .data
    msg db "Introduce un número: ", 0
    par db "Es par", 10, 0
    impar db "Es impar", 10, 0

section .bss
    buffer resb 10

section .text
    global _start

_start:
    ; Mostrar mensaje
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 22
    syscall

    ; Leer número (ascii)
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 10
    syscall

    ; Convertir de ASCII a entero
    xor rbx, rbx       ; número
    xor rcx, rcx       ; índice

convertir:
    mov al, [buffer + rcx]
    cmp al, 10         ; salto de línea
    je verificar
    sub al, '0'
    imul rbx, rbx, 10
    add rbx, rax
    inc rcx
    jmp convertir

verificar:
    mov rax, rbx
    and rax, 1
    cmp rax, 0
    je es_par

    ; Es impar
    mov rax, 1
    mov rdi, 1
    mov rsi, impar
    mov rdx, 9
    syscall
    jmp salir

es_par:
    mov rax, 1
    mov rdi, 1
    mov rsi, par
    mov rdx, 6
    syscall

salir:
    mov rax, 60
    xor rdi, rdi
    syscall

	;...
