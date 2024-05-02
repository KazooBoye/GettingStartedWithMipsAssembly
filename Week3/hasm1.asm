#Laboratory Exercise 3, Home Assignment 1
start:
	slt $t0,$s2,$s1 	# (set less than) If $s2 < $s1 then set $t0 to 1 else set $t0 to 0
	bne $t0,$zero,else 	# (branch not equal) branch to  label 'else' if $t0 is not equal to $zero
	addi $t1,$t1,1 		# (add immediate) add $t1 to immediate '1', save result on $t1
	addi $t3,$zero,1 	# 
	j endif 		# (jump without condition) jump to label 'endif' unconditionally
else: 	addi $t2,$t2,-1 	# begin else part: y=y-1
	add $t3,$t3,$t3 	# (normal add)
endif:
