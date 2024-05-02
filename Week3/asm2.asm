#Laboratory Week 3, Assignment 2

.data
Array: .word 1, 2, 3, 4, 5	#Assign memory space and value for an array A[I]

.text
	#Set loop parameters
	addi $s0, $zero, 5	#N = 5
	addi $s1, $zero, 0	#I = 0
	addi $s2, $zero, 1	#step = 1
	addi $s3, $zero, 0	#sum = 0
	#Load address of A[1] into $t1
	la $t1, Array

loop:
	add $s1, $s1, $s2	#I = I + step
	lw $t2, 0($t1)		#Load value of A[I] into $t2
	add $s3, $s3, $t2	#sum = sum + A[I]
	addi $t1, $t1, 4	#Shift array address 4 bytes forward
	blt $s1, $s0, loop	#(Branch if less than) branch to 'loop' if I < N
