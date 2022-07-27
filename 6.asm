# ler 16 pontuacoes.Escolher a maior e a 7
.data 
	intro: .asciiz "Insira a nota: "
	biggest: .asciiz "Maior :"
	seventh: .asciiz "Sétima: "
	break_line: .asciiz "\n"

.text 

	# armazena maior nota (como são notas, entao >= 0)
	move $t1, $zero 
	
	move $t2, $zero # age como contador  
	li $t3, 16
	li $t4, 7
	move $t5, $zero # armazena a 7 posicao
	loop:
		# solicitacoes
		li $v0, 4
		la $a0, intro
		syscall 
		# entrada de dados
		li $v0, 5
		syscall 
		
		move $t6, $v0
		
		bge $t6, $t1, big
		addi $t2, $t2, 1  
		
		j next
		big:
			# verifica a melhor nota
			
			move $t1, $t6 
			addi $t2, $t2, 1
		next:
			# pula 
			beq $t2, $t4, storage
			blt $t2,$t3 , loop
			j fim 
		storage:
			# salva a 7 nota
			move $t5, $t6 
			blt $t2, $t3, loop
			j fim
			
		fim:
			# finaliza
			# maior:
			li $v0, 4 
			la $a0, biggest
			syscall
			
			li $v0, 1
			move $a0, $t1 
			syscall 
			
			# imprime quebra de linha
			li $v0, 4
			la $a0, break_line
			syscall
			
			# setimo:
			li $v0, 4 
			la $a0, seventh
			syscall
			
			
			li $v0, 1
			move $a0, $t5 
			syscall 

	