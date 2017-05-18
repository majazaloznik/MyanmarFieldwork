---
title: 'Myanmanr Census - Age distribution of "farming population"'
tables: yes
output:
  html_document:
    css: custom.css
    toc: yes
  word_document:
    toc: yes
---
    
library(knitr)
library(tidyverse)
library(memisc)
library(RColorBrewer)
kh01 <- as.data.frame(as.data.set(spss.system.file("census/outputs/KH01.sav")))

# Farming Population

#' Definition of farming population?
#' I only have data on *households* 
#'
#' So, households where:
#' 1. The head of the HH is in a farming occupation (ISCO classification category 6: Skilled Agricultural, Forestry and Fishery Workers), AND
#' 2. The head of the HH is not an employee. (His Activity status is either Employer or Contributing family worker) 
#' 
#' Then these are defined as farming households, and we have information on the heads of HH:
#' 
#' 



kh01.01 <- kh01 %>%
  filter(tablenumber_ == 1, var1 != "Total") %>%
  dplyr::select(-tablenumber_, -total, -command_, -subtype_, -var4, -var6, -label_) %>%
  dplyr::rename(region = var1, hh_type = var2, sex = var3, disability = var5) %>% 
  gather(key = age.group, value = count, 5:22 ) %>% 
  separate(age.group, c("A", "age.group")) %>% 
  dplyr::select(-A) %>% 
  filter(disability != "") %>% 
  filter(region != "Total",
         hh_type != "Total",
         sex != "Total",
         disability != "Total") %>% 
  dplyr::select(age.group, region, sex, disability, hh_type, count) %>% 
  arrange(age.group, region, sex, disability, hh_type) %>% 
  mutate(hh_type = ifelse(hh_type == "not farming", 0, 1)) %>% 
  group_by(age.group, region, sex, disability, hh_type) %>% 
  dplyr::summarise(count = sum(count, na.rm = TRUE)) %>% 
  ungroup() 
  

kh01.01 %>% 
  group_by(age.group, hh_type) %>% 
  dplyr::summarise(count = sum(count, na.rm = TRUE)) %>%  ungroup() %>% 
  mutate(age.group = as.character(age.group)) %>% 
  separate(age.group, 2, into = c("from", "to")) %>% 
  unite(age.group, from, to, sep = "-") %>% 
  mutate(age.group = ifelse(age.group == "14-", "-14", age.group))-> age.dist


age.dist %>% spread(hh_type, count, sep="_") %>% 
  dplyr::rename(non.farm = hh_type_0, 
                farm = hh_type_1) %>% 
  mutate(non.farm.percent = non.farm/sum(non.farm)*100,
         farm.percent = farm/sum(farm)*100) -> age.dist.table


yz <- barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, col = c("indianred2", "darkslategray2"), horiz = TRUE
)
text(-50000,colMeans(yz), age.dist.table[[1]], las = 2)



yz <- barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, col = c("indianred2", "darkslategray2"), horiz = TRUE
    )
text(-0.5,colMeans(yz), age.dist.table[[1]], las = 2)




