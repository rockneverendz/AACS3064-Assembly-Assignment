.MODEL SMALL
.STACK 100
.DATA

	NEWL DB 0DH,0AH,"$"
	
	LGIN DB 0DH,0AH,"ENTER PASSWORD : $"
	LGIN_ERROR DB 0DH,0AH,"INVALID LOGIN, PLEASE TRY AGAIN.$"
	
	LBRK DB 0DH,0AH,"=================================$"
	WLCM DB 0DH,0AH,"Welcome to New Zealand Apple Farm$"
	
	MENU DB 0DH,0AH,"   Select a report$"
	MEN1 DB 0DH,0AH,"1. Employee's Weekly Hours$"
	MEN2 DB 0DH,0AH,"2. Employee's Weekly Task$"
	MEN3 DB 0DH,0AH,"3. Employee's Weekly Salary$"
	MEN0 DB 0DH,0AH,"0. Exit$"
	MENU_ERROR DB 0DH,0AH,"INVALID INPUT.$"
	CONT DB 0DH,0AH,"Continue? (Y/N) : $"

	DAY DB "Monday   $"	;Array of strings of days
		DB "Tuesday  $" ;10 CHARACTER
		DB "Wednesday$"
		DB "Thurday  $"
		DB "Friday   $"
		DB "Saturday $"
		DB "Sunday   $"
			
	APPLE	DB "Braeburn      $" ;Array of strings of Apples
			DB "Fuji          $" ;15 CHARACTER
			DB "Granny Smith  $"
			DB "Honeycrisp    $" 
			DB "NZ Beauty     $"
			DB "NZ Queen      $"
			DB "Red Delicious $" 
			DB "Royal Gala    $"
	;VALUE DB 7 DUP(0)	;actual command
	
	VALUE	DB 0		;for debugging use only
			DB 1 
			DB 2 
			DB 3 
			DB 4 
			DB 5 
			DB 6 
	RESULT	DW 123
			DW 234
			DW 345
			DW 456
			DW 567
			DW 678
			DW 789		
	DISREST DB ?
			DB ?
			DB ?
	
	TENB 	DB 10
	TENW 	DW 10
	TWO 	DB 2
	
	PASSWRD DB "password$"
	PASS_IN	DB 9 DUP (?)
	INPUT	DB ?
	
	CXX DW ?	;TO SAVE LOOP COUNTER
	SII DW ?	;
	
.CODE

LOGIN PROC
	RELOGIN:	;LOGIN (OR RETRY)
	MOV AH,09H	;
	LEA DX,LGIN ;
	INT 21H		;
	
	
	MOV CX, 8   	; GET 8 CAHRS   
    LEA SI, PASS_IN ; BUFFER TO HOLD PASSWORD
    MOV DL, "*" 	;  DL TO HOLD '*' TO PRINT LATER
    
	INPUTPASS:
		MOV AH,07H	;GET CHAR
		INT 21H
		MOV [SI], AL
		
		MOV AH, 02H	;PRINT '*'
		INT 21H		;'*' IS ALREADY IN DL
		
		INC SI		;INCREASE PASS_IN INDEX 
    LOOP INPUTPASS 	;CONTINUE UNTIL CX = 0

    MOV BYTE PTR[SI], "$"	;PROPERLY TERMINATING THE STRING
							;BYTE PTR SOLVES "OPERAND MUST HAVE THE SAME TYPE"
		
	MOV CX, 8			;COMPARE 8 CHARACTERS
	MOV SI, OFFSET PASSWRD
	MOV DI, OFFSET PASS_IN
	COMPARE:
		MOV AL, [SI]	;
		CMP AL, [DI]	;COMPARE CHARACTER BY CHARACTER
		JNE LOGERROR	;ABORT LOOP WHEN 1 CHAR IS NOT THE SAME
		INC SI			;
		INC DI			;
	LOOP COMPARE		;
	JMP RETURN			;JUMP TO RETURN AFTER LOOP IS COMPLETED (NOT ABORTED)
	
	LOGERROR:
	MOV AH,09H	
	LEA DX,LGIN_ERROR
	INT 21H		
;	MOV AH, 09H			;//  //  //  //  // 
;	LEA DX, NEWL		;Debug purposes only
;	INT 21H				;  //  //  //  //  /
;	LEA DX, PASS_IN		;Debug purposes only	;DISPLAY ENTERED PASSWORD
;	INT 21H				;//  //  //  //  // 
;	LEA DX, NEWL		;Debug purposes only
;	INT 21H				;  //  //  //  //  /
;	LEA DX, PASSWRD		;Debug purposes only	;DISPLAY VALID PASSWORD
;	INT 21H				;//  //  //  //  // 
	JMP RELOGIN;
	
	RETURN:
	RET
LOGIN ENDP

