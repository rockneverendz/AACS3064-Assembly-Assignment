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
	
	PASSWRD DB "this$"
	PASS_IN	DB 20
			DB ?
			DB 20 DUP("$")
	
	CXX DW ?	;TO SAVE LOOP COUNTER
	SII DW ?	;
	
.CODE

LOGIN PROC
				;LOGIN
	MOV AH,09H	;
	LEA DX,LGIN ;
	INT 21H		;
	
	MOV AH, 0AH	;
	LEA DX, PASS_IN
	INT 21H
	
	MOV AH, 09H
	LEA DX, NEWL
	INT 21H
	LEA DX, PASS_IN
	INT 21H
	LEA DX, NEWL
	INT 21H
	LEA DX, PASSWRD
	INT 21H
				;LGIN_ERROR
	MOV AH,09H	;
	LEA DX,LGIN_ERROR
	INT 21H		;
	
	
	RET
LOGIN ENDP

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

MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	;----BEGIN----
	CALL LOGIN	;PROCEED WHEN LOGIN INFO IS VALID
				;WELCOME
	MOV AH,09H	;
	LEA DX,LBRK ;	Horizontal Line
	INT 21H		;
	LEA DX,WLCM ;	Welcome message
	INT 21H		;
	LEA DX,LBRK ;	Horizontal Line
	INT 21H		;
	
				;MENU
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
	
				;MENU_ERROR
	MOV AH,09H	;
	LEA DX,MENU_ERROR
	INT 21H		;
	
				;MENU
	MOV AH,09H	;
	LEA DX,MEN1 ;	"1. Employee's Weekly Hours"
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	
	MOV CX,7	;7 DAYS A WEEK
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
			
					;DIVISION ;PROB ERROR HERE
		CALL DISPLAYDW
		
		
		MOV CX,CXX	;CX = CXX	;RE-WRITE LOOP COUNTER
		INC SI		;
	LOOP REPORT1
	
	;----END----
	MOV AX,4C00H
	INT 21H
MAIN ENDP
END MAIN