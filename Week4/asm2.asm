#Laboratory Exercise 4, Assignment 2

.text
	addi $s0, $zero, 0x99999999	#Initialize $s0
	andi $t0, $s0, 0xFF000000	#Logical instruction to extract 2 MSB to $t0
	#Shift bytes in $t0 24 bytes to the right
	srl $t0, $t0, 24		#Shift right by 24 bits
	
	andi $s0, $s0, 0xFFFFFF00	#Clear 2 LSB from $s0
	xor $s0, $s0, 0x000000FF	#Set 2 LSB of $s0 to 1111 1111
	andi $s0, $s0, 0x00000000	#Clear $s0 to 0
	

	
	