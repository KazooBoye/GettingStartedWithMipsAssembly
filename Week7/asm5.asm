#Laboratory Week 7, Assignment 5

.data
max_message: .asciiz "Largest: "
min_message: .asciiz "Smallest: "
comma: .asciiz ","
newline: .asciiz "\n"

.text
main:
	li $s0, -2
	li $s1, -10
	li $s2, 5
	li $s3, 6
	li $s4, 10
	li $s5, 2
	li $s6, -3
	li $s7, -20
	addi $sp, $sp, -32	#Allocate space in stack

push:
	sw $s7, 0($sp)		#Push to stack
	addi $sp, $sp, 4
	sw $s6, 0($sp)
	addi $sp, $sp, 4
 	sw $s5, 0($sp)
	addi $sp, $sp, 4
	sw $s4, 0($sp)
	addi $sp, $sp, 4
	sw $s3, 0($sp)
	addi $sp, $sp, 4
	sw $s2, 0($sp)
	addi $sp, $sp, 4
	sw $s1, 0($sp)
	addi $sp, $sp, 4
	sw $s0, 0($sp)
	addi $sp, $sp, 4

find_min_max:
	li $t3, 0	#$t3 = 0 (i)
	li $t4, 8	#Loop condition
	lw $k0, -4($sp)	#$k0 = $s0 => initial value
	lw $k1, -4($sp)	#$k1 = $s0
			#$k0 = max, $k1 = min, $t1 = index of max, $t0 = index of min, $a0 = value, $a1 = value position

load:
	addi $t3, $t3, 1	#$t3 = $t3 + 1 = i + 1
	add $t5, $t3, $t3	#$t5 = 2*$t3 = 2*i
	add $t5, $t5, $t5	#$t5 = 4*$t3 = 4*i
	sub $t5, $zero, $t5	#$t1 = -4*i
	add $t2, $t5, $sp	#$t2 = $sp - 4*$t1 = &A[i]
	lw $a0, 0($t2)		#$a0 = *$t2 = A[i]
 	addi $a1, $t3, -1	#$a1 = $t0 - 1 = position of A[i]
	beq $a1, $t4, print	#if $a1 == $t4, jump to print
	nop

check:
	slt $a2, $k0, $a0	#if $k0 < $a0 => $a1 = 1 ($a0 <= $k0)
	beqz $a2, min		#if $a1 == 0 ($a0 <= $k0 => no change), jump to min
	nop
	addi $k0, $a0, 0	#$k0 = $a0
	addi $t0, $a1, 0	#$t0 = $a1 (new max position)

min:
    slt $a2, $a0, $k1	#if $k1 <= $a0 => jump, if $a0 < $k1 => $a1 = 1
    beqz $a2, load	#if $a1 == 0 ($k1 <= $a0 => no change), jump to load (new loop)
    nop
    addi $k1, $a0, 0	#$k1 = $a0
    addi $t1, $a1, 0	#$t1 = $a1 (new min position)
    j load

print:
    li $v0, 4		#Print max result
    la $a0, max_message
    syscall
    li $v0, 1
    addi $a0, $k0, 0
    syscall
    li $v0, 4
    la $a0, comma
    syscall
    li $v0, 1
    addi $a0, $t0, 0
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4		#Print min result
    la $a0, min_message
    syscall
    li $v0, 1
    addi $a0, $k1, 0
    syscall
    li $v0, 4
    la $a0, comma
    syscall
    li $v0, 1
    addi $a0, $t1, 0
    syscall
    li $v0, 4
    la $a0, newline
    syscall
