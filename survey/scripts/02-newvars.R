###############################################################################
##  02 New variables
###############################################################################
##  01-import.R was the main import and tidy.
##  Here a bunch of new variables are created that were used in the R02 reports
###############################################################################

##  1. packages and import dataset and helper funcitons
###############################################################################
## the data and dataset objects created in 01.import: [769 vars atm]
load("survey/data/survey.data01.RData")
library(dplyr)
library(tidyr)

# funciton for swapping the order of the columns when new var is introduced
FunSwap <- function(New, After) {
  from <- which(names(dataset)[index] == New)
  to <- which(names(dataset)[index] == After)
  index <- append(index, values = from, after = to)
  index <- index[-(from+1)]
  return(index)
}

## 2. Additional reshaped data tables
###############################################################################
## 2.1. HH movers: one row per person moved out of HH (still NA row if none)
## reshape whole dataset to get a row per person moved out of HH (but keep sinlge)
## record for HH where noone moved out 
data %>% 
  gather(key, value,  q8id.01: q8_6.09) %>%
  filter(grepl('q', key)) %>%
  extract(key, c("question", "mover_id"), "(.+)\\.(..)") %>%
  spread(question, value) %>% 
  arrange(question_no)  %>%
  filter(mover_id == "01" | !is.na(q8id )) -> data.movers


## 2.1.1. additional variables in movers dataset
###############################################################################

# is son moved out of hh
data.movers$m1 <- ifelse(is.na(data.movers$q8_1), 0, 
                         ifelse(data.movers$q8_1 == "Children" & data.movers$q8_2 == "Male", 1, 0))
#  is daughter moved out of HH
data.movers$m2 <- ifelse(is.na(data.movers$q8_1), 0, 
                         ifelse(data.movers$q8_1 == "Children" & data.movers$q8_2 == "Female", 1, 0))


# is son moved out of hh to get married
data.movers$m3 <- ifelse(is.na(data.movers$q8_1), 0, 
                         ifelse(data.movers$q8_1 == "Children" & 
                                  data.movers$q8_2 == "Male" & 
                                  data.movers$q8_4 == "Marriage" , 1, 0))
#  is daughter moved out of HH to get married
data.movers$m4 <- ifelse(is.na(data.movers$q8_1), 0, 
                         ifelse(data.movers$q8_1 == "Children" & 
                                  data.movers$q8_2 == "Female" & 
                                  data.movers$q8_4 == "Marriage", 1, 0))

## aggregate movers data back to 600 households - see below for adding n156 and n157back
data.movers %>%
  group_by(question_no) %>%
  summarise(n156 = ifelse(sum(m1) == 0, 0, 1),
            n157 = ifelse(sum(m2) == 0, 0, 1),
            n158 = ifelse(sum(m3) == 0, 0, 1),
            n159 = ifelse(sum(m4) == 0, 0, 1) ) -> hh.movers



##  3. additional variables:
###############################################################################

# N 153 dividing by size of landholding
n153 <- ifelse(dataset$q17 <= 5 | is.na(dataset$q17), 0, 
               ifelse( dataset$q17 <= 10, 1,2))
labels(n153) <- c("up to 5 acres" =  0,
                  "5 to 10 acres" =  1,
                  "over 10 acres" =  2)
dataset <- data.set(dataset, n153 = n153)
description(dataset$n153) <- "N153 - Landholding size - three groups"

index <- 1:770
index <- FunSwap("n153", "q17")
dataset <- dataset[index]
rm(index, n153)

# N154 age groups 10 years
n154 <- ifelse(dataset$q2 <=29, 0, 
               ifelse(dataset$q2 <=39, 1,
                      ifelse(dataset$q2 <=49, 2,
                             ifelse(dataset$q2 <=59, 3,
                                    ifelse(dataset$q2 <=69, 4,
                                           ifelse(dataset$q2 <=79, 5,
                                                  ifelse(dataset$q2 <=89, 6,
                                                         ifelse(dataset$q2 <=99, 7
                                                         ))))))))

labels(n154) <- c("under 30" =  0,
                  "30 to 39" =  1,
                  "40 to 49" =  2,
                  "50 to 59" =  3,
                  "60 to 69" =  4,
                  "70 to 79" =  5,
                  "80 to 89" =  6,
                  "90 to 99" =  7)
dataset <- data.set(dataset, n154 = n154)
description(dataset$n154) <- "N154 - Age group (10 year groups)"

