# ler a hora inicial e final de um jogo, máximo de 24h, e exibir a duração.
.data 
	# alocação de memória para armazenamento de frases
	inicio:
	      .asciiz
              "Informe a hora inicial: "
	fim: 
              .asciiz
              "Informe a hora final: "
	duracao:
	      .asciiz
              "A duração foi de: "
	erro:
              .asciiz
              "\n[ERRO] tempo inválido"
.text

	# ------------------ LEITURA E ENTRADA DE DADOS ----------------------
	
	li $t3, 24 # atribui horário de referencia
	
	# exibe mensagem inicial
	li $v0, 4
	la $a0, inicio
	syscall        # hora de entrada
	
	# entrada da hora de início:
	li $v0, 5
	syscall
	move $t1, $v0  # move o valor do registrador v0 para t1  (valor lido)
	
	li $v0, 4
	la $a0, fim 
	syscall # hora final
	
	# entrada da hora final
	li $v0, 5
	syscall 
	move $t2, $v0  # move o valor do registrador v0 para t2 (valor lido)
	
	# ----------------- FIM DA LEITURA E ENTRADA DE DADOS --------------
	
	# encontrando o valor da hora, com base na diferença:
	ble $t2, $t1, diaSeguinte  # se a hora final for menor que t1 (proximo dia), exexuta diaSeguinte
	diaNormal:
	# se nao ultrapassar o dia atual:
	sub $t1, $t2, $t1
	j final
		diaSeguinte:
			# realiza a subtração das horas, se o dia ultrapassa 24h
			sub $t1, $t3, $t1    # subtrai 24h de t1 e a diferenca é acrescida a t2
			add $t1, $t2, $t1
			ble $t1, $t3, final  # verifica se o resultado é maior q 24, se for, da erro
			# se for maior q 24:
			li $v0, 4
			la $a0, erro
			syscall
			j ftotal
			
	
		final:
		# encerra o programa
		li, $v0, 4
		la $a0, duracao
		syscall  # exibe mensagem precede o resultado
		
		li $v0, 1
		move $a0, $t1
		syscall  # exibe o resultado
		
		ftotal:
		# termina sem mensagens.(return 0)
				
	
	
	
