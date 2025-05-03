##########################################################################
.data

menu: .asciiz "1.Run\n2.Exit\nGive choice:\n"
wrong_choice: .asciiz "Wrong choice choose again!\n"
first_number: .asciiz "Give first number: \n"
second_number: .asciiz "Give second number: \n"
wrong_number: .asciiz "Wrong number!\n"
result: .asciiz "result="
newline: .asciiz "\n"

.text
.globl main 
main:
########################################################################
li $v0,4
la $a0,menu
syscall
li $v0,5
syscall
add $t0,$v0,$0  #$t0 =choice,R1
while_label:
 addi $t2,$t0,-2    #slti $t1,$t0,2
 addi $t1,$t0,-1    #add $t2,$0,$0
 bgez $t1,second_condition #blt $t0,1,label_1
 j code      #addi $t2,$0,1
 second_condition:   #label_1:
 blez $t2,end_while   #and $t1,$t1,$t2
 code:      #beq $t1,1,end_while
 li $v0,4
 la $a0,wrong_choice
 syscall
 li $v0,5
 syscall
 add $t0,$v0,$0
 j while_label
end_while:

while_label_1:
 addi $t2,$0,2
 beq $t0,$t2,end_while_1
 li $v0,4
 la $a0,first_number
 syscall
 li $v0,5
 syscall
 add $t3,$v0,$0
 li $v0,4
 la $a0,second_number
 syscall
 li $v0,5
 syscall
 add $t4,$v0,$0
 while_label_2:
  bgez $t3,second_condition_1
  j code_1
  second_condition_1:
  bgez $t4,end_while_2
  code_1:
  li $v0,4
  la $a0,wrong_number
  syscall
  li $v0,4
  la $a0,first_number
  syscall
  li $v0,5
  syscall
  add $t3,$v0,$0
  li $v0,4
  la $a0,second_number
  syscall
  li $v0,5
  syscall
  add $t4,$v0,$0
  j while_label_2
 end_while_2:
 
 move $a0,$t3
 move $a1,$t4
 jal ackermann
 move $t5,$v0
 li $v0,4
 la $a0,result
 syscall
 li $v0,1
 move $a0,$t5
 syscall
 li $v0,4
 la $a0,newline
 syscall

 
 
 li $v0,4
 la $a0,menu
 syscall
 li $v0,5
 syscall
 add $t0,$v0,$0  
 while_label_3:
  addi $t2,$t0,-2    #slti $t1,$t0,2
  addi $t1,$t0,-1    #add $t2,$0,$0
  bgez $t1,second_condition_2 #blt $t0,1,label_1
  j code_2      #addi $t2,$0,1
  second_condition_2:   #label_1:
  blez $t2,end_while_3   #and $t1,$t1,$t2
  code_2:      #beq $t1,1,end_while
  li $v0,4
  la $a0,wrong_choice
  syscall
  li $v0,5
  syscall
  add $t0,$v0,$0
  j while_label_3
 end_while_3:
 j while_label_1
end_while_1:
j exit
 




ackermann:

addi $sp,$sp,-4
sw $ra,0($sp)
move $t0,$a0
move $t1,$a1
bnez $t0,else_if_label
 addi $v0,$t1,1
 lw $ra,0($sp)
 addi $sp,$sp,4
 j $ra

else_if_label:
bnez $t1,else_label
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 addi $a0,$t0,-1
 addi $a1,$0,1
 jal ackermann
 move $t3,$v0
 lw $t1,4($sp)
 lw $t0,0($sp)
 addi $sp,$sp,8
 move $v0,$t3
 lw $ra,0($sp)
 addi $sp,$sp,4
 j $ra
else_label:
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 move $a0,$t0
 addi $a1,$t1,-1
 jal ackermann
 move $t3,$v0
 lw $t1,4($sp)
 lw $t0,0($sp)
 addi $sp,$sp,8
 addi $sp,$sp,-8
 sw $t0,0($sp)
 sw $t1,4($sp)
 addi $a0,$t0,-1
 move $a1,$t3
 jal ackermann
 move $t3,$v0
 lw $t1,4($sp)
 lw $t0,0($sp)
 addi $sp,$sp,8
 move $v0,$t3
 lw $ra,0($sp)
 addi $sp,$sp,4
 j $ra
 
exit:
 li $2, 10 # 10 is the code to finish execution 
syscall