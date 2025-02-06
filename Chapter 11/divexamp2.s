//
// More Examples of 64-Bit Integer Division
//
// Shows signed divisions that require rounding.
// On ARM64, SDIV and UDIV always round towards 0.
//

.global main

main:
	STP	LR, X20, [SP, #-16]!
	LDR	X20, =input

loop:
	LDR	X1, [X20], #8
	CMP	X1, XZR
	BEQ	end

	LDR	X2, [X20], #8
	SDIV	X3, X1, X2

	LDR	X0, =fmt
	BL	printf

	B	loop

end:	LDP	LR, X20, [SP], #16
	MOV	X0, #0		// return code
	RET

.data
fmt:	.asciz	"%2ld / %2ld = %2ld\n"

// The input list consists of pairs of dividends and divisors.
// The list terminates with a 0.
	.align	3
input:	.dword	 5,	 3
	.dword	-5,	 3
	.dword	 5,	-3
	.dword	-5,	-3
	.dword	0
