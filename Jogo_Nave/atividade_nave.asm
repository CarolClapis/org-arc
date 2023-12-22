
jmp main

mensagem2	: string "Jogo da Nave"


main:
	loadn r0, #0	
	loadn r1, #mensagem2	
	loadn r2, #0	

    call Imprimestr

    loadn r0, #40  
	loadn r1, #'@'	   
	loadn r2, #32	    
    loadn r5, #1199   


Loop:
    call ApagaObj
    call RecalculaPos
    call ImprimeObj
    call Delay
    jmp Loop

	halt


Imprimestr:
	push r0	
	push r1	
	push r2
	push r3	
	push r4

	loadn r3, #'\0'	

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
	pop r4	
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
    outchar r1, r0  
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
