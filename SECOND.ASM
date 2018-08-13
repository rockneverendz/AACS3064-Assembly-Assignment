.MODEL SMALL
.STACK 100
.DATA
	;AACS3064 COMPUTER SYSTEMS ARCHITECTURE
    
	;VerniyLust 	(Brendan Chew Jian Wen	)	[Pointers		, Address			]
	;Shiina 		(Chia Wei Xiang			)	[Display Table	, String Injecting	]
	;Scrum Master 	(Soo Cia Yang			)	[Function Calls	, 5 Digit Input		]
	
	;Link below is the github repo of this project
    ;https://github.com/rockneverendz/AACS3064-Assembly-Assignment
    ;The github repo serves as a proof that we made it oursleves
    ;Just refer to the list of commits and you'll see how we almost went insane

	;Just a note, 48 = 40H = "0"
	;0DH = 13	, stands for carriage return, return to the beginning of the current line without advancing downward.
	;0AH = 10	, stands for line feed, advance downward to the next line.
	
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
	
	;STRINGS FOR MENU1
	MENU1IN         DB 0DH,0AH,"   Enter hour worked on $"
	MENU1IN_ERROR   DB 0DH,0AH,20 DUP (" "),"INVALID INPUT > PLEASE ENTER A VALID NUMBER, 0 IF NONE"
                    DB 0DH,0AH,20 DUP (" "),"              > $" ;"Press anykey to continue"
	
	MENU1RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,10 DUP (196),194,11 DUP (196),194,20 DUP (196),180,"$"
	MENU1RE2 DB 0DH,0AH,"  ",179," Day      ",179," Hours    ",179," Hour Rate ",179," Total Pay          ",179,"$"
	MENU1RE3 DB 0DH,0AH,"  ",195,10 DUP (196),197,10 DUP (196),197,11 DUP (196) ,197,20 DUP (196)          ,180,"$"
	MENU1REX DB                           " ",179,"          ",179,"           ",179,"                .00 ",179,"$"
	MENU1RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,10 DUP (205),216,11 DUP (205) ,216,20 DUP (205)          ,181,"$"
	MENU1RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"          ",179,"           ",179,"                .00 ",179,"$"
	MENU1RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,10 DUP (205),207,11 DUP (205) ,207,20 DUP (205)          ,190,"$"
	
	;STRINGS FOR MENU2
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
	MENU2REN DB                                    "              ",179,"   - "    ,179,"    --.-- ",179,"   ---.-- ",179,"$"
	MENU2RE4 DB 0DH,0AH,"  ",198,10 DUP (205),216,15 DUP (205)     ,216,5 DUP (205),216,10 DUP (205),216,10 DUP (205),181,"$"
	MENU2RE5 DB 0DH,0AH,"  ",179," TOTAL    ",179,"               ",179,"     "    ,179,"          ",179,"      .   ",179,"$"
	MENU2RE6 DB 0DH,0AH,"  ",212,10 DUP (205),207,15 DUP (205)     ,207,5 DUP (205),207,10 DUP (205),207,10 DUP (205),190,"$"
	
	;STRINGS FOR MENU3
	MENU3CF_PAY_1	DB 0DH,0AH,"   Value of Total Hour Pay can be retrived from previous report.$"
	MENU3CF_PAY_2	DB 0DH,0AH,"          Total Hour Pay :      .  $"
    
	MENU3CF_BIN_1	DB 0DH,0AH,"   Value of Total Bin Value can be retrived from previous report.$"
	MENU3CF_BIN_2	DB 0DH,0AH,"         Total Bin Value :      .  $"
    
	MENU3CF_CONT	DB 0DH,0AH,"   Would you like to continue with this value? (Y/N) : $"
    
	MENU3IN1        DB 0DH,    "   Enter Total Hour Pay  :  [   .  ]$"
	MENU3IN1_ERROR  DB 0DH,0AH,"           INVALID INPUT > PLEASE ENTER A VALID PAY"
                    DB 0DH,0AH,"                         > $" ;"Press anykey to continue"
	MENU3IN2        DB 0DH,    "   Enter Total Bin Value :[     .  ]$"
    MENU3IN2_ERROR  DB 0DH,0AH,"           INVALID INPUT > PLEASE ENTER A VALID VALUE"
                    DB 0DH,0AH,"                         > $" ;"Press anykey to continue"
   
	MENU3RE1 DB 0DH,0AH,"  ",195,196,193,8 DUP (196),194,10 DUP (196),194,10 DUP (196),194,10 DUP (196),194,10 DUP (196),180,"$"
	MENU3RE2 DB 0DH,0AH,"  ",179," Hour Pay ",179," Bin Val  ",179,"Comm. Rate",179,"Commission",179," Salary   ",179,"$"
	MENU3RE3 DB 0DH,0AH,"  ",198,10 DUP (205),216,10 DUP (205),216,10 DUP (205),216,10 DUP (205),216,10 DUP (205),181,"$"
	MENU3RE4 DB 0DH,0AH,"  ",179,"      .   ",179,"      .   ",179,"          ",179,"      .   ",179,"      .   ",179,"$"
	MENU3RE5 DB 0DH,0AH,"  ",212,10 DUP (205),207,10 DUP (205),207,10 DUP (205),207,10 DUP (205),207,10 DUP (205),190,"$"

	INDENT	 DB 0DH,0AH,"  ",179,"$"
	INDENTX	 DB 0DH,0AH,"  ",179,"0",179," ","$"	;Same with INDENT but with indeX, get it? xD (Only used in DISPLAY_APPLE)

	APPLE1 	 DB 0DH,0AH,"  ",218,196,194,26 DUP (196)                ,194,25 DUP (196)               ,191,"$"
	APPLE2 	 DB 0DH,0AH,"  ",179," ",179," Apple Types              ",179," Value Per Bin           ",179,"$"
	APPLE3 	 DB 0DH,0AH,"  ",195,196,197,26 DUP (196)                ,197,25 DUP (196)               ,180,"$"
	APPLEX	 DB                                         "           ",179,"    .                    ",179,"$"
	APPLEN	 DB 0DH,0AH,"  ",179,"0",179," NONE                     ",179,"                         ",179,"$"
	APPLE4	 DB 0DH,0AH,"  ",192,196,193,26 DUP (196)                ,193,25 DUP (196)               ,217,"$"

	;https://en.wikipedia.org/wiki/Code_page_437 for more box drawing characters	
	;┌─┬┐	218	196	194	191
	;│ ││	179		179	179
	;├─┼┤	195	196	197	180
	;└─┴┘	192	196	193	217
	;╞═╪╡	198	205	216	181
	;╘═╧╛	212	205	207	190	

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
	
    HOURS_VAR	DB 7 DUP(0)
	APPLE_VAR	DB 7 DUP(0)
	BIN_VAR		DB 7 DUP(0)
	
	BIN_VALUE_AX	DW 7 DUP(0)
	BIN_VALUE_AX_PL DB 7 DUP(0)
	BIN_VALUE_AX_PH DB 7 DUP(0)
	
	BIN_VALUE_DX	DW 7 DUP(0)
	BIN_VALUE_DX_PL DB 7 DUP(0)
	BIN_VALUE_DX_PH DB 7 DUP(0)
	
	TTL_BIN				DB 0
	TTL_BIN_VALUE_AX	DW 0
	TTL_BIN_VALUE_DX	DW 0
	
	HOUR_RATE		DB 7
	TTL_HOUR		DB 0
	TTL_HOUR_PAY	DW 0
	
	TTL_BIN_INPUT 	DW 0
		
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
	TEND	DD    10
	NULL	DB " "
	
	PASSWRD DB "password$"
	PASS_IN	DB 9 DUP (?)
	
	INPUT	DW ?
	AXX DW ?
	AHH	DB ?
	CXX DW ?	;
	SII DW ?	;
	DII DW ?
	
	;<TO DO>
	;A function to automatically insert value into strings
	;Parameter : value in DX:AX, string address in some variable, string index in DI?
	
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
	MOV TTL_HOUR_PAY, 0
	
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
		MOV MENU1REX[10], AL;The location of the column 'Hours'
		
		MOV AH, 0
		MOV AL, RESULTB[SI]
		DIV TENB
		ADD AX, 3030H		;ADD AL,"0"	;ADD AH,"0"
		MOV MENU1REX[39], AL;The location of the column 'Total Pay'
		MOV MENU1REX[40], AH
		
		MOV AH,09H
		LEA DX,MENU1REX
		INT 21H
		
		INC SI
	LOOP MENU1_REPORT
	
	LEA DX, MENU1RE4
	INT 21H
	
	MOV AH,	0
	MOV AL, TTL_HOUR		;AL = 23

	DIV TENB				;AL = 2		;AH = 3
	ADD AX, 3030H			;ADD AL,"0"	;ADD AH,"0"
	MOV MENU1RE5[23], AL	;The location of the column 'Hours'
	MOV MENU1RE5[24], AH	;

	MOV AX, TTL_HOUR_PAY	;AX = 345
	MUL HUNDRED				;AX = 34500 ;MAX AX can hold is 65535
	MOV TTL_HOUR_PAY, AX
	MOV DI, OFFSET MENU1RE5	;Location of the string you want to inject
	ADD DI, 52				;Index of the string to begin injecting
	CALL INJECT_DW_STRING

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
	MOV TTL_BIN 		, 0
	MOV TTL_BIN_VALUE_AX, 0 ;OVERWRTIE PREVIOUS DATA (IF THERE IS ANY)
	MOV TTL_BIN_VALUE_DX, 0 ;
	
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
		
	MOV CX,7		;7 DAYS A WEEK	
	MOV SI,0		;
	MENU2_REPORT:	;PRINTING REPORT
		CALL MENU2_REPORT_PROC  ;
	LOOP MENU2_REPORT
	
	MOV AH, 0
	MOV AL, TTL_BIN
	DIV TENB
	ADD AX, 3030H				;ADD AL,"0"	;ADD AH,"0"
	MOV MENU2RE5[34], AL
	MOV MENU2RE5[35], AH
	
	MOV AX, TTL_BIN_VALUE_AX	;INSERT TTL_BIN_VALUE INTO MENU2RE5 CHARACTER BY CHARACTER
	MOV DX, TTL_BIN_VALUE_DX	;DX:AX = 1234567
	MOV DI, OFFSET MENU2RE5		;Location of MENU2RE5 for later edit
	ADD DI, 50					;Location of TTL_BIN column in MENU2RE5
	CALL INJECT_DD_STRING
	
	MOV AH, 09H
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
		ADD TTL_BIN, AL
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
	MOV AH, 0                   ;AL already has the valid number of bins
	MOV BH, APPLE_RATEPH[DI]    ;[DI] contains the types of apple the user had input previously
	MOV BL, APPLE_RATEPL[DI]    ;Import the apple_rate from pointers
	MOV BX, [BX]                
	MUL BX						;DX:AX = 155421
	
	MOV BH, BIN_VALUE_AX_PH[SI]	;Moving AX to BIN_VALUE_AX
	MOV BL, BIN_VALUE_AX_PL[SI]
	MOV [BX], AX
	
	MOV BH, BIN_VALUE_DX_PH[SI]	;Moving DX to BIN_VALUE_DX
	MOV BL, BIN_VALUE_DX_PL[SI]
	MOV [BX], DX
	
	ADD TTL_BIN_VALUE_AX, AX	;Adding AX to TTL_BIN_VALUE_AX
	ADC TTL_BIN_VALUE_DX, DX	;Adding DX to TTL_BIN_VALUE_DX with carry (if there is)
	
	RET
