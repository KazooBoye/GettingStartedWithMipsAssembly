#Laboratory Exercise 5, Assignment 1

.data
	test: .asciiz "Hello World"

.text
	li $v0, 4	#Load service 4 (print string)
	la $a0, test	#Load argument (string at address)
	syscall		#Run service
	