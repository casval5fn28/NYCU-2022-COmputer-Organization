.data
num1: .word 4
num2: .word 8
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
    lw s0, num1
	lw s1, num2

	jal ra, gcd
    jal ra, printResult

    # Exit program
    li a7, 10
    ecall

gcd:
    addi sp,sp, -48
    sw ra, 40(sp)
    sw s2, 32(sp)
    sw s1, 24(sp)
    sw s0, 16(sp)
    sw t1, 8(sp)
    sw t0, 0(sp)
    mv t1,s1
    mv t0,s0
    bnez t1,cal
    
    addi sp,sp, 40
    ret
    
cal:
    rem s2,s0,s1
    mv s0,s1
    mv s1,s2
    j gcd
    lw ra, 40(sp)
    lw s2, 32(sp)
    lw s1, 24(sp)
    lw s0, 16(sp)
    lw t1, 8(sp)
    lw t0, 0(sp)   
    addi sp, sp, 16  
    ret

printResult:
    mv t0, a0
    mv t1, a1
    la a0, str1
    li a7, 4
    ecall
    lw a0, num1
    li a7, 1
    ecall
    la a0, str2
    li a7, 4
    ecall
    lw a0, num2
    li a7, 1
    ecall
    la a0, str3
    li a7, 4
    ecall
    mv a0, s0
    li a7, 1
    ecall
    ret
