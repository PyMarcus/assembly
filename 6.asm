# pegar a maior e a sétima maior nota em um array


.data 
# aloca espaço para o vetor:
	vetor: .space 64  # 64 / 4 (tamanho dos valores) = 16 itens (cada inteiro 4bit, logo, 16 int)
# demais alocações:
	message: .asciiz "Informe uma nota: "
	maior_nota: .asciiz "A maior nota é: "
	setima_maior_nota: .asciiz "A sétima melhor é: "
	quebra_linha: .asciiz "\n"
.text 

# apontar para a base do vetor
move $t0, $zero  # ponteiro para base do vetor
li $t2, 1        # contador para percorrer o loop

# solicitar dados ao usuário e preencher o vetor:
preenche_vetor:
	# solicita nota
	li $v0, 4 
	la $a0, message
	syscall

	li $v0, 5
	syscall 
	
	move $t1, $v0       # passa conteudo de v0 para t1
	addi $t2, $t2, 1
	
	sw $t1, vetor($t0)  # armazena valor do registrador t1 em t0
	addi $t0, $t0, 4    # percorre vetor 

ble $t2, 16, preenche_vetor # enquanto for menor que 16

li $t2, 1  # zera o registrador do contador
move $t0, $zero  # torna a apontar para base do vetor



# exibir vetor preenchido
exibe_vetor:
	#imprime vetor desordenado
	li $v0, 1
	lw $a0, vetor($t0)
	syscall

	addi $t0, $t0, 4  # acrescenta ao vetor
	addi $t2, $t2, 1  # adiciona 1 ao contador t2
	
ble $t2, 16, exibe_vetor  # enquanto t2 for menor que 16
	

# ordena vetor
la $s0, vetor #base do vetor  
addi $s1, $s0, 60 #ult. pos. de memoria vet # 0 4 8 16 20 24 28 32 36 40 44 48 52 56 60
laco1:
	move $s2, $s0
	laco2:
		bge $s2, $s1, continualaco1
		addi $s2, $s2, 4 
		
		lw $t0, ($s0)
		lw $t2, ($s2)
		
		#verificando se a troca e necessaria
		ble $t0, $t2, laco2
		#trocando as posicoes
		sw $t0, ($s2)
		sw $t2, ($s0)
	
	j laco2 
continualaco1:
addi $s0, $s0, 4

blt $s0, $s1, laco1
# quebra linha
li $v0, 4 
la $a0, quebra_linha
syscall

# exibir vetor ordenado
li $t2, 1        # zera o registrador do contador
move $t0, $zero  # torna a apontar para base do vetor


exibe_vetor_ordenado:
	#imprime
	li $v0, 1
	lw $a0, vetor($t0)
	syscall

	addi $t0, $t0, 4  # acrescenta ao vetor
	addi $t2, $t2, 1  # adiciona 1 ao contador t2
	
ble $t2, 16, exibe_vetor_ordenado  # enquanto t2 for menor que 16

# quebra linha
li $v0, 4 
la $a0, quebra_linha
syscall


# maior nota e sétima maior:
li $v0, 4
la $a0, maior_nota
syscall

li $t1, 60

li $v0, 1
lw $a0, vetor($t1)
syscall
# quebra linha
li $v0, 4 
la $a0, quebra_linha
syscall

li $t1, 24
# sétima
li $v0, 4
la $a0, setima_maior_nota
syscall
li $v0, 1
lw $a0, vetor($t1)
syscall