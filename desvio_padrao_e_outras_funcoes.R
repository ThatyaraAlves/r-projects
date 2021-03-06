# Acabamos de ver um pouquinho sobre vari�ncia e desvio padr�o. 
#  aplicar isso no R, criando uma lista de n�meros quaisquer, 
# como feito anteriormente.

numeros <- c(1, 2, 3, 5, 6, 7, 8, 11, 2, 3, 44, 55, 67, 12, 34, 56)

#Se desejarmos calcular a vari�ncia, usamos o comando var(numeros), 
#o que trar� 531. Entretanto, sabemos que a vari�ncia por si s� n�o nos 
#traz muitas informa��es, portanto guardaremos isso em uma vari�vel denominada 
#variancia.

variancia <- var(numeros)

#E ent�o calcularemos a raiz quadrada da vari�ncia:

sqrt(variancia)

#Isso nos traz o desvio padr�o que, como sabemos, � a raiz quadrada da vari�ncia. 
#Mas ser� que � preciso faz�-lo em dois passos? Claro que n�o, o R tem isso 
#automatizado:

sd(numeros) # sd calcula o desvio padr�o

#PARA ABRIR UM ARQUIVO J� EXISTENTE EM CSV:

nums <- read.csv(file="/Users/alura/numeros.csv")

#Esse comando retorna um DataFrame

#� poss�vel exibir apenas uma coluna, utilizando o comando nums$X1.

nums$X1