.data
arr: .word 5,3,6,7,31
#arr: .word 5,3,6,7,31,23,43,12,45,1
str1: .string "Array： \n"
space: .string " "
str2: .string "Sorted： \n"
str3: .string "\n"

.text
main:
	la s0, arr
	mv t3, s0
    
    la a0, str1
    li a7, 4
    ecall
    
    addi s1, s1, 4
	#addi s1, s1, 8
	addi t0, zero, -1
    jal ra printArray
	addi t0, zero, -1
	jal ra, bubblesort
    
    la a0, str3
    li a7, 4
    ecall
    
	mv t0, zero
	addi s1, s1, 1
	mv s0, t3

    la a0, str2
    li a7, 4
    ecall
	j printSorted

bubblesort:
	addi sp, sp, -24
	sw ra, 16(sp)
	sw s1, 8(sp)
	sw s0, 0(sp)
    outloop:
	    addi t0, t0, 1
	    mv t1, zero
	    sub t2, s1, t0
	    blt t0, s1, inloop
	    addi sp, sp, 24
	    jr ra
    inloop:
	    mv s0, t3
	    bge t1, t2, outloop
	    slli t4, t1, 2
	    add s0, s0, t4
	    lw a2, 0(s0)
	    lw a3, 4(s0)
	    addi t1, t1, 1
	    bgt a2, a3, swap
	    j inloop
swap:
	sw a2, 4(s0)
	sw a3, 0(s0)
	j inloop 

printArray: 
	bge t0, s1, Exit1
	lw  a0, 0(s0)
	li  a7, 1
	ecall
    la a0, space
    li a7, 4
    ecall
	addi t0, t0, 1
	addi s0, s0, 4
	j printArray

printSorted: 
	bge t0, s1, Exit2
	lw  a0, 0(s0)
	li  a7, 1
	ecall
    la a0, space
    li a7, 4
    ecall
	addi t0, t0, 1
	addi s0, s0, 4
	j printSorted

Exit1:
    ret

Exit2:
    li  a7, 10
    ecall 