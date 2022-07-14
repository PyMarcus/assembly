# gerar a serie 1 44 2 55 3 66...
.data 
	intro: .asciiz "Informe um valor: "

.text 
	li $t0, 1  # valor de in�cio da sequ�ncia
	li $t1, 4  # valor inicial dos pares na sequencia
	
	# impress�o para o usu�rio na sa�da padr�o:
	li $v0, 4
	la $a0, intro 
	syscall 
	
	# entrada de dados pelo usu�rio:
	li $v0, 5 # tipo inteiro
	syscall 
	
	# movendo o valor do registrador v0 para o registrador t2 para ser o limite do loop:
	move $t2, $v0
	
	li $v0, 1
	loop:
		# imprime o primeiro numero da sequ�ncia (1 vez)
		move $a0, $t0 
		syscall
		
		# imprime o segundo n�mero da sequ�ncia (2 vezes)
		move $a0, $t1
		syscall 
		move $a0, $t1 
		syscall
		
		add $t1, $t1, 1  # acrescenta 1 a t1
		add $t0, $t0, 1  # acrescenta 1 a t0

		
	blt $t0, $t2, loop  # at� que t1 seja do tamanho de t2, � executado o label loop
