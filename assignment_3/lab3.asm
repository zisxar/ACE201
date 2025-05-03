# HRY 201 Digital Computers, Autumn 2007, Dionisios Pnevmatikatos 
# 
# LAB 3: Simple program prologue & epilogue 
# 
####################################################################### 
# Prologue begins. Do NOT edit this portion of the file 
####################################################################### 
.data 
.globl str1
.globl newline
str1: .asciiz "this is a string with a carriage return at the end\n"
newline: .asciiz "\n"
odd: .asciiz "odd\n"
odd1: .asciiz "#odds" 
.text 
.globl main 
main:
########################################################################
lui $7,0xF #odd
ori $11,$7,0x8421
add $8,$0,$0 #j of loop
while_label:
			addi $9,$8,-7
			bgtz $9,end_while
			andi $10,$8,1
			beq $10,$0,end_if
			li $2, 4 
			la $4, odd 
			syscall 
			addi $11,$11,1
			end_if:
			addi $8,$8,1
			j while_label
		end_while:
		li $2,4 
		la $4, odd1 
		syscall 
		li $2,1
		move $4,$11
		syscall
		
########################################################################
# You will need to print a string. 
# Just change str1 to the string you want to print 
li $2, 4 # 4 is the code to print a string 
la $4, str1 # string to be printed (str1) in register $4 
syscall 
# You will need to print an integer. 
# Just change $8 to the register you want to print 
# Print the integer located in register $8. 
li $2, 1 # 1 is the code to print integer 
move $4, $8 # $4 receives integer to be printed 
syscall 
# You will need to print a newline. 
# Print a newline 
li $2, 4 # 4 is the code to print a string 
la $4, newline # string to be printed (newline) in register $4 
syscall 
#######################################################################
# Epilogue begins. Do NOT edit this portion of the file 
#######################################################################
# Exit
li $2, 10 # 10 is the code to finish execution 
syscall