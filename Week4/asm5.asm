#Laboratory Exercise 4, Assignment 5


.text	#Calculate n power of 2
	li $t0, 5	#n = 5
	li $t1, 1	#result (temporary set to 1 to shift bytes)

loop:
	sll $t1, $t1, 1		# Shift left by 1 byte (8 bits)
        addi $t0, $t0, -1	# Decrement the exponent
        bnez $t0, loop		# Check if exponent is zero