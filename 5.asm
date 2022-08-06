
.data 
	intro:
		.asciiz
		"Insira o número: " 
	yes: 
		.asciiz
		"yes" 
	no: 
		.asciiz
		"no" 

.text 

	# obtidos atraves do produtório	
	
	# exibe introducao
	li $v0, 4
	la $a0, intro 
	syscall 
	
	#Entrada de dados
	li $v0, 5 
	syscall 
	
	# move o valor de v0 para t1
	move $t1, $v0 
	
	li $t2, 0 # contador
	li $t3, 1 # produto
	loop:		
		addi $t2, $t2, 1
		mul $t3, $t2, $t3  # realiza as multiplicações sucessivas
		beq $t3, $t1, yep  # se for igual, vai para o rotulo
	ble $t2, $t1, loop 
	li $v0, 4
	nope: 
		# se nao for igual:
		la $a0, no
		syscall 
		j fim 
	yep:
		# é igual:
		li $v0, 4
		la $a0, yes 
		syscall
	fim:
	    # finalizado a execução.