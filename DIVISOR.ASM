.MODEL SMALL
.STACK 100
.DATA
	VAL1 DB ?
	VAL2 DB ?
 	STR1 DB 0DH,0AH,"DIVIDEND : $"
	STR2 DB 0DH,0AH,"DIVISOR  : $"
	STR3 DB 0DH,0AH,"QUOTIENT : $"
	STR4 DB 0DH,0AH,"REMAINDER: $"
	TEN DB 10
	NL DB 0DH,0AH,"$"
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	;----BEGIN----

	           ;STRING
	MOV AH,09H ;--MANDATORY FOR PRINT STRING(MOVE ONCE)
	LEA DX,STR1;--LOADING STRING TO PRINT
	INT 21H    ;--MANDATORY FOR PRINT

	           ;INPUT SINGLE CHARACTER
	MOV AH,01H ;
	INT 21H    ;
	SUB AL, 48 ;(MINUS 48 IF NUMBER)
	MOV VAL1, AL

	           ;STRING
	MOV AH,09H ;--MANDATORY FOR PRINT STRING(MOVE ONCE)
	LEA DX,STR2;--LOADING STRING TO PRINT
	INT 21H    ;--MANDATORY FOR PRINT

	           ;INPUT SINGLE CHARACTER
	MOV AH,01H ;
	INT 21H    ;
	SUB AL, 48 ;(MINUS 48 IF NUMBER)
	MOV VAL2, AL
	
	MOV AH, 0
	MOV AL, VAL1
	DIV VAL2
	MOV BX, AX

	           ;STRING
	MOV AH,09H ;--MANDATORY FOR PRINT STRING(MOVE ONCE)
	LEA DX,STR3;--LOADING STRING TO PRINT
	INT 21H    ;--MANDATORY FOR PRINT

	           ;INTEGER
	MOV AH,02H ;--MANDATORY FOR PRINT VARIABLE(MOVE ONCE)
	MOV DL,BL  ;--MOVING VARIABLE TO PRINT ()
	ADD DL,48  ;--OFFSETTING ASCII VALUES (0 BEGINS AT 48)
	INT 21H	   ;--MANDATORY FOR PRINT

	           ;STRING
	MOV AH,09H ;--MANDATORY FOR PRINT STRING(MOVE ONCE)
	LEA DX,STR4;--LOADING STRING TO PRINT
	INT 21H    ;--MANDATORY FOR PRINT

	           ;INTEGER
	MOV AH,02H ;--MANDATORY FOR PRINT VARIABLE(MOVE ONCE)
	MOV DL,BH  ;--MOVING VARIABLE TO PRINT ()
	ADD DL,48  ;--OFFSETTING ASCII VALUES (0 BEGINS AT 48)
	INT 21H	   ;--MANDATORY FOR PRINT
	
	
	;----END----
	MOV AX,4C00H
	INT 21H
MAIN ENDP
END MAIN