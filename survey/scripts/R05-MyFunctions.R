library(dplyr)
library(tidyr)
library(xtable)
library(knitr)
library(RColorBrewer)
library(memisc)
library(lattice)
require(grid)
require(latticeExtra)
require(HH)
# load("../data/survey.data02.RData")
# load("survey/data/survey.data02.RData")



## 1.2. Categorical variables by Region by age and by size of holding
###############################################################################
## TABLES 

FunR02Table <- function(var) {
  x <-  cbind(table(var ,data$n151 ),
              table(var ,data$n152 ),
              table(var ,data$n153 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  prop.table(x, 2)*100
}



Fun02Barplot <- function(var) {
  y <-  c(table(data$n151 ),
          table(data$n152 ),
          table(data$n153 ))
  par(mar = c(10,2,1,1), xpd = TRUE)
  barplot(FunR02Table(var), width = y, space = c(.5,.5,1,.5,1,.5,.5),
          col = colorRampPalette(brewer.pal(11, "Spectral"))(nrow(FunR02Table(var))),
          legend.text = rownames(FunR02Table(var)), args.legend = list(y = -15))
}

Fun02PrintTab<- function(var){
  kable(FunR02Table(var), digits = 2, booktabs = TRUE, padding = 10)
}





## 1.3. Categorical variables by Region and Age
###############################################################################

FunR03Table <- function(var) {
  var %>% table(Var = ., Age.group = data$n151 , Region = data$n152) %>% 
    prop.table(c(2,3)) 
}

Fun03PrintTab <- function(var) {
  tabz <- FunR03Table(var)
  cbind(`Dry zone - 60 or over (%)` = tabz[,1,1], 
        `Dry zone - under 60 (%)` = tabz[,2,1],
        `Delta zone - 60 or over (%)` = tabz[,1,2], 
        `Delta zone - under 60 (%)` = tabz[,2,2],
        `Total sample (%)` = prop.table(table(var)))*100 -> tab.print
  # remove row where there are no cases (otherwise a few errors..)
  row_sub = apply(tab.print, 1, function(row) !all(row == 0 ))
  tab.print <- tab.print[row_sub,]
  return(list(kable(tab.print, digits = 2, booktabs = TRUE, padding = 10),
              rownames(tab.print),
              tab.print))
}


Fun03Barplot <- function(var) {
  y <-  c(table(data$n151, data$n152))
  par(mfrow = c(2,1), xpd = TRUE)
  par(mar = c(3,6,1,9))
  barplot(Fun03PrintTab(var)[[3]][,1:2], horiz = TRUE, 
          main = "Dry zone",
          col = colorRampPalette(brewer.pal(11, "Spectral"))(length(Fun03PrintTab(var)[[2]])),
          legend.text = Fun03PrintTab(var)[[2]], args.legend = list( x = 101.01,y = 300, xjust = 0, cex = 0.7),
          width = y[1:2], las=2)
  barplot(Fun03PrintTab(var)[[3]][,3:4], horiz = TRUE,
          main = "Delta",
          col = colorRampPalette(brewer.pal(11, "Spectral"))(length(Fun03PrintTab(var)[[2]])),
          width = y[3:4], las=2)
}

## 1.4. Categorical variables by Region Only
###############################################################################
FunR04Table.region <- function(var) {
  x <-  cbind(table(var ,data$n152 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  prop.table(x, 2)*100
}

Fun04Barplot.region <- function(var) {
  y <- c(table(data$n152))
  par(mar = c(10,2,1,1), xpd = TRUE)
  barplot(FunR04Table.region(var), width = y, 
          col = colorRampPalette(brewer.pal(11, "Spectral"))(nrow(FunR04Table.region(var))),
          legend.text = rownames(FunR04Table.region(var)), args.legend = list(y = -15))
}

Fun04PrintTab.region<- function(var){
  kable(FunR04Table.region(var), digits = 2, booktabs = TRUE, padding = 10)
}

## 1.5. Categorical variables by age group  and total as well
###############################################################################
FunR05Table.age <- function(var) {
  x <-  cbind(table(var ,data$n151 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  cbind(Total = prop.table(table(var))*100,
        prop.table(x, 2)*100)
  
}

FunR05Barplot.age <- function(var) {
  y <- c(sum(table(data$n151)), table(data$n151))
  par(mar = c(10,2,1,1), xpd = TRUE)
  barplot(FunR05Table.age(var), width = y, space=c(1,.5,.5),
          col = colorRampPalette(brewer.pal(11, "Spectral"))(nrow(FunR05Table.age(var))),
          legend.text = rownames(FunR05Table.age(var)), args.legend = list(y = -15))
}

Fun05PrintTab.region<- function(var){
  kable(FunR05Table.age(var), digits = 2, booktabs = TRUE, padding = 10)
}

## 1.5. Categorical variables by age group& gender  and total as well
###############################################################################
FunR06Table.age <- function(var) {
  x <-  cbind(table(var ,data$n206 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  cbind(prop.table(x, 2)*100)
  
}

FunR06Barplot.age <- function(var) {
  y <- c(table(data$n206))
  par(mar = c(10,2,1,1), xpd = TRUE)
  barplot(FunR06Table.age(var), width = y,
          col = colorRampPalette(brewer.pal(11, "Spectral"))(nrow(FunR06Table.age(var))),
          legend.text = rownames(FunR06Table.age(var)), args.legend = list(y = -15))
}

Fun06PrintTab.region<- function(var){
  kable(FunR06Table.age(var), digits = 2, booktabs = TRUE, padding = 10)
}


## 2.2. Interval variables by Region by age and by size of holding
###############################################################################
## TABLES 

FunR02TableInt<- function(var){
  y <-  c(table(data$n151 ),
          table(data$n152 ),
          table(data$n153 ))
  data %>% 
    group_by(n151) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), median(., na.rm = TRUE), max(., na.rm = TRUE)), get(var)) %>%
    dplyr::rename( var = n151 ) -> x1
  
  data %>% 
    group_by(n152) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), median(., na.rm = TRUE), max(., na.rm = TRUE)), get(var)) %>%
    dplyr::rename( var = n152 ) -> x2
  
  data %>% 
    group_by(n153) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), median(., na.rm = TRUE), max(., na.rm = TRUE)), get(var)) %>%
    dplyr::rename( var = n153 ) -> x3
  
  tab <- t(rbind(x1,x2,x3)[2:5])
  colnames(tab) <- names(y)
  tab
}

