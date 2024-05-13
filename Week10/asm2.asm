#Assignment 2, Cao Duc Anh 20225781

.eqv DISPLAY_ADDR 0x10010000	#Display adress
.eqv RED 0x00FF0000		#Color Hex Value
.eqv BLACK 0x00000000		


.text
main:
	li $t0, RED			#Load color address
	li $t1, BLACK
	li $s0, 8			#Display width and height
	li $s1, 8
	mul $t2, $s0, $s1
	li $k0, DISPLAY_ADDR		#Load display address
	li $t3, 0			#Init counter
loop:
	sw $t1, -4($k0)
	sw $t0, 0($k0)
	addi $k0, $k0, 4
	addi $t3, $t3, 1
	beq  $t3, $t2, reset_last_pixel
	j loop

reset_last_pixel:
	sw $t1, -4($k0)
	j main