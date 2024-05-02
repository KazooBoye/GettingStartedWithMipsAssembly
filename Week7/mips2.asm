#Laboratory Week 7, Assignment 5
# Procedure to find the largest and smallest elements in a list of 8 elements
# Input: $s0-$s7: 8 elements of the list
# Output: $s8: position of the largest element
#         $s9: position of the smallest element

find_max_min:
    # Save return address and frame pointer
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $fp, 0($sp)

    # Set up frame pointer
    move $fp, $sp
    
    # Initialize largest and smallest elements and their positions
    move $s8, $zero     # Initialize largest position
    move $s9, $zero     # Initialize smallest position
    move $s3, $s0       # Initialize largest element
    move $s6, $s0       # Initialize smallest element

    # Loop through the list of elements
    li $t0, 1           # Initialize counter
loop:
    # Compare current element with largest element
    bgt $s3, $s0, update_largest
    move $s3, $s0       # Update largest element
    move $s8, $t0       # Update largest position
    
update_largest:
    # Compare current element with smallest element
    blt $s6, $s0, update_smallest
    move $s6, $s0       # Update smallest element
    move $s9, $t0       # Update smallest position
    
update_smallest:
    addi $t0, $t0, 1   # Increment counter
    addi $s0, $s0, 4   # Move to next element
    blt $t0, 8, loop   # Repeat until all elements are processed

    # Restore return address and frame pointer
    lw $ra, 4($sp)
    lw $fp, 0($sp)
    addi $sp, $sp, 8

    # Return
    jr $ra
