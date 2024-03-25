	.text
	.global _start
	_start:
	LDR R0,SEG
	LDR R4,TUM	
	LDR R5,[R4]

	MOVW R1,0x3F6D
	MOVT R1,0X0073

	MOVW R2,0x797D
	MOVT R2,0X0076


	CMP R5, #128
	BLE Neg
	STR R1,[R0]
	B Pos
Neg: STR R2,[R0]
Pos: Del:SUBS R3, R3,#1
	BNE Del

	B _start
SEG:.word 0xff200020
TUM:.word 0xFF200040
const: .word 0x80000000
.end
