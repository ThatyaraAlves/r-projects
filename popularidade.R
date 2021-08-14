#Utilizaremos a função count() para essa contagem, mas ela não está pré instalada no programa. 
# Para utilizá-la, precisamos instalar uma biblioteca chamada plyr, que a contém:

install.packages("plyr")
library(plyr) # para carregar a biblioteca

#Ao executarmos, a biblioteca será carregada, e pode-se usar a função de contagem.

auxiliar <- count(aulas, vars = "course_id") # objeto "auxiliar" recebe a funçaõ "count" com
# os parametros "aulas", e "vars" --> aqui se escolhe quais variaveis se quer contar

write.csv(auxiliar, "popularidade.csv") # para salvar o banco de dados em um arquivo 
getwd()