MENU2_PROCESS_PROC ENDP

MENU2_REPORT_PROC PROC
		
	MOV AH, 09H	        		;STRING
	LEA DX, INDENT      		;INDENT
	INT 21H
	MOV DH, DAYPH[SI]			;Retrive pointer of day from an array
	MOV DL, DAYPL[SI]
	INT 21H	
		
	LEA DX, LINE				;A vertical dividor, like modulus but longer
	INT 21H
		
	MOV BH, 0					;The apple name which user selected
	MOV BL, APPLE_VAR[SI]
	CMP BL, BH					;CHECK IF IT'S NULL, 0 IS NOT NULL
	JL  MENU2_REPORT_NULL  		;-1 < 0, THUS WE CAN CONCULDE IF IT'S NULL
	JMP MENU2_REPORT_NOT_NULL
    
    MENU2_REPORT_NULL:
        LEA DX,MENU2REN			;Print out a preset NULL record, the one with dashes.
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
	
	MOV BH, APPLE_RATEPH[DI]	
	MOV BL, APPLE_RATEPL[DI]	
	MOV AX, [BX]					;AX = 17212	;DX = 0
	MOV DI, OFFSET MENU2REX			;Location of the string you want to inject
	ADD DI, 10						;Index of the string to begin injecting
	CALL INJECT_DW_STRING
	
	MOV BH, BIN_VALUE_AX_PH[SI]	
	MOV BL, BIN_VALUE_AX_PL[SI]	
	MOV AX, [BX]
	
	MOV BH, BIN_VALUE_DX_PH[SI]	
	MOV BL, BIN_VALUE_DX_PL[SI]	
	MOV DX, [BX]					;DX:AX = 155421
	
	MOV DI, OFFSET MENU2REX		
	ADD DI, 19					
	CALL INJECT_DD_STRING
	
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
	
	; if(TTL_HOUR_PAY == 0){
	; 	"Please enter pay"
	; }
	; else{
	; 	"Previous pay found, pay = 123.00"
	; 	"would you like to use this pay?"		
	; 	if(false){
	; 		"Please enter pay value"
	; 	}
	; }
	
	; if(TTL_BIN_VALUE_AX = 0 && TTL_BIN_VAL = 0){
	;	 "Please enter bin value"	
	; }
	; else{
	; 	"Previous bin value found, pay = 12345.67"
	; 	"would you like to use this bin value?"
	; 	if(false){
	; 		"Please enter bin value"
	; 	}
	; }
	
	CMP TTL_HOUR_PAY, 0					
	JE  MENU3_INPUT_PAY_NULL			;if TTL_HOUR_PAY == 0, ask the user to enter it
	
	CALL MENU3_INPUT_PAY_CONFIRMATION	;if TTL_HOUR_PAY != 0, ask the user if they want to continue with the value
	CMP AL, "Y"							;if user chose "Yes, continue with this value",
	JE	MENU3_NEXT_INPUT				;jump to the next input, else get value
	
	MENU3_INPUT_PAY_NULL:				
	CALL MENU3_INPUT_PAY_PROC
	
	MENU3_NEXT_INPUT:
	MOV AX, TTL_BIN_VALUE_AX			;Check if it's 0 in both variable
	ADD AX, TTL_BIN_VALUE_DX            ;0 + 0 = 0 = NULL
	CMP AX, 0
	JE MENU3_INPUT_BIN_NULL				;if TTL_HOUR_PAY     == 0, ask the user to enter it
	
	CALL MENU3_INPUT_BIN_CONFIRMATION	;if AX != 0, ask the user if they want to continue with the value
	CMP AL, "Y"							;if user chose "Yes, continue with this value",
	JE	MENU3_DONE_INPUT				;jump to processing, else get value
	
	MENU3_INPUT_BIN_NULL:
	CALL MENU3_INPUT_BIN_PROC			
	JMP MENU3_DONE_INPUT
	
	MENU3_DONE_INPUT:
	CALL MENU3_REPORT_PROC
	
	MOV AH,09H		;
	LEA DX,MEN1 	;	============================
	INT 21H			;
	LEA DX,MEN6 	;	"3. Employee's Weekly Salary$"
	INT 21H			;
	LEA DX,MENU3RE1	;
	INT 21H		;
	LEA DX,MENU3RE2	;
	INT 21H		;
	LEA DX,MENU3RE3	;
	INT 21H		;
	LEA DX,MENU3RE4	;
	INT 21H		;
	LEA DX,MENU3RE5	;
	INT 21H		;
	
	RET
