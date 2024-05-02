#Laboratory Week 7, Assignment 2

.text

main:
	li $s0, 5	#Init test value
	li $s1, 4
	li $s2, 1
	jal max
	nop
endmain:

max:
	add $t0, $s0, $zero	#$t0 stores current largest integer
	sub $t1, $s1, $t0
	bltz $t1, continue	#if ($s1 - $t0) < 0 then continue
	nop
	add $t0, $s1, $zero	#else update current largest integer
	
continue:
	sub $t1, $s2, $t0
	bltz $t1, endmax	#if ($s2 - $t0) < 0 then end procedure
	nop
	add $t0, $s2, $zero	#else update current largest integer
	
endmax:
	jr $ra		#return back to main