section .data
    buffer db 10 dup(0)   ; Buffer para almacenar el número en ASCII

section .bss
    counter resb 1         ; Reservar un byte para el contador

section .text
    global _start

_start:
    mov byte [counter], 1  ; Inicializamos el contador en 1

loop_start:
    mov al, [counter]      ; Cargar el valor de counter en al
    add al, '0'            ; Convertir el número a su valor ASCII
    mov [buffer], al       ; Guardamos el carácter en el buffer

    ; Imprimir el número
    mov rdi, 1             ; File descriptor (stdout)
    mov rdx, 1             ; Longitud (1 carácter)
    mov rsi, buffer        ; Dirección del mensaje
    mov rax, 1             ; syscall para escribir
    syscall

    inc byte [counter]     ; Incrementamos el contador
    cmp byte [counter], 6  ; Comparamos con 6
    jl loop_start          ; Si es menor que 6, seguimos en el bucle

    ; Salir del programa
    mov rax, 60            ; syscall para terminar
    xor rdi, rdi           ; código de salida 0
    syscall

