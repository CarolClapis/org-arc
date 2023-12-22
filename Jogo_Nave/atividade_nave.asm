
jmp main

mensagem2	: string "Jogo da Nave"


main:
	loadn r0, #0	
	loadn r1, #mensagem2	
	loadn r2, #0	

    call Imprimestr

    loadn r0, #40   ; Posicao da nave na tela
	loadn r1, #'@'	    ; Char da Nave
	loadn r2, #32	    ; Char espaço em branco
    loadn r5, #1199     ; Fim da tela


Loop:
    call ApagaObj
    call RecalculaPos
    call ImprimeObj
    call Delay
    jmp Loop

	halt


Imprimestr:
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina

	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop

ImprimestrSai:
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

ApagaObj:
    outchar r2, r0  
    rts

RecalculaPos:
    inc r0  ; r0++
    cmp r0, r5
    ceq RetornaZero
    rts

ImprimeObj:
    outchar r1, r0  ; r0-> Posicao  r1-> "O"
    rts

Delay:
    push r0
    push r1

    loadn r1, #50

    Delay_volta2:           
        loadn r0, #3000

        Delay_volta1:
            dec r0;                 
            jnz Delay_volta1
            dec r1
            jnz Delay_volta2

    pop r1
    pop r0

    rts


RetornaZero:
    loadn r0, #40
    rts
