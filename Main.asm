; Main.asm
; Name: Ethan Shen, Kushal Shah
; UTEid: 
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer
LD R6,HEADER

 
; set up the keyboard interrupt vector table entry

LD R0,INRPT
STI R0,IVT

; enable keyboard interrupts

LD R0,KBIMASK
STI R0,KBSR


; start of actual program

	AND R0,R0,0
	STI R0,BUFFER
START	LDI R0,BUFFER
	BRz START

	AND R1,R1,0
	STI R1,BUFFER
	

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
	BRnp VALID
	
VALID
	TRAP X25


A	.FILL #-65
C	.FILL #-67
G	.FILL #-71
U	.FILL #-85

BUFFER	.FILL X4600
HEADER 	.FILL X4000
KBIMASK	.FILL X4000
KBSR 	.FILL XFE00
IVT 	.FILL X0180
INRPT	.FILL X2600
		.END