MENU1 PROC
	MOV AH,09H	;
	LEA DX,MEN1 ;	"1. Employee's Weekly Hours"
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	
	MOV CX,7	;7 DAYS A WEEK	;MIGHT NEED TO MIGRATE THIS INTO A FUNTION LATER
	MOV SI,0
	REPORT1:	
		MOV CXX,CX	;CXX = CX	;SAVE LOOP COUNTER FOR LATER

					;STRING
		MOV AH,09H	;
		LEA DX,NEWL	;
		INT 21H		;
		
		MOV AX,SI	;Multiply 10 as each DAY strings are 10 char in length.
		MUL TENB	;Multiply with the SI index value and add with DAY address
					;
		MOV AH,09H	;and we'll get the next DAY location.
		LEA DX,DAY	;
		ADD DL,AL	;DL = AL = SI * 10
		INT 21H		;
		
					;CHARACTER
		MOV AH,02H	;
		MOV DL,VALUE[SI]
		ADD DL,48	;--OFFSETTING ASCII VALUES (0 BEGINS AT 48)
		INT 21H		;
		
		CALL DISPLAYDW
		
		MOV CX,CXX	;CX = CXX	;RE-WRITE LOOP COUNTER
		INC SI		;
	LOOP REPORT1
	
	
	RET
MENU1 ENDP

MENU2 PROC
	MOV AH,09H	;
	LEA DX,MEN2 ;	"2. Employee's Weekly Task$"
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	
	
	RET
MENU2 ENDP

MENU3 PROC
	MOV AH,09H	;
	LEA DX,MEN3 ;	"3. Employee's Weekly Salary$"
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	
	
	RET
MENU3 ENDP

DISPLAYDW PROC
	MOV SII, SI 	;SAVE FOR A LATER

	MOV DX,0
	ADD SI, SI
	ADD SI, OFFSET RESULT
	MOV AX, [SI]
	
	DIV TENW			;AX = 23	;DX = 4
	MOV DISREST[2], DL	;
	DIV TENB			;AL = 2		;AH = 3
	MOV DISREST[1], AH	;
	MOV DISREST[0], AL	;
	
				;1ST DIGIT
	MOV AH,02H	;
	MOV DL,DISREST[0]
	ADD DL,48	;
	INT 21H		;
				;2ND DIGIT
	MOV DL,DISREST[1]
	ADD DL,48	;
	INT 21H		;
				;3RD DIGIT
	MOV DL,DISREST[2]
	ADD DL,48	;
	INT 21H		;
	
	MOV SI, SII	;RE-INSTATEING 
	
	RET
DISPLAYDW ENDP

CONTINUE PROC
	CLOOP:
	MOV AH,09H	;
	LEA DX,CONT	;"CONTINUE?"
	INT 21H		;
				;
	MOV AH,01H	;INPUT CHAR
	MOV DL,INPUT;
	INT 21H		;
	
	CMP AL, "Y"
	JE	CEND
	CMP AL, "y"
	JE 	CEND
	CMP AL, "N"
	JE  CEND
	CMP AL, "n"
	JE	CEND_E_N;UNDERSTAND INPUT BUT CAPITALIZE n
	
	JMP CLOOP	;DOENS'T UNDERSTAND INPUT, RE-PROMPT
	
	CEND_E_N:
	MOV AL, "N"
	CEND:
	RET
CONTINUE ENDP

MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	;----BEGIN----
	CALL LOGIN	;PROCEED WHEN LOGIN INFO IS VALID
	Q:			;WELCOME
	MOV AH,09H	;
	LEA DX,LBRK ;	Horizontal Line
	INT 21H		;
	LEA DX,WLCM ;	Welcome message
	INT 21H		;
	LEA DX,LBRK ;	Horizontal Line
	INT 21H		;
	
	SELECTMENU:	;MENU
	MOV AH,09H	;
	LEA DX,MENU ;	"Select a report"
	INT 21H		;
	LEA DX,MEN1 ;	"1. Employee's Weekly Hours"
	INT 21H		;
	LEA DX,MEN2 ;	"2. Employee's Weekly Task"
	INT 21H		;
	LEA DX,MEN3 ;	"3. Employee's Weekly Salary"
	INT 21H		;
	LEA DX,MEN0 ;	"0. Exit"
	INT 21H		;
	
				;INPUT SINGLE CHARACTER
	MOV AH,01H	;
	INT 21H		;
	
	CMP AL, "1"
	JE	M1
	CMP AL, "2"
	JE	M2
	CMP AL, "3"
	JE	M3
	CMP AL, "0"
	JE	QUIT
	;ANY OTHER INPUT	;MENU_ERROR
	MOV AH,09H			;
	LEA DX,MENU_ERROR	;
	INT 21H				;
	JMP SELECTMENU
	
	M1:
	CALL MENU1		;
	CALL CONTINUE	;
	CMP AL, "N"		;JUMP BACK MENU IF ABORT ("N")	
	JE Q			;ELSE CONTINUE (VERIFICATION ALREADY DONE AT CONTINUE PROC)
	M2:				
	CALL MENU2		;
	CALL CONTINUE	;
	CMP AL, "N"		;
	JE Q			;
	M3:
	CALL MENU3		;
	CALL CONTINUE	;
	CMP AL, "N"		;
	JE Q			;
	JMP M1			;ELSE CONTINUE TO M1
	;----END----
	QUIT:
	MOV AX,4C00H
	INT 21H
MAIN ENDP
END MAIN