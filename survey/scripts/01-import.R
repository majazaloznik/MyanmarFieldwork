###############################################################################
##  01 First trawl through survey data
###############################################################################
##  00-0-new-variables.sps is the first trawl through the spss dataset
##  with a set of new variables. 
##  This file imports them into R, re-orders the new and old vars in 
##  the correct order, relists the variable names and labels 
###############################################################################

##  1. packages and import dataset
###############################################################################

library(memisc)
library(dplyr)
dataset <- as.data.set(spss.system.file(paste0("survey/data/Myanmar Ageing ",
                                               "Farmer draft data set.sav")))

##  2. function for reordering 
###############################################################################

FunSwap <- function(New, After) {
  from <- which(names(dataset)[index] == New)
  to <- which(names(dataset)[index] == After)
  index <- append(index, values = from, after = to)
  index <- index[-(from+1)]
  return(index)
}

##  3. reorder vars interspersing the "new" ones with the old
###############################################################################
 
index <- 1:852
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
index <- FunSwap("n49", "q31_a5")
index <- FunSwap("n50", "n49")
index <- FunSwap("n51", "q31_b5")
index <- FunSwap("n52", "q31_c1_3_ot_sp")
index <- FunSwap("n53", "q31_c2_3_ot_sp")
index <- FunSwap("n54", "q31_c3_3_ot_sp")
index <- FunSwap("n55", "q31_c4_3_ot_sp")
index <- FunSwap("n56", "q31_c5_3_ot_sp")
index <- FunSwap("n57", "n56")
index <- FunSwap("n58", "q32_1_4")
index <- FunSwap("n59", "n58")
index <- FunSwap("n60", "q32_2_4")
index <- FunSwap("n61", "n60")
index <- FunSwap("n62", "q32_3_4")
index <- FunSwap("n63", "n62")
index <- FunSwap("n64", "q33_a1")
index <- FunSwap("n65", "q33_b1")
index <- FunSwap("n66", "q33_c1")
index <- FunSwap("n67", "q33_d1")
index <- FunSwap("n68", "q33_e1")
index <- FunSwap("n69", "q34_a5_3_days")
index <- FunSwap("n70", "n69")
index <- FunSwap("n71", "n70")
index <- FunSwap("n72", "n71")
index <- FunSwap("n73", "n72")
index <- FunSwap("n74", "n73")
index <- FunSwap("n75", "n74")
index <- FunSwap("n76", "q34_b5_3_days")
index <- FunSwap("n77", "n76")
index <- FunSwap("n78", "n77")
index <- FunSwap("n79", "n78")
index <- FunSwap("n80", "n79")
index <- FunSwap("n81", "n80")
index <- FunSwap("n82", "n81")
index <- FunSwap("n83", "q34_c5_3_days")
index <- FunSwap("n84", "n83")
index <- FunSwap("n85", "n84")
index <- FunSwap("n86", "n85")
index <- FunSwap("n87", "n86")
index <- FunSwap("n88", "n87")
index <- FunSwap("n89", "n88")
index <- FunSwap("n90", "q34_d5_3_days")
index <- FunSwap("n91", "n90")
index <- FunSwap("n92", "n91")
index <- FunSwap("n93", "n92")
index <- FunSwap("n94", "n93")
index <- FunSwap("n95", "n94")
index <- FunSwap("n96", "n95")
index <- FunSwap("n97", "q34_e5_3_days")
index <- FunSwap("n98", "n97")
index <- FunSwap("n99", "n98")
index <- FunSwap("n100", "n99")
index <- FunSwap("n101", "n100")
index <- FunSwap("n102", "n101")
index <- FunSwap("n103", "n102")
index <- FunSwap("n104", "q35_a_2")
index <- FunSwap("n105", "q35_b_2")
index <- FunSwap("n106", "q35_c_2")
index <- FunSwap("n107", "q35_d_2")
index <- FunSwap("n108", "q35_e_2")
index <- FunSwap("n109", "q36_a1")
index <- FunSwap("n110", "q36_a2")
index <- FunSwap("n111", "q36_b1")
index <- FunSwap("n112", "q36_b2")
index <- FunSwap("n113", "q36_c1")
index <- FunSwap("n114", "q36_c2")
index <- FunSwap("n115", "q36_d1")
index <- FunSwap("n116", "q36_d2")
index <- FunSwap("n117", "q36_e1")
index <- FunSwap("n118", "q36_e2")
index <- FunSwap("n119", "n118")
index <- FunSwap("n120", "n119")
index <- FunSwap("n121", "n120")
index <- FunSwap("n122", "q37_j")
index <- FunSwap("n123", "q39_a2")
index <- FunSwap("n124", "q39_b2")
index <- FunSwap("n125", "q39_c2")
index <- FunSwap("n126", "q39_d2")
index <- FunSwap("n127", "q39_e2")
index <- FunSwap("n128", "q39_f2")
index <- FunSwap("n129", "q39_g2")
index <- FunSwap("n130", "q39_h2")
index <- FunSwap("n131", "q39_i2")
index <- FunSwap("n132", "q40_i_ot_sp")
index <- FunSwap("n133", "q40_1_ot_sp")
index <- FunSwap("n134", "q40_2_ot_sp")
index <- FunSwap("n135", "q40_3_ot_sp")
index <- FunSwap("n136", "q43_1_ot_sp")
index <- FunSwap("n137", "q43_2_ot_sp")
index <- FunSwap("n138", "q44_1_ot_sp")
index <- FunSwap("n139", "q44_2_ot_sp")
index <- FunSwap("n140", "q45_1_ot_sp")
index <- FunSwap("n141", "q45_2_ot_sp")
index <- FunSwap("n142", "q46_1_ot_sp")
index <- FunSwap("n143", "q46_2_ot_sp")
index <- FunSwap("n144", "q46_3_ot_sp")
index <- FunSwap("n145", "q52_b1_9")
index <- FunSwap("n146", "n145")
index <- FunSwap("n147", "n146")
index <- FunSwap("n148", "n147")
index <- FunSwap("n149", "q54_h_a3")
index <- FunSwap("n150", "q56_e_ot_sp")
index <- FunSwap("n151", "q2")
index <- FunSwap("n152", "id1")

