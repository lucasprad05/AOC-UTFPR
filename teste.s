.data
    salario: .asciiz "Entre com seu salario"
    divida: .asciiz "Entre com sua divida"
    pulan: .asciiz "\n"
    print: .asciiz "O saldo da sua conta é "
.text

main:
    add $s0, $zero, $zero		#salario
    add $s1, $zero, $zero		#divida
    add $s2, $zero, $zero		#saldo
    
    li $v0, 4
    la $a0, salario			#pega salario
    syscall
    
    li $v0, 4
    la $a0, pulan			#\n
    syscall
    
    li $v0, 5
    syscall
    add $s0, $zero, $v0			#$s0 = salario
    
    li $v0, 4
    la $a0, divida			#pega divida
    syscall
    
    li $v0, 4
    la $a0, pulan			#\n
    syscall
    
    li $v0, 5
    syscall
    add $s1, $zero, $v0			#$s1 = divida
    
    jal printSaldo
    
    li $v0, 10				#sair
    syscall
    
printSaldo:
    addi $sp, $sp, -4
    sw $ra, 4($sp)
    
    jal saldoDisponivel
    
    li $v0, 4
    la $a0, print			#mostra saldo
    syscall
    
    li $v0, 1
    move $a0, $s2
    syscall
    
    li $v0, 4
    la $a0, pulan			#\n
    syscall
    
    li $v0, 4
    la $a0, pulan			#\n
    syscall
    
    lw $ra, 4($sp)
    addi $sp, $sp, 4	 
    jr $ra

saldoDisponivel:
    addi $sp, $sp, -4
    sw $ra, 4($sp)

    jal somaSaldo
    add $s2, $zero, $v1
    
    jal subtraiSaldo
    add $s2, $zero, $v1
    
    lw $ra, 4($sp)
    addi $sp, $sp, 4
    jr $ra

somaSaldo:
    addi $sp, $sp, -4
    sw $s2, 4($sp)
    add $v1, $s2, $s0
    lw $s2, 4($sp)
    addi $sp, $sp, 4
    j $ra
    
subtraiSaldo:
    addi $sp, $sp, -4
    sw $s2, 4($sp)
    sub $v1, $s2, $s1
    lw $s2, 4($sp)
    addi $sp, $sp, 4
    jr $ra

