	.text
	.global _start
	_start:
	LDR R0,SEG
	LDR R5,SET
	LDR R3,const

	MOVW R4,0x0000 
	MOVW R1,0x063F
	MOVT R1,0X066D

	MOVW R2,0x5B3F	
	MOVT R2,0x5B3F

fin: STR R1,[R0]

Del: SUBS R3, R3,#1
	BNE Del
	STR R4,[R0]
	STR R4,[R5]

	STR R2,[R0]
Dell: SUBS R3, R3,#1
	BNE Dell
	STR R4,[R0]
	STR R4,[R5]

	B fin
SEG:.word 0xff200020
SET:.word 0xff200030
const: .word 0x100000000
.end
