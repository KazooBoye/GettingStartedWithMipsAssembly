.data
A: .word -2 0 53 9 3 8 2    # Array A initialized with some values
Aend: .word               # End marker for array A
space: .asciiz " "        # String for space character
newline: .asciiz "\n"    # String for newline character

.text
    la $a0, A             # Load address of array A into $a0
    la $a1, Aend          # Load address of end marker for array A into $a1
    addi $a1, $a1, -4     # Move $a1 to the last element of array A
    add $s0, $a0, $zero   # Copy address of array A to $s0

loop:
    lw $k0, 0($s0)        # Load current element of the array into $k0
    addi $t0, $s0, -4     # Move to the previous element in the array

while:
    slt $s1, $t0, $a0     # Set $s1 to 1 if $t0 < $a0, i.e., if we are at the beginning of the array
    bne $s1, $zero, end_while   # Branch out of the while loop if we are at the beginning of the array
    lw $t1, 0($t0)        # Load the element before the current element into $t1
    slt $s1, $k0, $t1     # Set $s1 to 1 if $k0 < $t1
    beq $s1, $zero, end_while   # Branch out of the while loop if $k0 is not less than $t1
Do:
    sw $t1, 4($t0)        # Store $t1 at the next position
    addi $t0, $t0, -4     # Move to the previous element in the array
    j while               # Jump to the beginning of the while loop
    nop

end_while:
    sw $k0, 4($t0)        # Store $k0 at the next position

Display:
    add $a2, $a0, $zero   # Copy address of array A to $a2
    add $s1, $a0, $zero   # Copy address of array A to $s1
    li $v0, 4             # Load the syscall number for printing string into $v0
    la $a0, newline       # Load the address of newline string into $a0
    syscall               # Print newline character

Print_integer:
    li $v0, 1             # Load the syscall number for printing integer into $v0
    lw $a0, 0($s1)        # Load the integer at the current position into $a0
    syscall               # Print the integer

    li $v0, 4             # Load the syscall number for printing string into $v0
    la $a0, space         # Load the address of space string into $a0
    syscall               # Print space character

    beq $s1, $a1, Display_loop   # Branch to OutPrint_running if $s1 equals $a1 (end of array)
    addi $s1, $s1, 4     # Move to the next integer in the array
    j Print_integer      # Jump to PrintInt
Display_loop:
    addi $a0, $a2, 0     # Copy the address of array A into $a0
    beq $s0, $a1, exit   # Branch to exit if $s0 equals $a1 (end of array)
    addi $s0, $s0, 4     # Move to the next integer in the array
    j loop                # Jump to the beginning of the loop
    nop

exit:
    li $v0, 10            # Load the syscall number for exit into $v0
    syscall               # Exit the program
