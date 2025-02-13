//
// Assembler program to convert a string to
// all upper case.
//
// X0 - address of input string
// X1 - address of output string
// X2 - use to store temporary data
// X3 - saved address of input string, for length calculation
// Q0 - 8 characters to be processed
// V1 - contains all a's for comparison
// V2 - result of comparison with 'a's
// Q3 - all 25's for comp
// Q8 - spaces for bic operation

.global toupper	     // Allow other files to call this routine

toupper:
	MOV	W2, #(25 * 0x100 + 'a') // Prepare data for DUP
	MOVK	W2, #0x20, LSL 16
	FMOV	S0, W2
	DUP	V1.16B, V0.16B[0]	// Load Q1 with all as
	DUP	V3.16B, V0.16B[1]	// Load Q3 with all 25's
	DUP	V8.16B, V0.16B[2]	// Load Q8 with all spaces
	MOV	X3, X0
// The loop is until a zero byte is loaded into Q0
loop:	LDR	Q0, [X0], #16 // load 16 characters and increment pointer
	SUB	V2.16B, V0.16B, V1.16B	// Subtract 'a's
	CMHS	V2.16B, V3.16B, V2.16B	// compare 25's to chars
	AND V2.16B, V2.16B, V8.16B 	// and result with spaces
	BIC	V0.16B, V0.16B, V2.16B	// kill the bit that makes it lowercase
	STR	Q0, [X1], #16	    // store character to output str
	CMEQ	V0.16B, V0.16B, #0
	ADDP	D0, V0.2D
	FMOV	X2, D0
	CBZ	X2, loop		// loop if all characters aren't null
	SUB	X0, X0, X3	// get the length by subtracting the pointers
	RET		// Return to caller
