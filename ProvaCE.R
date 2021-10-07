library(ggplot2)
library(tidyverse)
library(readxl)

#1) (0,5 Ponto) Importe os arquivos prova1.csv e nomes_CE2021.xlsx no R.
getwd()
dados1 = read.csv2("prova1v1.csv")
dados2 = read_excel ("nomes_CE2021.xlsx", sheet=1, col_names=TRUE)

#2) (1,5 Ponto) Gere um novo banco de dados a partir dos dados importados. Selecione apenas as observações do arquivo prova1.csv que tem a variável ID_analista que corresponde ao seu nome no arquivo nomes_CE2021.xlsx. 
ndataset <- merge(dados1, dados2, by = c("ID_analista"))
ndataset <- subset(ndataset,ID_analista == "202018046")

#Observação: se não conseguir gerar esse arquivo faça a prova com os dados completos (prova1.csv). 

#3) (0,5 Ponto) Retire as variáveis DTCADASTRO e ORIGEM.
ndataset <- ndataset[,-c(2,25)]

#4) (1,0 Ponto) Crie uma variável de classificação (IDADE_CAT), do tipo fator, a partir da variável IDADEMAE. As classificações são: "Até 20 anos, "De 21 a 30 anos", "De 31 a 40 anos" e "Acima de 40 anos".
ndataset$IDADE_CAT <- cut(ndataset$IDADEMAE, breaks=c(0,20, 30, 40, 46), 
                           labels=c("até 20 anos", "de 21 a 30 anos","de 31 a 40 anos", "acima de 40 anos"),
                           right=FALSE)


#5) (0,5 Ponto) Transforme as variáveis SEXO e PARTO em fatores. Utilize os rótulos de acordo com o dicionário de variáveis.
ndataset$SEXO  <- factor(ndataset$SEXO, label = c( "Ignorado","Masculino",
                                                     "Feminino"), level= 0:2)
ndataset$PARTO <- factor(ndataset$PARTO, label = c("Vaginal",
                                                     "Cesáreo","Ignorado"), level= c( 1,2,9))

#6) (1,0 Ponto) Escreva o código para representar graficamente as variáveis SEXO e PARTO conjuntamente. Utilize percentuais considerando os totais de meninos e meninas.
barplot(prop.table(table(ndataset$SEXO, ndataset$PARTO),2),
        xlab = "Tipo de Parto", ylab = "%", legend=TRUE, main = "Tipos de parto/sexo")

ggplot(data = ndataset) + 
  labs(x="Tipo de parto" ,y ="Número de recém nascidos")+
  geom_bar(mapping = aes(x = PARTO, fill = SEXO))+
  labs(caption = "Fonte: ndataset", 
       title = "Nascimentos e tipo de parto", 
        fill = "Sexo")
 


#7) (0,5 Ponto) Escreva o código para calcular a correlação entre PESO e IDADEMAE e representar essa relação com um diagrama de dispersão.
correlacao = cor(ndataset$PESO,ndataset$IDADEMAE)


plot(x = ndataset$PESO, y = ndataset$IDADEMAE,
     xlab = "Peso",
     ylab = "Idade da mãe",
     main = "Correlação Entre Peso e Idade da Mãe",
     sub = paste("Correlação = ", correlacao)) 

ggplot(data = ndataset) + 
  labs(x="Peso", y="Idade da mãe") +
  geom_point(mapping = aes(x = PESO, y=IDADEMAE, color= SEXO))+
  labs(caption = paste("Correlação = ", correlacao), 
       title = "Correlação Entre Peso e Idade da Mãe")
 


#8) (0,5 Ponto) O diagrama de dispersão do item 7 pode conter informação de outra variável, por exemplo, o tipo de parto. Escreva o código para que essa divisão dada pelo tipo de parto apareça de alguma forma no gráfico.
ggplot(data = ndataset) + 
  labs(x="Peso", y="Idade da mãe") +
  geom_point(mapping = aes(x = PESO, y=IDADEMAE, color = PARTO))+
  labs(caption = paste("Correlação = ", correlacao), 
       title = "Correlação Entre Peso e Idade da Mãe")
  
#9) (0,5 Ponto) Mude o nome da variável RACACOR para Etnia.
names(ndataset)[names(ndataset)== "RACACOR"]<- "Etnia"

#10) (1,0 Ponto) Calcular a média, desvio padrão, coeficiente de variação e os quartis da variável PESO.
summary(ndataset$PESO)
mean(ndataset$PESO)
sd(ndataset$PESO)
cv <- sd(ndataset$PESO) / mean(ndataset$PESO)

quantile(ndataset$PESO)

#11) (1,0 Ponto) Construa o histograma da variável IDADEMAE.
ggplot(data = ndataset) + 
  labs(x="Idade da mãe", y = "Frequência") +
  geom_histogram( color="#0000FF", mapping = aes(x = IDADEMAE) )+
  labs(title = "Distribuição da variável IDADEMAE")
  

#12) (1,0 Ponto) Comparar a distribuição da variável PESO de acordo com a variável PARTO. A comparação será realizada com média, desvio padrão, mínimo e máximo.
ggplot(data = ndataset) + 
  labs(x="Peso(g)", y = "Frequência") +
  geom_histogram(color="#0000FF", mapping = aes(x = PESO, fill = PARTO) )+
  labs(title = "Distribuição da variável PESO")
  

summary(ndataset$PESO[ndataset$PARTO== "Cesáreo"])
summary(ndataset$PESO[ndataset$PARTO== "Vaginal"])

#13) (0,5 Ponto) Construa os box-plots para complementar a comparação acima.
ggplot(ndataset, aes(x= PESO , color = PARTO))+
  geom_boxplot()+
  labs(caption = "Fonte: novoBanco", 
       title = "Comparação de PESO",
       subtitle = "separado por tipo de parto")
 