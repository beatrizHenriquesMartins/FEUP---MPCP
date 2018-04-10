include mpcp.inc

;; declaracoes de dados (variaveis globais)
.data
	frase1 BYTE "Mensagem!"
    fmt BYTE "%c"

;; seccao de codigo principal 
.code
    ;; --------------Exercicio 3--------------
    main PROC C
                 mov ESI, offset frase1
                 mov ECX, lengthof frase1
                 mov EAX, BYTE PRT [ESI]

        next1:   movzx EAX, BYTE PRT [ESI]
                 push EAX
                 inc ESI
                 loop next1

                 mov ECX, lengthof frase1

        next2:   pop EAX
                 push ECX
                 invoke printf, offset fmt, AL
                 pop ECX
                 loop next2         

        invoke_getch
	    ;; Terminar o programa: NAO omitir!
		invoke	ExitProcess, 0
    main ENDP
end 