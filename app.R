library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(lubridate)
set.seed(7)

data <- data.frame(replicate(5,sample(rnorm(10*1000, 3, .5),12,rep = TRUE)), c(1:12))
names(data) <- c('banks', 'treasury', 'infometrics', 'corelogic', 'tonyalexander', 'month')


data %>% pivot_longer(c(banks, treasury, infometrics, corelogic, tonyalexander), names_to = 'source', values_to = 'predictions')

  
#c('banks', 'treasury', 'infometrics', 'corelogic', 'tonyalexander', 'source6', 'source7','source8', 'source9', 'source10')
# month <- c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December')

# data <- cbind.data.frame(data, month)


ggplot(data %>% pivot_longer(c(banks, treasury, infometrics, corelogic, tonyalexander), names_to = 'source', values_to = 'predictions'), aes(x = lubridate::month(month), y = predictions, colour = source))+
  geom_line() +
  theme_minimal() 


# Now with realistic data predictions:
# ANZ - 7% fall by end of 2022
# Annual To Monthly Formula: (1 + Growth Rate)^(1/12)-1 

banks <- (1 + -0.93)^(1/12)-1


