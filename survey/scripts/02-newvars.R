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
library(memisc)
# funciton for swapping the order of the columns when new var is introduced
FunSwap <- function(New, After) {
  from <- which(names(dataset)[index] == New)
  to <- which(names(dataset)[index] == After)
  index <- append(index, values = from, after = to)
  index <- index[-(from + 1)]
  return(index)
}

## 2. Additional reshaped data tables
###############################################################################
## 2.1. HH movers: one row per person moved out of HH (still NA row if none)
## reshape whole dataset to get a row per person moved out of HH (but keep sinlge)
## record for HH where noone moved out
data %>%
  gather(key, value,  q8id.01:q8_6.09) %>%
  filter(grepl('q', key)) %>%
  extract(key, c("question", "mover_id"), "(.+)\\.(..)") %>%
  spread(question, value) %>%
  arrange(question_no)  %>%
  filter(mover_id == "01" | !is.na(q8id)) -> data.movers


## 2.1.1. additional variables in movers dataset
###############################################################################

# is son moved out of hh
data.movers$m1 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(data.movers$q8_1 == "Children" &
           data.movers$q8_2 == "Male", 1, 0)
)
#  is daughter moved out of HH
data.movers$m2 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(
    data.movers$q8_1 == "Children" &
      data.movers$q8_2 == "Female",
    1,
    0
  )
)


# is son moved out of hh to get married
data.movers$m3 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(
    data.movers$q8_1 == "Children" &
      data.movers$q8_2 == "Male" &
      data.movers$q8_4 == "Marriage" ,
    1,
    0
  )
)
#  is daughter moved out of HH to get married
data.movers$m4 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(
    data.movers$q8_1 == "Children" &
      data.movers$q8_2 == "Female" &
      data.movers$q8_4 == "Marriage",
    1,
    0
  )
)

#  son moved out but in same village
data.movers$m5 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(
    data.movers$q8_1 == "Children" &
      data.movers$q8_2 == "Male" &
      data.movers$q8_5 %in% c("In same village/town in walking distance",
                              "IIn same village/town, not in walking distance"),
    1,
    0
  )
)

#  daugther moved for marriage but in same village (=> son in law in same village)
data.movers$m6 <- ifelse(
  is.na(data.movers$q8_1),
  0,
  ifelse(
    data.movers$q8_1 == "Children" &
      data.movers$q8_2 == "Female" &
      data.movers$q8_4 == "Marriage" &
      data.movers$q8_5 %in% c("In same village/town in walking distance",
                              "IIn same village/town, not in walking distance"),
    1,
    0
  )
)

## aggregate movers data back to 600 households - see below for adding n156 and n157back
data.movers %>%
  group_by(question_no) %>%
  summarise(
    n156 = ifelse(sum(m1) == 0, 0, 1),
    n157 = ifelse(sum(m2) == 0, 0, 1),
    n158 = ifelse(sum(m3) == 0, 0, 1),
    n159 = ifelse(sum(m4) == 0, 0, 1),
    n190 = ifelse(sum(m5) == 0, 0, 1),
    n191 = ifelse(sum(m6) == 0, 0, 1)
  ) -> hh.movers




###############################################################################
## 2.2. HH members: one row per HH member
## reshape whole dataset to get a row per person

data %>%
  gather(key, value,  hhmid.01:q7_6.12)%>%
  filter(grepl('q|hhmid', key)) %>%
  extract(key, c("question", "member_id"), "(.+)\\.(..)")   %>% 
  spread(question, value) %>%
  arrange(question_no)   %>%
  filter(!is.na(hhmid)) -> data.members


# is son in HH over 14 years old
data.members$v1 <- ifelse(data.members$q7_2 == "Children" &
           data.members$q7_3 == "Male" &
           data.members$q7_4 >= 14, 1, 0)

# is son in law in hh
data.members$v2 <- ifelse(data.members$q7_2 == "Children-in-law" &
                            data.members$q7_3 == "Male", 1, 0)


## aggregate movers data back to 600 households - see below for adding vars back
data.members %>%
  group_by(question_no) %>%
  summarise(
    n192 = ifelse(sum(v1) == 0, 0, 1),
    n193 = ifelse(sum(v2) == 0, 0, 1)
  ) -> hh.members



##  3. additional variables:
###############################################################################

# N 153 dividing by size of landholding
dataset$n153 <- ifelse(dataset$q17 <= 5 | is.na(dataset$q17),
               0,
               ifelse(dataset$q17 <= 10, 1, 2))
labels(dataset$n153) <- c(
  "up to 5 acres" =  0,
  "5 to 10 acres" =  1,
  "over 10 acres" =  2
)

description(dataset$n153) <-
  "N153 - Landholding size - three groups"

index <- 1:770
index <- FunSwap("n153", "q17")
dataset <- dataset[index]
rm(index)

