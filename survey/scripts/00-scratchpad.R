library(memisc)
library(xtable)

dataset <- as.data.set(spss.system.file("survey/data/Myanmar Ageing Farmer draft data set.sav"))
names(dataset)

index <- 1:852
FunSwap <- function(New, After) {
  from <- which(names(dataset)[index] == New)
  to <- which(names(dataset)[index] == After)
  index <- append(index, values = from, after = to)
  index <- index[-(from+1)]
  return(index)
}

index <- FunSwap("n1", "q6_h")
index <- FunSwap("n2", "q7_5$15")
index <- FunSwap("n3", "q7_6$15")
index <- FunSwap("n4", "n3")
index <- FunSwap("n5", "n4")
index <- FunSwap("n6", "n5")
index <- FunSwap("n7", "q8_1$15")
index <- FunSwap("n8", "n7")
index <- FunSwap("n9", "n8")
index <- FunSwap("n10", "n9")
index <- FunSwap("n11", "n10")
index <- FunSwap("n12", "n11")
index <- FunSwap("n13", "n12")
index <- FunSwap("n14", "n13")
index <- FunSwap("n15", "n14")
index <- FunSwap("n16", "q8_2$15")
index <- FunSwap("n17", "n16")
index <- FunSwap("n18", "q8_4_ot_sp$15")
index <- FunSwap("n19", "n18")
index <- FunSwap("n20", "n19")
index <- FunSwap("n21", "n20")
index <- FunSwap("n22", "n21")
index <- FunSwap("n23", "n22")
index <- FunSwap("n24", "q8_5$15")
index <- FunSwap("n25", "n24")
index <- FunSwap("n26", "n25")
index <- FunSwap("n27", "n26")
index <- FunSwap("n28", "n27")
index <- FunSwap("n29", "n28")
index <- FunSwap("n30","q15_j_96_ot_sp_3")
index <- FunSwap("n31", "q18")
index <- FunSwap("n32", "q20_a")
index <- FunSwap("n33", "q23")
index <- FunSwap("n34", "q24_b_id")
index <- FunSwap("n35", "q24_c_id")
index <- FunSwap("n36", "n35")
index <- FunSwap("n37", "q28_a_ot_sp")
index <- FunSwap("n38", "q28_b_ot_sp")
index <- FunSwap("n39", "q28_c_ot_sp")
index <- FunSwap("n40", "q28_d_ot_sp")
index <- FunSwap("n41", "q28_g_ot_sp")
index <- FunSwap("n42", "n41")
index <- FunSwap("n43", "n42")
index <- FunSwap("n44", "n43")
index <- FunSwap("n45", "n44")
index <- FunSwap("n46", "n45")
index <- FunSwap("n47", "q30_c")
index <- FunSwap("n48", "q30_c_acre")
index <- FunSwap("n49", "q31_c5_3_ot_sp")
index <- FunSwap("n50", "n49")

names(dataset[index])




codebook(dataset)
length(sapply(dataset, labels))

x <- description(dataset)


tab <- xtable(cbind(names(x), unlist(x), sapply(dataset, labels) ))
head(tab[[1]])
print(tab)

x <- data.frame(no= NA,label = NA)
for (i in 1:852) {
x <- rbind(x,   
             c(no = as.character(i),
               label = description(dataset[i])[[1]]))
}

