section .data
    resultado db "Factorial de 5 es: ", 0
    buffer db 10 dup(0)

section .text
    global _start

_start:
    mov rax, 5            ; Inicializar con el número 5
    mov rbx, 1            ; Inicializar el resultado en 1

factorial_loop:
    mul rbx               ; Multiplica rax por rbx
    dec rax               ; Decrementa rax
    cmp rax, 1            ; Compara con 1
    jg factorial_loop     ; Si es mayor que 1, sigue el bucle

    ; Convertir el resultado a carácter
    add rbx, '0'
    mov [buffer], bl      ; Guardar el carácter

    ; Imprimir el resultado
    mov rax, 1            ; syscall para escribir
    mov rdi, 1            ; file descriptor (stdout)
    mov rsi, buffer       ; dirección del resultado
    mov rdx, 1            ; longitud (1 carácter)
    syscall

    ; Salir del programa
    mov rax, 60           ; syscall para terminar
    xor rdi, rdi          ; código de salida 0
    syscall

	;...
