#Laboratory Exercise 3, Home Assignment 3
.data
test: .word 1
.text
	la $s0, test 	#(load address) load address of label 'test' into $s0
	lw $s1, 0($s0) 	#(load word) load the value of $s0 into $s1
	li $t0, 0 	#(load immediate) load unsigned immediate to $t0
	li $t1, 1
	li $t2, 2
	beq $s1, $t0, case_0	#(branch if equal) branch to label 'case_0' if $s1 equal to $t0
	beq $s1, $t1, case_1
	beq $s1, $t2, case_2
	j default		#jump to label 'default'

case_0: addi $s2, $s2, 1 	#a=a+1
	j continue
case_1: sub $s2, $s2, $t1 	#(subtract) set $s2 to results of $s2 - $t1
	j continue
case_2: add $s3, $s3, $s3 
	j continue
	
default:
continue: