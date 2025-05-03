# HRY 201 Digital Computers, Autumn 2007, Dionisios Pnevmatikatos 
# 
# LAB 3: Simple program prologue & epilogue 
# 
####################################################################### 
# Prologue begins. Do NOT edit this portion of the file 
####################################################################### 
.data
str: .space 80  
print_string: .asciiz "Please enter a string (80 characters max):\n"
menu: .asciiz "MENU\n1.Convert string to UPPERCASE. \n2.Convert string to Title Case. \n3.Exit.\n"
wrong_choice: .asciiz "Wrong choice!\n"
choose_from_above: .asciiz "Choose from the above menu: \n"
.text
.globl main 
main:
########################################################################

addi $s1,$0,1
addi $s3,$0,3
addi $s2,$0,2

li $v0,4
la $a0,print_string
syscall
li $v0,8
la $a0,str 
li $a1,80
syscall
la $s4,str
li $v0,4
la $a0,menu
syscall
li $v0,4
la $a0,choose_from_above
syscall
li $v0,5
syscall
move $s0,$v0  
while_label_1:
	beq $v0,$s3,end_while_1
	while_label_2:
		bge $s0,$s1,second_if
			j code
		second_if:
		ble $s0,$s3,end_if_1
			code:
				li $v0,4
				la $a0,wrong_choice
				syscall
				li $v0,4
				la $a0,choose_from_above
				syscall
				li $v0,5
				syscall
				move $s0,$v0
				j while_label_2
		end_if_1:
	end_while_2:
		bne $s0,$s1,else_label
			la $a0,str
			jal uppercase
			li $v0,4
			la $a0,str
			syscall	
			j end_if_2
		else_label:
			bne $s0,$s2,end_if_2
				la $a0,str
				jal titlecase
				li $v0,4
				la $a0,str
				syscall
		end_if_2:
			beq $s0,$s3,end_while_1
				li $v0,4
				la $a0,print_string
				syscall
				li $v0,8
				la $a0,str
				li $a1,81
				syscall
				la $s4,str
				li $v0,4
				la $a0,choose_from_above
				syscall
				li $v0,5
				syscall
				move $s0,$v0
				j while_label_1
end_while_1:
	li $v0,10
	syscall


uppercase:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	move $t0,$a0
	add $t1,$0,$0
	add $t2,$0,$0
	while_label_3:
		add $t3,$t2,$t0
		lb $t4,0($t3)
		beq $t4,0,end_while_3
			addi $t2,$t2,1
			addi $t1,$t1,1
			j while_label_3
	end_while_3:
	add $t1,$0,$0
	while_label_4:
		bge $t1,$t2,end_while_4
			add $t3,$t1,$t0
			lb $t4,0($t3)
			blt $t4,97,end_if
			bgt $t4,122,end_if
				addi $t4,$t4,-32
			sb $t4, 0($t3)
			end_if:
			addi $t1,$t1,1
			j while_label_4
	end_while_4:
	add $t1,$0,$0
	add $t2,$0,$0
	lw $ra,0($sp)
	addi $sp,$sp,4
	j $ra
	
	
titlecase:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	move $t0,$a0
	add $t1,$0,$0
	add $t2,$0,$0
	while_label_5:
		add $t3,$t2,$t0
		lb $t4,0($t3)
		beq $t4,0,end_while_5
			addi $t2,$t2,1
			addi $t1,$t1,1
			j while_label_5
	end_while_5:
	add $t1,$0,$0
	add $t3,$t1,$t0
	lb $t4,0($t3)
	blt $t4,97,end_if_4
	bgt $t4,122,end_if_4
		addi $t4,$t4,-32
		sb $t4,0($t3)
	end_if_4:
	addi $t1,$t1,1
	while_label_6:
		bge $t1,$t2,end_while_6
			addi $t7,$t1,-1
			add $t3,$t7,$t0
			lb $t4,0($t3)
			bge $t4,65,else_if_5
				j code1
			else_if_5:
			blt $t4,91,else_if_6
			bgt $t4,96,else_if_6
				j code1
			else_if_6:
			ble $t4,122,else_if_7
				code1:
				add $t3,$t1,$t0
				lb $t4,0($t3)
					blt $t4,97,end_if_6
					bgt $t4,122,end_if_6
						addi $t4,$t4,-32
						sb $t4,0($t3)
						j end_if_6
			else_if_7:
				add $t3,$t1,$t0
				lb $t4,0($t3)
				blt $t4,65,end_if_6
				bgt $t4,90,end_if_6
					addi $t4,$t4,32
					sb $t4,0($t3)
				end_if_6:
			addi $t1,$t1,1
			j while_label_6
	end_while_6:
	add $t1,$0,$0
	add $t2,$0,$0
	lw $ra,0($sp)
	addi $sp,$sp,4
	j $ra

#######################################################################
# Epilogue begins. Do NOT edit this portion of the file 
#######################################################################
# Exit
li $2, 10 # 10 is the code to finish execution 
syscall