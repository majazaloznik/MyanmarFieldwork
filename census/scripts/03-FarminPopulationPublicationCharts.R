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

par(bg=NA) 

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


###############################################################################
## PLOT TTYPE 1
###############################################################################

par(mfrow = c(1,2), xpd = TRUE)
par(mar = c(3,4,1,1))
yz <- barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, axes = FALSE, xlim = c(0, 1200000))
lines(c(200000, 200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(400000, 400000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(600000, 600000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(800000, 800000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1000000, 1000000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1200000, 1200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, add = TRUE, axes = FALSE, xlim = c(0, 1200000))
text(-150000,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,1200000,200000), labels = LETTERS[1:7])



yz <- barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, legend.text = c("N", "FF"),
              args.legend = list(x = 10,bty = "n"),axes = FALSE, xlim = c(0,14))
lines(c(2, 2), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(4, 4), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(6, 6), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(8, 8), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 10), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(12, 12), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(14, 14), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))

barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, legend.text = c("N", "FF"),
        args.legend = list(x = 10,bty = "n"),add = TRUE,
        axes = FALSE, xlim = c(0,14))
text(-1.5,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,14,2), labels = c(9, 2,4,6,8,10,12,14))

dev.copy2eps(file = "reports/HAI-report/figures/type01.eps", width = 10, height = 6)



###############################################################################
## PLOT TTYPE 2
#####################
kh01.01 <- kh01 %>%
  filter(tablenumber_ == 2, var1 != "Total") %>%
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

##########################################################

par(mfrow = c(1,2), xpd = TRUE)
par(mar = c(3,4,1,1))
yz <- barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, axes = FALSE, xlim = c(0, 1200000))
lines(c(200000, 200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(400000, 400000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(600000, 600000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(800000, 800000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1000000, 1000000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1200000, 1200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, add = TRUE, axes = FALSE, xlim = c(0, 1200000))
text(-150000,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,1200000,200000), labels = LETTERS[1:7])



yz <- barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, legend.text = c("N", "FF"),
              args.legend = list(x = 10,bty = "n"),axes = FALSE, xlim = c(0,14))
lines(c(2, 2), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(4, 4), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(6, 6), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(8, 8), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 10), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(12, 12), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(14, 14), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))

barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, legend.text = c("N", "FF"),
        args.legend = list(x = 10,bty = "n"),add = TRUE,
        axes = FALSE, xlim = c(0,14))
text(-1.5,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,14,2), labels = c(9, 2,4,6,8,10,12,14))

dev.copy2eps(file = "reports/HAI-report/figures/type02.eps", width = 10, height = 6)



###############################################################################
## PLOT TTYPE 3
#####################
kh01.01 <- kh01 %>%
  filter(tablenumber_ == 3, var1 != "Total") %>%
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

##########################################################

