        addi $sp, $sp, -16  # stack frame size is 32 bytes
        sw $ra, 12($sp)     # save return address
        sw $fp, 8($sp)      # save frame pointer
        addi $fp, $sp, 4    # set frame pointer
        addi $a0, $zero, 7  # a0 = n = 7
        jal fib             # v0 = fib(n)
        sw $v0, 84($0)      # save fib(n) to dmem
        lw $ra, 12($sp)     # restore ra
        addi $sp, $sp, 16   # restore stack pointer
        addi $fp, $sp, 4    # restore frame pointer
        j end               # finish

fib:    addi $sp, $sp, -16  # 16 byte stack frame
        sw $ra, 12($sp)     # save return address
        sw $fp, 8($sp)      # save frame pointer
        addi $fp, $sp, 4    # set frame pointer
        sw $a0, 0($fp)      # save a0 = n
        
        beq $a0, $0, E0     # if (a0 == 0): E0
        addi $t0, $0, 1     # t0 = 1
        beq $a0, $t0, E1    # if (a0 == 1): E1

        addi $a0, $a0, -1   # a0 = n - 1
        jal fib             # v0 = fib(n-1)
        sw $v0, -4($fp)     # save fib(n-1)
        lw $a0, 0($fp)      # restore a0 = n

        addi $a0, $a0, -2   # a0 = n - 2
        jal fib             # v0 = fib(n-2)
        lw $a0, 0($fp)      # restore a0 = n

        lw $t0, -4($fp)     # t0 = fib(n-1)
        add $t1, $v0, $0    # t1 = fib(n-2)
        add $v0, $t0, $t1   # v0 = fib(n-1) + fib(n-2)

        lw $ra, 12($sp)     # restore ra
        addi $sp, $sp, 16   # restore stack pointer
        addi $fp, $sp, 4    # restore frame pointer
        jr $ra              # return to caller

E0:     add $v0, $0, $0     # fib(n) = 0
        addi $sp, $sp, 16   # restore stack pointer
        addi $fp, $sp, 4    # restore frame pointer
        jr $ra              # return to caller

E1:     addi $v0, $0, 1     # fib(n) = 1
        addi $sp, $sp, 16   # restore stack pointer
        addi $fp, $sp, 4    # restore frame pointer
        jr $ra              # return to caller

end: