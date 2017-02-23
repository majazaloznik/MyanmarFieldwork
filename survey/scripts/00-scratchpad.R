###############################################################################
##  02 PERCEPTION OF CHALLENGES
###############################################################################

## 1. LOAD PACKAGES AND DATA
###############################################################################
library(dplyr)
load("survey/data/survey.dataframe.RData")

library(memisc)
load("survey/data/survey.dataset.RData")


FunR02Table <- function(var) {
x <-  cbind(table(var ,data$n151 ),
             table(var ,data$n152 ),
             table(var ,data$n153 ))
prop.table(x, 2)*100
}


FunR02Table <- function(var) {
  x <-  cbind(table(var ,data$n151 ),
              table(var ,data$n152 ),
              table(var ,data$n153 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  prop.table(x, 2)*100
}

barplot(FunR02Table(data$q4), width = y)
library(RColorBrewer)
