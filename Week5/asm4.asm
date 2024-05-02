#Laboratory Exercise 5, Home Assignment 4

.data
	str: .space 50
	msg1: .asciiz "Input string:”
	msg2: .asciiz "String length (incl. end of string): "

.text
main:
get_string:
	li $v0, 4		#Load service 4 print string
	la $a0, msg1
	syscall
	
	li $v0, 8		#Load service 8 read string
	la $a0, str		#Load address of str
	li $a1, 50		#Maximum characters to read 50
	syscall
	
get_length:

	add $t3, $zero, $zero	#Current string length
	add $t0, $zero, $zero	#i = 0
	
	check_char:
		add $t1, $a0, $t0 	#Advance address pointer
		lb $t2, 0($t1) 		#Load current byte value to check for NULL
		beq $t2,$zero,end_of_str#Check for NULL char to end loop
		addi $t3, $t3, 1 	#length = length + 1
		addi $t0, $t0, 1 	#i = i + 1 (increase address pointer)
		j check_char
end_of_str:
end_of_get_length:
print_length:
	li $v0, 4		#Load service 4 print string
	la $a0, msg2
	syscall
	
	li $v0, 1		#Load service 1 print integer
	add $a0, $zero, $t3	#Load length
	syscall
