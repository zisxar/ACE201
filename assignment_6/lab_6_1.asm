##########################################################################
.data
str: .space 80  
menu: .asciiz "Give me the string.\n"
.text
.globl main 
main:
##########################################################################


la $a0,menu
jal write_str
la $a0,str
jal read_str
la $a0,str
jal uppercase
la $a0,str
jal write_str
j exit

write_ch:
	addi $sp,$sp,-12
	sw $t0,0($sp)
	sw $t1,4($sp)
	sw $t2,8($sp)
	move $t0,$a0
	loop_label:
		lb $t1,0xffff0008		#Transmitter Control
		and $t2,$t1,0x00000001
		beqz $t2,loop_label
	sb $t0,0xffff000c			#Transmitter Data
	lw $t2,8($sp)
	lw $t1,4($sp)
	lw $t0,0($sp)
	addi $sp,$sp,12
	j $ra
	
write_str:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	move $t0,$a0
	add $t1,$0,$0
	while_label:
		add $t2,$t1,$t0
		lb $t3,0($t2)
		beq $t3,0,end_while_label #exoume valei sti sinthiki to null afou o xristis
		move $a0,$t3			   #otan stamataei na pliktrologei pataei to enter
		jal write_ch
		addi $t1,$t1,1
		j while_label
	end_while_label:
	lw $ra,0($sp)
	addi $sp,$sp,4
	j $ra
	
read_ch:
	addi $sp,$sp,-16
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	loop_label_1:
		lb $t1,0xffff0000		#Receiver Control
		and $t2,$t1,0x00000001
		beqz $t2,loop_label_1
	lb $t0,0xffff0004			#Receiver Data
	addi $sp,$sp,-4
	sw $t0,0($sp)
	move $a0,$t0
	jal write_ch
	lw $v0,0($sp)
	addi $sp,$sp,4
	lw $t2,12($sp)
	lw $t1,8($sp)
	lw $t0,4($sp)
	lw $ra,0($sp)
	addi $sp,$sp,16
	j $ra
	
read_str:
	addi $sp,$sp,-4
	sw $ra,0($sp)
	move $t0,$a0
	add $t1,$0,$0
	loop_label_2:
		jal read_ch
		beq $v0,10,end_loop_label_2 
		move $t3,$v0
		add $t2,$t1,$t0
		sb $t3,0($t2)
		addi $t1,$t1,1
		j loop_label_2
	end_loop_label_2:
	lw $ra,0($sp)
	addi $sp,$sp,4
	j $ra
	
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
	


















##########################################################################
# Exit
exit:
li $2, 10 # 10 is the code to finish execution 
syscall