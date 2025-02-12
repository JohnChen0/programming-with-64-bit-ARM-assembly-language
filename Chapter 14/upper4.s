//
// Assembler program to convert a string to
// all upper case.
//
// X0 - address of input string
// X1 - address of output string
// X2 - use as indirection to load data
// Q0 - 8 characters to be processed
// V1 - contains all a's for comparison
// V2 - result of comparison with 'a's
// Q3 - all 25's for comp
// Q8 - spaces for bic operation

.global toupper	     // Allow other files to call this routine

	.EQU	N, 4
toupper:
	LDR X2, =a
	LD1R	{V1.16B}, [X2], #1   // Load Q1 with all as
	LD1R	{V3.16B}, [X2], #1  // Load Q3 with all 25's
	LD1R	{V8.16B}, [X2], #1 // Load Q8 with all spaces
	MOV	W3, #N
// The loop is until byte pointed to by R1 is non-zero
loop:	LDR	Q0, [X0], #16 // load 16 characters and increment pointer
	SUB	V2.16B, V0.16B, V1.16B	// Subtract 'a's
	CMHS	V2.16B, V3.16B, V2.16B	// compare 25's to chars
	AND V2.16B, V2.16B, V8.16B 	// and result with spaces
	BIC	V0.16B, V0.16B, V2.16B	// kill the bit that makes it lowercase
	STR	Q0, [X1], #16	    // store character to output str
	SUBS	W3, W3, #1		// decrement loop counter and set flags
	B.NE	loop		// loop if character isn't null
	MOV	X0, #(N*16)	// get the length by subtracting the pointers
	RET		// Return to caller

.data
a:	.byte	'a'
endch:	.byte	25	// after shift, chars are 0-25
space:	.byte	0x20	// space for bic

