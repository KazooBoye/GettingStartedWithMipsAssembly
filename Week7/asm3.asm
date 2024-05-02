#Laboratory Week 7, Assignment 3

.text
	li $s0, 3	#Init test value
	li $s1, 6

push:
	addi $sp, $sp, -8	#adjust stack pointer
	sw $s0, 4($sp)		#push $s0 to stack
	sw $s1, 0($sp)		#push $s1 to stack
	
work:
	nop

pop:
	lw $t0, 0($sp)		#pop to $t0
	lw $t1, 4($sp)		#pop to $t1
	addi $sp, $sp, 8	#adjust stack pointer
