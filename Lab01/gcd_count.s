.data
num1: .word 4
num2: .word 8
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
    lw s0, num1           #1
	lw s1, num2           #2

	jal ra, gcd           #3
    jal ra, printResult   #4  57

    # Exit program
    li a7, 10             #5  58
    ecall                 #6  59

gcd:
    addi sp,sp, -48       #7  25 43
    sw ra, 40(sp)         #8  26 44
    sw s2, 32(sp)         #9  27 45
    sw s1, 24(sp)         #10 28 46
    sw s0, 16(sp)         #11 29 47
    sw t1, 8(sp)          #12 30 48
    sw t0, 0(sp)          #13 31 49
    mv t1,s1              #14 32 50
    mv t0,s0              #15 33 51
    bnez t1,cal           #16 34 52
    
    addi sp,sp, 40        #17 35 53
    ret                   #18 36 54
    
cal:
    rem s2,s0,s1          #19 37 55
    mv s0,s1              #20 38 56
    mv s1,s2              #21 39
    j gcd                 #22 40
    lw ra, 40(sp)         #23 41
    lw s2, 32(sp)         #24 42
    lw s1, 24(sp)         #
    lw s0, 16(sp)         #
    lw t1, 8(sp)          #
    lw t0, 0(sp)          #
    addi sp, sp, 16       #
    ret                   #

printResult:
    mv t0, a0             #60
    mv t1, a1             #61
    la a0, str1           #62
    li a7, 4              #63
    ecall                 #64
    lw a0, num1           #65
    li a7, 1              #66
    ecall                 #67
    la a0, str2           #68
    li a7, 4              #69
    ecall                 #70
    lw a0, num2           #71
    li a7, 1              #72
    ecall                 #73
    la a0, str3           #74
    li a7, 4              #75
    ecall                 #76
    mv a0, s0             #77
    li a7, 1              #78
    ecall                 #79
    ret                   #80