par(mfrow = c(1,2), xpd = TRUE)
par(mar = c(3,4,1,1))
yz <- barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, axes = FALSE, xlim = c(0, 1200000))
lines(c(200000, 200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(400000, 400000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(600000, 600000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(800000, 800000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1000000, 1000000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1200000, 1200000), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
barplot(t(as.matrix(age.dist.table[2:3])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, add = TRUE, axes = FALSE, xlim = c(0, 1200000))
text(-150000,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,1200000,200000), labels = LETTERS[1:7])



yz <- barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
              col = c(rgb(0, 104, 139, max = 255), 
                      rgb(236, 193, 19, max = 255)), 
              horiz = TRUE, legend.text = c("N", "FF"),
              args.legend = list(x = 10,bty = "n"),axes = FALSE, xlim = c(0,14))
lines(c(2, 2), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(4, 4), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(6, 6), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(8, 8), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 10), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(12, 12), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(14, 14), c(1,55), lty = 3, col = rgb(102, 170, 204, max = 255))

barplot(t(as.matrix(age.dist.table[4:5])), beside = TRUE, 
        col = c(rgb(0, 104, 139, max = 255), 
                rgb(236, 193, 19, max = 255)), 
        horiz = TRUE, legend.text = c("N", "FF"),
        args.legend = list(x = 10,bty = "n"),add = TRUE,
        axes = FALSE, xlim = c(0,14))
text(-1.5,colMeans(yz), letters[1:18], las = 2)
axis(1, at = seq(0,14,2), labels = c(9, 2,4,6,8,10,12,14))

dev.copy2eps(file = "reports/HAI-report/figures/type03.eps", width = 10, height = 6)



##########################################################
## TFR plots
##########################################################


tfr <- read.csv("reports/HAI-report/figures/tfr.csv")


par(mfrow = c(1,2))
par(mar = c(4,3,2,0))
plot(1:13, tfr[[4]], col = rgb(0, 104, 139, max = 255), 
     lwd = 2, bty = "n",
     xlab = "",
     ylab = "y1", axes = FALSE, ylim = c(0,7),
     main = "tfr")
lines(1:13, tfr[[4]], type = "c", col = rgb(236, 193, 19, max = 255), lwd = 2 )

axis(1, las = 2,labels = LETTERS[1:13], at = 1:13)
axis(2, las = 2, at = seq(0,7,1))
lines(c(1, 13), c(0,0), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(2,2), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(4,4), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(6,6), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(1,1), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(3,3), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(5,5), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(7,7), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(2.1,2.1), lty = 1, col = rgb(102, 170, 204, max = 255))
lines(1:13, tfr[[4]], type = "c", col = rgb(236, 193, 19, max = 255), lwd = 2 )



plot(1:13, tfr[[2]], type = "b", col = rgb(0, 104, 139, max = 255), 
     lwd = 2, bty = "n",
     xlab = "",
     main = "e",
     ylab = "y2", axes = FALSE, ylim = c(0,80))
lines(1:13, tfr[[3]], type = "b", col = rgb(236, 193, 19, max = 255), lwd = 2 )
axis(1, labels = LETTERS[1:13], at = 1:13, las = 2)
axis(2, las = 2, at = seq(0,80,20))
lines(c(1, 13), c(0,0), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(20,20), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(40,40), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(60,60), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(1, 13), c(80,80), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(1:13, tfr[[3]], type = "b", col = rgb(236, 193, 19, max = 255), lwd = 2 )
lines(1:13, tfr[[2]], type = "b", col = rgb(0, 104, 139, max = 255), lwd = 2 )
legend(x=8, y = 20, legend = c("f", "m"),
       col = c(rgb(236, 193, 19, max = 255),rgb(0, 104, 139, max = 255)),
       lwd = 2, cex=1.2, pch = 21,pt.bg = 'white', bty = "n")


dev.copy2eps(file = "reports/HAI-report/figures/tfr.eps", width = 10, height = 5)


##########################################################
## proje1 plot
##########################################################


proj1 <- read.csv("reports/HAI-report/figures/proj1.csv")

colfunc <- colorRampPalette(c(rgb(0, 104, 139, max = 255), rgb(236, 193, 19, max = 255)))
plot(rep(1,10),col=colfunc(10),pch=19,cex=3)

par(mfrow = c(1,1), xpd = TRUE)
par(mar = c(3,4,1,1))
yz <- barplot(t(as.matrix(proj1[2:5])), beside = TRUE,
              col = colfunc(4), axes = FALSE)
axis(1, labels = LETTERS[1:13], at = colMeans(yz), las = 2)
axis(2, las =2)
lines(c(0, 66), c(2,2), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 66), c(4,4), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 66), c(6,6), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 66), c(8,8), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 66), c(10,10), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 66), c(12,12), lty = 3, col = rgb(102, 170, 204, max = 255))
barplot(t(as.matrix(proj1[2:5])), beside = TRUE,
        col = colfunc(4), axes = FALSE, add = TRUE, legend.text = c("2014", "2024", "2034", "2044"),
        args.legend =list(x = 8, bty = "n"))

dev.copy2eps(file = "reports/HAI-report/figures/proj1.eps", width = 10, height = 5)



##########################################################
## proje2 plot
##########################################################

proj2 <- read.csv("reports/HAI-report/figures/proj2.csv")

colfunc <- colorRampPalette(c(rgb(0, 104, 139, max = 255), rgb(236, 193, 19, max = 255)))

par(mfrow = c(1,1), xpd = TRUE)
par(mar = c(3,4,1,1))
yz <- barplot(t(as.matrix(proj2[4:7])), beside = TRUE,
              col = colfunc(4), axes = FALSE)
