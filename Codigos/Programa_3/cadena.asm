section .data
    mensaje db "Numero convertido a ASCII: ", 0
    salto db 10

section .bss
    buffer resb 10
    numero resb 10

section .text
    global _start

_start:
    ; Mostrar mensaje
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje
    mov rdx, 27
    syscall

    ; Valor fijo para mostrar (ej: 123)
    mov rax, 123
    mov rbx, 10
    mov rcx, numero
    add rcx, 9          ; fin del buffer
    mov byte [rcx], 0   ; null-terminador

convertir:
    dec rcx
    xor rdx, rdx
    div rbx
    add dl, '0'
    mov [rcx], dl
    test rax, rax
    jnz convertir

    ; Mostrar número en ascii
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, numero+9
    sub rdx, rcx
    syscall

    ; Salto de línea
    mov rax, 1
    mov rdi, 1
    mov rsi, salto
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

	;...
