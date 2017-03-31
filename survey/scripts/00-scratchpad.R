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

table(dataset$n184)
dataset[1:5, "q34_a1_2_id"]



dataset$n199 <- as.numeric(interaction(dataset$n184, dataset$q24))
dataset$n199 <- recode(dataset$n199,
       8 -> NA,
       7 -> NA,
       5 -> 1,
       3 -> 2,
       1 -> 3,
       2 -> 5,
       otherwise = "copy")
labels(dataset$n199) <- c(
  "Don't work in the field & another family member manages" = 1,
  "Don't work in the field & co-manage with another family member" = 2,
  "Don't work in the field but manage alone" = 3,
  "Work in the field & co-manage" = 4,
  "Work in the field & manage alone" = 5
)
sum(table(dataset$n199))



