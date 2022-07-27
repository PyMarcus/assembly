# imprimir o 'triângulo' abaixo:
#       7
#      76
#     765
#    7654
#   76543
#  765432
# 7654321

.data 
	intro: .asciiz "Informe o valor de entrada: "
	white_space: .asciiz " "
	break_line: .asciiz "\n"
.text 

	li $t4, 0
	li $t5, 1
	# solicita entrada para o user (inteiro):
	li $v0, 4
	la $a0, intro 
	syscall
	
	# recebe a entrada de dados:
	li $v0, 5
	syscall
	move $t1, $v0    # valor do registrador de input passa para t1
	move $t3, $zero  # contador
	move $t6, $v0  # t6 é uma constante
	move $t7, $t1
	# imprime a ponta
	 
	loop:
		# decrescente em relação aos espaços.
		li $v0, 4 
		la $a0, white_space
		syscall 
		addi $t3, $t3, 1
		
	ble $t3, $t1, loop  # verifica enquanto for menot q t1, executa o loop

	# inserir loop aqui.
	
	loop2:
		li $v0, 1
		move $a0, $t7
		syscall 
		subi $t7, $t7, 1
		
	addi $t4, $t4, 1
	blt $t4, $t5, loop2
	move $t4, $zero
	move $t7, $t6
	addi $t5, $t5, 1
	

	# imprime quebra de linha
	li $v0, 4
	la $a0, break_line
	syscall
	
	subi $t1, $t1, 1  # subtrai 1 de t1
	
	
	# reseta t3
	move $t3, $zero

	bgt $t1, $zero, loop  # enquanto t1 for maior que zero, executa loop
	
	
	
	
