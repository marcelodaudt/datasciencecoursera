# Programming Assignment 1 - Air Pollution
# Part 1

# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors. The function 'pollutantmean' takes three arguments:
# 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that
# monitors' particulate matter data from the directory specified in the 'directory' argument and
# returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA.

# Escreva uma função chamada 'pollutantmean' que calcula a média de um poluente (sulfato ou nitrato)
# em uma lista especificada de monitores. A função 'pollutantmean' leva três argumentos:
# 'diretório', 'poluente' e 'id'. Dados os números de identificação de um monitor de vetor, 'pollutantmean'
# lê os dados dos monitores de material particulado do diretório especificado no argumento 'diretório' e
# retorna a média do poluente em todos os monitores, ignorando quaisquer valores ausentes codificados como NA.

# directory = vetor de caracteres de tamanho 1, indicando a localização do arquivo CSV
# pollutant = vetor de caracteres de tamanho 1, indicando o nome do poluente, "sulfate" ou "nitrate"
# id = vetor de inteiros, indicando o ID do monitor a ser utilizado

pollutantmean <- function(directory, pollutant, id = 1:332) {
  means <- numeric()
  workdirectory <- getwd()
  
  for(file in id) {
    path <- paste(workdirectory, "/", directory, "/", sprintf("%03d", file), ".csv", sep = "")
    data <- read.csv(path, header = TRUE, sep = ",", dec = ".")
    read_data <- data[pollutant]
    means <- c(means, read_data[na.rm = removeNA])
  }
  mean(means)
}
