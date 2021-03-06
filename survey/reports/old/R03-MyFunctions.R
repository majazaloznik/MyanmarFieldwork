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
#load("../data/survey.data02.RData")
# load("survey/data/survey.data02.RData")

## FUN1 categorical variables
###############################################################################
## TABLES

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
  par(mar = c(3,2,1,9))
  barplot(Fun03PrintTab(var)[[3]][,1:2], horiz = TRUE, 
          main = "Dry zone",
          col = colorRampPalette(brewer.pal(11, "Spectral"))(length(Fun03PrintTab(var)[[2]])),
          legend.text = Fun03PrintTab(var)[[2]], args.legend = list( x = 101.01,y = 300, xjust = 0),
          width = y[1:2])
  barplot(Fun03PrintTab(var)[[3]][,3:4], horiz = TRUE,
          main = "Delta",
          col = colorRampPalette(brewer.pal(11, "Spectral"))(length(Fun03PrintTab(var)[[2]])),
          width = y[3:4])
}


## interval variables
###############################################################################

FunR03TableInt <- function(var) {
  data %>%
    group_by(n152, n151) %>%
    summarise_each(funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), max(., na.rm = TRUE)), get(var))  %>%
    unite(gr, n152, n151, sep = " - ") -> x1
  tab <- t(x1[2:4])
  tab <- cbind(tab, t(summarise_each(data, funs(min(., na.rm = TRUE), mean(., na.rm = TRUE), max(., na.rm = TRUE)), get(var))))
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