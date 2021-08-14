
duracao <- rename(duracao, replace = c("user_id"="aluno", "course_id"="curso", "timeToFinish"="dias"))

sumario_estatistico = aggregate(duracao$dias, list(duracao$curso), mean, na.rm = T) 
# juntar dois dados 

popularidade = rename(popularidade, replace = c("course_id" = "curso", "freq" = "popularidade"))

sumario_estatistico = rename(sumario_estatistico, replace = c("Group.1" = "curso", "x" = "dias"))

popularidade_e_duracao = merge(sumario_estatistico, popularidade, by = "curso")
# merge > junta dois bancos de dados