getwd()


library(plyr)
duracao <- rename(duracao, replace = c("user_id"="aluno", "course_id"="curso", "timeToFinish"="dias"))
duracao

plot(duracao$dias) # para ver um gráfico selecionado pelo default do R

hist(duracao$dias) # para visualizar um histograma

hist(duracao$dias, breaks = 3) # o parametro breaks define o numero de quebras do hitograma

jpeg("histograma.jpg") #cria um arquivo .jpg para salvar o histograma abaixo

hist(duracao$dias, breaks = 10, main = "Histograma de Tempo", ylab = "Quant.cursos", xlab = "Tempo", ylim = c(0, 2000), col = "yellow")
# EXPLICANDO OS PARAMETROS:
# main > define o título do histograma
# ylab > define o róluto do eixo y (vertical)
# xlab > define o rotulo do eixo x (horizontal)
# ylim > define o limite do eixo y
# col > define a cor do histograma

dev.off() # encerra o processo de salvamento de arquivo


