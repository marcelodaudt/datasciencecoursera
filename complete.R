# Programming Assignment 1 - Air Pollution
# Part 2

# Write a function that reads a directory full of files and reports the number of completely observed cases
# in each data file. The function should return a data frame where the first column is the name of the file
# and the second column is the number of complete cases.

# Escreva uma função que leia um diretório cheio de arquivos e relate o número de casos
# completamente observados em cada arquivo de dados. A função deve retornar um quadro de
# dados onde a primeira coluna é o nome do arquivo e a segunda coluna é o número de casos completos.

complete <- function(directory, id = 1:332){
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(monitor in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    monitor_data <- read.csv(path)
    interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
    interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
    nobs <- nrow(interested_data)
    results <- rbind(results, data.frame(id=monitor, nobs=nobs))
  }
  results
}