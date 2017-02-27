###############################################################################
##  02 PERCEPTION OF CHALLENGES
###############################################################################

## 1. LOAD PACKAGES AND DATA
###############################################################################
library(dplyr)
library(tidyr)
library(RColorBrewer)
load("survey/data/survey.data01.RData")

library(memisc)
load("survey/data/survey.dataset.RData")

FunR02Table <- function(var) {
  x <-  cbind(table(var ,data$n151 ),
              table(var ,data$n152 ),
              table(var ,data$n153 ))
  row_sub = apply(x, 1, function(row) !all(row == 0 ))
  x <- x[row_sub,]
  if(is.null(dim(x))) {
    x[1:7] <- rep(100,7)
    print(x)} else{
  prop.table(x, 2)*100}
}

y <-  c(table(data$n151 ),
        table(data$n152 ),
        table(data$n153 ))

Fun02Barplot <- function(var) {
  par(mar = c(10,2,1,1), xpd = TRUE)
  barplot(FunR02Table(var), width = y, space = c(.5,.5,1,.5,1,.5,.5),
          col = colorRampPalette(brewer.pal(11, "Spectral"))(nrow(FunR02Table(var))),
          legend.text = rownames(FunR02Table(var)), args.legend = list(y = -15))
}



FunR02TableInt<- function(var){
  data %>% 
    group_by(n151) %>%
    summarise_each(funs(min, mean, max), get(var)) %>%
    dplyr::rename( var = n151 ) -> x1
  
  data %>% 
    group_by(n152) %>%
    summarise_each(funs(min, mean, max), get(var)) %>%
    dplyr::rename( var = n152 ) -> x2
  
  data %>% 
    group_by(n153) %>%
    summarise_each(funs(min, mean, max), get(var)) %>%
    dplyr::rename( var = n153 ) -> x3
  
  tab <- t(rbind(x1,x2,x3)[2:4])
  colnames(tab) <- names(y)
  tab
}

Fun02PrintTab<- function(var){
  kable(FunR02Table(var), digits = 2, booktabs = TRUE, padding = 10)
}

Fun02PrintTabInt<- function(var){
  kable(FunR02TableInt(var), digits = 2, booktabs = TRUE, padding = 10)
}
Fun02PrintTabInt("n2")
boxplot(c(1,1,1,1,1,1,1,3,4,4,9))
###############################################################################


test <- cbind(names = names(x)[1:300], descr =  Variable.Name[1:300])
names(x)[793]
dataset[[792]]

names(x)[781:792]
