.text
.global _start
_start: LDR R0,tumb
	LDR R1,[R0]
	LDR R2,svet
	LDR R3,knop
	LDR R5, =MAS
	MOV R11,#0
	MOV R8,#6
	STR R11,[R2]
	MOV R12,#0xF

	STR R12,[R3,#0xC]

VOD:	LDR R4,[R3,#0xC]
	TST R4,#2
	BEQ VOD
		
	LDR R6,[R0]
	STR R6,[R5],#4
	
	STR R12,[R3,#0xC]
	SUBS R8,R8,#1
	BNE VOD
	
ZAN:	MOV R8,#6
	LDR R5, =MAS	
	
PROV:	LDR R10,[R5],#4
	TST R10,#1
	BNE V

	STR R10,[R2]

V:	LDR R9,con
TI1:	SUBS R9,R9,#1
	BNE TI1

	SUBS R8,R8,#1
	BNE PROV

	B ZAN 
tumb: .word 0xFF200040
svet: .word 0xFF200000
knop: .word 0xFF200050
MAS: .word 0,0,0,0,0,0
con: .word 0x60000000

.end