# N154 age groups 10 years
n154 <- ifelse(dataset$q2 <= 29, 0,
               ifelse(dataset$q2 <= 39, 1,
                      ifelse(
                        dataset$q2 <= 49, 2,
                        ifelse(dataset$q2 <= 59, 3,
                               ifelse(
                                 dataset$q2 <= 69, 4,
                                 ifelse(dataset$q2 <= 79, 5,
                                        ifelse(
                                          dataset$q2 <= 89, 6,
                                          ifelse(dataset$q2 <=
                                                   99, 7)
                                        ))
                               ))
                      )))

labels(n154) <- c(
  "under 30" =  0,
  "30 to 39" =  1,
  "40 to 49" =  2,
  "50 to 59" =  3,
  "60 to 69" =  4,
  "70 to 79" =  5,
  "80 to 89" =  6,
  "90 to 99" =  7
)
dataset <- data.set(dataset, n154 = n154)
description(dataset$n154) <- "N154 - Age group (10 year groups)"

index <- 1:771
index <- FunSwap("n154", "q2")
dataset <- dataset[index]
rm(index, n154)

description(dataset$q6_a) <-
  "Q6.A. Do you have difficulty with seeing, even if wearing glasses?"
description(dataset$q6_b) <-
  "Q6.B. Do you have difficulty with hearing, even if using a hearing aid?"
description(dataset$q6_c) <-
  "Q6.C. Do you have difficulty with walking?"
description(dataset$q6_d) <-
  "Q6.D. Do you have difficulty with climbing steps?"
description(dataset$q6_e) <-
  "Q6.E. Do you have difficulty with carrying heavy items?"
description(dataset$q6_f) <-
  "Q6.F. Do you have difficulty with remembering things?"
description(dataset$q6_g) <-
  "Q6.G. Do you have difficulty with Concentrating?"
description(dataset$q6_h) <-
  "Q6.H. Do you have difficulty with none of the above?"


# N155 HH size grouped
n155 <- ifelse(dataset$q7 <= 2, 0,
               ifelse(dataset$q7 <= 5, 1,
                      ifelse(dataset$q7 <= 10, 2, 3)))

labels(n155) <- c(
  "up to 2" =  0,
  "3 to 5" =  1,
  "6 to 10" =  2,
  "over" =  3
)
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
description(dataset$n156) <-
  "N156 - Household has had (at least one) son move out"

index <- 1:773
index <- FunSwap("n156", "n17")
dataset <- dataset[index]
rm(index, n156)

# N157 HH has had daughter move out
n157 <- hh.movers$n157

labels(n157) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n157 = n157)
description(dataset$n157) <-
  "N157 - Household has had (at least one) daughter move out"

index <- 1:774
index <- FunSwap("n157", "n156")
dataset <- dataset[index]
rm(index, n157)




# N158 HH has had son move out to get married
n158 <- hh.movers$n158

labels(n158) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n158 = n158)
description(dataset$n158) <-
  "N158 - Household has had (at least one) son move out in order to get married"

index <- 1:775
index <- FunSwap("n158", "n157")
dataset <- dataset[index]
rm(index, n158)

# N159 HH has had daughter move out to get married
n159 <- hh.movers$n159

labels(n159) <- c("No" =  0,
                  "Yes" =  1)
dataset <- data.set(dataset, n159 = n159)
description(dataset$n159) <-
  "N159 - Household has had (at least one) daughter move out in order to get married"

index <- 1:776
index <- FunSwap("n159", "n158")
dataset <- dataset[index]
rm(index, n159)



# N160  generation type

hh.relationships <- subset(data, select = q7_2.01:q7_2.15)

FunGen <- function(var) {
  ifelse(as.numeric(var) %in% c(1, 2, 8, 9, 10),
         0,
         ifelse(
           as.numeric(var) %in% c(3, 5),
           -1,
           ifelse (as.numeric(var) == 4 ,-2,
                   ifelse(as.numeric(var) %in% c(6, 7), 1, NA))
         ))
}

for (i in 1:15) {
  new.n <- paste0("n160.", i)
  assign(new.n, FunGen(hh.relationships[, i]))
}

# todo add labesl
hh.gens <-
  cbind(
    question_no = data$question_no,
    n160.1,
    n160.2,
    n160.3,
    n160.4,
    n160.5,
    n160.6,
    n160.7,
    n160.8,
    n160.9,
    n160.10,
    n160.11,
    n160.12,
    n160.13,
    n160.14,
    n160.15
  )

hh.gens %>%
  as.data.frame() %>%
  gather(key, value,-question_no) %>%
  group_by(question_no) %>%
  arrange(question_no) %>%
  mutate(no = sum(!is.na(unique(value, na_rm = TRUE)))) %>%
  summarize(no = mean(no)) -> hh.gens



n160 <- hh.gens$no
labels(n160) <-
  c(
    "One (of respondent)" = 1,
    "Two" = 2,
    "Three" = 3,
    "Four" = 4
  )

dataset <- data.set(dataset, n160 = n160)
description(dataset$n160) <-
  "N160 - NUmber of generations living in household"

