numeros <-c(1, 2, 2, 2, 2, 3, 3, 4, 5, 5, 6, 7) # '<-' Criação de variaveis 
# 'método c( ), que guardará uma lista de números
mode <- function(numeros) {
  ux <- unique(numeros)
  ux[which.max(tabulate(match(numeros, ux)))]
}
mode(numeros)