MENU3 ENDP

MENU3_INPUT_PAY_CONFIRMATION PROC
	MOV DX, 0					;DX = 0
	MOV AX, TTL_HOUR_PAY		;AX = 34500
	MOV DI, OFFSET MENU3CF_PAY_2		;Location of the string you want to inject
	ADD DI, 31					;Index of the string to begin injecting
	CALL INJECT_DW_STRING

	MENU3_INPUT_PAY_CF_PROMPT:
	MOV AH,09H
	LEA DX,MENU3CF_PAY_1
	INT 21H
	LEA DX,MENU3CF_PAY_2
	INT 21H
	LEA DX,MENU3CF_CONT
	INT 21H	
	
	MOV AH,01H	;INPUT CHAR
	INT 21H		;
	
	CMP AL, "Y"
	JE	MENU3_INPUT_PAY_CF_VALID
	CMP AL, "y"
	JE	MENU3_INPUT_PAY_CF_VALID_EDIT	;UNDERSTAND INPUT BUT CAPITALIZE "n"
	CMP AL, "N"
	JE	MENU3_INPUT_PAY_CF_VALID
	CMP AL, "n"
	JE	MENU3_INPUT_PAY_CF_VALID	
	JMP MENU3_INPUT_PAY_CF_PROMPT	;DOENS'T UNDERSTAND INPUT, RE-PROMPT
	
	MENU3_INPUT_PAY_CF_VALID_EDIT:
	MOV AL, "Y"
	MENU3_INPUT_PAY_CF_VALID:
	RET
