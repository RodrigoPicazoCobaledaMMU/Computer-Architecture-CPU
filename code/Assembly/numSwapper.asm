.data
# --- Declaring constants in the program --- #s
inputPrompt1: .string "\nPlease enter the first number: "
inputPrompt2: .string "\nPlease enter the second number: "
enterValidation: .string "\nYou've entered: "
solutionMsg: .string "\nThe sorted values are: "
.text
# --- Starting the program --- #
# --- First int input --- #

la a0, inputPrompt1 #Loads string inputPrompt1 into register a0
jal strPrint #Jumps and link subroutine strPrint which displays what's stored at a0 (Which is 
jal intInput #Jumps and link subroutine intInput which stores the integer entered into a0

add t3, a0,zero #Adds the integer entered in a0 and stores it in t3 to output

add s0,t3,zero  #Copies the value from t3 into s0

la a0, enterValidation
jal strPrint
jal intPrint

# --- Second int input --- #
la a0, inputPrompt2
jal strPrint
jal intInput
add t3, a0, zero

add s1, t3, zero

la a0, enterValidation
jal strPrint
jal intPrint

# --- Sorting --- #
slt t1,s0,s1 #if (s0 < s1) {t1 = 1} else {t1 = 0}
bnez t1,sorted #if (t1 != 0) { sorted(); } else 
add s2,s0,zero
add s0,s1,zero
add s1,s2,zero
j sorted

# --- Subroutines --- #
exit: #Exit program
	addi a7,zero,10
	ecall

strPrint: #Prints a string
	addi a7,zero,4
	ecall
	ret

intPrint: #Prints an integer
	addi a7,zero,1
	add a0,t3,zero
	ecall
	
	addi a7,zero,11
	addi a0, zero, '\n'
	ecall
	ret

intInput: #Takes in an input and stores it in a0
	addi a7,zero,5
	ecall
	ret

sorted:
	#cout << ""The sorted values are: ";
	addi a7,zero,4
	la a0, solutionMsg
	ecall
	#cout << s0;
	addi a7,zero,1
	add a0,zero,s0
	ecall
	#cout << ' ';
	addi a7,zero,11
	addi a0,zero, ' '
	ecall
	#cout << s1;
	addi a7,zero,1
	add a0,zero,s1
	ecall
	#exit();
	j exit
	
	
