library(dplyr)

rm(list = ls())

load("survey/data/survey.data.RData")


filter(data, q63_crop_01 == "Onion" )
