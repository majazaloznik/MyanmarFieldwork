###############################################################################
##  02 PERCEPTION OF CHALLENGES
###############################################################################

## 1. LOAD PACKAGES AND DATA
###############################################################################
library(dplyr)
library(tidyr)
library(RColorBrewer)
load("survey/data/survey.data03.RData")
source("survey/scripts/R05-MyFunctions.R")

# N221 relationship of manager or co-manager

table(data$n219, data$n212)

