library(memisc)
library(xtable)
dataset <- as.data.set(spss.system.file("survey/data/Myanmar Ageing Farmer draft data set.sav"))


length(sapply(dataset, labels))

x <- description(dataset)


library(xtable)


tab <- xtable(cbind(names(x), unlist(x), sapply(dataset, labels) ))
head(tab)
print(tab, type="html")

for (i in 1:702) {
  message(i)
  message(description(dataset[i]))
  message(labels(dataset[i]))
}


