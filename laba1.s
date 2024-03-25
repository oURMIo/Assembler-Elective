	.text
	.global _start
	_start:
	LDR R0,SEG
	LDR R5,SET
	LDR R3,const
	MOVW R4,0x0000 
	MOVW R1,0x6339
	MOVT R1,0X5B3F
	MOVW R6,0x3037
	STR R1,[R0]
	STR R6,[R5]
Del:SUBS R3, R3,#1
	BNE Del
	STR R4,[R0]
	STR R4,[R5]
fin: B fin
SEG:.word 0xff200020
SET:.word 0xff200030
const: .word 0x100000000
.end
