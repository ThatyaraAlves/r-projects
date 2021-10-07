setwd('/home/thatyara/Área de trabalho/UnB/Estatística')
     
dados = read.csv("dados_atividades.csv", dec = ",", sep=";")
str(dados)
sapply(dados, class)

head(dados, 10)
dados
class(dados)
dados_notas_baixas = subset(dados, Notas == 1) # para ver os valores de uma variavel especifica, 
#dados_notas_baixas <- dados[dados$Notas == 1,]
dados_notas_baixas

menores_de_quatorze <- dados[(dados$Idade >=11 & dados$Idade <= 14), -c(2,11) ]
menores_de_quatorze

dados_notas_baixas$Autoeficacia2 <- dados_notas_baixas$Autoeficacia * 2.5 - 2.5
dados_notas_baixas

dados_notas_baixas$Autoeficacia2= round(dados_notas_baixas$Autoeficacia2, 2) # definir quantas casas decimais que eu quero que apareçam
dados_notas_baixas