index <- 1:771
index <- FunSwap("n154", "q2")
dataset <- dataset[index]
rm(index, n154)

description(dataset$q6_a) <- "Q6.A. Do you have difficulty with seeing, even if wearing glasses?"
description(dataset$q6_b) <- "Q6.B. Do you have difficulty with hearing, even if using a hearing aid?"
description(dataset$q6_c) <- "Q6.C. Do you have difficulty with walking?"
description(dataset$q6_d) <- "Q6.D. Do you have difficulty with climbing steps?"
description(dataset$q6_e) <- "Q6.E. Do you have difficulty with carrying heavy items?"
description(dataset$q6_f) <- "Q6.F. Do you have difficulty with remembering things?"
description(dataset$q6_g) <- "Q6.G. Do you have difficulty with Concentrating?"
description(dataset$q6_h) <- "Q6.H. Do you have difficulty with none of the above?"


# N155 HH size grouped 
n155 <- ifelse(dataset$q7 <=2, 0, 
               ifelse(dataset$q7 <=5, 1,
                      ifelse(dataset$q7 <=10, 2, 3)))

labels(n155) <- c("up to 2" =  0,
                  "3 to 5" =  1,
                  "6 to 10" =  2,
                  "over" =  3)
dataset <- data.set(dataset, n155 = n155)
description(dataset$n155) <- "N155 - Household size (four groups)"

index <- 1:772
index <- FunSwap("n155", "q7")
dataset <- dataset[index]
rm(index, n155)



# N156 HH has had son move out
n156 <- hh.movers$n156

labels(n156) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n156 = n156)
description(dataset$n156) <- "N156 - Household has had (at least one) son move out"

index <- 1:773
index <- FunSwap("n156", "n17")
dataset <- dataset[index]
rm(index, n156)

# N157 HH has had daughter move out
n157 <- hh.movers$n157

labels(n157) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n157 = n157)
description(dataset$n157) <- "N157 - Household has had (at least one) daughter move out"

index <- 1:774
index <- FunSwap("n157", "n156")
dataset <- dataset[index]
rm(index, n157)




# N158 HH has had son move out to get married
n158 <- hh.movers$n158

labels(n158) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n158 = n158)
description(dataset$n158) <- "N158 - Household has had (at least one) son move out in order to get married"

index <- 1:775
index <- FunSwap("n158", "n157")
dataset <- dataset[index]
rm(index, n158)

# N159 HH has had daughter move out to get married
n159 <- hh.movers$n159

labels(n159) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n159 = n159)
description(dataset$n159) <- "N159 - Household has had (at least one) daughter move out in order to get married"

index <- 1:776
index <- FunSwap("n159", "n158")
dataset <- dataset[index]
rm(index, n159)



# N160  generation type

hh.relationships <- subset(data, select = q7_2.01:q7_2.15)

FunGen <- function(var) {
  ifelse(as.numeric(var)%in% c(1,2,8, 9, 10), 0, 
         ifelse(as.numeric(var) %in% c(3,5), -1,
                ifelse (as.numeric(var) == 4 , -2,
                        ifelse(as.numeric(var) %in% c(6,7), 1, NA))))
}

for (i in 1:15) {
  new.n <- paste0("n160.", i)
  assign(new.n, FunGen(hh.relationships[,i]))
}

 # todo add labesl 
hh.gens <- cbind(question_no = data$question_no, n160.1,n160.2, n160.3, n160.4, n160.5, n160.6, n160.7,
                 n160.8, n160.9, n160.10, n160.11, n160.12, n160.13, 
                 n160.14, n160.15)

hh.gens %>%
  as.data.frame() %>%
  gather(key, value, -question_no)%>%
  group_by(question_no)%>%
  arrange(question_no) %>%
  mutate( no = n_distinct(value, na_rm = TRUE)) %>%
  summarize(no = mean(no))-> hh.gens

n160 <- hh.gens$no
labels(n160) <- c("One (of respondent)" = 1, "Two" = 2, "Three" = 3, "Four" = 4)
dataset <- data.set(dataset, n160 = n160)
description(dataset$n160) <- "N160 - NUmber of generations living in household"

index <- 1:777
index <- FunSwap("n160", "q7_2.15")
dataset <- dataset[index]
rm(index, n160)

rm(hh.relationships, n160.1,n160.2, n160.3, n160.4, n160.5, n160.6, n160.7,
   n160.8, n160.9, n160.10, n160.11, n160.12, n160.13, 
   n160.14, n160.15, hh.gens, FunGen)

