.data
num: .word 4
str: .string "th number in the Fibonacci sequence is "

.text
main:           
    lw a0, num
    li s0, 1
    jal ra, fib

    mv a1, a0
    lw a0, num
    
    jal ra, printResult
    li  a7, 10
    ecall 

fib:
    ble a0, s0 , RT
    addi sp, sp, -24
    sw ra, 16(sp)
    sw a0, 8(sp)
    addi a0, a0, -1
    jal ra, fib          # fib(n - 1)
    sw a0, 0(sp)         # store fib(n - 1)
    lw a0, 8(sp)         # load n
    addi a0, a0, -2      
    jal ra, fib          # fib(n - 2)
    lw t0, 0(sp)         # load fib(n - 1)
    add a0, a0, t0       # fib(n - 1) + fib(n - 2)
    lw ra, 16(sp)
    addi sp, sp, 24
    ret
	
RT:
    ret

printResult:
    mv t0, a0
    mv t1, a1
    li a7, 1
    ecall
    
    mv a0, t0
    la a0, str
    li a7, 4
    ecall
    
    mv a0, t1
    li a7, 1
    ecall