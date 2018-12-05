; ISR.asm
; Name:
; UTEid:  
; Keyboard ISR runs when a key is struck
; Checks for a valid RNA symbol and places it at x4600
               .ORIG x2600

	ST R1, SAVER1
	ST R0, SAVER0
GETK	LDI R0, KBSR
	BRp GETK
	LDI R0, KBDR
	
	LD R1, A
	ADD R1, R1, R0
	BRz VALID
	
	LD R1, C
	ADD R1, R1, R0
	BRz VALID

	LD R1, G
	ADD R1, R1, R0
	BRz VALID

	LD R1, U
	ADD R1, R1, R0
	BRnp FAIL
	
VALID	STI R0, DEST
FAIL	LD R1, SAVER1
	LD R0, SAVER0
	RTI	

KBSR 	.FILL XFE00
KBDR 	.FILL XFE02
DEST	.FILL X4600
A	.FILL #-65
C	.FILL #-67
G	.FILL #-71
U	.FILL #-85
SAVER1	.BLKW 1
SAVER0 	.BLKW 1

		.END