MENU3_INPUT_PAY_CONFIRMATION ENDP

MENU3_INPUT_PAY_PROC PROC
	MOV TTL_HOUR_PAY, 0
	MOV AH, 09H
	LEA DX, NEWL
	INT 21H
	
	MENU3_INPUT_PAY_START:
		MOV AX, TTL_HOUR_PAY		;Value you want to display
		MOV DI, OFFSET MENU3IN1		;Location of the string you want to inject
		ADD DI, 30					;Index of the string to begin injecting
		CALL INJECT_DW_STRING
		
		MOV AH, 09H
		LEA DX, MENU3IN1
		INT 21H
		
		MOV AH, 07H					;INPUT NO ECHO
		INT 21H
		
		CMP AL, 13					;If enter key
		JE	MENU3_INPUT_PAY_DONE
		CMP AL, 8					;If backspace
		JE	MENU3_INPUT_PAY_BACKSPACE
		CMP AL, "0"					;If lower than "0"
		JL	MENU3_INPUT_PAY_START
		CMP AL, "9"					;If greater than "9"
		JG	MENU3_INPUT_PAY_START
		MOV AH, 0
		SUB AL, "0"					;From char to int
		MOV BX, AX					;Save for later as AX will get overwritten by the next statement
		
		MOV AX, TTL_HOUR_PAY		;Import from var
		MOV DX, 0
		MUL TENW				 	;Multiply by 10
		
		ADD AX, BX					;Add input value to (TTL_HOUR_PAY * 10)
		MOV TTL_HOUR_PAY, AX		;Then update var
		JMP MENU3_INPUT_PAY_START
		
	MENU3_INPUT_PAY_BACKSPACE:
		MOV AX, TTL_HOUR_PAY		;Import from var
		MOV DX, 0					
		DIV TENW				 	;Divide by 10
		
		MOV TTL_HOUR_PAY, AX		;Then store it back to var
		JMP MENU3_INPUT_PAY_START
		
	MENU3_INPUT_PAY_DONE:
	RET
