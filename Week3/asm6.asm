#Laboratory Week 3, Assignment 6

.data
Array: .word 1, 2, -3, 4, 5	#Assign memory space and value for an array A[I]

.text
	la $t0, Array		#Load base address of A[I] into $t0
	addi $t3, $zero, 4	#N = 5
	addi $s0, $zero, 1	#Array stepping
	addi $s1, $zero, 0	#Array starting index

#Convert array's value to absolute
loop_abs:
	add $s1, $s1, $s0	#I = I + step
	lw $t2, 0($t0)		#Load value of A[I] into $t2
	blt $t2, $zero, convert_abs	#If A[i] < 0 then goto 'convert_abs'
	addi $t0, $t0, 4	#Shift array address 4 bytes forward
	blt $s1, $t3, loop_abs	#(Branch if less than) rerun 'loop' if I < N
	j endloop_abs
	
convert_abs:
	addi $t8, $zero, -1
	mul $t2, $t2, $t8	#A[i] = A[i] * (-1)
	sw $t2, 0($t0)		#Store A[i] converted value back to array
	addi $t0, $t0, 4	#Shift array address 4 bytes forward
	blt $s1, $t3, loop_abs  # (Branch if less than) rerun 'loop' if I < N
	j loop_abs		#return to loop_abs
endloop_abs:
addi $s1, $zero, 0	#Reset array starting index
addi $s2, $zero, 0	#Array largest value


loop_largest:
	add $s1, $s1, $s0	#I = I + step
	lw $t2, 0($t0)		#Load value of A[I] into $t2
	bge $t2, $s2, update_largest	#Update largest = A[i] if A[i] >= largest
	addi $t0, $t0, 4	#Shift array address 4 bytes forward
	blt $s1, $t3, loop_largest	#(Branch if less than) rerun 'loop' if I < N
	j endloop_largest
	
update_largest:			#Update largest = A[i]
	add $s2, $zero, $t2
	addi $t0, $t0, 4	#Shift array address 4 bytes forward
	blt $s1, $t3, loop_largest  # (Branch if less than) rerun 'loop' if I < N
	j loop_largest		#return to loop_largest

endloop_largest: