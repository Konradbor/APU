    if (!require("neuralnet")){ install.packages("neuralnet"); library("neuralnet")}
    
    f1 <- function(x){
      x ^ 3 + 2 * x
    }
    
    x <- seq(1,20)
    y <- sapply(x, f1)
    df <- data.frame(x,y)
    
    xs <- scale(x, center = F)
    ys <- scale(y, center = F)
    dfs <- data.frame(xs,ys)
    
    xsu <- xs * attr(xs, 'scaled:scale')
    
    
    nn <- neuralnet(ys~xs, data=dfs, hidden=c(10,20,10,5), rep=2, linear.output = T, threshold = 0.000001)
    
    plot(nn, rep="best", file="nn.png")
    dev.print(pdf, "nn.pdf")
    
    test <- data.frame(x = seq(1,100))
    tests <- data.frame(xs = test$x / attr(xs, 'scaled:scale'))
    
    results <- compute(nn, tests)
    results$net.result
    data.frame(predicted = results$net.result * attr(ys, 'scaled:scale'), actual = sapply(seq(1,100), f1))
