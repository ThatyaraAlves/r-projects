library(ggplot2)
library(tidyverse)
library(readxl)

#1) (0,5 Ponto) Importe os arquivos prova1.csv e nomes_CE2021.xlsx no R.
getwd()
dados1 = read.csv2("prova1v1.csv")
dados2 = read_excel ("nomes_CE2021.xlsx", sheet=1, col_names=TRUE)

#2) (1,5 Ponto) Gere um novo banco de dados a partir dos dados importados. Selecione apenas as observa��es do arquivo prova1.csv que tem a vari�vel ID_analista que corresponde ao seu nome no arquivo nomes_CE2021.xlsx. 
ndataset <- merge(dados1, dados2, by = c("ID_analista"))
ndataset <- subset(ndataset,ID_analista == "202018046")

#Observa��o: se n�o conseguir gerar esse arquivo fa�a a prova com os dados completos (prova1.csv). 

#3) (0,5 Ponto) Retire as vari�veis DTCADASTRO e ORIGEM.
ndataset <- ndataset[,-c(2,25)]

#4) (1,0 Ponto) Crie uma vari�vel de classifica��o (IDADE_CAT), do tipo fator, a partir da vari�vel IDADEMAE. As classifica��es s�o: "At� 20 anos, "De 21 a 30 anos", "De 31 a 40 anos" e "Acima de 40 anos".
ndataset$IDADE_CAT <- cut(ndataset$IDADEMAE, breaks=c(0,20, 30, 40, 46), 
                           labels=c("at� 20 anos", "de 21 a 30 anos","de 31 a 40 anos", "acima de 40 anos"),
                           right=FALSE)


#5) (0,5 Ponto) Transforme as vari�veis SEXO e PARTO em fatores. Utilize os r�tulos de acordo com o dicion�rio de vari�veis.
ndataset$SEXO  <- factor(ndataset$SEXO, label = c( "Ignorado","Masculino",
                                                     "Feminino"), level= 0:2)
ndataset$PARTO <- factor(ndataset$PARTO, label = c("Vaginal",
                                                     "Ces�reo","Ignorado"), level= c( 1,2,9))

#6) (1,0 Ponto) Escreva o c�digo para representar graficamente as vari�veis SEXO e PARTO conjuntamente. Utilize percentuais considerando os totais de meninos e meninas.
barplot(prop.table(table(ndataset$SEXO, ndataset$PARTO),2),
        xlab = "Tipo de Parto", ylab = "%", legend=TRUE, main = "Tipos de parto/sexo")

ggplot(data = ndataset) + 
  labs(x="Tipo de parto" ,y ="N�mero de rec�m nascidos")+
  geom_bar(mapping = aes(x = PARTO, fill = SEXO))+
  labs(caption = "Fonte: ndataset", 
       title = "Nascimentos e tipo de parto", 
        fill = "Sexo")
 


#7) (0,5 Ponto) Escreva o c�digo para calcular a correla��o entre PESO e IDADEMAE e representar essa rela��o com um diagrama de dispers�o.
correlacao = cor(ndataset$PESO,ndataset$IDADEMAE)


plot(x = ndataset$PESO, y = ndataset$IDADEMAE,
     xlab = "Peso",
     ylab = "Idade da m�e",
     main = "Correla��o Entre Peso e Idade da M�e",
     sub = paste("Correla��o = ", correlacao)) 

ggplot(data = ndataset) + 
  labs(x="Peso", y="Idade da m�e") +
  geom_point(mapping = aes(x = PESO, y=IDADEMAE, color= SEXO))+
  labs(caption = paste("Correla��o = ", correlacao), 
       title = "Correla��o Entre Peso e Idade da M�e")
 


#8) (0,5 Ponto) O diagrama de dispers�o do item 7 pode conter informa��o de outra vari�vel, por exemplo, o tipo de parto. Escreva o c�digo para que essa divis�o dada pelo tipo de parto apare�a de alguma forma no gr�fico.
ggplot(data = ndataset) + 
  labs(x="Peso", y="Idade da m�e") +
  geom_point(mapping = aes(x = PESO, y=IDADEMAE, color = PARTO))+
  labs(caption = paste("Correla��o = ", correlacao), 
       title = "Correla��o Entre Peso e Idade da M�e")
  
#9) (0,5 Ponto) Mude o nome da vari�vel RACACOR para Etnia.
names(ndataset)[names(ndataset)== "RACACOR"]<- "Etnia"

#10) (1,0 Ponto) Calcular a m�dia, desvio padr�o, coeficiente de varia��o e os quartis da vari�vel PESO.
summary(ndataset$PESO)
mean(ndataset$PESO)
sd(ndataset$PESO)
cv <- sd(ndataset$PESO) / mean(ndataset$PESO)

quantile(ndataset$PESO)

#11) (1,0 Ponto) Construa o histograma da vari�vel IDADEMAE.
ggplot(data = ndataset) + 
  labs(x="Idade da m�e", y = "Frequ�ncia") +
  geom_histogram( color="#0000FF", mapping = aes(x = IDADEMAE) )+
  labs(title = "Distribui��o da vari�vel IDADEMAE")
  

#12) (1,0 Ponto) Comparar a distribui��o da vari�vel PESO de acordo com a vari�vel PARTO. A compara��o ser� realizada com m�dia, desvio padr�o, m�nimo e m�ximo.
ggplot(data = ndataset) + 
  labs(x="Peso(g)", y = "Frequ�ncia") +
  geom_histogram(color="#0000FF", mapping = aes(x = PESO, fill = PARTO) )+
  labs(title = "Distribui��o da vari�vel PESO")
  

summary(ndataset$PESO[ndataset$PARTO== "Ces�reo"])
summary(ndataset$PESO[ndataset$PARTO== "Vaginal"])

#13) (0,5 Ponto) Construa os box-plots para complementar a compara��o acima.
ggplot(ndataset, aes(x= PESO , color = PARTO))+
  geom_boxplot()+
  labs(caption = "Fonte: novoBanco", 
       title = "Compara��o de PESO",
       subtitle = "separado por tipo de parto")
 