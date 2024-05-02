#Laboratory Exercise 5, Assignment 3
.data
	x: .space 100 		#Allocate empty space for string X
	y: .asciiz "Hello"	#Init string Y
.text

strcpy:	
	li $s0, 0		#Init i = 0 (address offset value)
	la $a1, y		#Load address of y[0] to $a1
	la $a0, x		#Load address of x[0] to $a0
	Loop:
		add $t1,$s0,$a1 #Advance address of y (t1 = y[i+1])
		lb $t2,0($t1) 	#Load byte value of y to $t2
		
		add $t3,$s0,$a0 #Advance address of x (t3 = x[i+1])
		sb $t2,0($t3)	#Store byte value of x from $t2		
		
		beq $t2,$zero,endstrcpy	#If y[i]==0, exit loop
		addi $s0,$s0,1 		#Increase address offset
		j Loop
		nop
	

endstrcpy:
	li $v0, 4		#Print result
	la $a0, x
	syscall