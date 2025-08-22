.data

enterMsg1: .string "Please use the last four digits of your student id as two 2-digit numbers \n"
enterMsg2: .string "Enter a two digit number\n"
enterMsg3: .string "Enter next number \n"
	
.text

###

# output the instruction text to the console
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

## add the two values together and store in s2
##



# output the value from s2
add a0, s2, zero
addi a7, zero, 1
ecall


addi a7, zero, 10
ecall
