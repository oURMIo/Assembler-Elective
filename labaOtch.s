.text
.global _start
_start:
	LDR R0,=0xFFFEC600	//adres_time
	LDR R1,=0xBEBC200	//time
	LDR R2, SVET

	STR R1,[R0]
	MOV R11,#3
	STR R11,[R0,#8]

OBNOL:	LDR R3,=MAS

LOOP:	LDR R12,[R0,#12]	//timer
	MOV R11,#1
	CMP R12,R11
	BNE LOOP
	STR R11,[R0,#12]

	LDR R9,[R3],#4	//INPUT NEXT EL FROM MAS

	ADD R10,R10,#1
	CMP R10,#8	
	BNE OBNOL

	B VID

VID://	OR 
	STR R9,[R2]
	B LOOP
SVET: .word 0xff200020
MAS: .word 0x76, 0x79, 0x6E, 0x40, 0x5E, 0x77, 0x6E, 0
.end
