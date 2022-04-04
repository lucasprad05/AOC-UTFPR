# int main(){
#   int fac = fact(5);
#   printf("%d", fac);
# }
#
# int fact(int n){
#   if (n <= 1) return 1;
#   else return (n * fact(n – 1));
# } 

.data

.text

main:
  li $a0, 5
  li $t0, 1
  li $v0, 1
  
  jal fact
  
  move $t0, $v0
  li $v0, 1
  move $a0, $t0
  syscall
  
  li $v0, 10
  syscall

fact:
  add $sp, $sp, -12
  sw $a0, 12($sp)
  sw $s0, 8($sp)
  sw $ra, 4($sp)
  
  beq $a0, $t0, sair
  slti $s0, $a0, 1
  bne $s0, $zero, sair
  
  addi $a0, $a0, -1
  jal fact
  
  lw $a0, 12($sp)
  lw $s0, 8($sp)
  lw $ra, 4($sp)
  add $sp, $sp, 12
  
  mul $v0, $v0, $a0

sair:
 jr $ra
