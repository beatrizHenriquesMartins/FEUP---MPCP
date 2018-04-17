include mpcp.inc

;; prototipo
rotmax proto address: DWORD, seqsize: DWORD

;; declaracoes de dados (variaveis globais)
.data
	seq SDWORD 1, 2, -3, -10, 50, -20
    msg1 BYTE "Valor máximo: %d", 10, 13, 0

;; seccao de codigo principal 
.code
    main PROC C
        invoke rotmax, offset seq, lengthof seq
        invoke printf, offset msg1, EAX

        invoke _getch
	    
        ;; Terminar o programa: NAO omitir!
		invoke	ExitProcess, 0
    main ENDP

    ;; --------------Exercicio 14--------------
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


    rotmed proc uses ESI seq_addr: DWORD, seq_size:DWORD
                mov ECX, seq_size
                mov ESI, seq_addr
                xor EAX, EAX
                mov EAX, [ESI]
                add ESI, 4
                dec ECX
        soma:   add EAX, [ESI]
                loop
                idiv EAX, ECX
                ret
    rotmed ENDP
end 