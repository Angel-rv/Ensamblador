section .data
    par db "El número es par", 0
    impar db "El número es impar", 0

section .text
    global _start

_start:
    mov rax, 6            ; Cargar el número 6 en rax
    and rax, 1            ; Verificar si el número es par (si el bit menos significativo es 0)
    jz es_par             ; Si es 0, el número es par

    mov rsi, impar        ; Si es impar, mostramos el mensaje "impar"
    jmp mostrar

es_par:
    mov rsi, par          ; Si es par, mostramos el mensaje "par"

mostrar:
    mov rdi, 1            ; File descriptor (stdout)
    mov rdx, 17           ; Longitud del mensaje
    mov rax, 1            ; syscall para escribir
    syscall

    ; Salir del programa
    mov rax, 60           ; syscall para terminar
    xor rdi, rdi          ; código de salida 0
    syscall