## Fix N35, which has 13 cases missing of "other family, 
new.labs <- labels(dataset$n35) + c("Other nonHH family"=88)
desc <- description(dataset$n35)
dataset$n35 <- ifelse(dataset$q24_c_id == 88, 88, dataset$n35)
description(dataset$n35) <- desc
labels(dataset$n35) <- new.labs
rm(new.labs)

# Now have to fix n36 as well, since it depended on N35
new.labs <- labels(dataset$n36) + c("Other nonHH family"=88)
desc <- description(dataset$n36)
dataset$n36 <- ifelse(is.na(dataset$n35), dataset$n34, dataset$n35 )
description(dataset$n36) <- desc
labels(dataset$n36) <- new.labs
rm(new.labs, desc)

## fix N64 to N68 by grouping years since they have done sth.. 

new.labs <- labels(dataset$n64) + c("Under 5 years ago" = 1,
                                    "Between 5 and 10 years ago" = 2,
                                    "Between 10 and 20 years ago" = 3,
                                    "Over 10 years ago" = 4)
desc <- description(dataset$n64)
dataset$n64 <- ifelse(as.numeric(dataset$n64) == 0, 0,
                      ifelse(as.numeric(dataset$n64) <= 5, 1,
                             ifelse(as.numeric(dataset$n64) <= 10, 2,
                                    ifelse(as.numeric(dataset$n64) <= 20, 3,
                                           ifelse(as.numeric(dataset$n64) < 99, 4, 99)))))

labels(dataset$n64) <- new.labs
description(dataset$n64) <- desc

## N65 
desc <- description(dataset$n65)
dataset$n65 <- ifelse(as.numeric(dataset$n65) == 0, 0,
                      ifelse(as.numeric(dataset$n65) <= 5, 1,
                             ifelse(as.numeric(dataset$n65) <= 10, 2,
                                    ifelse(as.numeric(dataset$n65) <= 20, 3,
                                           ifelse(as.numeric(dataset$n65) < 99, 4, 99)))))

labels(dataset$n65) <- new.labs
description(dataset$n65) <- desc

## N66 
desc <- description(dataset$n66)
dataset$n66 <- ifelse(as.numeric(dataset$n66) == 0, 0,
                      ifelse(as.numeric(dataset$n66) <= 5, 1,
                             ifelse(as.numeric(dataset$n66) <= 10, 2,
                                    ifelse(as.numeric(dataset$n66) <= 20, 3,
                                           ifelse(as.numeric(dataset$n66) < 99, 4, 99)))))

labels(dataset$n66) <- new.labs
description(dataset$n66) <- desc

## N67
desc <- description(dataset$n67)
dataset$n67 <- ifelse(as.numeric(dataset$n67) == 0, 0,
                      ifelse(as.numeric(dataset$n67) <= 5, 1,
                             ifelse(as.numeric(dataset$n67) <= 10, 2,
                                    ifelse(as.numeric(dataset$n67) <= 20, 3,
                                           ifelse(as.numeric(dataset$n67) < 99, 4, 99)))))

labels(dataset$n67) <- new.labs
description(dataset$n67) <- desc


## N68
desc <- description(dataset$n68)
dataset$n68 <- ifelse(as.numeric(dataset$n68) == 0, 0,
                      ifelse(as.numeric(dataset$n68) <= 5, 1,
                             ifelse(as.numeric(dataset$n68) <= 10, 2,
                                    ifelse(as.numeric(dataset$n68) <= 20, 3,
                                           ifelse(as.numeric(dataset$n68) < 99, 4, 99)))))

labels(dataset$n68) <- new.labs
description(dataset$n68) <- desc


# total number of draught animals owned or rented
n161 <- rowSums(cbind (data$q53_a_1_cows,data$q53_a_2_cows,
                data$q53_b_1_buffaloes,data$q53_b_2_buffaloes), na.rm=TRUE)

dataset <- data.set(dataset, n161 = n161)
description(dataset$n161) <- "N161 - Number of draught animals both owned and rented"

index <- 1:778
index <- FunSwap("n161", "q53_d")
dataset <- dataset[index]
rm(index, n161)

# Own or rent machinery: 
# plough/tiller
n162 <- ifelse((dataset$q54_a_1 == 0 | is.na(dataset$q54_a_1)) &
                 (dataset$q54_a_2 == 0 | is.na(dataset$q54_a_2)), 0,
               ifelse((dataset$q54_a_2 == 0 | is.na(dataset$q54_a_2)), 1,
                      ifelse((dataset$q54_a_1 == 0 | is.na(dataset$q54_a_1)), 2,3)))

