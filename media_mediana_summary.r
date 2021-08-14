getwd()
library(plyr)
duracao = rename(duracao, replace = c("user_id"="aluno", "course_id"="curso", "timeToFinish"="dias"))

mean(duracao$dias, na.rm = T) # calcula a media dos dias

median(duracao$dias, na.rm = T) # calcula a mediana

# na.rm = T > significa remove NA = True, sereve para remover os valores NA

summary(duracao$dias) #mostra um resumo das informações de duracao$dias

#PARA CALCULAR A PROPORCAO ENTRE ALUNOS QUE NAO CONCLUIRAM OS CURSOS E QUE CONCLUIRAM:

dim(duracao)[1] # 'dim" mostra a dimensão [1] dos dados, ou seja, as linhas

#Para calcular a proporcao dividimos o n de NA's pelo n de linhas:

3828/6366

# 60.13 % dos alunos nao concluiram os cursos

length(unique(duracao$curso)) # para sabermos quantos cursos unicos temos na nossa amostra

length(unique(duracao$aluno)) #para sabermos quantos alunos unicos temos






