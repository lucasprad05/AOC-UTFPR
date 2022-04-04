.data
	x: .asciiz " "
	y: .asciiz "Olá mundo !!!!\n\n"

.text

strcpy:
	addi $sp, $sp, -20
	sw $s3, 20($sp)
	sw $s5, 16($sp)
	sw $s6, 12($sp)
	sw $s7, 8($sp)
	sw $ra, 4($sp)


	li $s3, 0 			#$s3 == i

while:
	add $s5, $s3, $s0 		#$s5 = x[i]
	add $s6, $s3, $s1 		#$s6 = y[i]
	lb $s7, 0($s6) 			#carrega byte em y
	beq $s7, $zero, sair 		#compara se y[i] != \0
	sb $s7, 0($s5) 			#x[i] = y[i]
	addi $s3, $s3, 1

	j while


sair:
	lw $s3, 20($sp)
	lw $s5, 16($sp)
	lw $s6, 12($sp)
	lw $s7, 8($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 20
	move $v1, $s3
	jr $ra

main:
	la $s0, x 			#ender x
	la $s1, y 			#ender y
	jal strcpy
	li $v0, 4
	la $a0, x
	syscall

	li $v0, 10
	syscall