index <- 1:777
index <- FunSwap("n160", "q7_2.15")
dataset <- dataset[index]
rm(index, n160)

rm(
  hh.relationships,
  n160.1,
  n160.2,
  n160.3,
  n160.4,
  n160.5,
  n160.6,
  n160.7,
  n160.8,
  n160.9,
  n160.10,
  n160.11,
  n160.12,
  n160.13,
  n160.14,
  n160.15,
  hh.gens,
  FunGen
)

## Fix N35, which has 13 cases missing of "other family,
new.labs <- labels(dataset$n35) + c("Other nonHH family" = 88)
desc <- description(dataset$n35)
dataset$n35 <- ifelse(dataset$q24_c_id == 88, 88, dataset$n35)
description(dataset$n35) <- desc
labels(dataset$n35) <- new.labs
labels(dataset$q24_c_id) <- NULL
rm(new.labs)

# Now have to fix n36 as well, since it depended on N35
new.labs <- labels(dataset$n36) + c("Other nonHH family" = 88)
desc <- description(dataset$n36)
dataset$n36 <- ifelse(is.na(dataset$n35), dataset$n34, dataset$n35)
description(dataset$n36) <- desc
labels(dataset$n36) <- new.labs
rm(new.labs, desc)

## fix N64 to N68 by grouping years since they have done sth..

new.labs <- labels(dataset$n64) + c(
  "Under 5 years ago" = 1,
  "Between 5 and 10 years ago" = 2,
  "Between 10 and 20 years ago" = 3,
  "Over 10 years ago" = 4
)
desc <- description(dataset$n64)
dataset$n64 <- ifelse(as.numeric(dataset$n64) == 0,
                      0,
                      ifelse(
                        as.numeric(dataset$n64) <= 5,
                        1,
                        ifelse(
                          as.numeric(dataset$n64) <= 10,
                          2,
                          ifelse(as.numeric(dataset$n64) <= 20, 3,
                                 ifelse(as.numeric(dataset$n64) < 99, 4, 99))
                        )
                      ))

labels(dataset$n64) <- new.labs
description(dataset$n64) <- desc

## N65
desc <- description(dataset$n65)
dataset$n65 <- ifelse(as.numeric(dataset$n65) == 0,
                      0,
                      ifelse(
                        as.numeric(dataset$n65) <= 5,
                        1,
                        ifelse(
                          as.numeric(dataset$n65) <= 10,
                          2,
                          ifelse(as.numeric(dataset$n65) <= 20, 3,
                                 ifelse(as.numeric(dataset$n65) < 99, 4, 99))
                        )
                      ))

labels(dataset$n65) <- new.labs
description(dataset$n65) <- desc

## N66
desc <- description(dataset$n66)
dataset$n66 <- ifelse(as.numeric(dataset$n66) == 0,
                      0,
                      ifelse(
                        as.numeric(dataset$n66) <= 5,
                        1,
                        ifelse(
                          as.numeric(dataset$n66) <= 10,
                          2,
                          ifelse(as.numeric(dataset$n66) <= 20, 3,
                                 ifelse(as.numeric(dataset$n66) < 99, 4, 99))
                        )
                      ))

labels(dataset$n66) <- new.labs
description(dataset$n66) <- desc

## N67
desc <- description(dataset$n67)
dataset$n67 <- ifelse(as.numeric(dataset$n67) == 0,
                      0,
                      ifelse(
                        as.numeric(dataset$n67) <= 5,
                        1,
                        ifelse(
                          as.numeric(dataset$n67) <= 10,
                          2,
                          ifelse(as.numeric(dataset$n67) <= 20, 3,
                                 ifelse(as.numeric(dataset$n67) < 99, 4, 99))
                        )
                      ))

labels(dataset$n67) <- new.labs
description(dataset$n67) <- desc


## N68
desc <- description(dataset$n68)
dataset$n68 <- ifelse(as.numeric(dataset$n68) == 0,
                      0,
                      ifelse(
                        as.numeric(dataset$n68) <= 5,
                        1,
                        ifelse(
                          as.numeric(dataset$n68) <= 10,
                          2,
                          ifelse(as.numeric(dataset$n68) <= 20, 3,
                                 ifelse(as.numeric(dataset$n68) < 99, 4, 99))
                        )
                      ))

labels(dataset$n68) <- new.labs
description(dataset$n68) <- desc


# total number of draught animals owned or rented
n161 <- rowSums(
  cbind (
    data$q53_a_1_cows,
    data$q53_a_2_cows,
    data$q53_b_1_buffaloes,
    data$q53_b_2_buffaloes
  ),
  na.rm = TRUE
)

dataset <- data.set(dataset, n161 = n161)
description(dataset$n161) <-
  "N161 - Number of draught animals both owned and rented"

index <- 1:778
index <- FunSwap("n161", "q53_d")
dataset <- dataset[index]
rm(index, n161)

