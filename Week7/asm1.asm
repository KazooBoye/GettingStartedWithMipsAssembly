#Laboratory Week 7, Assignment 1

.text

main:
	li $a0, 45	#init input
	jal abs		#jump and link to procedure (assign $ra to current program counter value)
	nop
	
abs:
	sub $t0, $zero, $a0	#inverse $a0 value
	bltz $a0, done		#if $a0 < 0 then go to 'done'
	nop
	add $t0, $a0, $zero	#else set $t0 to $a0

done:
	jr $ra		#jump back to after jal opcode
