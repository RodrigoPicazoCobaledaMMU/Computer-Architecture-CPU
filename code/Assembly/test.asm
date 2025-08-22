addi s0,zero,12
jal fact
add a0,zero,s1
addi a7,zero,1
ecall
addi a7,zero,10
ecall

fact:
beqz s0,base
addi sp,sp,-8
sw s0,4(sp)
sw ra,0(sp)
addi s0,s0,-1
jal fact
lw t0,4(sp)
lw ra, 0(sp)
mul s1, s1,t0
addi sp,sp,8
ret

base:
addi s1,zero,1
ret