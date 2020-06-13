if (!require("mlr")){ install.packages("mlr"); library("mlr")}
if (!require("rFerns")){ install.packages("rFerns"); library("rFerns")}
if (!require("randomForestSRC")){ install.packages("randomForestSRC")}

load("../1/ramka_smartfony")

input <- data.frame(name = ramka$nazwa, 
                    display = ramka$wyświetlacz,
                    RAM = ramka$pamięć_RAM,
                    ROM = ramka$pamieć_wbudowana,
                    camera = ramka$aparat_foto,
                    price = ramka$cena,
                    grade = ramka$ocena)

task = makeClassifTask(id = deparse(substitute(input)), input, "grade",
                  weights = NULL, blocking = NULL, coordinates = NULL,
                  positive = NA_character_, fixup.data = "warn", check.data = TRUE)

lrns <- makeLearners(c("rpart", "C50","rFerns", "randomForestSRC"), type = "classif")
resamp <- makeResampleDesc(method = "CV", iters = 2)
porownanie <- benchmark(learners = lrns,
                        tasks = task,
                        resampling = resamp)
porownanie

plotBMRSummary(porownanie)
plotBMRBoxplots(porownanie)