MENU3_INPUT_PAY_PROC ENDP

MENU3_INPUT_BIN_CONFIRMATION PROC
	MOV AX, TTL_BIN_VALUE_AX		;INSERT TTL_BIN_VALUE INTO MENU2RE5 CHARACTER BY CHARACTER
	MOV DX, TTL_BIN_VALUE_DX		;DX:AX = 1234567
	MOV DI, OFFSET MENU3CF_BIN_2	;Location of the string you want to inject
	ADD DI, 29						;Index of the string to begin injecting
	CALL INJECT_DD_STRING
	
	MENU3_INPUT_BIN_CF_PROMPT:
	MOV AH,09H
	LEA DX,MENU3CF_BIN_1
	INT 21H
	LEA DX,MENU3CF_BIN_2
	INT 21H
	LEA DX,MENU3CF_CONT
	INT 21H	
	
	MOV AH,01H	;INPUT CHAR
	INT 21H		;
	
	CMP AL, "Y"
	JE	MENU3_INPUT_BIN_CF_VALID
	CMP AL, "y"
	JE	MENU3_INPUT_BIN_CF_VALID_EDIT	;UNDERSTAND INPUT BUT CAPITALIZE "n"
	CMP AL, "N"
	JE	MENU3_INPUT_BIN_CF_VALID
	CMP AL, "n"
	JE	MENU3_INPUT_BIN_CF_VALID	
	JMP MENU3_INPUT_BIN_CF_PROMPT	;DOENS'T UNDERSTAND INPUT, RE-PROMPT
	
	MENU3_INPUT_BIN_CF_VALID_EDIT:
	MOV AL, "Y"
	MENU3_INPUT_BIN_CF_VALID:
	RET
