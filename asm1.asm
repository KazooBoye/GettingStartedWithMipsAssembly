# Define the input and output addresses for the hex keyboard
.eqv IN_ADRESS_HEXA_KEYBOARD, 0xFFFF0012
.eqv OUT_ADRESS_HEXA_KEYBOARD, 0xFFFF0014

.text
main:
    li    $t1, IN_ADRESS_HEXA_KEYBOARD   # Load the input address into $t1
    li    $t2, OUT_ADRESS_HEXA_KEYBOARD  # Load the output address into $t2

polling:
    li    $t3, 0x01                      # Start with the first row (0x01)
    li    $t4, 4                         # Set the number of rows to check (4 rows)
row_loop:
    sb    $t3, 0($t1)                    # Write the row value to the input address
    lb    $a0, 0($t2)                    # Read the scan code of the key from the output address
    
    beq   $a0, $zero, next_row           # If no key is pressed (scan code is 0), skip printing
print:
    li    $v0, 34                        # Prepare to print integer (in hexadecimal)
    syscall                              # Make the syscall to print the key code
    
next_row:
    sll   $t3, $t3, 1                    # Shift left to move to the next row (0x01, 0x02, 0x04, 0x08)
    addi  $t4, $t4, -1                   # Decrease the row counter
    bnez  $t4, row_loop                  # If there are more rows to check, continue loop

sleep:
    li    $a0, 100                       # Load 100ms into $a0 for the sleep duration
    li    $v0, 32                        # Prepare to sleep
    syscall                              # Make the syscall to sleep
    
back_to_polling:
    j     polling                        # Jump back to the polling loop