labels(n162) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n162 = n162)
description(dataset$n162) <- "N162 - Do you own and-or rent Plough-tiller for use with draught animals? "

index <- 1:779
index <- FunSwap("n162", "q54_a_3")
dataset <- dataset[index]
rm(index, n162)

# plough/tiller
n163 <- ifelse(dataset$n162 == 0, NA, rowSums(cbind (dataset$q54_a_1,dataset$q54_a_2), na.rm=TRUE))

dataset <- data.set(dataset, n163 = n163)
description(dataset$n163) <- "N163 - Number of Plough-tiller for use with draught animals both owned and rented"

index <- 1:780
index <- FunSwap("n163", "n162")
dataset <- dataset[index]
rm(index, n163)

# hand tractor 
n164 <- ifelse((dataset$q54_b_1 == 0 | is.na(dataset$q54_b_1)) &
                 (dataset$q54_b_2 == 0 | is.na(dataset$q54_b_2)), 0,
               ifelse((dataset$q54_b_2 == 0 | is.na(dataset$q54_b_2)), 1,
                      ifelse((dataset$q54_b_1 == 0 | is.na(dataset$q54_b_1)), 2,3)))

labels(n164) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n164 = n164)
description(dataset$n164) <- "N164 - Do you own and-or rent Hand tractor (power tiller?) "

index <- 1:781
index <- FunSwap("n164", "n163")
dataset <- dataset[index]
rm(index, n164)

# hand tractor - number
n165 <- ifelse(dataset$n164 == 0, NA, rowSums(cbind (dataset$q54_b_1,dataset$q54_b_2), na.rm=TRUE))

dataset <- data.set(dataset, n165 = n165)
description(dataset$n165) <- "N165 - Number of  Hand tractor (power tiller) both owned and rented"

index <- 1:782
index <- FunSwap("n165", "n164")
dataset <- dataset[index]
rm(index, n165)



# Drum seeder
n166 <- ifelse((dataset$q54_c_1 == 0 | is.na(dataset$q54_c_1)) &
                 (dataset$q54_c_2 == 0 | is.na(dataset$q54_c_2)), 0,
               ifelse((dataset$q54_c_2 == 0 | is.na(dataset$q54_c_2)), 1,
                      ifelse((dataset$q54_c_1 == 0 | is.na(dataset$q54_c_1)), 2,3)))

labels(n166) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n166 = n166)
description(dataset$n166) <- "N166 - Do you own and-or rent Drum seeder? "

index <- 1:783
index <- FunSwap("n166", "n165")
dataset <- dataset[index]
rm(index, n166)

# drum seeders - number
n167 <- ifelse(dataset$n166 == 0, NA, rowSums(cbind (dataset$q54_c_1,dataset$q54_c_2), na.rm=TRUE))

dataset <- data.set(dataset, n167 = n167)
description(dataset$n167) <- "N167 - Number of  Drum seeders both owned and rented"

index <- 1:784
index <- FunSwap("n167", "n166")
dataset <- dataset[index]
rm(index, n167)


# Tractor
n168 <- ifelse((dataset$q54_d_1 == 0 | is.na(dataset$q54_d_1)) &
                 (dataset$q54_d_2 == 0 | is.na(dataset$q54_d_2)), 0,
               ifelse((dataset$q54_d_2 == 0 | is.na(dataset$q54_d_2)), 1,
                      ifelse((dataset$q54_d_1 == 0 | is.na(dataset$q54_d_1)), 2,3)))

labels(n168) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n168 = n168)
description(dataset$n168) <- "n168 - Do you own and-or rent Tractor? "

index <- 1:785
index <- FunSwap("n168", "n167")
dataset <- dataset[index]
rm(index, n168)

# Tractors - number
n169 <- ifelse(dataset$n168 == 0, NA, rowSums(cbind (dataset$q54_d_1,dataset$q54_d_2), na.rm=TRUE))

dataset <- data.set(dataset, n169 = n169)
description(dataset$n169) <- "n169 - Number of  Tractors both owned and rented"

index <- 1:786
index <- FunSwap("n169", "n168")
dataset <- dataset[index]
rm(index, n169)



# Mechanical Thresher
n170 <- ifelse((dataset$q54_e_1 == 0 | is.na(dataset$q54_e_1)) &
                 (dataset$q54_e_2 == 0 | is.na(dataset$q54_e_2)), 0,
               ifelse((dataset$q54_e_2 == 0 | is.na(dataset$q54_e_2)), 1,
                      ifelse((dataset$q54_e_1 == 0 | is.na(dataset$q54_e_1)), 2,3)))

