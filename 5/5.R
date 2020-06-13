  if (!require("mlr")){ install.packages("mlr"); library("mlr")}
  if (!require("rpart")){ install.packages("rpart"); library("rpart")}
  if (!require("partykit")){ install.packages("partykit"); library("partykit")}
  if (!require("C50")){ install.packages("C50"); library("C50")}
  
  rtree <- rpart(Species ~ ., iris)
  par(mar = rep(0,4))
  plot(rtree)
  text(rtree)
  
  ctr <- ctree(Species ~ ., iris)
  plot(ctr)
  
  input <- subset(iris, select = -c(Species))
  tree <- C5.0.default(x=input, y=iris$Species)
  
  summary(tree)
  plot(tree)
  
  
  classif <- C5.0(Species ~ ., data = iris, rules = T)
  summary(classif)
