include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
	seq1 BYTE 'MARGARIDAS'
    seq2 WORD 10 DUP(?)
    formato BYTE 'Comprimento: %d', 0

;; seccao de codigo principal 
.code
    ;; --------------Exercicio 2--------------
    ;; ----------------alinea a---------------
    main PROC C
	    ;; escrever codigo (parte principal)
		    	mov EDX, offset frase1
                xor EAX, EAX

        next:   cmp BYTE PTR [EDX], 0
                jz fim
                inc EAX
                add EDX, 1 ;; = inc EDX
                jmp next

        fim:    invoke printf, offset formato, EAX
	    		;; Terminar o programa: NAO omitir!
		    	invoke	ExitProcess, 0
    main ENDP
end 