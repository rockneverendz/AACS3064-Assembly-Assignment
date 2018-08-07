.MODEL SMALL
.STACK 100
.DATA
    ;Link below is the github repo of this project
    ;https://github.com/rockneverendz/AACS3064-Assembly-Assignment
    ;The github repo serves as a proof that we made it oursleves
    ;Just refer to the list of commits and you'll see how we almost went insane
    
	;Test commit from SCY
	
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
	MENU_ERROR DB       0DH,0AH,"     INVALID INPUT > ENTER INDEX OF THE REPORT, 0 TO EXIT"
               DB       0DH,0AH,"                   > $" ;"Press anykey to continue"
	
	CONT            DB 0DH,0AH,"   Continue? (Y/N) : $"
	ERROR_CONT      DB         "Press any key to continue......$"
	
	MENU1IN         DB 0DH,0AH,"   Enter hour worked on $"
	MENU1IN_ERROR   DB 0DH,0AH,20 DUP (" "),"INVALID INPUT > PLEASE ENTER A VALID NUMBER, 0 IF NONE"
                    DB 0DH,0AH,20 DUP (" "),"              > $" ;"Press anykey to continue"
	MENU1RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,10 DUP (196),194,11 DUP (196),194,20 DUP (196),180,"$"
	MENU1RE2 DB 0DH,0AH,"  ",179," Day      ",179," Hours    ",179," Hour Rate ",179," Total Pay          ",179,"$"
	MENU1RE3 DB 0DH,0AH,"  ",195,10 DUP (196),197,10 DUP (196),197,11 DUP (196),197,20 DUP (196)          ,180,"$"
	MENU1REX DB                           " ",179,"          ",179,"           ",179,"                    ",179,"$"
	MENU1RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,10 DUP (205),216,11 DUP (205),216,20 DUP (205)          ,181,"$"
	MENU1RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"          ",179,"           ",179,"                    ",179,"$"
	MENU1RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,10 DUP (205),207,11 DUP (205),207,20 DUP (205)          ,190,"$"
	
	MENU2IN1        DB 0DH,0AH,"   Select apple picked on $"
	MENU2IN1_ERROR  DB 0DH,0AH,22 DUP (" "),"INVALID INPUT > ENTER INDEX OF THE APPLES, 0 IF NONE"
                    DB 0DH,0AH,22 DUP (" "),"              > $" ;"Press anykey to continue"
	MENU2IN2        DB 0DH,0AH,"   Number of bins of $"
    MENU2IN2_ERROR  DB 0DH,0AH,22 DUP (" "),"INVALID INPUT > PLEASE ENTER A VALID NUMBER"
                    DB 0DH,0AH,22 DUP (" "),"              > $" ;"Press anykey to continue"
    
	MENU2RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,15 DUP (196),194,5 DUP (196),194,10 DUP (196),194,10 DUP (196),180,"$"
	MENU2RE2 DB 0DH,0AH,"  ",179," Day      ",179," Apple Picked  ",179," Bin "    ,179," Bin Rate ",179," Bin Value",179,"$"
	MENU2RE3 DB 0DH,0AH,"  ",195,10 DUP (196),197,15 DUP (196)     ,197,5 DUP (196),197,10 DUP (196),197,10 DUP (196),180,"$"
	MENU2REX DB                                                     179,"     "    ,179,"      .   ",179,"      .   ",179,"$"
	MENU2REN DB                                    "              ",179,"   - "    ,179,"    --.-- ",179,"    --.-- ",179,"$"
	MENU2RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,15 DUP (205)     ,216,5 DUP (205),216,10 DUP (205),216,10 DUP (205),181,"$"
	MENU2RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"               ",179,"     "    ,179,"          ",179,"          ",179,"$"
	MENU2RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,15 DUP (205)     ,207,5 DUP (205),207,10 DUP (205),207,10 DUP (205),190,"$"
	
	
	INDENT	 DB 0DH,0AH,"  ",179,"$"
	INDENTX	 DB 0DH,0AH,"  ",179,"0",179," ","$"	;Same with INDENT but with indeX, get it? xD (Only used in DISPLAY_APPLE)

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
	APPLE0	DB "NONE          $"
	APPLEPH	DB 8 DUP(?)	;APPLE POINTER HIGH	;Same thing as DAY PONTER you see above
	APPLEPL	DB 8 DUP(?)	;APPLE POINTER LOW
				
	APPLE_RATE	DW 17212	;Means RM 172.12 
				DW 22823
				DW 14445
				DW 12856
				DW 11267
				DW 11478
				DW 12489
				DW 10890
	APPLE_RATEPH DB 8 DUP(?)	;APPLE RATE POINTER HIGH
	APPLE_RATEPL DB 8 DUP(?)	;APPLE RATE POINTER LOW
	
    HOURS_VAR   DB 7 DUP(0)
	APPLE_VAR  DB 7 DUP(0)
	BIN_VAR  DB 7 DUP(0)
	
	BIN_VALUE_AX DW 7 DUP(0)
	BIN_VALUE_AX_PL DB 7 DUP(0)
	BIN_VALUE_AX_PH DB 7 DUP(0)
	
	BIN_VALUE_DX DW 7 DUP(0)
	BIN_VALUE_DX_PL DB 7 DUP(0)
	BIN_VALUE_DX_PH DB 7 DUP(0)
	
	
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
	LINE	DB " ",179," $"
	TWO 	DB 2
	FIFTHTN DB 15
	TENTHOU DW 10000
	ONETHOU DW  1000
	HUNDRED DW   100
	TENB 	DB 	  10
	TENW 	DW    10
	
	
	PASSWRD DB "password$"
	PASS_IN	DB 9 DUP (?)
	INPUT	DB ?
	
	HOUR_RATE		DB 7
	TTL_HOUR		DB 0
	TTL_HOUR_PAY	DW 0
	TTL_BIN_VALUE	DW 0
	
	AXX DW ?
	CXX DW ?	;
	SII DW ?	;
	DII DW ?
	
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
	MOV AX, OFFSET BIN_VALUE_AX
	MOV DX, OFFSET BIN_VALUE_DX
	MOV BX, OFFSET DAY
	MOV CX,7	;7 DAYS A WEEK
	MOV SI,0
	DAYCP:		;Stands for 'Day Create Pointer' loop
		MOV DAYPH[SI], BH;
		MOV DAYPL[SI], BL;
		
		MOV BIN_VALUE_AX_PH[SI], AH;
		MOV BIN_VALUE_AX_PL[SI], AL;
		
		MOV BIN_VALUE_DX_PH[SI], DH;
		MOV BIN_VALUE_DX_PL[SI], DL;
		
		ADD AX, 2	;Size of DW is 2
		ADD DX, 2	;
		ADD BX, 10	;Since each string length is 10, add 10 and we will find the next address of the next day
		INC SI
	LOOP DAYCP
    
	MOV AX, OFFSET APPLE
	MOV BX, OFFSET APPLE_RATE
	MOV CX,8	;8 APPLE IN THE LIST
	MOV SI,0
	APPLECP:	;Stands for 'Apple Create Pointer' loop
		MOV APPLEPH[SI], AH			;SAVE POINTER FOR LATER
		MOV APPLEPL[SI], AL			;This is for the apple's name pointer
		
		MOV APPLE_RATEPH[SI], BH	;This is for the apple's bin value pointer
		MOV APPLE_RATEPL[SI], BL	;Really, I created pointers so I could use them in increments of ONE
		
		ADD AX, 15	;Apple's name string are 15 in length
		ADD BX, 2	;Size of DW is 2
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
	MENU1_INPUT_HOURS:
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
		SUB AL, "0"	;
		CMP AL, 0	;
		JL  MENU1_INPUT_HOURS_INVALID   ;INPUT < 0
		CMP AL, 9	;
		JG  MENU1_INPUT_HOURS_INVALID   ;INPUT > 9
		JMP MENU1_INPUT_HOURS_VALID     ;0 <= INPUT <= 9
		
		MENU1_INPUT_HOURS_INVALID:
		MOV AH,09H	;
		LEA DX,MENU1IN_ERROR	;
		INT 21H		;
        CALL ERROR_CONT_PROC;Press Any Key To Continue
		JMP MENU1_INPUT_HOURS	;
		
		MENU1_INPUT_HOURS_VALID:
		MOV HOURS_VAR[SI], AL	;STORE IN 'HOURS' 
		ADD TTL_HOUR , AL	;SUM OF 'HOURS'
		
		MOV AH, 0
		MUL HOUR_RATE
		MOV RESULTB[SI] , AL;STORE IN 'TOTAL PAY'
		ADD TTL_HOUR_PAY, AX;SUM OF 'TOTAL PAY'
		
		INC SI		;
	LOOP MENU1_INPUT_HOURS
	
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
	ADD AL, "0"			;If owner decide to change the rates, the report will follow suit
	MOV DI, 22			;The location of the column 'Hour Rate'
	MOV MENU1REX[DI], AL;
	
	MOV CX,7	;7 DAYS A WEEK	
	MOV SI,0
	MENU1_REPORT:	;PRINTING REPORT
					;STRING
		MOV AH,09H	;
		LEA DX,INDENT;INDENT
		INT 21H
		MOV DH,DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
		MOV DL,DAYPL[SI]
		INT 21H	
		
		MOV AL,HOURS_VAR[SI]
		ADD AL, "0"
		MOV DI, 10			;The location of the column 'Hours'
		MOV MENU1REX[DI], AL;
		
		MOV AH, 0
		MOV AL, RESULTB[SI]
		DIV TENB
		ADD AL, "0"
		ADD AH, "0"
		MOV DI, 42			;The location of the column 'Total Pay'
		MOV MENU1REX[DI]  , AL
		MOV MENU1REX[DI+1], AH
		
		MOV AH,09H	;
		LEA DX,MENU1REX;INDENT
		INT 21H
		
		INC SI		;
	LOOP MENU1_REPORT
	
	LEA DX, MENU1RE4
	INT 21H
	
	MOV AH,	0
	MOV AL, TTL_HOUR	;AL = 23

	DIV TENB			;AL = 2		;AH = 3
	ADD AL, "0"
	ADD AH, "0"
	MOV DI, 23				;The location of the column 'Hours'
	MOV MENU1RE5[DI]  , AL	;
	MOV MENU1RE5[DI+1], AH	;

	MOV DX, 0				;DX = 0
	MOV AX, TTL_HOUR_PAY	;AX = 345

	DIV TENW				;AX = 34	;DX = 5
	DIV TENB				;AL = 3		;AH = 4
	ADD AL, "0"				;FROM INT TO CHAR
	ADD AH, "0"				;FROM INT TO CHAR
	ADD DL, "0"				;FROM INT TO CHAR
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
	MENU2_INPUT:
		CALL MENU2_INPUT_PROC	;
	LOOP MENU2_INPUT
	
	MOV AH, 09H
	LEA DX, MEN1 	;	============================
	INT 21H			;
	LEA DX, MEN5 	;	"2. Employee's Weekly Task "
	INT 21H			;
	LEA DX, MENU2RE1;	============================
	INT 21H			;
	LEA DX, MENU2RE2;	DAY | HOURS | HOURRATE | PAY
	INT 21H			;
	LEA DX, MENU2RE3;	============================
	INT 21H			;
		
	MOV CX,7	;7 DAYS A WEEK	
	MOV SI,0
	MENU2_REPORT:	;PRINTING REPORT
		CALL MENU2_REPORT_PROC  ;
	LOOP MENU2_REPORT
	
	LEA DX, MENU2RE4
	INT 21H
	
	LEA DX, MENU2RE5
	INT 21H
	
	LEA DX, MENU2RE6
	INT 21H
	
	RET
