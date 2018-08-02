.MODEL SMALL
.STACK 100
.DATA

	NEWL DB 0DH,0AH,"$"
	
	LGIN DB 0DH,0AH,"   ENTER PASSWORD : $"
	LGIN_ERROR DB 0DH,0AH,"                    INVALID LOGIN, PLEASE TRY AGAIN.$"
	
	WLC1 DB 0DH,0AH,"          ",201,37 DUP (205),187,"$"
	WLC2 DB 0DH,0AH,"          ",186,"  Welcome to New Zealand Apple Farm  ",186,"$"
	WLC3 DB 0DH,0AH,"          ",200,37 DUP (205),188,"$"
	
	MEN1 	 DB 0DH,0AH,"  ",218,196,194,52 DUP (196)                                          ,191,"$"
	MEN2 	 DB 0DH,0AH,"  ",179," ",179," Select a report                                    ",179,"$"
	MEN3 	 DB 0DH,0AH,"  ",195,196,197,52 DUP (196)                                          ,180,"$"
	MEN4 	 DB 0DH,0AH,"  ",179,"1",179," Employee's Weekly Hours                            ",179,"$"
	MEN5 	 DB 0DH,0AH,"  ",179,"2",179," Employee's Weekly Task                             ",179,"$"
	MEN6	 DB 0DH,0AH,"  ",179,"3",179," Employee's Weekly Salary                           ",179,"$"
	MEN7	 DB 0DH,0AH,"  ",179,"0",179," Exit                                               ",179,"$"
	MEN8	 DB 0DH,0AH,"  ",192,196,193,52 DUP (196)                                          ,217,"$"
	MEN9	 DB 0DH,0AH,0DH,0AH,"   Enter selection : $"
	MENU_ERROR DB 0DH,0AH,"                     INVALID SELECTION.$"
	
	CONT     DB 0DH,0AH,"   Continue? (Y/N) : $"
	INPUT_ERROR DB 0DH,0AH,"                                    INVALID INPUT$"
	
	MENU1IN  DB 0DH,0AH,"   Enter hour worked on $"
	MENU1RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,10 DUP (196),194,11 DUP (196),194,20 DUP (196),180,"$"
	MENU1RE2 DB 0DH,0AH,"  ",179," Day      ",179," Hours    ",179," Hour Rate ",179," Total Pay          ",179,"$"
	MENU1RE3 DB 0DH,0AH,"  ",195,10 DUP (196),197,10 DUP (196),197,11 DUP (196),197,20 DUP (196)          ,180,"$"
	MENU1REX DB                           " ",179,"          ",179,"           ",179,"                    ",179,"$"
	MENU1RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,10 DUP (205),216,11 DUP (205),216,20 DUP (205)          ,181,"$"
	MENU1RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"          ",179,"           ",179,"                    ",179,"$"
	MENU1RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,10 DUP (205),207,11 DUP (205),207,20 DUP (205)          ,190,"$"
	
	MENU2IN1 DB 0DH,0AH,"   Select apple picked on $"
	MENU2IN2 DB 0DH,0AH,"   Enter the number of bins of $"
	MENU2RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,15 DUP (196),194,5 DUP (196),194,10 DUP (196),194,10 DUP (196),180,"$"
	MENU2RE2 DB 0DH,0AH,"  ",179," Day      ",179," Apple Picked  ",179," Bin "    ,179," Bin Rate ",179," Bin Value",179,"$"
	MENU2RE3 DB 0DH,0AH,"  ",195,10 DUP (196),197,15 DUP (196)     ,197,5 DUP (196),197,10 DUP (196),197,10 DUP (196),180,"$"
	MENU2REX DB                           " ",179,"               ",179,"     "    ,179,"          ",179,"          ",179,"$"
	MENU2RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,15 DUP (205)     ,216,5 DUP (205),216,10 DUP (205),216,10 DUP (205),181,"$"
	MENU2RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"               ",179,"     "    ,179,"          ",179,"          ",179,"$"
	MENU2RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,15 DUP (205)     ,207,5 DUP (205),207,10 DUP (205),207,10 DUP (205),190,"$"
	
	
	INDENT	 DB 0DH,0AH,"  ",179,"$"
	INDENTX	 DB 0DH,0AH,"  ",179,"0",179," ","$"	;Same with INDENT but with indeX, get it? xD (Only used in DISPLAYAPPLE)

	APPLE1 	 DB 0DH,0AH,"  ",218,196,194,26 DUP (196)                ,194,25 DUP (196)               ,191,"$"
	APPLE2 	 DB 0DH,0AH,"  ",179," ",179," Apple Types              ",179," Value Per Bin           ",179,"$"
	APPLE3 	 DB 0DH,0AH,"  ",195,196,197,26 DUP (196)                ,197,25 DUP (196)               ,180,"$"
	APPLEX	 DB                                         "           ",179,"                         ",179,"$"
	APPLE4	 DB 0DH,0AH,"  ",192,196,193,26 DUP (196)                ,193,25 DUP (196)               ,217,"$"
	
	;┌─┬┐	;218	;196	;194	;191		
	;│ ││	;179			;179	;179
	;├─┼┤	;195	;196	;197	;180
	;└─┴┘	;192	;196	;193	;217
	
	
	DAY DB "Monday   $"	;Array of strings of days
		DB "Tuesday  $" ;10 CHARACTER
		DB "Wednesday$"
		DB "Thurday  $"
		DB "Friday   $"
		DB "Saturday $"
		DB "Sunday   $"
	DAYPH	DB 7 DUP(?)	;DAY POINTER HIGH	;I would use 'DW' if index isn't increment of 2
	DAYPL	DB 7 DUP(?)	;DAY POINTER LOW	;Basically for easier indexing, you know?
			
	APPLE	DB "Braeburn      $" ;Array of strings of Apples
			DB "Fuji          $" ;15 CHARACTER
			DB "Granny Smith  $"
			DB "Honeycrisp    $" 
			DB "NZ Beauty     $"
			DB "NZ Queen      $"
			DB "Red Delicious $" 
			DB "Royal Gala    $"
	APPLEPH	DB 8 DUP(?)	;APPLE POINTER HIGH	;Same thing as DAY PONTER you see above
	APPLEPL	DB 8 DUP(?)	;APPLE POINTER LOW
			
	APPLE_RATE	DB 172
				DB 228
				DB 144
				DB 128
				DB 112
				DB 114
				DB 124
				DB 108
	
	VALUE1  DB 7 DUP(0)
	VALUE2  DB 7 DUP(0)
	
	RESULTB	DB ?
			DB ?
			DB ?
			DB ?
			DB ?
			DB ?
			DB 78
	RESULTW	DW 123
			DW 234
			DW 345
			DW 456
			DW 567
			DW 678
			DW 789		
	DISREST DB ?
			DB ?
			DB ?
	

	SPACE	DB " ",179,"       $"
	COLON	DB " : $"
	TENB 	DB 10
	TENW 	DW 10
	TWO 	DB 2
	FIFTHTN DB 15
	
	PASSWRD DB "password$"
	PASS_IN	DB 9 DUP (?)
	INPUT	DB ?
	
	HOUR_RATE		DB 7
	TTL_HOUR		DB 0
	TTL_HOUR_PAY	DW 0
	TTL_BIN_VALUE	DW 0
	
	AXX DW ?
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

