numeros <-c(1, 2, 2, 2, 2, 3, 3, 4, 5, 5, 6, 7) # '<-' Cria��o de variaveis 
# 'm�todo c( ), que guardar� uma lista de n�meros
mode <- function(numeros) {
  ux <- unique(numeros)
  ux[which.max(tabulate(match(numeros, ux)))]
}
mode(numeros)