MENU2 ENDP

MENU2_INPUT_PROC PROC
	MENU2_INPUT_APPLE:
		CALL DISPLAY_APPLE
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
		SUB AL, "0"	;
		CMP AL, 8	;
		JG  MENU2_INPUT_APPLE_INVALID	;INPUT > 8
		CMP AL, 0	;
		JL  MENU2_INPUT_APPLE_INVALID	;INPUT < 0
		JE  MENU2_INPUT_APPLE_NONE
		JMP MENU2_INPUT_APPLE_VALID 	;0 <= INPUT <= 8
		
	MENU2_INPUT_APPLE_INVALID:
		MOV AH,09H			;
		LEA DX,MENU2IN1_ERROR
		INT 21H				;
        CALL ERROR_CONT_PROC;Press Any Key To Continue
		JMP MENU2_INPUT_APPLE;
		
	MENU2_INPUT_APPLE_VALID:
		DEC AL	 			;User Input - 1 = Index of Apple
		MOV APPLE_VAR[SI], AL	;STORE IN 'APPLE TYPE' 
		MOV AH, 0
		MOV DI, AX
	
	MENU2_INPUT_BIN:			;STRING
		MOV AH,09H			;
		LEA DX,MENU2IN2		;
		INT 21H				;
		MOV DH,APPLEPH[DI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
		MOV DL,APPLEPL[DI]
		INT 21H	
		
		LEA DX, COLON;DISPLAY COLON
		INT 21H
		
		MOV AH,01H	;INPUT SINGLE CHARACTER
		INT 21H		;
		SUB AL, "0"	;
		CMP AL, 1	;
		JL  MENU2_INPUT_BIN_INVALID	;INPUT < 1
		CMP AL, 9	;
		JG  MENU2_INPUT_BIN_INVALID	;INPUT > 9
		JMP MENU2_INPUT_BIN_VALID	;0 <= INPUT <= 9
		
	MENU2_INPUT_BIN_INVALID:
		MOV AH,09H			;
		LEA DX,MENU2IN2_ERROR
		INT 21H				;
        CALL ERROR_CONT_PROC;Press Any Key To Continue
		JMP MENU2_INPUT_BIN	;
	
	MENU2_INPUT_BIN_VALID:
		MOV BIN_VAR[SI], AL	;STORE IN 'BIN' 
        CALL MENU2_PROCESS_PROC
		JMP INPUTM2_COMPLETE
		
	MENU2_INPUT_APPLE_NONE:
		DEC AL              ;DECREASE 0
		MOV APPLE_VAR[SI], AL  ;MOVE -1 TO APPLE_VAR[SI]
		
	INPUTM2_COMPLETE:
		INC SI
	RET
MENU2_INPUT_PROC ENDP

MENU2_PROCESS_PROC PROC
	MOV DII, DI
	MOV AH, 0                   ;AL already has the valid number of bins
	MOV BH, APPLE_RATEPH[DI]    ;[DI] contains the types of apple the user had input previously
	MOV BL, APPLE_RATEPL[DI]    ;Import the apple_rate from pointers
	MOV BX, [BX]                
	MUL BX
	
	MOV BH, BIN_VALUE_AX_PH[SI]	
	MOV BL, BIN_VALUE_AX_PL[SI]
	MOV [BX], AX
	
	MOV BH, BIN_VALUE_DX_PH[SI]	
	MOV BL, BIN_VALUE_DX_PL[SI]	
	MOV [BX], DX				;DX:AX = 155421

	MOV DI, DII
	RET
MENU2_PROCESS_PROC ENDP

MENU2_REPORT_PROC PROC
		
	MOV AH, 09H	        ;STRING
	LEA DX, INDENT      ;INDENT
	INT 21H
	MOV DH, DAYPH[SI]	;RETRIVE POINTER OF DAY FROM AN ARRAY
	MOV DL, DAYPL[SI]
	INT 21H	
		
	LEA DX, LINE		;A line
	INT 21H
		
	MOV BH, 0			;The apple name which user selected
	MOV BL, APPLE_VAR[SI]
	CMP BL, BH			;CHECK IF IT'S NULL, 0 IS NOT NULL
	JL  MENU2_REPORT_NULL   ;-1 < 0, THUS WE CAN CONCULDE IF IT'S NULL
	JMP MENU2_REPORT_NOT_NULL
    
    MENU2_REPORT_NULL:
        LEA DX,MENU2REN
        INT 21H
        JMP MENU2_REPORT_NEXT
    
    MENU2_REPORT_NOT_NULL:
	MOV DI, BX
	MOV DH, APPLEPH[DI]	
	MOV DL, APPLEPL[DI]
	INT 21H	
		
	MOV BL, BIN_VAR[SI]
	ADD BL, "0"
	MOV MENU2REX[4], BL
		
	MOV DX, 0
	MOV BH, APPLE_RATEPH[DI]	
	MOV BL, APPLE_RATEPL[DI]	
	MOV AX, [BX]				;AX = 17212	;DX = 0
		
	DIV TENTHOU					;AX = 1		;DX = 7212
	ADD AL, "0"
	MOV MENU2REX[10], AL		
		
	MOV AX, DX					;AX = 7212	;DX = 0
	MOV DX, 0
	DIV ONETHOU					;AX = 7		;DX = 212
	ADD AL, "0"
	MOV MENU2REX[11], AL

	MOV AX, DX					;AX = 212	;DX = 0
	MOV DX, 0
	DIV HUNDRED					;AX = 2		;DX = 12
	ADD AL, "0"
	MOV MENU2REX[12], AL
	
	MOV AX, DX					;AL = 12	;AH = 0
	DIV TENB					;AL = 1		;AH = 2
	ADD AL, "0"
	ADD AH, "0"
	MOV MENU2REX[14], AL
	MOV MENU2REX[15], AH
	
	MOV BH, BIN_VALUE_AX_PH[SI]	
	MOV BL, BIN_VALUE_AX_PL[SI]	
	MOV AX, [BX]
	
	MOV BH, BIN_VALUE_DX_PH[SI]	
	MOV BL, BIN_VALUE_DX_PL[SI]	
	MOV DX, [BX]				;DX:AX = 155421

	DIV HUNDRED					;AX = 1554	;DX = 21
	DIV TENB					;AH = 4		;AL = 155
	ADD AH, "0"
	MOV MENU2REX[23], AH		;	---4.--
	
	MOV AH, 0
	DIV TENB					;AH = 5		;AL = 15
	ADD AH, "0"
	MOV MENU2REX[22], AH		;	--54.--
	
	MOV AH, 0
	DIV TENB					;AH = 5		;AL = 1
	ADD AH, "0"
	ADD AL, "0"
	MOV MENU2REX[21], AH		;	-554.--
	MOV MENU2REX[20], AL		;	1554.--
	
	MOV AX, DX					;AX = 21
	DIV TENB					;AH = 1		;AL = 2
	ADD AL, "0"
	ADD AH, "0"
	MOV MENU2REX[25], AL		;	1554.2-
	MOV MENU2REX[26], AH		;	1554.21
	
	MOV AH, 09H
	LEA DX,MENU2REX
	INT 21H
	
	MENU2_REPORT_NEXT:
        INC SI		;
    RET
MENU2_REPORT_PROC ENDP
		
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

DISPLAY_MENU PROC
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
DISPLAY_MENU ENDP

DISPLAY_APPLE PROC
	MOV CXX, CX;
	MOV SII, SI;
	
	MOV AH, 09H
	LEA DX, APPLE1
	INT 21H
	LEA DX, APPLE2
	INT 21H
	LEA DX, APPLE3
	INT 21H
	
	MOV DI, 13			;Location of Value Per Bin
	MOV CX, 8			;8 APPLES IN THE LIST
	MOV SI, 0
	APPLE_LIST:
		INC	INDENTX[5]	;Incrementing the character '0' to '8'
		LEA DX, INDENTX
		INT 21H
		MOV DH, APPLEPH[SI]
		MOV DL, APPLEPL[SI]
		INT 21H
		
		MOV DX, 0
		MOV BH, APPLE_RATEPH[SI]	
		MOV BL, APPLE_RATEPL[SI]	
		MOV AX, [BX]				;AX = 17212	;DX = 0
		
		DIV TENTHOU					;AX = 1		;DX = 7212
		ADD AL, "0"
		MOV APPLEX[DI+0], AL		
		
		MOV AX, DX					;AX = 7212	;DX = 0
		MOV DX, 0
		DIV ONETHOU					;AX = 7		;DX = 212
		ADD AL, "0"
		MOV APPLEX[DI+1], AL

		MOV AX, DX					;AX = 212	;DX = 0
		MOV DX, 0
		DIV HUNDRED					;AX = 2		;DX = 12
		ADD AL, "0"
		MOV APPLEX[DI+2], AL
		
		MOV AX, DX					;AL = 12	;AH = 0
		DIV TENB					;AL = 1		;AH = 2
		ADD AL, "0"
		ADD AH, "0"
		MOV APPLEX[DI+3], "."
		MOV APPLEX[DI+4], AL
		MOV APPLEX[DI+5], AH
		
		MOV AH, 09H
		LEA DX, APPLEX
		INT 21H
		
		INC SI
	LOOP APPLE_LIST
	
	MOV	INDENTX[5], "0" ;Initializing to 0, we will add this character value by one increment each loop
	LEA DX, INDENTX
	INT 21H
	LEA DX, APPLE0
	INT 21H
	MOV APPLEX[DI+0], " "		
	MOV APPLEX[DI+1], " "
	MOV APPLEX[DI+2], " "
	MOV APPLEX[DI+3], " "
	MOV APPLEX[DI+4], " "
	MOV APPLEX[DI+5], " "
	LEA DX, APPLEX
	INT 21H
	
	LEA DX, APPLE4
	INT 21H
		
	MOV CX, CXX;
	MOV SI, SII;
	RET 
DISPLAY_APPLE ENDP

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

ERROR_CONT_PROC PROC
    LEA DX,ERROR_CONT   ;Press Any Key To Continue
    INT 21H				;
    MOV AH,07H	        ;Invisible Input
    INT 21H
    RET
ERROR_CONT_PROC ENDP

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
	CALL DISPLAY_MENU;
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
    CALL ERROR_CONT_PROC;Press Any Key To Continue
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