setwd("/home/thatyara/Área de trabalho/UnB/Estatística/Atividade5")
getwd()
library(readxl)
homicidios = read_excel("homicidios.xlsx")
idh = read_excel("idh.xlsx")
pib = read_excel("pib.xlsx")
populacao = read_excel("populacao.xlsx")

names(idh)[names(idh) == 'Município'] = 'Municipio'
names(homicidios)[names(homicidios) == 'Nome'] = 'Nome_do_municipio'
nchar(idh$Municipio)
idhEstado = substr(idh$Municipio, nchar(idh$Municipio) - 2, nchar(idh$Municipio) - 1)