MENU3_INPUT_BIN_CONFIRMATION ENDP

MENU3_INPUT_BIN_PROC PROC
	MOV TTL_BIN_VALUE_AX, 0			;Zeroing
	MOV TTL_BIN_VALUE_DX, 0	
	MOV AH, 09H
	LEA DX, NEWL
	INT 21H
	
	MENU3_INPUT_BIN_START:
		MOV DX, TTL_BIN_VALUE_DX
		MOV AX, TTL_BIN_VALUE_AX	;Value you want to display
		MOV DI, OFFSET MENU3IN2		;Location of the string you want to inject
		ADD DI, 28					;Index of the string to begin injecting
		CALL INJECT_DD_STRING
		
		MOV AH, 09H
		LEA DX, MENU3IN2
		INT 21H
		
		MOV AH, 07H					;INPUT NO ECHO
		INT 21H
		CMP AL, 13					;If enter key
		JE	MENU3_INPUT_BIN_DONE
		CMP AL, 8					;If backspace
		JE	MENU3_INPUT_BIN_BACKSPACE
		CMP AL, "0"					;If lower than "0"
		JL	MENU3_INPUT_BIN_START
		CMP AL, "9"					;If greater than "9"
		JG	MENU3_INPUT_BIN_START
		CMP TTL_BIN_VALUE_DX, 9		;IF OVERLOADED
		JG	MENU3_INPUT_BIN_OVERFLOW	
		
		MOV AH, 0					;Input valid and not overloaded
		SUB AL, "0"					;From char to int
		MOV INPUT, AX				;Save for later as AX will get overwritten by the next statement
		
		MOV DX, 0
		MOV AX, TTL_BIN_VALUE_AX	;MULTI AX
		MUL TENW				 	;Multiply by 10
		
		ADD AX, INPUT
		MOV TTL_BIN_VALUE_AX, AX
		MOV AXX, DX
		
		MOV AX, TTL_BIN_VALUE_DX	;MULTI DX
		MUL TENB				 	;Multiply by 10
		ADD AX, AXX					;ADD CARRY OF AX TO AX(DX)
		MOV AH, 0
		MOV TTL_BIN_VALUE_DX, AX	;Then update array

		JMP MENU3_INPUT_BIN_START
		
	MENU3_INPUT_BIN_BACKSPACE:
		MOV AX, TTL_BIN_VALUE_DX	;Value to divide
		DIV TENB				 	;Divide by 10
		MOV AHH, AH
		MOV AH, 0
		MOV TTL_BIN_VALUE_DX, AX
		
		MOV AX, TTL_BIN_VALUE_AX
		MOV DH, 0
		MOV DL, AHH					;Move remainder to DX
		DIV TENW
		
		MOV TTL_BIN_VALUE_AX, AX 	;Then update array
		
		JMP MENU3_INPUT_BIN_START
		
	MENU3_INPUT_BIN_OVERFLOW:
		;MAX 2 BYTES CAN HOLD ‭65535‬
		;DX:AX can hold ‭65535‬00 no problem
		;but later INJECT_DD_STRING function will need to hold the qoutient of it
		;so we need to have a fail safe, prevent OVERFLOW from happening
		MOV TTL_BIN_VALUE_AX, 65436	;Just give them max possible value
		MOV TTL_BIN_VALUE_DX, 49	;‭0031:FF9C‬ Hex = 32767
		;for some reason it can display 32767.00, but not 32768.00 and above (let alone ‭65535‬).
		;65535 is twice of 32767 + 1
		;INJECT_DD_STRING didn't even use signed division. idk man im tired.
		
		JMP MENU3_INPUT_BIN_START
		
	MENU3_INPUT_BIN_DONE:
	RET
