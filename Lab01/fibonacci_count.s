.data
num: .word 4
str: .string "th number in the Fibonacci sequence is "

.text
main:           
    lw a0, num           #1
    li s0, 1             #2
    jal ra, fib          #3

    mv a1, a0            #4 120
    lw a0, num           #5 121
    
    jal ra, printResult  #122
    li  a7, 10           #123
    ecall                #124

fib:
    ble a0, s0 , RT      #6  14 22 30 42 61 80 88 100
    addi sp, sp, -24     #7  15 23 31 43 62 81 89 101
    sw ra, 16(sp)        #8  16 24 32 44 63 82 90 102
    sw a0, 8(sp)         #9  17 25 83
    addi a0, a0, -1      #10 18 26 84
    jal ra, fib          #11 19 27 85
    sw a0, 0(sp)         #12 20 28 36 55 74 86 94
    lw a0, 8(sp)         #13 21 29 37 56 75 87 95
    addi a0, a0, -2      #38 57 76 96
    jal ra, fib          #39 58 77 97
    lw t0, 0(sp)         #40 48 59 67 78 98 106 113
    add a0, a0, t0       #41 49 60 68 79 99 107 114
    lw ra, 16(sp)        #50 69 108 115
    addi sp, sp, 24      #51 70 109 116
    ret                  #52 71 110 117
	
RT:
    ret                  #33 45 53 64 72 91 103 111 118
    
printResult:
    mv t0, a0            #34 46 54 65 73 92 104 112 119 125
    mv t1, a1            #35 47 66 93 105 126
    li a7, 1             #127
    ecall                #128
    
    mv a0, t0            #129
    la a0, str           #130
    li a7, 4             #131
    ecall                #132
    
    mv a0, t1            #133
    li a7, 1             #134
    ecall                #135