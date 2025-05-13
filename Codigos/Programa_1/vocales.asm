section .data
    mensaje db "Introduce una cadena: ", 0
    salto db 10
    resultado db "Vocales: ", 0

section .bss
    buffer resb 100
    longitud resb 1
    count resb 1

section .text
    global _start

_start:
    ; Mostrar mensaje
    mov rax, 1          ; syscall write
    mov rdi, 1          ; STDOUT
    mov rsi, mensaje
    mov rdx, 24         ; longitud del mensaje
    syscall

    ; Leer entrada del usuario
    mov rax, 0          ; syscall read
    mov rdi, 0          ; STDIN
    mov rsi, buffer
    mov rdx, 100
    syscall
    mov [longitud], al  ; Guardar número de bytes leídos

    ; Inicializar contador
    mov byte [count], 0
    xor rcx, rcx        ; índice = 0

contar:
    mov al, [buffer + rcx]
    cmp al, 10
    je mostrar
    cmp al, 'a'
    je inc_count
    cmp al, 'e'
    je inc_count
    cmp al, 'i'
    je inc_count
    cmp al, 'o'
    je inc_count
    cmp al, 'u'
    je inc_count
    jmp siguiente

inc_count:
    inc byte [count]

siguiente:
    inc rcx
    cmp rcx, 100
    jl contar

mostrar:
    ; Mostrar "Vocales: "
    mov rax, 1
    mov rdi, 1
    mov rsi, resultado
    mov rdx, 9
    syscall

    ; Convertir el número a ASCII y mostrar
    movzx eax, byte [count]
    add al, '0'
    mov [count], al

    mov rax, 1
    mov rdi, 1
    mov rsi, count
    mov rdx, 1
    syscall

    ; Imprimir salto de línea
    mov rax, 1
    mov rdi, 1
    mov rsi, salto
    mov rdx, 1
    syscall

    ; Salida
    mov rax, 60
    xor rdi, rdi
    syscall

	;...
