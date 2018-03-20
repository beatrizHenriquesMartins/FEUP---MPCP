include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
	frase1 BYTE 72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100, 0
    frase2 BYTE 'Hello World!', 0
    formato BYTE 'Comprimento: %d', 0

;; seccao de codigo principal 
.code
    ;; --------------Exercicio 1--------------
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