section .data
    resultado db "Resultado: ", 0  ; Mensaje inicial
    buffer db 10 dup(0)  ; Buffer para guardar el resultado en caracteres

section .text
    global _start

_start:
    ; Operación: 10 - 6
    mov rax, 10      ; Cargar 10 en rax
    sub rax, 6       ; Restar 6 de rax

    ; Convertir el resultado a carácter (si es un solo dígito)
    add rax, '0'     ; Convertir el número a su valor ASCII
    mov [buffer], al ; Guardar el carácter en buffer

    ; Imprimir el resultado
    mov rax, 1       ; syscall para escribir en la pantalla
    mov rdi, 1       ; File descriptor (stdout)
    mov rsi, buffer  ; Dirección del mensaje
    mov rdx, 1       ; Longitud (1 carácter)
    syscall

    ; Salir del programa
    mov rax, 60      ; syscall para terminar el programa
    xor rdi, rdi     ; Código de salida 0
    syscall
