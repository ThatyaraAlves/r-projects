setwd("/home/thatyara/Área de trabalho/UnB/Estatística/Atividade 4")
getwd()

library(readxl)

dados_goias = read.csv("amostra_goias.csv", sep = ";", dec = ",")
notas = read.csv("notas_go_ms.csv", sep = ";", dec = ",")
escolas = read_excel("amostra_escolas.xlsx")
dados_matogrosso = read.table("dados_matogrosso.csv")
# remover colunad  do DtaFrame dados<-dados[,-c(1,3)]
data1 = dados_goias[, -c(2,5,9,10)]
data2 = dados_matogrosso[-1, -c(2,5,9,10)]


#novo1 <- rbind(data3, data4)   "

data3 = data2               # Replicate data
colnames(data3) = colnames(data1)    # Change column names


df <- rbind(data1, data3)  

df= merge(df, escolas, by = "Escola")
df = merge(df, notas, by = "ID_ALUNO")
dataf = df[, -c(11,12,13,14)]

novos = dataf[dataf$IDADE == 15, ]
names(novos)[names(novos)== "SIGLA_UF"] = "Estado"
names(novos[names(novos)== "Escolaridade_M"] = "ESC_M",

novos$TRAB[novos$TRAB == 0]<- "Nao",
novos$TRAB[novos$TRAB == 1]<- "Sim",

#removendo campos NA para utilizar o comando quantile
novos = na.omit(novos)
quantile(novos$Nota_Mat)

#associando os labels aos quartis
novos$MAT_cat = NA,
novos$MAT_cat = cut(novos$Nota_Mat, breaks = c(0, 210.0, 242.0, 278.5 ,351.0), 
                                labels = c("Baixo", "Regular","Médio", "Alto"),
                                right = FALSE)

novos = novos[order(novos$Nota_Mat),]

novos$MAT_p <- NA,
novos$MAT_p <- (novos$Nota_Mat - mean(novos$Nota_Mat)) / sd(novos$Nota_Mat)




















#  ###  Concatenando Arquivos: cbind  e  rbind
  
  # por colunas cbind
  #novo <- cbind(data1, data2)
#head(novo)

# por linha rbind
#novo1 <- rbind(data3, data4)   
#novo1




# names(); rbind(); merge(); df1= df1[c('ID_ALUNO', 'SIGLA_UF', 'SEXO'... etc)]