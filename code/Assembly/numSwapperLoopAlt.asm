.data
# --- Declaring constants in the program --- #s
inputPrompt1: .string "\nPlease enter the first number: "
inputPrompt2: .string "\nPlease enter the second number: "
enterValidation: .string "\nYou've entered: "
solutionMsg: .string "\nThe sorted values are: "
equalMsg: .string "\nThe numbers are the same" 
numbers : .word 100
.text
# --- Starting the program --- #
# --- Array --- #
la a1,numbers #  Stores the address of the array to a1
add a5,zero,a1 # Makes a copy of the initial array in register a5
# --- First int input --- #

la a0, inputPrompt1 #Loads string inputPrompt1 into register a0
jal strPrint #Jumps and link subroutine strPrint which displays what's stored at a0
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

# --- Sort --- #


beq s0,s1,equal #if (s0 == s1) {equal();} 
addi s1,s1,1 # So it doesnt stop one number before the number entered
slt t1,s0,s1 #if (s0 < s1) {t1 = 1} else {t1 = 0}
bnez t1,loop #if (t1 != 0) { sorted(); } else 
mv s2,s0
mv s0,s1
mv s1,s2

addi s0,s0,-1
addi s1,s1,1
j loop

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
loop:
	addi a3,a3,1 # Counter for how many times numbers were incremented
	sw s0, 0(a1) # Stores each increment of s0 in the array
	addi s0,s0,1 #s0 = s0 + 1;
	addi a1, a1, 4 #Increments the array by 1 index
	slt t1,s0,s1 #if (s0 < s1) { t1 = 1;} else {t1 = 0;}
	bnez t1,loop #if (t1 != 0) {
	j loopdone # 	loopdone(); }
	
loopdone:
	
	bge a2,a3, exit # if (a2 > a3) {exit();}
	lw a0,0(a5) # Loads the copy of the initial address into the variable a0
	
	addi a7,zero,1 # cout << a0;
	ecall
	
	addi a7,zero,11 # cout <<  ' ';
	addi a0,zero, ' '
	ecall
	
	addi a2,a2,1 # adds 1 to a2 (counter)
	addi a5,a5,4 # Increments the index by one
	j loopdone
	
	
calling:
	addi a7,zero,1 #cout << s0;
	add a0,zero,s0
	ecall
	
	addi a7,zero,11 #cout << ' ';
	addi a0,zero, ' '
	ecall
	ret
	
equal:
	la a0, equalMsg 
	jal strPrint #cout << equalMsg;
	j exit #exit();

