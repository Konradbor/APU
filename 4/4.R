  if (!require("C50")){ install.packages("C50"); library("C50")}
  
  load("../1/ramka_smartfony")
  
  input <- data.frame(subset(ramka, select = -c(status_opinii, nazwa, ocena, liczba_opinii)))
  tree <- C5.0.default(x=input, y=ramka$ocena)
  
  predict.C5.0(tree, input)
  
  summary(tree)
  plot(tree)