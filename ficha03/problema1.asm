include mpcp.inc

.data
    frase1 BYTE 72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 0
    frase2 BYTE 'Hello World!', 0
    formato BYTE 'Comprimento: %d', 0

.code
            mov EDX, offset frase1
            xor EAX, EAX

    next:   cmp BYTE PTR [EDX], 0
            jz fim
            inc EAX
            add EDX, 1 ;; = inc EDX
            jmp next

    fim:    invoke printf, offset formato, EAX
            invoke ExitProcess, 0        