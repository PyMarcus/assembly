# verificar se o n�mero � tri�ngular:
.data 
	intro: .asciiz "Insira o n�mero: " 
	# respostas se o n�mero � ou n�o triangular
	yes: .asciiz "yes" 
	no: .asciiz "no" 

.text 

	# obtidos atraves da soma aritm�tica
	
	
	# ****************** entrada de dados *******************
	li $v0, 4
	la $a0, intro 
	syscall 
	
	li $v0, 5 
	syscall 
	
	move $t1, $v0 
	
	li $t2, 0 # contador
	li $t3, 1 # produto
	loop:
		# soma os valores at� o numero, se o valor for igual ao n�mero
		# este ser� um tri�ngular
		
		addi $t2, $t2, 1
		mul $t3, $t2, $t3
		beq $t3, $t1, yep  # se for igual, vai para o rotulo
	ble $t2, $t1, loop 
	li $v0, 4
	nope: 
		# se nao for igual
		 
		la $a0, no
		syscall 
		j fim 
	yep:
		li $v0, 4
		la $a0, yes 
		syscall
	fim: