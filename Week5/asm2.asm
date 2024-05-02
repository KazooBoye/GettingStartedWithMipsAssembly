#Laboratory Exercise 5, Assignment 2

.data
	str0: .asciiz "The sum of "
	str1: .asciiz " and "
	str2: .asciiz " is "
.text	
	li $s0, 5		#Init value for $s0 and $s1
	li $s1, 6	


	li $v0, 4		#Load service 4 (print string)
	la $a0, str0		#Load str0 address to argument register
	syscall			#Call service to print "The sum of "
	
	li $v0, 1		#Load service 1 (print integer)
	addu $a0, $zero, $s0	#First operand s0 = 5
	syscall
	
	li $v0, 4		#Load service 4 (print string)
	la $a0, str1		#Load str1 address to argument register
	syscall			#Call service to print " and "
	
	li $v0, 1		#Load service 1 (print integer)
	addu $a0, $zero, $s1	#Second operand s1 = 6
	syscall
	
	li $v0, 4		#Load service 4 (print string)
	la $a0, str2		#Load str1 address to argument register
	syscall			#Call service to print " is "
	
	li $v0, 1		#Load service 1 (print integer)
	add $a0, $s0, $s1	#Second operand s1 = 6
	syscall