# Own or rent machinery:
# plough/tiller
n162 <- ifelse((dataset$q54_a_1 == 0 | is.na(dataset$q54_a_1)) &
                 (dataset$q54_a_2 == 0 | is.na(dataset$q54_a_2)),
               0,
               ifelse((
                 dataset$q54_a_2 == 0 | is.na(dataset$q54_a_2)
               ), 1,
               ifelse((
                 dataset$q54_a_1 == 0 | is.na(dataset$q54_a_1)
               ), 2, 3)))

labels(n162) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n162 = n162)
description(dataset$n162) <-
  "N162 - Do you own and-or rent Plough-tiller for use with draught animals? "

index <- 1:779
index <- FunSwap("n162", "q54_a_3")
dataset <- dataset[index]
rm(index, n162)

# plough/tiller
n163 <-
  ifelse(dataset$n162 == 0, NA, rowSums(cbind (dataset$q54_a_1, dataset$q54_a_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n163 = n163)
description(dataset$n163) <-
  "N163 - Number of Plough-tiller for use with draught animals both owned and rented"

index <- 1:780
index <- FunSwap("n163", "n162")
dataset <- dataset[index]
rm(index, n163)

# hand tractor
n164 <- ifelse((dataset$q54_b_1 == 0 | is.na(dataset$q54_b_1)) &
                 (dataset$q54_b_2 == 0 | is.na(dataset$q54_b_2)),
               0,
               ifelse((
                 dataset$q54_b_2 == 0 | is.na(dataset$q54_b_2)
               ), 1,
               ifelse((
                 dataset$q54_b_1 == 0 | is.na(dataset$q54_b_1)
               ), 2, 3)))

labels(n164) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n164 = n164)
description(dataset$n164) <-
  "N164 - Do you own and-or rent Hand tractor (power tiller?) "

index <- 1:781
index <- FunSwap("n164", "n163")
dataset <- dataset[index]
rm(index, n164)

# hand tractor - number
n165 <-
  ifelse(dataset$n164 == 0, NA, rowSums(cbind (dataset$q54_b_1, dataset$q54_b_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n165 = n165)
description(dataset$n165) <-
  "N165 - Number of  Hand tractor (power tiller) both owned and rented"

index <- 1:782
index <- FunSwap("n165", "n164")
dataset <- dataset[index]
rm(index, n165)



# Drum seeder
n166 <- ifelse((dataset$q54_c_1 == 0 | is.na(dataset$q54_c_1)) &
                 (dataset$q54_c_2 == 0 | is.na(dataset$q54_c_2)),
               0,
               ifelse((
                 dataset$q54_c_2 == 0 | is.na(dataset$q54_c_2)
               ), 1,
               ifelse((
                 dataset$q54_c_1 == 0 | is.na(dataset$q54_c_1)
               ), 2, 3)))

labels(n166) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n166 = n166)
description(dataset$n166) <-
  "N166 - Do you own and-or rent Drum seeder? "

index <- 1:783
index <- FunSwap("n166", "n165")
dataset <- dataset[index]
rm(index, n166)

# drum seeders - number
n167 <-
  ifelse(dataset$n166 == 0, NA, rowSums(cbind (dataset$q54_c_1, dataset$q54_c_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n167 = n167)
description(dataset$n167) <-
  "N167 - Number of  Drum seeders both owned and rented"

index <- 1:784
index <- FunSwap("n167", "n166")
dataset <- dataset[index]
rm(index, n167)


# Tractor
n168 <- ifelse((dataset$q54_d_1 == 0 | is.na(dataset$q54_d_1)) &
                 (dataset$q54_d_2 == 0 | is.na(dataset$q54_d_2)),
               0,
               ifelse((
                 dataset$q54_d_2 == 0 | is.na(dataset$q54_d_2)
               ), 1,
               ifelse((
                 dataset$q54_d_1 == 0 | is.na(dataset$q54_d_1)
               ), 2, 3)))

labels(n168) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n168 = n168)
description(dataset$n168) <-
  "n168 - Do you own and-or rent Tractor? "

index <- 1:785
index <- FunSwap("n168", "n167")
dataset <- dataset[index]
rm(index, n168)

# Tractors - number
n169 <-
  ifelse(dataset$n168 == 0, NA, rowSums(cbind (dataset$q54_d_1, dataset$q54_d_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n169 = n169)
description(dataset$n169) <-
  "n169 - Number of  Tractors both owned and rented"

index <- 1:786
index <- FunSwap("n169", "n168")
dataset <- dataset[index]
rm(index, n169)



# Mechanical Thresher
n170 <- ifelse((dataset$q54_e_1 == 0 | is.na(dataset$q54_e_1)) &
                 (dataset$q54_e_2 == 0 | is.na(dataset$q54_e_2)),
               0,
               ifelse((
                 dataset$q54_e_2 == 0 | is.na(dataset$q54_e_2)
               ), 1,
               ifelse((
                 dataset$q54_e_1 == 0 | is.na(dataset$q54_e_1)
               ), 2, 3)))

labels(n170) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n170 = n170)
description(dataset$n170) <-
  "n170 - Do you own and-or rent Mechanical Thresher? "

index <- 1:787
index <- FunSwap("n170", "n169")
dataset <- dataset[index]
rm(index, n170)

# Mechanical Thresher - number
n171 <-
  ifelse(dataset$n170 == 0, NA, rowSums(cbind (dataset$q54_e_1, dataset$q54_e_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n171 = n171)
description(dataset$n171) <-
  "n171 - Number of  Mechanical Threshers both owned and rented"

index <- 1:788
index <- FunSwap("n171", "n170")
dataset <- dataset[index]
rm(index, n171)




# Harvester
n172 <- ifelse((dataset$q54_f_1 == 0 | is.na(dataset$q54_f_1)) &
                 (dataset$q54_f_2 == 0 | is.na(dataset$q54_f_2)),
               0,
               ifelse((
                 dataset$q54_f_2 == 0 | is.na(dataset$q54_f_2)
               ), 1,
               ifelse((
                 dataset$q54_f_1 == 0 | is.na(dataset$q54_f_1)
               ), 2, 3)))

labels(n172) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n172 = n172)
description(dataset$n172) <-
  "n172 - Do you own and-or rent Harvester? "

index <- 1:789
index <- FunSwap("n172", "n171")
dataset <- dataset[index]
rm(index, n172)

# Harvester - number
n173 <-
  ifelse(dataset$n172 == 0, NA, rowSums(cbind (dataset$q54_f_1, dataset$q54_f_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n173 = n173)
description(dataset$n173) <-
  "n173 - Number of  Harvesters both owned and rented"

index <- 1:790
index <- FunSwap("n173", "n172")
dataset <- dataset[index]
rm(index, n173)


# Irrigation pump
n174 <- ifelse((dataset$q54_g_1 == 0 | is.na(dataset$q54_g_1)) &
                 (dataset$q54_g_2 == 0 | is.na(dataset$q54_g_2)),
               0,
               ifelse((
                 dataset$q54_g_2 == 0 | is.na(dataset$q54_g_2)
               ), 1,
               ifelse((
                 dataset$q54_g_1 == 0 | is.na(dataset$q54_g_1)
               ), 2, 3)))

labels(n174) <- c(
  "None" =  0,
  "Own only" =  1,
  "Rent only" = 2,
  "Own and rent" = 3
)
dataset <- data.set(dataset, n174 = n174)
description(dataset$n174) <-
  "n174 - Do you own and-or rent Irrigation pump? "

index <- 1:791
index <- FunSwap("n174", "n173")
dataset <- dataset[index]
rm(index, n174)

# Irrigation pump - number
n175 <-
  ifelse(dataset$n174 == 0, NA, rowSums(cbind (dataset$q54_g_1, dataset$q54_g_2), na.rm =
                                          TRUE))

dataset <- data.set(dataset, n175 = n175)
description(dataset$n175) <-
  "n175 - Number of  Irrigation pumps both owned and rented"

index <- 1:792
index <- FunSwap("n175", "n174")
dataset <- dataset[index]
rm(index, n175)

## All machines, owned or rented
n176 <-
  rowSums(
    cbind(
      dataset$n163,
      dataset$n165,
      dataset$n167,
      dataset$n169,
      dataset$n171,
      dataset$n173,
      dataset$n175
    ),
    na.rm = TRUE
  )


dataset <- data.set(dataset, n176 = n176)
description(dataset$n176) <-
  "n176 - Number of  total machines, both owned and rented"

index <- 1:793
index <- FunSwap("n176", "n175")
dataset <- dataset[index]
rm(index, n176)

## n177, 178 - gender of managing or co-managing HH member
## n179, 180 - managing or co-managing HH member is child or child in law
# n181, n182 - so or son in law
dataset %>% as.data.frame() %>%
  mutate(
    n177 = ifelse(q24_b_id == 1, q7_3.01,
                  ifelse(
                    q24_b_id == 2, q7_3.02,
                    ifelse(q24_b_id == 3, q7_3.03,
                           ifelse(
                             q24_b_id == 4, q7_3.04,
                             ifelse(q24_b_id == 5, q7_3.05,
                                    ifelse(q24_b_id == 6, q7_3.06, 0))
                           ))
                  )),
    n178 = ifelse(q24_c_id == 1, q7_3.01,
                  ifelse(
                    q24_c_id == 2, q7_3.02,
                    ifelse(q24_c_id == 3, q7_3.03,
                           ifelse(
                             q24_c_id == 4, q7_3.04,
                             ifelse(q24_c_id == 5, q7_3.05,
                                    ifelse(q24_c_id == 6, q7_3.06, 0))
                           ))
                  )),
    n179 = ifelse(n34 %in% c("Children", "Children-in-law"), 1, 0),
    n180 = ifelse(n35 %in% c("Children", "Children-in-law"), 1, 0),
    n181 = ifelse(n36 %in% c("Children", "Children-in-law"), 1, 0)
    ) %>% dplyr::select(q24, n177:n181) -> new

# n177: **if (co-) manager is other family member, we don't know gender/age, etc
dataset <- data.set(dataset, n177 = new$n177)
labels(dataset$n177) <- c("Ohter family member" =  0,
                          "Male" =  1,
                          "Female" = 2)
description(dataset$n177) <-
  "n177 - Gender of other family member helping manage the farm (from q24_b_id)"

## n178
dataset <- data.set(dataset, n178 = new$n178)
labels(dataset$n178) <- c("Ohter family member" =  0,
                          "Male" =  1,
                          "Female" = 2)
description(dataset$n178) <-
  "n178 - Gender of other family member managing the farm (from q24_c_id)"

## n179
dataset <- data.set(dataset, n179 = new$n179)
labels(dataset$n179) <- c("Child (in law) co-managing" =  1,
                      "Not" =  0)
description(dataset$n179) <-
  "N179 - child or child in law helping manage the farm (q24_b_id)"

## n180
dataset <- data.set(dataset, n180 = new$n180)
labels(dataset$n180) <- c("Child (in law) managing" =  1,
                          "Not" =  0)
description(dataset$n180) <-
  "N180 - child or child in law managing the farm (q24_c_id)"

## n181
dataset <- data.set(dataset, n181 = new$n181)
labels(dataset$n181) <- c("Child (in law) (co-)managing" =  1,
                          "Not" =  0)
description(dataset$n181) <-
  "N181 - child or child in law helping manage or managing the farm (n179 and n180)"


# N182 - Farm management type with relation to children (inlaw)  (co-)managing
new %>% 
  mutate(n182 = ifelse((!is.na(n177) & n177 == 1 | 
                          !is.na(n178) & n178 == 1  ) & n181 == 1 , 1,
                       ifelse((!is.na(n177) & n177 == 2 | 
                                 !is.na(n178) & n178 == 2  ) & n181 == 1, 2, 
                              ifelse(q24 == "Me alone", 0,
                                     ifelse (q24 == "A tenant", 4,3)))))  -> new

dataset <- data.set(dataset, n182 = new$n182)
labels(dataset$n182) <- c("Alone" =  0,
                          "Son (or son-in-law) (co-)managing" =  1,
                          "Daughter (or daughter-in-law) (co-)managing" =  2, 
                          "Other family member (co-)managing" = 3,
                          "A tenant" = 4)

description(dataset$n182) <-
  "N182 - Farm management type with relation to children (inlaw)  (co-)managing (q24, b,c,& q7_3)"


# N183 - number of different household members listed as helping in at least one of the 5 farming tasks
data %>% 
  dplyr::select(starts_with("q34_"), question_no) %>% 
  dplyr::select(ends_with("_2_id"), question_no) %>% 
  gather(var.key, hh.member.id, -(ncol(.))) %>% 
  group_by(question_no) %>% 
  arrange(question_no) %>% 
  mutate(hh.members.helping = length(unique(hh.member.id[!is.na(hh.member.id) & hh.member.id > 0 ])),
         respondent.helping = any(hh.member.id[!is.na(hh.member.id)] == 1)) %>% 
  summarise(n183 = first(hh.members.helping),
            n184 = first(respondent.helping)) -> tmp

dataset <- data.set(dataset, n183 = unlist(tmp$n183))
description(dataset$n183) <- paste0("N183 - number of different household members",
                                    "listed as helping in at least one of the 5 farming tasks",
                                    "(from all 25  variables with q34_*_2_id pattern)")

# N184 - Is respondedt listed as helping in at least one of the 5 farming tasks
dataset <- data.set(dataset, n184 = unlist(tmp$n184))
description(dataset$n184) <- "N184 - does the respondent help with at least one of the 5 farming tasks"

labels(dataset$n184) <- c("No" =  0,
                          "Yes" =  1)

# N185 - number of person days of household labour used to perform the 5 farming tasks
# turns out this is already in N103, but never hurts to double check.
data %>%
  dplyr::select(starts_with("q34_"), question_no) %>%
  dplyr::select(ends_with("_3_days"), question_no) %>%
  gather(var.key, no.days,-(ncol(.))) %>%
  group_by(question_no) %>%
  arrange(question_no) %>%
  mutate(total.no.days = sum(no.days[!is.na(no.days)])) %>%
  summarise(n185 = first(total.no.days)) %>% dplyr::select(n185) %>% 
  unlist() -> n185
dataset <- data.set(dataset, n185 = n185)
description(dataset$n185) <- "N185 - number of person days of household labour used to perform the 5 farming tasks"

# N186 - average number of days labouring at the five farming tasks per household member
dataset$n186 <- dataset$n185 / dataset$n183
description(dataset$n186) <- "N186 - average number of days per HH member helping to perform the 5 farming tasks"

# N187 - HH labour pattern (number of members and head of HHs involvment) (from N184 and N183)
n187 <- ifelse(!dataset$n184 & dataset$n183 == 0, 0, 
               ifelse(dataset$n184 & dataset$n183 == 1, 1, 
                      ifelse(dataset$n184 & dataset$n183 == 2, 2, 
                             ifelse(dataset$n184 & dataset$n183 == 3, 3,
                                    ifelse(dataset$n184 & dataset$n183 >= 4, 4,
                                           ifelse(!dataset$n184 & dataset$n183 == 1, 5, 6))))))


dataset$n187 <- n187
description(dataset$n187) <- "N187 - HH labour pattern (number of members and head of HHs involvment) (from N184 and N183)"

labels(dataset$n187) <- c("No HH farm labour" =  0,
                          "Head of HH only" =  1,
                          "HoH plus one" =  2, 
                          "HoH plus two" = 3,
                          "HoH plus three or more" = 4,
                          "One non HoH labourer" = 5,
                          "Two or more non HoH labourers" = 6)



# N188 - Ratio of HH to hired labour (100 = all HH, 0 == all hired) - from n185 and n121
n188 <- dataset$n185/(dataset$n185 + dataset$n121)
dataset$n188 <- n188
description(dataset$n188) <- "N188 - Ratio of HH to hired labour (100 = all HH, 0 == all hired) from n185 and n121"


# N189 - Allmost all HH labour or all hired labour - or sth in between - (from n188)
n189 <- ifelse(n188 <= 0.05 , 0, 
               ifelse(n188 >= 0.95 , 2, 1))
dataset$n189 <- n189
description(dataset$n189) <- "N189 - Allmost all HH labour or all hired labour (5%)- or sth in between (from n188)"


labels(dataset$n189) <- c("under 5% household labour" =  0,
                          "Under 5% hired labour" =  2,
                          "In bewteen" =  1)
                          




# N190 HH has had son move out but stay in same village
dataset$n190 <- hh.movers$n190

labels(dataset$n190) <- c("No" =  0,
                  "Yes" =  1)

description(dataset$n190) <-
  "N190 - Household has had (at least one) son move out but remain in same village/town"
rm(n190)

# N191 HH has had daughter move out to get married but stay in same village - 
# so we assume a son in law lives in the same village
dataset$n191 <- hh.movers$n191

labels(dataset$n191) <- c("No" =  0,
                  "Yes" =  1)
description(dataset$n191) <-
  "N191 - Household has had (at least one) daughter move out to marry in same village/town"


# N192 has son over 14 years old in HH
dataset$n192 <- hh.members$n192

labels(dataset$n192) <- c("No" =  0,
                  "Yes" =  1)
description(dataset$n192) <-
  "N192 - Household has had (at least one) son aged 14 or over"



# N193 has a son in law in the HH
dataset$n193 <- hh.members$n193
labels(dataset$n193) <- c("No" =  0,
                  "Yes" =  1)
description(dataset$n193) <-
  "N193 - Household has (at least one) son in law living there"


# N194  HH has son over 14 in HH or in village
dataset$n194 <- ifelse(dataset$n190 == 1 | dataset$n192 == 1, 1, 0)
labels(dataset$n194) <- c("No" =  0,
                          "Yes" =  1)
description(dataset$n194) <-
  "N194 - Household has  (at least one) son aged 14 or over in HH or in village"

# N195  HH has son over 14 in HH or in village
dataset$n195 <- ifelse(dataset$n191 == 1 | dataset$n193 == 1, 1, 0)
labels(dataset$n195) <- c("No" =  0,
                          "Yes" =  1)
description(dataset$n195) <-
  "N195 - Household has (at least one) son-in-law in HH or in village"

# N196 sons and son in laws
dataset$n196 <- ifelse(dataset$n194 ==1 & dataset$n195 ==1, 1,
                       ifelse(dataset$n194 == 1, 2,
                              ifelse(dataset$n195 ==1, 3,4)))
labels(dataset$n196) <- c("Both Son and son-in-law in HH/village" =  1,
                          "Son in HH/village" =  2,
                          "Son-in-law in HH/village" = 3,
                          "Neither son nor son-in-law in HH/village" = 4)

description(dataset$n196) <-
  "N196 - Household access to sons and son-in-laws in HH/village"

# N197 Is farming HH (manage or co-manage)
dataset$n197 <- ifelse(dataset$q24 =="A tenant", 0, 1)
labels(dataset$n197) <- c("No" =  0,
                         "Yes" =  1)
description(dataset$n197) <-
  "N197 - Household manages it's own farmland"

# N198 sons and son in laws farm only
dataset$n198 <- dataset$n196
dataset$n198[dataset$n197==0] <- NA

description(dataset$n198) <-
  "N198 - Farming household's access to sons and son-in-laws in HH/village"


# n199 - HoH managing and working combinations
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
  "Doesn't work & doesn't manage" = 1,
  "Doesn't work & co-manages with family member" = 2,
  "Doesn't work but manage alone" = 3,
  "Works in the field & co-manages" = 4,
  "Works in the field & manages alone" = 5
)

description(dataset$n199) <-
  "N199 - Head of HH cobmination of working in field and managing the farm"

# N200 - N187 but only for manage/co-manage HH labour pattern (number of members and head of HHs involvment) (from N184 and N183)



dataset$n200 <- dataset$n187
dataset$n200 <- ifelse(!dataset$q24 %in% c("A tenant", "Another family  member"), dataset$n200, NA)

description(dataset$n200) <- "N200 - HH labour pattern (number of members and head of HHs involvment)  only HH where HoH manages or co-manages, (from N187 and Q24)"

labels(dataset$n200) <- c("No HH farm labour" =  0,
                          "Head of HH only" =  1,
                          "HoH plus one" =  2, 
                          "HoH plus two" = 3,
                          "HoH plus three or more" = 4,
                          "One non HoH labourer" = 5,
                          "Two or more non HoH labourers" = 6)



# N201 - N160 & q7 single generation and single person

dataset$n201 <- ifelse(dataset$q7 == 1, 1,
                       ifelse(dataset$n160 == 1, 2, 3))


description(dataset$n201) <- "N201 - Single generation or single person households (from N160 and Q7)"

labels(dataset$n201) <- c("Single person" =  1,
                          "Single generation " =  2,
                          "Two or more generations" =  3)

# N202 number of working age children  and N204 number of working age sons in hh

data %>% 
  dplyr::select(starts_with("q7_")) %>% 
  tibble::rownames_to_column() %>% 
  gather(key, value, -rowname) %>% 
  separate(key, into = c("var", "id"), sep = "[.]") %>% 
  spread(key = var, value = value)  %>% 
  mutate(child_under16 = ifelse(q7_2 == "Children" & q7_4 <=16, 2,
                                ifelse(q7_2 == "Children", 1, 0)),
         son_over16 = ifelse(child_under16 == 1 & q7_3 == "Male", 1, 0 )) %>% 
  group_by(rowname)  %>% 
  mutate(n202 =ifelse(all(child_under16 == 0, na.rm = TRUE)== TRUE, 0,
                      ifelse(any(child_under16 == 1, na.rm = TRUE) == TRUE, 1, 2))) %>% 
  mutate(n204 = ifelse(any(son_over16 == 1, na.rm = TRUE) == TRUE,  2,
                       ifelse(any(n202 == 1, na.rm = TRUE) == TRUE, 1, 0))) %>% 
  summarise(n204 = first(n204),
            n202 = first(n202)) %>% 
  mutate(rowname = as.numeric(rowname)) %>% 
  arrange(rowname) %>% 
  dplyr::select(n202, n204) -> x


dataset$n202 <- x$n202
description(dataset$n202) <- "N202 - HH with or without working age children (from N160 and Q7)"

labels(dataset$n202) <- c("No children" =  0,
                          "At least one child over 16" =  1,
                          "Only children 16 or younger" =  2)


dataset$n204 <- x$n204

description(dataset$n204) <- "N204 - HH with or without working age children (from N160 and Q7)"

labels(dataset$n204) <- c("No children over 16" =  0,
                          "At least one son over 16" =  2,
                          "Only daughters over 16" =  1)



# N205 - 2 or 3 gen with or without working age children in HH

dataset$n205 <- ifelse(dataset$n201 == 1, 1,
                       ifelse(dataset$n201 == 2, 2, 
                              ifelse(dataset$n160 == 2 & dataset$n204 == 0, 3, 
                                     ifelse(dataset$n160 == 2 & dataset$n204 == 1, 4, 
                                            ifelse(dataset$n160 == 2 & dataset$n204 == 2, 5, 
                                                   ifelse(dataset$n204 == 0, 6, 
                                                          ifelse(dataset$n204 == 1, 7,8))))))) 


description(dataset$n205) <- "N205 - No of generations and working age sons (from N160 and Q7)"

labels(dataset$n205) <- c("Single person" =  1,
                          "Single generation " =  2,
                          "Two gen no kids of working age" =  3,
                          "Two gen only daughters of working age" =  4,
                          "Two gen at least one son of working age" =  5,
                          "More gen no kids of working age" =  6,
                          "More gen only daughters of working age" =  7,
                          "More gen at least one son of working age" =  8)




## Save in both formats, data and dataset,
###############################################################################
data <- as.data.frame(dataset)
save(data, dataset, file = "survey/data/survey.data03.RData")




# ## 8. print codebook and List all variables in pdf file
# ###############################################################################
write_html(codebook(dataset), file = "survey/reports/CodebookSurveyVariables.html")

library(knitr)
library(rmarkdown)
knit("survey/reports/old/SurveyListVariables.Rmd",
     output= "survey/reports/old/SurveyListVariables.md")
render("survey/reports/old/SurveyListVariables.md",
       "pdf_document", output_dir ="survey/reports" )

# # 27/2/2017 19:28
