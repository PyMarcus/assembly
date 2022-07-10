# ler 3 valores(diferentes) somar os 2 maiores
.data
  # alocação de mensagens de texto na memória
	num1: .asciiz " Informe o num1: "
	num2: .asciiz " Informe o num2: "
	num3: .asciiz " Informe o num3: "
	result: .asciiz " Resultado: "
 
.text
  	# ---------- ENTRADA DE DADOS ------------
  	# exibição de mensagens para o usuário
  	li $v0, 4
  	la $a0, num1
  	syscall
  	
  	# recebe 1 numero
  	li $v0, 5
  	syscall
  	move $t1, $v0  # move o valor do registrador v0 para t1
  	
  	# exibição de mensagens para o usuário
  	li $v0, 4
  	la $a0, num2
  	syscall
  	
  	# recebe 2 numero
  	li $v0, 5
  	syscall
  	move $t2, $v0  # move o valor do registrador v0 para t2
  	
 	# exibição de mensagens para o usuário
  	li $v0, 4
  	la $a0, num3
  	syscall
  	
  	# recebe 3 numero
  	li $v0, 5
  	syscall
  	move $t3, $v0  # move o valor do registrador v0 para t3
  	# ---------- FIM DA ENTRADA DE DADOS ------------
  	
  	# inicio das verificações
  	# se t1 e t2 forem os maiores
  	ble $t3, $t1, t1et2maior
  	# se nao for, t3 e maior
  	# verifica se t2 e maior que t1
  	ble $t1, $t2 t2et3maiores
  	
  	# se nao for t1 e t3 sao os maiores
  	j t1et3maiores
  	t1et2maior:
  		# verifica se t3 é menor que t2 tambem
  		ble $t3, $t2, t1et2maiorOk
  		j t1et3maiores
  	t1et2maiorOk:
  		add $t3, $t1, $t2
  		li $v0, 4
  		la $a0, result  # exibe texto 'resultado'
  		syscall
  		
  		li $v0, 1
  		move $a0, $t3  # move o valor do registrador t3 para a0
  		syscall # exibe soma de t1 com t2
  		j fim
  	t2et3maiores:
  		add $t3, $t3, $t2
  		li $v0, 4
  		la $a0, result  # exibe texto 'resultado'
  		syscall
  		
  		li $v0, 1
  		move $a0, $t3  # move o valor do registrador t3 para a0
  		syscall # exibe soma de t2 com t3
  		j fim
  	t1et3maiores:
  		add $t3, $t3, $t1
  		li $v0, 4
  		la $a0, result  # exibe texto 'resultado'
  		syscall
  		
  		li $v0, 1
  		move $a0, $t3  # move o valor do registrador t3 para a0
  		syscall # exibe soma de t1 com t3
  		j fim
  	
  	fim:
  	  # finaliza o programa sem retornos
  		
  		
  		
  		
  		
  
  	
  	