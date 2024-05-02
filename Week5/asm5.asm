#Laboratory Exercise 5, Home Assignment 5

.data
	msg: .asciiz "Input string:"
	str: .space  21		#Allocate space for string
	str_rev: .space  21	#Allocate space for reversed string
	reverse_msg: .asciiz "Reversed string:"
	
.text
main:
	li $v0, 4	#Promt input
	la $a0, msg
	syscall

	li $v0, 8	#Read string
	la $a0, str
	li $a1, 21      #Maximum input length 20 + NULL
	syscall

get_length:		# Find length of string
	li $t0, 0       #Init i = 0 for loop
get_length_loop:
	lb $t1, str($t0)		#Load current byte value to check for NULL
	beqz $t1, end_get_length	#Check for NULL char to end loop
	addi $t0, $t0, 1		#Increment address counter i = i + 1
	b get_length_loop
end_get_length:

get_reverse:
	subi $t0, $t0, 1		#Decrement address counter i = i - 1 to skip NULL
	li $t2, 0               	#Index for str_rev
reverse_loop:
	
	lb $t1, str($t0)		#Load byte from original string
	sb $t1, str_rev($t2)		#Store byte in reversed string
	beq $t0, $zero, print_reverse	#If i = 0, exit loop
	addi $t0, $t0, -1       	#Decrement i = i - 1
	addi $t2, $t2, 1		#Increment index for str_rev
	b reverse_loop
print_reverse:

    li $v0, 4
    la $a0, reverse_msg
    syscall

    la $a0, str_rev	#Print reversed string
    li $v0, 4
    syscall