dataset <- dataset[index]
rm(index)
##  4. clean up duplicate factor labels
###############################################################################
## need to remove duplicate labels from vars q63_2_1_crop_1 to q63_2_1_crop_4

labels(dataset$q63_2_1_crop_1) <- labels(dataset$q63_2_1_crop_1)[
  labels(dataset$q63_2_1_crop_1)@values %in% unique(dataset$q63_2_1_crop_1)]
labels(dataset$q63_2_2_crop_1) <- labels(dataset$q63_2_2_crop_1)[
  labels(dataset$q63_2_2_crop_1)@values %in% unique(dataset$q63_2_2_crop_1)]
labels(dataset$q63_2_3_crop_1) <- labels(dataset$q63_2_3_crop_1)[
  labels(dataset$q63_2_3_crop_1)@values %in% unique(dataset$q63_2_3_crop_1)]

labels(dataset$q63_2_1_crop_2) <- labels(dataset$q63_2_1_crop_2)[
  labels(dataset$q63_2_1_crop_2)@values %in% unique(dataset$q63_2_1_crop_2)]
labels(dataset$q63_2_2_crop_2) <- labels(dataset$q63_2_2_crop_2)[
  labels(dataset$q63_2_2_crop_2)@values %in% unique(dataset$q63_2_2_crop_2)]
labels(dataset$q63_2_3_crop_2) <- labels(dataset$q63_2_3_crop_2)[
  labels(dataset$q63_2_3_crop_2)@values %in% unique(dataset$q63_2_3_crop_2)]

labels(dataset$q63_2_1_crop_3) <- labels(dataset$q63_2_1_crop_3)[
  labels(dataset$q63_2_1_crop_3)@values %in% unique(dataset$q63_2_1_crop_3)]
labels(dataset$q63_2_2_crop_3) <- labels(dataset$q63_2_2_crop_3)[
  labels(dataset$q63_2_2_crop_3)@values %in% unique(dataset$q63_2_2_crop_3)]
labels(dataset$q63_2_3_crop_3) <- labels(dataset$q63_2_3_crop_3)[
  labels(dataset$q63_2_3_crop_3)@values %in% unique(dataset$q63_2_3_crop_3)]

labels(dataset$q63_2_1_crop_4) <- labels(dataset$q63_2_1_crop_4)[
  labels(dataset$q63_2_1_crop_4)@values %in% unique(dataset$q63_2_1_crop_4)]
labels(dataset$q63_2_2_crop_4) <- labels(dataset$q63_2_2_crop_4)[
  labels(dataset$q63_2_2_crop_4)@values %in% unique(dataset$q63_2_2_crop_4)]
labels(dataset$q63_2_3_crop_4) <- labels(dataset$q63_2_3_crop_4)[
  labels(dataset$q63_2_3_crop_4)@values %in% unique(dataset$q63_2_3_crop_4)]

##  5. remove variables with 600 missing values
###############################################################################

drop <- which(sapply(dataset, function(x) sum(is.na(x)) == 600))

dataset <- dataset[-drop]
rm(drop)

##  6. additional datasets:
###############################################################################

data <- as.data.frame(dataset)

##  7.  save dataset, data and data.movers
###############################################################################

write.csv(data, file = "survey/data/survey.data01.csv" )
save(data, dataset, file = "survey/data/survey.data01.RData" )




