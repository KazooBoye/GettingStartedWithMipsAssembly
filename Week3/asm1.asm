#Laboratory Week 3, Assignment 1

.text
#Assign variable X, Y, Z
	addi $s2, $zero, 1	#X = 1
	addi $s3, $zero, 2	#Y = 2
	addi $s4, $zero, 3	#Z = 3

#Assign conditional variable I, J
	addi $s0, $zero, 2	#I = 1
	addi $s1, $zero, 1	#J = 2
	
start:
	ble $s0, $s1, true	#(branch if less or equal) If i<=j then go to 'true'
	#else
	addi $s3, $s3, -1	#Y = Y - 1
	add $s4, $s4, $s4	#Z = 2*Z

true:
	addi $s2, $s2, 1	#X = X + 1
	addi $s4, $zero, 1	#Z = 1
	j endif			#jump to endif
	
endif:

