.data
enterMsg1: .string "Please use the last four digits of your student id as two 2-digit numbers \n"
enterMsg2: .string "Enter a two digit number\n"
enterMsg3: .string "Enter next number \n"
outputMsg: .string "\nThe total of the operation is:\n"
andMsg: .string "\nThe total of the values in a bitwise and operation is:\n"
xorMsg: .string "\nThe total of the values in a bitwise xor operation is:\n"
.text
###
# ------------------------------------------------------- Input segment  -------------------------------------------------------------------- #
# output the instruction text to the console

addi a7, zero, 4 # outputs "Please use the last four digits of your student id as two 2-digit numbers" and makes a new line
la a0, enterMsg1
ecall

addi a7, zero, 4
la a0, enterMsg2
ecall

# read an integer from keyboard input and store in s0
addi a7, zero, 5
ecall
add s0, zero, a0


# output the text asking for the next number to the console
# then receive the input and store in s1

addi a7, zero, 4
la a0, enterMsg3
ecall

addi a7, zero, 5
ecall

add s1, zero, a0

# ------------------------------------------------------- mathematical equations ------------------------------------------------------------ #
## add the two values together and store in s2
add s2,s0,s1 # s2 = input1 (a0) + input2 (a1)

## bitwise and operation on s0 and s1
and s3,s0,s1

## bitwise xor operation on s0 and s1
xor s4,s0,s1

# -------------------------------------------------------- Run I/O segment ------------------------------------------------------------------ #

# --- Add --- #
addi a1, s2, 0
la a0, outputMsg
jal output
# --- And --- #
addi a1, s3, 0
la a0, andMsg
jal output
# --- Xor --- #
addi a1, s4, 0
la a0, xorMsg
jal output

#------ Ends the program ------#

addi a7, zero, 10 #Exit code
ecall #Syscall

output:
	addi a7,zero, 4
	ecall
	
	addi a7,zero, 1
	add a0, a1,zero
	ecall
	ret