labels(n170) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n170 = n170)
description(dataset$n170) <- "n170 - Do you own and-or rent Mechanical Thresher? "

index <- 1:787
index <- FunSwap("n170", "n169")
dataset <- dataset[index]
rm(index, n170)

# Mechanical Thresher - number
n171 <- ifelse(dataset$n170 == 0, NA, rowSums(cbind (dataset$q54_e_1,dataset$q54_e_2), na.rm=TRUE))

dataset <- data.set(dataset, n171 = n171)
description(dataset$n171) <- "n171 - Number of  Mechanical Threshers both owned and rented"

index <- 1:788
index <- FunSwap("n171", "n170")
dataset <- dataset[index]
rm(index, n171)




# Harvester
n172 <- ifelse((dataset$q54_f_1 == 0 | is.na(dataset$q54_f_1)) &
                 (dataset$q54_f_2 == 0 | is.na(dataset$q54_f_2)), 0,
               ifelse((dataset$q54_f_2 == 0 | is.na(dataset$q54_f_2)), 1,
                      ifelse((dataset$q54_f_1 == 0 | is.na(dataset$q54_f_1)), 2,3)))

labels(n172) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n172 = n172)
description(dataset$n172) <- "n172 - Do you own and-or rent Harvester? "

index <- 1:789
index <- FunSwap("n172", "n171")
dataset <- dataset[index]
rm(index, n172)

# Harvester - number
n173 <- ifelse(dataset$n172 == 0, NA, rowSums(cbind (dataset$q54_f_1,dataset$q54_f_2), na.rm=TRUE))

dataset <- data.set(dataset, n173 = n173)
description(dataset$n173) <- "n173 - Number of  Harvesters both owned and rented"

index <- 1:790
index <- FunSwap("n173", "n172")
dataset <- dataset[index]
rm(index, n173)


# Irrigation pump
n174 <- ifelse((dataset$q54_g_1 == 0 | is.na(dataset$q54_g_1)) &
                 (dataset$q54_g_2 == 0 | is.na(dataset$q54_g_2)), 0,
               ifelse((dataset$q54_g_2 == 0 | is.na(dataset$q54_g_2)), 1,
                      ifelse((dataset$q54_g_1 == 0 | is.na(dataset$q54_g_1)), 2,3)))

labels(n174) <- c("None" =  0,
                  "Own only" =  1,
                  "Rent only" = 2,
                  "Own and rent" = 3)
dataset <- data.set(dataset, n174 = n174)
description(dataset$n174) <- "n174 - Do you own and-or rent Irrigation pump? "

index <- 1:791
index <- FunSwap("n174", "n173")
dataset <- dataset[index]
rm(index, n174)

# Irrigation pump - number
n175 <- ifelse(dataset$n174 == 0, NA, rowSums(cbind (dataset$q54_g_1,dataset$q54_g_2), na.rm=TRUE))

dataset <- data.set(dataset, n175 = n175)
description(dataset$n175) <- "n175 - Number of  Irrigation pumps both owned and rented"

index <- 1:792
index <- FunSwap("n175", "n174")
dataset <- dataset[index]
rm(index, n175)

## All machines, owned or rented
n176 <- rowSums(cbind(dataset$n163,dataset$n165, dataset$n167, dataset$n169,
               dataset$n171, dataset$n173, dataset$n175), na.rm=TRUE)


dataset <- data.set(dataset, n176 = n176)
description(dataset$n176) <- "n176 - Number of  total machines, both owned and rented"

index <- 1:793
index <- FunSwap("n176", "n175")
dataset <- dataset[index]
rm(index, n176)


## Save in both formats, data and dataset, 
###############################################################################
data <- as.data.frame(dataset)
save(data, dataset, file = "survey/data/survey.data02.RData" )




# ## 8. print codebook and List all variables in pdf file
# ###############################################################################
# write_html(codebook(dataset), file = "survey/reports/CodebookSurveyVariables.html")
# 
# library(knitr)
# library(rmarkdown)
# knit("survey/reports/old/SurveyListVariables.Rmd",
#      output= "survey/reports/old/SurveyListVariables.md")
# render("survey/reports/old/SurveyListVariables.md",
#        "pdf_document", output_dir ="survey/reports" )

# # 27/2/2017 19:28