Fun02PrintTabInt<- function(var){
  kable(FunR02TableInt(var), digits = 2, booktabs = TRUE, padding = 10)
}

Fun02BarplotInt <- function(var) {
  par(mar = c(5,2,1,1), xpd = TRUE)
  par(mfrow = c(1,3))
  boxplot(get(var) ~ n151, data)
  boxplot(get(var) ~ n152, data)
  boxplot(get(var) ~ n153, data)
  par(mfrow = c(1,1))
}




## 1.3. Interval variables by Region AND age 
###############################################################################
## TABLES 
###############################################################################

FunR03TableInt <- function(var) {
  data %>%
    group_by(n152, n151) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), median(., na.rm = TRUE),max(., na.rm = TRUE)), get(var))  %>%
    unite(gr, n152, n151, sep = " - ") -> x1
  tab <- t(x1[2:5])
  tab <- cbind(tab, t(summarise_each(data, funs(min(., na.rm = TRUE), median(., na.rm = TRUE), mean(., na.rm = TRUE), max(., na.rm = TRUE)), get(var))))
  colnames(tab) <- c(x1[[1]], "Total")
  tab
}

Fun03PrintTabInt<- function(var){
  kable(FunR03TableInt(var), digits = 2, booktabs = TRUE, padding = 10)
}

Fun03BarplotInt <- function(var) {
  par(mar = c(5,1.5,1,.1), xpd = TRUE)
  boxplot(get(var) ~ n151 + n152, data, cex.axis= 0.6)
  par(mfrow = c(1,1))
}


## 1.4. Categorical variables by Region Only
###############################################################################

FunR04TableInt.region<- function(var){
  y <-  c(table(data$n152))
  data %>% 
    group_by(n152) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), median(., na.rm = TRUE), max(., na.rm = TRUE)), get(var)) %>%
    dplyr::rename( var = n152 ) -> x2
  tab <- t(rbind(x2)[2:5])
  colnames(tab) <- names(y)
  tab
}

Fun04PrintTabInt.region<- function(var){
  kable(FunR04TableInt.region(var), digits = 2, booktabs = TRUE, padding = 10)
}

Fun04BarplotInt.region <- function(var) {
  par(mar = c(5,2,1,1), xpd = TRUE)
  par(mfrow = c(1,1))
  boxplot(get(var) ~ n152, data)
}



## Likert function


Fun03Likert <- function(var) {
  x <- table(data$n151, data$n152, var)
  x <- rbind(x[, 1, ], x[, 2, ])
  x <- prop.table(x, 1)*100
  rownames(x) <- NULL
  c("60 or over", "Under 60")
  rownames(x) <-
    c(paste(rep("Dry zone - ", 2), c("60 or over", "Under 60")),
      paste(rep("Delta zone - ", 2), c("60 or over", "Under 60")))
  
  likert(
    x,
    main = "",
    xlab = list("Percentage", cex = 0.75),
    cex.main = 2
  )
}