MENU3_INPUT_BIN_PROC ENDP

MENU3_REPORT_PROC PROC
	
	MOV AX, TTL_HOUR_PAY			;Value you want to display
	MOV DI, OFFSET MENU3RE4			;Location of the string you want to inject
	ADD DI, 8						;Index of the string to begin injecting
	CALL INJECT_DW_STRING
	
	MOV AX, TTL_BIN_VALUE_AX		;Value you want to display
	MOV DX, TTL_BIN_VALUE_DX		;DX:AX = 1234567
	MOV DI, OFFSET MENU3RE4 		;Location of the string you want to inject
	ADD DI, 17						;Index of the string to begin injecting
	CALL INJECT_DD_STRING			;
	
	
	
	RET
MENU3_REPORT_PROC ENDP

DISPLAY_MENU PROC
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
	
	MOV DI, OFFSET APPLEX	;Location of the string you want to inject
	ADD DI, 13				;Index of the string to begin injecting
	MOV CX, 8				;8 APPLES IN THE LIST
	MOV SI, 0
	APPLE_LIST:
		INC	INDENTX[5]	;Incrementing the character '0' to '8'
		LEA DX, INDENTX
		INT 21H
		MOV DH, APPLEPH[SI]
		MOV DL, APPLEPL[SI]
		INT 21H
		
		MOV BH, APPLE_RATEPH[SI]	
		MOV BL, APPLE_RATEPL[SI]	
		MOV AX, [BX]				;AX = 17212	;DX = 0
		CALL INJECT_DW_STRING		;DI already set before the loop
	
		MOV AH, 09H
		LEA DX, APPLEX
		INT 21H
		
		INC SI
	LOOP APPLE_LIST
	
	MOV	INDENTX[5], "0" ;Initializing to 0, we will add this character value by one increment each loop
	LEA DX, APPLEN
	INT 21H
	
	LEA DX, APPLE4
	INT 21H
		
	MOV CX, CXX;
	MOV SI, SII;
	RET 
DISPLAY_APPLE ENDP

