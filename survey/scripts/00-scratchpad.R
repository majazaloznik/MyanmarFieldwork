###############################################################################
##  02 PERCEPTION OF CHALLENGES
###############################################################################

## 1. LOAD PACKAGES AND DATA
###############################################################################
library(dplyr)
library(tidyr)
library(RColorBrewer)
load("survey/data/survey.data03.RData")
source("survey/reports/R04-MyFunctions.R")

boxplot(data$n119, data$n120,data$n121)
boxplot(data$n120)
boxplot(data$n121)

n187 <- ifelse(!dataset$n184 & dataset$n183 == 0, 0, 
       ifelse(dataset$n184 & dataset$n183 == 1, 1, 
              ifelse(dataset$n184 & dataset$n183 == 2, 2, 
                     ifelse(dataset$n184 & dataset$n183 == 3, 3,
                            ifelse(dataset$n184 & dataset$n183 >= 4, 4,
                                   ifelse(!dataset$n184 & dataset$n183 == 1, 5, 6))))))


data.set(dataset[,800:806], n188)
dataset %>% dpylr::select(q24, n177:n181)

rm(list = ls())
var <- "n188"
Fun02PrintTabInt(var)
Fun02BarplotInt(var) 

library(tidyverse)

df <- data.frame(
  id = 1:5,
  v1 = c("f", "m", "m", NA, "f"),
  v2 = c("f", "f", NA, NA, "m"),
  v3 = c("m", "f", NA, NA, NA),
  key = c(1, 3, 2, 1,2),
  stringsAsFactors = F
)

# a tidyverse way of doing it would be 
df %>% 
    gather(var, value, v1:v3) %>%
  arrange(id) %>% 
  group_by(id) %>% 
  mutate(lookup = value[unique(key)]) %>%
  spread(key = var, value = value)


# Here's one way of doing it that works.
# My main issue with it is that I have to list 
# the variables, can't do v1:v3

df %>%
  group_by(id) %>% 
  mutate(lookup = list(v1, v2, v3)[[key]])


