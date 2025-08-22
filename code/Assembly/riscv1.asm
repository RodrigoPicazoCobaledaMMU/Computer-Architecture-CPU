.data

enterMsg: .string "Enter a number:\n"
msg: .string " is less than "
newLn: .string "\n"

.text

# prints message
li a7, 4
la a0, enterMsg
ecall

# reads int from i/o
li a7, 5
ecall
add s0, a0, zero

# prints message
li a7, 4
la a0, enterMsg
ecall

# reads int from i/o
li a7, 5
ecall
add s1, a0, zero


slt t1, s0, s1 # set t1 = 1 if s0 < s1
bnez t1, sorted # branch to sorted if t1 != 0 
j exit

add s0, s2, zero
add s1, s0, zero
add s2, s1, zero

sorted:
li a7, 1
add a0, s0, zero
ecall

li a7, 4
la a0, msg
ecall 

li a7, 1
add a0, s1, zero
ecall

ret

exit:
li a7, 10
ecall