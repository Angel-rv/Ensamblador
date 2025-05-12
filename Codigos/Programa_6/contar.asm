section .data
    buffer db 10 dup(0)

section .text
    global _start

_start:
    mov rbx, 1            ; Empezamos con el número 1

loop_start:
    mov rax, rbx          ; Cargamos el número en rax
    add rax, '0'          ; Convertimos el número a su valor ASCII
    mov [buffer], al      ; Guardamos el carácter en el buffer

    ; Imprimir el número
    mov rdi, 1            ; File descriptor (stdout)
    mov rdx, 1            ; Longitud (1 carácter)
    mov rsi, buffer       ; Dirección del mensaje
    mov rax, 1            ; syscall para escribir
    syscall

    inc rbx               ; Incrementamos el contador
    cmp rbx, 10           ; Comparamos con 10
    jl loop_start         ; Si es menor que 10, seguimos en el bucle

    ; Salir del programa
    mov rax, 60           ; syscall para terminar
    xor rdi, rdi          ; código de salida 0
    syscall
