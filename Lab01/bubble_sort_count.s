.data
arr: .word 5,3,6,7,31
#arr: .word 5,3,6,7,31,23,43,12,45,1
str1: .string "Array： \n"
space: .string " "
str2: .string "Sorted： \n"
str3: .string "\n"

.text
main:
	la s0, arr               #1
	mv t3, s0                #2
    
    la a0, str1              #3
    li a7, 4                 #4
    ecall                    #5
    
    addi s1, s1, 4           #6 
	#addi s1, s1, 8   
	addi t0, zero, -1        #7
    jal ra printArray        #8
	addi t0, zero, -1        #9  77
	jal ra, bubblesort       #10 78
    
    la a0, str3              #79 245
    li a7, 4                 #246
    ecall                    #247
    
	mv t0, zero              #248
	addi s1, s1, 1           #249
	mv s0, t3                #250

    la a0, str2              #251
    li a7, 4                 #252
    ecall                    #253
	j printSorted            #254

bubblesort:
	addi sp, sp, -24         #80 255
	sw ra, 16(sp)            #81 256
	sw s1, 8(sp)             #82
	sw s0, 0(sp)             #83
    outloop:
	    addi t0, t0, 1       #84 141 184 216 237
	    mv t1, zero          #85 142 185 217 238
	    sub t2, s1, t0       #86 143 186 218 239
	    blt t0, s1, inloop   #87 144 187 219 240
	    addi sp, sp, 24      #88 145 188 220 241
	    jr ra                #89 146 189 221 242
    inloop:
	    mv s0, t3            #90 104 115 126 137 147 158 169 180 190 201 212 222 233 243
	    bge t1, t2, outloop  #91 105 116 127 138 148 159 170 181 191 202 213 223 234 244
	    slli t4, t1, 2       #92 106 117 128 139 149 160 171 182 193 203 214 224 235 
	    add s0, s0, t4       #93 107 118 129 140 150 161 172 183 193 204 215 225 236
	    lw a2, 0(s0)         #94 108 119 130 151 162 173 194 205 226 
	    lw a3, 4(s0)         #95 109 120 131 152 163 174 195 206 227
	    addi t1, t1, 1       #96 110 121 132 153 164 175 196 207 228
	    bgt a2, a3, swap     #97 111 122 133 154 165 176 197 208 229
	    j inloop             #98 112 123 134 155 166 177 198 209 230
swap:
	sw a2, 4(s0)             #99 113 124 135 156 167 178 199 210 231
	sw a3, 0(s0)             #100 114 125 136 157 168 179 200 211 232
	j inloop                 #101

printArray: 
	bge t0, s1, Exit1        #11 23 35 47 59 71 102
	lw a0, 0(s0)             #12 24 36 48 60 72 103
	li a7, 1                 #13 25 37 49 61 73
	ecall                    #14 26 38 50 62
    la a0, space             #15 27 39 51 63
    li a7, 4                 #16 28 40 52 64
    ecall                    #17 29 41 53 65
	addi t0, t0, 1           #18 30 42 54 66
	addi s0, s0, 4           #19 31 43 55 67
	j printArray             #20 32 44 56 68

printSorted: 
	bge t0, s1, Exit2        #21 33 45 57 69 257 269 281 293 305 317
	lw a0, 0(s0)             #22 34 46 58 70 258 270 282 294 306 318
	li a7, 1                 #259 271 283 295 307 318
	ecall                    #260 272 284 296 308
    la a0, space             #261 273 285 297 309
    li a7, 4                 #262 274 286 298 310
    ecall                    #263 275 287 299 311
	addi t0, t0, 1           #264 276 288 300 312
	addi s0, s0, 4           #265 277 289 301 313
	j printSorted            #266 278 290 302 314

Exit1:
    ret                      #74 267 279 291 303 315

Exit2:
    li a7, 10                #75 268 280 292 304 316 320
    ecall                    #76 321