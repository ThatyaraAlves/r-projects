# Acabamos de ver um pouquinho sobre variância e desvio padrão. 
#  aplicar isso no R, criando uma lista de números quaisquer, 
# como feito anteriormente.

numeros <- c(1, 2, 3, 5, 6, 7, 8, 11, 2, 3, 44, 55, 67, 12, 34, 56)

#Se desejarmos calcular a variância, usamos o comando var(numeros), 
#o que trará 531. Entretanto, sabemos que a variância por si só não nos 
#traz muitas informações, portanto guardaremos isso em uma variável denominada 
#variancia.

variancia <- var(numeros)

#E então calcularemos a raiz quadrada da variância:

sqrt(variancia)

#Isso nos traz o desvio padrão que, como sabemos, é a raiz quadrada da variância. 
#Mas será que é preciso fazê-lo em dois passos? Claro que não, o R tem isso 
#automatizado:

sd(numeros) # sd calcula o desvio padrão

#PARA ABRIR UM ARQUIVO JÁ EXISTENTE EM CSV:

nums <- read.csv(file="/Users/alura/numeros.csv")

#Esse comando retorna um DataFrame

#É possível exibir apenas uma coluna, utilizando o comando nums$X1.

nums$X1