#Assignment 1, Cao Duc Anh 20225781

.eqv SEVENSEG_LEFT 0xFFFF0011	#Left LED Address
.eqv SEVENSEG_RIGHT 0xFFFF0010	#Left LED Address

.data
LED_value: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F

.text
main:
	li $s1, SEVENSEG_LEFT	#Assign LED's address
	li $a0, 0x0		#Set value for LED
	sb $a0, 0($s1)		#
	nop
	jal count
exit:	
	li $v0, 10
	syscall
endmain:

#===================================

count:
	li $t0, 0	#Init counter
	la $t1, LED_value
	
loop:
	li $s2, SEVENSEG_RIGHT	#Assign LED's address
	lb $a0, 0($t1)  	#Set value for LED
	sb $a0, 0($s2)		#
	addi $t1, $t1, 1
	addi $t0, $t0, 1
	beq $t0, 10, count
	j loop