axis(1, labels = LETTERS[2:13], at = colMeans(yz), las = 2)
axis(2, las =2, at = seq(0,16,2))
lines(c(0, 62), c(2,2), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 62), c(4,4), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 62), c(6,6), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 62), c(8,8), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 62), c(10,10), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(0, 62), c(12,12), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 62), c(14,14), lty = 3, col = rgb(102, 170, 204, max = 255))
lines(c(10, 62), c(16,16), lty = 3, col = rgb(102, 170, 204, max = 255))
barplot(t(as.matrix(proj2[4:7])), beside = TRUE,
        col = colfunc(4), axes = FALSE, add = TRUE, legend.text = c("2016", "2026", "2036", "2046"),
        args.legend =list(x = 8, bty = "n"))

dev.copy2eps(file = "reports/HAI-report/figures/proj2.eps", width = 10, height = 5)



##########################################################
## Likert scales
##########################################################

library(RColorBrewer)
library(lattice)
require(grid)
require(latticeExtra)
require(HH)
load("survey/data/survey.data02.RData")
table( data$q59a, data$n152, data$n151)



Fun03Likert <- function(var) {
  x <- table(data$n151, data$n152, var)
  x <- rbind(x[, 1, ], x[, 2, ])
  x <- prop.table(x, 1)*100
  x <- x[,5:1]
  rownames(x) <- c("a", "b", "c", "d")
  colfunc <- colorRampPalette(c(rgb(0, 104, 139, max = 255), rgb(236, 193, 19, max = 255)))
  X <- likert(
    x,
    col = colfunc(5),
    main = "",
    xlab = ""
  )
  X <- HH:::emptyMainLeftAxisLeftStripBottomLegend(X)
  X$y.scales$labels  <- letters[1:4]
  X
}

lw <- list(left.padding = list(x = 0, units = "inches"))
lw$right.padding <- list(x = -0.1, units = "inches")
lw$left.padding <- list(x = 1.4, units = "inches")
lh <- list(bottom.padding = list(x = 0, units = "inches"))
lh$bottom.padding <- list(x = -0.5, units = "inches")
lattice.options(layout.widths = lw, layout.heights = lh)


X <- Fun03Likert(data$q57a)
X$main <- "q57a"
X
dev.copy2eps(file = "reports/HAI-report/figures/57a.eps", width = 10, height = 3)


X <- Fun03Likert(data$q57b)
X$main <- "q57b"
X
dev.copy2eps(file = "reports/HAI-report/figures/57b.eps", width = 10, height = 3)


X <- Fun03Likert(data$q57c)
X$main <- "q57c"
X
dev.copy2eps(file = "reports/HAI-report/figures/57c.eps", width = 10, height = 3)

X <- Fun03Likert(data$q57d)
X$main <- "q57d"
X
dev.copy2eps(file = "reports/HAI-report/figures/57d.eps", width = 10, height = 3)




X <- Fun03Likert(data$q59a)
X$main <- "q59a"
X
dev.copy2eps(file = "reports/HAI-report/figures/59a.eps", width = 10, height = 3)


X <- Fun03Likert(data$q59b)
X$main <- "q59b"
X
dev.copy2eps(file = "reports/HAI-report/figures/59b.eps", width = 10, height = 3)


X <- Fun03Likert(data$q59c)
X$main <- "q59c"
X
dev.copy2eps(file = "reports/HAI-report/figures/59c.eps", width = 10, height = 3)

X <- Fun03Likert(data$q59d)
X$main <- "q59d"
X
dev.copy2eps(file = "reports/HAI-report/figures/59d.eps", width = 10, height = 3)

X <- Fun03Likert(data$q59e)
X$main <- "q59e"
X
dev.copy2eps(file = "reports/HAI-report/figures/59e.eps", width = 10, height = 3)

source("http://www.math.mcmaster.ca/bolker/R/misc/legendx.R")
par(bg = NA)
par(mar = c(0,3,0,0))

colfunc <- colorRampPalette(c(rgb(0, 104, 139, max = 255), rgb(236, 193, 19, max = 255)))
plot(1, type = "n", bty = "n", axes = FALSE, xlim = c(0,2), ylim = c(0,2), xlab = "", ylab = "")
legend(x = 0, y = 1, legend = LETTERS[1:5], bty = "n", fill = colfunc(5), horiz = TRUE, box.cex=c(3,5),
       x.intersp = 5, adj = c(6, 0.), border= NA)

dev.copy2eps(file = "reports/HAI-report/figures/ledge.eps", width = 10, height = 1.5)

