section .data
    mayor db "10 es mayor que 6", 0
    menor db "10 es menor que 6", 0
    buffer db 10 dup(0)

section .text
    global _start

_start:
    ; Comparar 10 y 6
    mov rax, 10          ; Cargar 10 en rax
    cmp rax, 6           ; Comparar con 6
    jg es_mayor          ; Si 10 es mayor, saltamos a es_mayor
    mov rsi, menor       ; Si no es mayor, mostramos el mensaje "menor"
    jmp mostrar

es_mayor:
    mov rsi, mayor       ; Si es mayor, mostramos el mensaje "mayor"

mostrar:
    mov rdi, 1           ; File descriptor (stdout)
    mov rdx, 18          ; Longitud del mensaje
    mov rax, 1           ; syscall para escribir
    syscall

    ; Salir del programa
    mov rax, 60          ; syscall para terminar
    xor rdi, rdi         ; código de salida 0
    syscall