POINTER PROC	;THIS INGENUITY IS MADE POSSIBLE BY VERNIY xD
	MOV CX,7	;7 DAYS A WEEK
	MOV SI,0
	DAYCP:		;Stands for 'Day Create Pointer' loop
		MOV AX,SI	;Multiply 10 as each DAY strings are 10 char in length.
		MUL TENB	;Multiply with the SI index value and add with DAY address
		
		LEA DX,DAY	;and we'll get the next DAY location
		ADD DX,AX	;DX =+ SI * 10
		MOV DAYPH[SI], DH;SAVE POINTER FOR LATER
		MOV DAYPL[SI], DL;SAVE POINTER FOR LATER
		
		INC SI
	LOOP DAYCP
	MOV CX,8	;8 APPLE IN THE LIST
	MOV SI,0
	APPLECP:	;Stands for 'Apple Create Pointer' loop
		MOV AX,SI	;Multiply 15 as each APPLE strings are 15 char in length.
		MUL FIFTHTN	;Multiply with the SI index value and add with APPLE address
		
		LEA DX,APPLE;and we'll get the next APPLE location
		ADD DX,AX	;DX =+ SI * 15
		MOV APPLEPH[SI], DH;SAVE POINTER FOR LATER
		MOV APPLEPL[SI], DL;SAVE POINTER FOR LATER
		
		INC SI
	LOOP APPLECP
	RET
