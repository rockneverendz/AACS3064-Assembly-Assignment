.MODEL SMALL
.STACK 100
.DATA
	CHAR DB 4 DUP("$")
	STR1 DB 0DH,0AH,"ENTER A CHARACTER : $"
	NL DB 0DH,0AH,"$"
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	;----BEGIN----
	
	MOV CX, 3
	MOV SI, 0
	L1:
	
					;STRING
		MOV AH,09H	;
		LEA DX,STR1	;
		INT 21H		;

					;INPUT SINGLE CHARACTER
		MOV AH,01H	;
		INT 21H		;
		MOV CHAR[SI], AL
		
		INC SI;
	LOOP L1;
		
	
				;STRING
	MOV AH,09H	;
	LEA DX,NL	;
	INT 21H		;
	LEA DX,CHAR	;
	INT 21H		;

	
	;----END----
	MOV AX,4C00H
	INT 21H
MAIN ENDP
END MAIN