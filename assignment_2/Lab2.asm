# HRY 201 Digital Computers, Fall 2008, Dionisios Pnevmatikatos
#
# LAB 1 : Simple program that prints a prompt, reads an integer
# and prints the integer plus 4 on the screen
#
# is the comment character
#
.data
.globl askint
.globl repint
hry: .asciiz "HRY 201"
askint: .asciiz "Type an integer : "
repint: .asciiz "The new value is : "
newline: .asciiz "??"
.text
.globl main
main:
li $v0,4
la $a0,hry
syscall
# Print the prompt
li $v0, 4 # 4 is the code to print a string
la $a0, askint # a0 is the pointer to the string to
# print and gets the value from
# "variable" askint
syscall
# Read in the integer
li $v0, 5 # 5 is the code to read an integer
syscall # result is placed in $v0
# Now we can process the value in register $v0
add $t0, $v0, 4 # add 4 to it and store the result in $t0
add $t0, $t0, $zero # $zero is always zero, so this instruction
# does not change the result in $t0
# *** Can I remove this instruction? ***
# Done processing, print the result
# Print the result string
li $v0, 4 # 4 is the code to print a string
la $a0, repint # string to print is in "variable" askint
syscall
# Print the answer
li $v0, 1 # 1 is the code for print integer
move $a0, $t0 # a0 receives integer to be printed
syscall
# Print a newline
li $v0, 4 # print integer
la $a0, newline # string to print is in "variable" newline
syscall
# Exit
li $v0, 10
syscall