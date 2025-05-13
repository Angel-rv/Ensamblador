section .data
    mensaje db "Introduce una cadena: ", 0
    pedir db "Caracter a buscar: ", 0
    encontrado db "Caracter encontrado", 10, 0
    no_encontrado db "No se encontro el caracter", 10, 0

section .bss
    cadena resb 100
    caracter resb 2

section .text
    global _start

_start:
    ; Pedir cadena
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje
    mov rdx, 24
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, cadena
    mov rdx, 100
    syscall

    ; Pedir caracter a buscar
    mov rax, 1
    mov rdi, 1
    mov rsi, pedir
    mov rdx, 21
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, caracter
    mov rdx, 2
    syscall

    ; Buscar en cadena
    xor rcx, rcx
buscar:
    mov al, [cadena + rcx]
    cmp al, 10
    je no_lo_encontro
    cmp al, [caracter]
    je lo_encontro
    inc rcx
    jmp buscar

lo_encontro:
    mov rax, 1
    mov rdi, 1
    mov rsi, encontrado
    mov rdx, 21
    syscall
    jmp salir

no_lo_encontro:
    mov rax, 1
    mov rdi, 1
    mov rsi, no_encontrado
    mov rdx, 28
    syscall

salir:
    mov rax, 60
    xor rdi, rdi
    syscall

	;...
