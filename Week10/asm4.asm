# Define memory addresses for keyboard and display
.eqv KEY_CODE 0xFFFF0004      # Address for keyboard ASCII code (1 byte)
.eqv KEY_READY 0xFFFF0000     # Address for keyboard ready flag
.eqv DISPLAY_CODE 0xFFFF000C  # Address for display ASCII code (1 byte)
.eqv DISPLAY_READY 0xFFFF0008 # Address for display ready flag

.text
main:
    # Initialize necessary addresses
    li $k0, KEY_CODE           # Load address of KEY_CODE into register $k0
    li $k1, KEY_READY          # Load address of KEY_READY into register $k1
    li $s0, DISPLAY_CODE       # Load address of DISPLAY_CODE into register $s0
    li $s1, DISPLAY_READY      # Load address of DISPLAY_READY into register $s1
    
    # Load characters to check for "exit" command
    li $t4, 'e'                # Load ASCII code for 'e' into register $t4
    li $t5, 'x'                # Load ASCII code for 'x' into register $t5
    li $t6, 'i'                # Load ASCII code for 'i' into register $t6
    li $t7, 't'                # Load ASCII code for 't' into register $t7
    
loop:
    # Wait for key input, read key, wait for display, and display key
    jal wait_for_key           # Wait for a new keycode
    jal read_key               # Read the keycode
    jal wait_for_display       # Wait for the display to be ready
    jal display_key            # Display the key on the screen
    
    # Check if the input is 'e'
    beq $t0, $t4, check_x      # Branch to check_x if input is 'e'
    j loop                     # Otherwise, repeat the loop
    
check_x:
    # Check if the input is 'x'
    jal wait_for_key           # Wait for a new keycode
    jal read_key               # Read the keycode
    jal wait_for_display       # Wait for the display to be ready
    jal display_key            # Display the key on the screen
    
    beq $t0, $t5, check_i      # Branch to check_i if input is 'x'
    j loop                     # Otherwise, repeat the loop
    
check_i:
    # Check if the input is 'i'
    jal wait_for_key           # Wait for a new keycode
    jal read_key               # Read the keycode
    jal wait_for_display       # Wait for the display to be ready
    jal display_key            # Display the key on the screen
    
    beq $t0, $t6, check_t      # Branch to check_t if input is 'i'
    j loop                     # Otherwise, repeat the loop
    
check_t:
    # Check if the input is 't'
    jal wait_for_key           # Wait for a new keycode
    jal read_key               # Read the keycode
    jal wait_for_display       # Wait for the display to be ready
    jal display_key            # Display the key on the screen
    
    beq $t0, $t7, end_main     # Branch to end_main if input is 't'
    j loop                     # Otherwise, repeat the loop

wait_for_key:
    # Wait for a new keycode
    lw $t1, 0($k1)             # Load the value at address KEY_READY into $t1
    nop                         # Delay slot
    beq $t1, $zero, wait_for_key # Loop if KEY_READY is not set
    jr $ra                      # Return to caller

read_key:
    # Read the keycode
    lw $t0, 0($k0)             # Load the value at address KEY_CODE into $t0
    nop                         # Delay slot
    jr $ra                      # Return to caller

wait_for_display:
    # Wait for the display to be ready
    lw $t2, 0($s1)             # Load the value at address DISPLAY_READY into $t2
    nop                         # Delay slot
    beq $t2, $zero, wait_for_display # Loop if DISPLAY_READY is not set
    jr $ra                      # Return to caller

display_key:
    # Display the key on the screen
    sw $t0, 0($s0)             # Store the value in $t0 to address DISPLAY_CODE
    nop                         # Delay slot
    jr $ra                      # Return to caller

end_main:
    # Terminate the program
    li $v0, 10                  # Load system call number for exit (10)
    syscall                     # Invoke system call
