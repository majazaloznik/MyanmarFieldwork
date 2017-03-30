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


xx <- head(cbind(data$n121, data$n185, data$n103, data$n188))
xx <- as.data.frame(na.omit(xx))

yy <- apply(xx, 2, mean)
yy[2]/yy[1]

group_by(data$n188, data$n151) %>% mean()

