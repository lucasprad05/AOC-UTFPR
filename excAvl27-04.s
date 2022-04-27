.data

    str1: .asciiz "teste1"
    str2: .asciiz "teste2"
    str3:

.text

main:

    la $a0, str1
    la $a1, str2
    la $a2, str3
    li $s0, 0		#int i
    li $s4, 0		#int j

    jal strcat
    
    li $v0, 4
    la $a0, str3
    syscall

    li $v0, 10
    syscall

strcat:
    add $s2, $s0, $a2
    add $s1, $s0, $a0
    lb $s3, 0($s1)
    beq $s3, $zero, strcat2
    sb $s3, 0($s2)
    addi $s0, $s0, 1
    j strcat

strcat2: 
    add $s2, $s0, $a2
    add $s1, $s4, $a1
    lb $s3, 0($s1)
    beq $s3, $zero, back
    sb $s3, 0($s2)
    addi $s0, $s0, 1
    addi $s4, $s4, 1
    j strcat2

back:
    j $ra
    
