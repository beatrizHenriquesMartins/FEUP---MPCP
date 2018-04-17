include mpcp.inc

;; prototipo
rotmax proto address: DWORD, seqsize: DWORD

;; declaracoes de dados (variaveis globais)
.data
	seq SDWORD 1, 2, -3, -10, 50, -20
    msg1 BYTE "Valor máximo: %d", 10, 13, 0
    msg2 BYTE "Valor médio: %d", 10, 13, 0
    msg3 BYTE "Valor médio com overflow: %d", 10, 13, 0

;; seccao de codigo principal 
.code
    main PROC C
        invoke rotmax, offset seq, lengthof seq
        invoke printf, offset msg1, EAX

        invoke rotmed, offset seq, lengthof seq
        invoke printf, offset msg1, EAX

        invoke rotmedOverflow, offset seq, lengthof seq
        invoke printf, offset msg1, EAX

        invoke _getch
	    
        ;; Terminar o programa: NAO omitir!
		invoke	ExitProcess, 0
    main ENDP

    ;; --------------Exercicio 14--------------
    ;; calculo do maximo da sequencia
    rotmax proc uses ESI address: DWORD, seqsize: DWORD
                mov ECX, seqsize
                mov ESI, address
                mov EAX, ESI
                dec ECX
        next:   add ESI, 4
                cmp EAX, [ESI]
                jg maior
                mov EAX, [ESI]
        maior:  loop next
                ret
    rotmax ENDP

    ;; calculo da média, assumindo que não existe overflow
    rotmed proc uses ESI ECX EDX seq_addr: DWORD, seq_size:DWORD
                mov ECX, seq_size
                mov ESI, seq_addr
                xor EAX, EAX
                mov EAX, [ESI]
                dec ECX
        soma:   add ESI, 4
                add EAX, [ESI]
                loop
                mov ECX, seq_size
                xor EDX, EDX
                idiv ECX
                ret
    rotmed ENDP

    ;; calculo da média, assumindo que existe overflow
    rotmedOverflow proc uses ESI ECX EDX seq_addr: DWORD, seq_size:DWORD
                mov ECX, seq_size
                mov ESI, seq_addr
                xor EAX, EAX
                xor EDX, EDX
        soma:   add EAX, [ESI]
                jno segue
                inc EDX
        segue:  add ESI, 4
                loop soma
                mov ecx, seq_size
                idiv ECX
                ret        
    rotmedOverflow ENDP
end 