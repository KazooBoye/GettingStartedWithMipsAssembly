#Laboratory Week 7, Assignment 4

.data
msg: .asciiz "Factorial calculation result: "

.text

main:
	jal	warp
	
print:
	la $a0, msg
	add $a1, $t1, $zero
	li $v0, 56
	syscall
	
exit:
	li $v0, 10
	syscall
	
endmain:

warp:
	sw $fp, -4($sp)		#save frame pointer to stack
	addi $fp, $sp, 0	#save stack's top address to frame pointer
	addi $sp, $sp, -8	#adjust stack pointer to make space
	sw $ra, 0($sp)		#save return address to stack
	
	li $s0, 5	#Init test input N
	jal factorial	#jump to procudure factorial
	nop
	lw $ra, 0($sp)	#retrieve return address
	addi $sp, $fp, 0	#return stack pointer
	lw $fp, -4($sp)		#return frame pointer
	jr $ra
	
warpend:
	
fact:
	sw $fp, -4($sp)		#save frame pointer to stack
	addi $fp, $sp, 0	#save stack's top address to frame pointer

top:
	addi $sp, $sp, -12	#adjust stack pointer to make space for $fp, $ra, $s0
	
stack:
	sw $ra, 4($sp)		#save return address to stack
	sw $s0, 0($sp)		#save N to stack
	
	slti $t0, $s0, 2	#if N < 2 false
	beqz $t0, recursive	#then continue recursive
	nop
	li $t1, 1		#else results N! = 1
	j done
	nop
	
recursive:
	addi $s0, $s0, -1	#N Decrement
	jal fact		#recursive call
	nop
	lw $t2, 0($sp)		#Load current N
	mult $t2, $t1		#Perform multiplication
	mflo $t1
	
done:
	lw $ra, 4($sp)		#retrieve return address
	lw $s0, 0($sp)		#retrieve initial N
	addi $sp, $fp, 0	#retrieve stack pointer
	lw $fp, -4($sp)		#retrieve frame pointer
	jr $ra			#jump back
	
factend: