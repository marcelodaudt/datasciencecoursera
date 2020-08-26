# Programming Assignment 1 - Air Pollution
# Part 3

# Write a function that takes a directory of data files and a threshold for complete cases and
# calculates the correlation between sulfate and nitrate for monitor locations where the number
# of completely observed cases (on all variables) is greater than the threshold. The function
# should return a vector of correlations for the monitors that meet the threshold requirement.
#If no monitors meet the threshold requirement, then the function should return a numeric
# vector of length 0.

# Escreva uma função que pegue um diretório de arquivos de dados e um limite para casos completos
# e calcule a correlação entre sulfato e nitrato para locais de monitor onde o número de casos
# completamente observados (em todas as variáveis) é maior que o limite. A função deve retornar
# um vetor de correlações para os monitores que atendem ao requisito de limite. Se nenhum monitor
# atender ao requisito de limite, a função deve retornar um vetor numérico de comprimento 0.

corr <- function(directory, threshold = 0){
  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]

  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      monitor_data <- read.csv(path)
      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}