POINTER ENDP

MENU1 PROC
	MOV AH,09H	;
	LEA DX,MEN1 ;	============================
	INT 21H		;
	LEA DX,MEN4 ;	"1. Employee's Weekly Hours"
	INT 21H		;
	LEA DX,MEN8 ;	============================
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	MOV TTL_HOUR, 0 ;OVERWRTIE PREVIOUS DATA (IF THERE IS ANY)
	
	MOV CX,7	;7 DAYS A WEEK
	MOV SI,0
	INPUTM1:
					;STRING
		MOV AH,09H	;
		LEA DX,MENU1IN	;
		INT 21H		;
		
		MOV DH,DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
		MOV DL,DAYPL[SI]	
		INT 21H	
					;
		LEA DX, COLON;DISPLAY COLON
		INT 21H
		
		MOV AH,01H	;INPUT SINGLE CHARACTER
		INT 21H		;
		SUB AL, 48	;
		CMP AL, 0	;
		JL  INPUTM1_INVALID ;INPUT < 0
		CMP AL, 9	;
		JG  INPUTM1_INVALID	;INPUT > 9
		JMP INPUTM1_VALID	;0 <= INPUT <= 9
		
		INPUTM1_INVALID:
		MOV AH,09H	;
		LEA DX,INPUT_ERROR	;
		INT 21H		;
		JMP INPUTM1	;
		
		INPUTM1_VALID:
		MOV VALUE1[SI], AL	;STORE IN 'HOURS' 
		ADD TTL_HOUR , AL	;SUM OF 'HOURS'
		
		MOV AH, 0
		MUL HOUR_RATE
		MOV RESULTB[SI] , AL;STORE IN 'TOTAL PAY'
		ADD TTL_HOUR_PAY, AX;SUM OF 'TOTAL PAY'
		
		INC SI		;
	LOOP INPUTM1
	
	MOV AH, 09H
	LEA DX, MEN1 	;	============================
	INT 21H			;
	LEA DX, MEN4 	;	"1. Employee's Weekly Hours"
	INT 21H			;
	LEA DX, MENU1RE1;	============================
	INT 21H			;
	LEA DX, MENU1RE2;	DAY | HOURS | HOURRATE | PAY
	INT 21H			;
	LEA DX, MENU1RE3;	============================
	INT 21H			;
	
	MOV AL, HOUR_RATE	;Since this is a constant, we only are required to change this once (and never touch this again)
	ADD AL, 48			;If owner decide to change the rates, the report will follow suit
	MOV DI, 22			;The location of the column 'Hour Rate'
	MOV MENU1REX[DI], AL;
	
	MOV CX,7	;7 DAYS A WEEK	
	MOV SI,0
	REPORTM1:	;PRINTING REPORT
					;STRING
		MOV AH,09H	;
		LEA DX,INDENT;INDENT
		INT 21H
		MOV DH,DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
		MOV DL,DAYPL[SI]
		INT 21H	
		
		MOV AL,VALUE1[SI]
		ADD AL, 48
		MOV DI, 10			;The location of the column 'Hours'
		MOV MENU1REX[DI], AL;
		
		MOV AH, 0
		MOV AL, RESULTB[SI]
		DIV TENB
		ADD AL, 48
		ADD AH, 48
		MOV DI, 42			;The location of the column 'Total Pay'
		MOV MENU1REX[DI]  , AL
		MOV MENU1REX[DI+1], AH
		
		MOV AH,09H	;
		LEA DX,MENU1REX;INDENT
		INT 21H
		
		INC SI		;
	LOOP REPORTM1
	
	LEA DX, MENU1RE4
	INT 21H
	
	MOV AH,	0
	MOV AL, TTL_HOUR	;AL = 23

	DIV TENB			;AL = 2		;AH = 3
	ADD AL, 48
	ADD AH, 48
	MOV DI, 23				;The location of the column 'Hours'
	MOV MENU1RE5[DI]  , AL	;
	MOV MENU1RE5[DI+1], AH	;

	MOV DX, 0				;DX = 0
	MOV AX, TTL_HOUR_PAY	;AX = 345

	DIV TENW				;AX = 34	;DX = 5
	DIV TENB				;AL = 3		;AH = 4
	ADD AL, 48				;FROM INT TO CHAR
	ADD AH, 48				;FROM INT TO CHAR
	ADD DL, 48				;FROM INT TO CHAR
	MOV DI, 55				;The location of the column 'Total Pay'
	MOV MENU1RE5[DI]  , AL	;
	MOV MENU1RE5[DI+1], AH	;
	MOV MENU1RE5[DI+2], DL
	
	MOV AH,09H
	LEA DX, MENU1RE5
	INT 21H
	
	LEA DX, MENU1RE6
	INT 21H
	
	RET
