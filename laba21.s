	.text
	.global _start
	_start:
	LDR R0,SEG
	LDR R4,TUM	
	LDR R5,[R4]
	LDR R6,CH

	MOVW R1,0x7D3F

	MOVW R2,0x377D
	MOVT R2,0X5E77


fin: CMN R5,R6
	BMI Dam
	STR R1,[R0]
	B Go
Dam: STR R2,[R0]
Go: Del:SUBS R3, R3,#1
	BNE Del
	SUBS R5, R5,#1
	B fin
SEG: .word 0xff200020
TUM: .word 0xFF200040
CH: .word 0x7FFFFF9C
const: .word 0x10000000
.end
