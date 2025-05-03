##########################################################################
.data
.globl cflag
.globl cdata
menu: .asciiz "Menu:\n1. Choice1\n2. Choice2\n3. Exit\n"
c1:  .asciiz "Choice 1\n"
c2:  .asciiz "Choice 2\n"
exit: .asciiz "exit\n"
cflag: .word 0
cdata: .word 0
.text
.globl main
 
main:
##########################################################################

mfc0 $t3,$12 #c0 status register
ori $t3,$t3,2049
mtc0 $t3,$12
 
lw $t4,0xffff0000 #receiver control
ori $t4,$t4,2 # enavle interrpts bit
sw $t4,0xffff0000
 
li $v0,4
la $a0,menu
syscall
loop:
lw $t0,cflag 
beq $t0,$0,loop 
sw $0,cflag 
lw $t1,cdata 
bne $t1,49,else1 
li $v0,4
la $a0,c1
syscall
j loop
else1:
bne $t1,50,else2
li $v0,4
la $a0,c2
syscall
  
j loop
else2:
bne $t1,32,loop
li $v0,4
la $a0,exit
syscall
li $v0,10
syscall