MENU1 ENDP

MENU2 PROC
	MOV AH,09H	;
	LEA DX,MEN1 ;	============================
	INT 21H		;
	LEA DX,MEN5 ;	"1. Employee's Weekly Hours"
	INT 21H		;
	LEA DX,MEN8 ;	============================
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	MOV TTL_BIN_VALUE, 0 ;OVERWRTIE PREVIOUS DATA (IF THERE IS ANY)
	
	MOV CX,7	;7 DAYS A WEEK
	MOV SI,0
	INPUTM2:
		INPUTM2_PART1:
			CALL DISPLAYAPPLE
								;STRING
			MOV AH,09H			;
			LEA DX,MENU2IN1		;
			INT 21H				;
			MOV DH,DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
			MOV DL,DAYPL[SI]
			INT 21H	
			
			LEA DX, COLON;DISPLAY COLON
			INT 21H
			
			MOV AH,01H	;INPUT SINGLE CHARACTER
			INT 21H		;
			SUB AL, 48	;
			CMP AL, 0	;
			JL  INPUTM2_INVALID_PART1	;INPUT < 0
			CMP AL, 8	;
			JG  INPUTM2_INVALID_PART1	;INPUT > 8
			JMP INPUTM2_VALID_PART1 	;0 <= INPUT <= 8
			
			INPUTM2_INVALID_PART1:
			MOV AH,09H			;
			LEA DX,INPUT_ERROR	;
			INT 21H				;
		JMP INPUTM2_PART1	;
		
			INPUTM2_VALID_PART1:
		MOV VALUE2[SI], AL	;STORE IN 'APPLE TYPE' 
		
		INPUTM2_PART2:			;STRING
			MOV AH,09H			;
			LEA DX,MENU2IN2		;
			INT 21H				;
			MOV DH,APPLEPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
			MOV DL,APPLEPL[SI]
			INT 21H	
			
			LEA DX, COLON;DISPLAY COLON
			INT 21H
			
			MOV AH,01H	;INPUT SINGLE CHARACTER
			INT 21H		;
			SUB AL, 48	;
			CMP AL, 0	;
			JL  INPUTM2_INVALID_PART2	;INPUT < 0
			CMP AL, 9	;
			JG  INPUTM2_INVALID_PART2	;INPUT > 9
			JMP INPUTM2_VALID_PART2		;0 <= INPUT <= 9
			
			INPUTM2_INVALID_PART2:
			MOV AH,09H			;
			LEA DX,INPUT_ERROR	;
			INT 21H				;
		JMP INPUTM2_PART2	;
		
			INPUTM2_VALID_PART2:
		MOV VALUE2[SI], AL	;STORE IN 'APPLE TYPE' 
		
		
		; MOV AH, 0
		; MUL HOUR_RATE
		; MOV RESULTB[SI] , AL;STORE IN 'TOTAL PAY'
		; ADD TTL_BIN_VALUE, AX;SUM OF 'TOTAL BIN VALUE'
		
		INC SI		;
	LOOP INPUTM2
	
	MOV AH, 09H
	LEA DX, MEN1 	;	============================
	INT 21H			;
	LEA DX, MEN5 	;	"1. Employee's Weekly Hours"
	INT 21H			;
	LEA DX, MENU2RE1;	============================
	INT 21H			;
	LEA DX, MENU2RE2;	DAY | HOURS | HOURRATE | PAY
	INT 21H			;
	LEA DX, MENU2RE3;	============================
	INT 21H			;
		
	MOV CX,7	;7 DAYS A WEEK	
	MOV SI,0
	REPORTM2:	;PRINTING REPORT
					;STRING
		MOV AH,09H	;
		LEA DX,INDENT;INDENT
		INT 21H
		MOV DH,DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
		MOV DL,DAYPL[SI]
		INT 21H	
		
		LEA DX,MENU2REX
		INT 21H
		
		INC SI		;
	LOOP REPORTM2
	
	LEA DX, MENU2RE4
	INT 21H
	
	LEA DX, MENU2RE5
	INT 21H
	
	LEA DX, MENU2RE6
	INT 21H
	
	RET