INJECT_DD_STRING PROC
	;Guide to use this funtion/procedure
	;Move the value you want to display to DX:AX
	;Load the string address to DI
	;Add the index to where you want to inject.
	
	;-------------------------------;Function call template
	; MOV AX, "Lower DD here"		;Value you want to display
	; MOV DX, "Higher DD here"		;DX:AX = 1234567
	; MOV DI, OFFSET "string here"	;Location of the string you want to inject
	; ADD DI, "index here"			;Index of the string to begin injecting
	; CALL INJECT_DD_STRING			;
	;-------------------------------;
	
	MOV CXX, CX
	MOV CL, " "					;Empty space ready to replace extra 0
	
	DIV HUNDRED					;AX = 12345	;DX = 67
	MOV BX, DX					;Save for later, since DX will be overwritten by the next divide
	
	MOV [DI]  , CL				;Initialize first index to empty space
	CMP AX    , 10000			;Check if it's less than 10000
	JL	THOUSAND_S				;If yes skip divide TENTHOU
	
	MOV DX, 0
	DIV TENTHOU					;AX = 1		;DX = 2345
	ADD AL, "0"
	MOV [DI]  , AL		;	1----.--
	MOV AX, DX					;AX = 2345	;DX = 0
	
	THOUSAND_S:
	MOV [DI+1], CL				;Initialize second index to empty space
	CMP AX    , 1000            ;Check if it's less than 1000
	JL	HUNDRED_S				;If yes skip divide ONETHOU
	
	MOV DX, 0
	DIV ONETHOU					;AX = 2		;DX = 345
	ADD AL, "0"
	MOV [DI+1], AL		;	12---.--
	MOV AX, DX					;AX = 345	;DX = 0
	
	HUNDRED_S:
	MOV DX, 0
	DIV HUNDRED					;AX = 3		;DX = 45
	ADD AL, "0"
	MOV [DI+2], AL		;	123--.--
	
	MOV AX, DX					;AL = 45	;AH = 0
	DIV TENB					;AL = 4		;AH = 5
	ADD AX, 3030H				;ADD AL,"0"	;ADD AH,"0"
	MOV [DI+3], AL		;	1234-.--
	MOV [DI+4], AH		;	12345.--
	
	MOV AX, BX					;AL = 67	;AH = 0
	DIV TENB					;AL = 6		;AH = 7
	ADD AX, 3030H				;ADD AL,"0"	;ADD AH,"0"
	MOV [DI+6], AL		;	12345.6-
	MOV [DI+7], AH		;	12345.67
	
	MOV CX, CXX
	RET
INJECT_DD_STRING ENDP

INJECT_DW_STRING PROC
	; We will zero out DX for you ;)	
	;-------------------------------;Function call template
	; MOV AX, "DW here"				;Value you want to display
	; MOV DI, OFFSET "string here"	;Location of the string you want to inject
	; ADD DI, "index here"			;Index of the string to begin injecting
	; CALL INJECT_DW_STRING			;
	;-------------------------------;
	
	MOV DX, 0
	DIV HUNDRED					;AX = 345	;DX = 67
	MOV BX, DX					;Save for later, since DX will be overwritten by the next divide
	
	MOV DX, 0					;AX = 345	;DX = 0
	DIV HUNDRED					;AX = 3		;DX = 45
	ADD AL, "0"
	MOV [DI]  , AL		;	3--.--
	
	MOV AX, DX					;AL = 45	;AH = 0
	DIV TENB					;AL = 4		;AH = 5
	ADD AX, 3030H				;ADD AL,"0"	;ADD AH,"0"
	MOV [DI+1], AL		;	34-.--
	MOV [DI+2], AH		;	345.--
	
	MOV AX, BX					;AL = 67	;AH = 0
	DIV TENB					;AL = 6		;AH = 7
	ADD AX, 3030H				;ADD AL,"0"	;ADD AH,"0"
	MOV [DI+4], AL		;	345.6-
	MOV [DI+5], AH		;	345.67
	
	RET
INJECT_DW_STRING ENDP

CONTINUE PROC
	CLOOP:
	MOV AH,09H	;
	LEA DX,CONT	;"CONTINUE?"
	INT 21H		;
				;
	MOV AH,01H	;INPUT CHAR
	INT 21H		;
	
	CMP AL, "Y"
	JE	CEND
	CMP AL, "y"
	JE	CEND
	CMP AL, "N"
	JE	CEND
	CMP AL, "n"
	JE	CEND_E_N;UNDERSTAND INPUT BUT CAPITALIZE "n"
	
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