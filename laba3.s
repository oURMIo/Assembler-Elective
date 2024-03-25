.text
.global _start
_start: LDR R0,ADR
	MOV R1,#8
MET:	LDR R3,[R0]
	LDR R4,[R0,#0xC]
	TST R3,R1
	BEQ MET
	MOV R5,#0xb
	STR R5,[R0,#0xC]
	LDR R4,[R0,#0xC]
stop: B stop
ADR: .word 0xFF200050
.end