MENU2 ENDP

MENU3 PROC
	MOV AH,09H	;
	LEA DX,MEN1 ;	============================
	INT 21H		;
	LEA DX,MEN6 ;	"3. Employee's Weekly Salary$"
	INT 21H		;
	LEA DX,MEN8 ;	============================
	INT 21H		;
	LEA DX,NEWL	;
	INT 21H		;
	
	
	RET
MENU3 ENDP

DISPLAYDB PROC
	MOV AH,	0
	MOV AL, RESULTB[SI]	;AL = 23
	
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
	
	RET
DISPLAYDB ENDP

DISPLAYDW PROC
	MOV SII, SI 	;SAVE FOR A LATER

	MOV DX,0
	ADD SI, SI
	ADD SI, OFFSET RESULTW
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

DISPLAYMENU PROC
	;MENU
	MOV AH,09H	;
	LEA DX,MEN1 ;
	INT 21H		;
	LEA DX,MEN2 ;
	INT 21H		;
	LEA DX,MEN3 ;
	INT 21H		;
	LEA DX,MEN4 ;
	INT 21H		;
	LEA DX,MEN5 ;
	INT 21H		;
	LEA DX,MEN6 ;
	INT 21H		;
	LEA DX,MEN7 ;
	INT 21H		;
	LEA DX,MEN8 ;
	INT 21H		;
	LEA DX,MEN9 ;
	INT 21H		;
	RET
DISPLAYMENU ENDP

DISPLAYAPPLE PROC
	MOV CXX, CX;
	MOV SII, SI;
	
	MOV AH, 09H
	LEA DX, APPLE1
	INT 21H
	LEA DX, APPLE2
	INT 21H
	LEA DX, APPLE3
	INT 21H
	
	MOV	INDENTX[5], "0" ;Initializing to 0, we will add this character value by one increment each loop
	MOV DI, 13			;Location of Value Per Bin
	MOV CX, 8			;8 APPLES IN THE LIST
	MOV SI, 0
	APPLELIST:
		INC	INDENTX[5]
		LEA DX, INDENTX
		INT 21H
		MOV DH, APPLEPH[SI]
		MOV DL, APPLEPL[SI]
		INT 21H
		
		MOV AH, 0
		MOV AL, APPLE_RATE[SI]		;AL = 234	;AH = 0
		DIV TENB					;AL = 23	;AH = 4
		ADD AH, 48
		MOV APPLEX[DI+2], AH		;
		
		MOV AH, 0					;AL = 23	;AH = 0
		DIV TENB					;AL = 2		;AH = 3
		ADD AH, 48
		ADD AL, 48
		MOV APPLEX[DI+1], AH		;
		MOV APPLEX[DI]  , AL		;
	
		MOV AH, 09H
		LEA DX, APPLEX
		INT 21H
		
		INC SI
	LOOP APPLELIST
	
	LEA DX, APPLE4
	INT 21H
		
	MOV CX, CXX;
	MOV SI, SII;
	RET 
DISPLAYAPPLE ENDP

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
	JE	CEND
	CMP AL, "N"
	JE	CEND
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
;	CALL LOGIN	;PROCEED WHEN LOGIN INFO IS VALID	;Just remember to reenable this procedure call when presenting
	CALL POINTER;PREPARING POINTERS FOR EASIER NAVIGATION
	Q:			;
	MOV AH,09H	;
	LEA DX,WLC1 ;   ===============
	INT 21H		;
	LEA DX,WLC2 ;	Welcome message
	INT 21H		;
	LEA DX,WLC3 ;   ===============
	INT 21H		;
	
	MOV TTL_HOUR_PAY , 0	;INITIALIZING TO ZERO
	MOV TTL_BIN_VALUE, 0	;OVERWRTIE PREVIOUS DATA (IF THERE IS ANY)
	
	SELECTMENU:	
	CALL DISPLAYMENU;
				;
	MOV AH,01H	;INPUT SINGLE CHARACTER
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