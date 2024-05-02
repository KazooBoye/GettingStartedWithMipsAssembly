#Laboratory Exercise 3, Assignment 3
.data
boolean: .word 2	#Declare a test boolean variable

.text
#Assign value to a, b
addi $s2, $zero, 0	#a = 0
addi $s3, $zero, 2	#b = 2

	la $s0, boolean #load address of 'boolean' into $s0
	lw $s1, 0($s0) 	#load content of $s0 into $s1
	li $t0, 0 	#{
	li $t1, 1	#load value of test cases to temporary register
	li $t2, 2	#}
	
	beq $s1, $t0, case_0	#{
	beq $s1, $t1, case_1	#branch to respective cases
	beq $s1, $t2, case_2	#}
	
	j default		#jump to label 'default' if no case match condition

case_0: addi $s2, $s2, 1 	#a = a + 1
	j continue
case_1: sub $s2, $s2, $t1 	#a = a - 1
	j continue
case_2: add $s3, $s3, $s3	#b = b + b = 2b
	j continue
	
default:
continue:
