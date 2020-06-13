  if (!require("neuralnet")){ install.packages("neuralnet"); library("neuralnet")}
  
  load("../1/ramka_smartfony")
  
  input <- data.frame(wyświetlacz = ramka$wyświetlacz, pamięć_RAM=ramka$pamięć_RAM, cena = ramka$cena,
                      aparat_foto = ramka$aparat_foto, pamieć_wbudowana = ramka$pamieć_wbudowana )
  inputs <- scale(input, center = F)
  nn <- neuralnet(cena~wyświetlacz+pamięć_RAM+pamieć_wbudowana+aparat_foto, inputs, hidden=c(5,3,2), rep=2, threshold = 0.0001)
  
  plot(nn, rep="best")
  
  test <- data.frame(wyświetlacz = 5.0 / attr(inputs, 'scaled:scale')["wyświetlacz"],
                     pamięć_RAM = 1/ attr(inputs, 'scaled:scale')["pamięć_RAM"],
                     pamieć_wbudowana = 16/ attr(inputs, 'scaled:scale')["pamieć_wbudowana"],
                     aparat_foto = 8/ attr(inputs, 'scaled:scale')["aparat_foto"])
  
  results <- compute(nn, test)
  results
  results$net.result * attr(inputs, 'scaled:scale')["cena"]
  
    test <- data.frame(wyświetlacz = 6.4 / attr(inputs, 'scaled:scale')["wyświetlacz"],
                       pamięć_RAM = 6/ attr(inputs, 'scaled:scale')["pamięć_RAM"],
                       pamieć_wbudowana = 128/ attr(inputs, 'scaled:scale')["pamieć_wbudowana"],
                       aparat_foto = 12/ attr(inputs, 'scaled:scale')["aparat_foto"])
    
    results <- compute(nn, test)
    results
    results$net.result * attr(inputs, 'scaled:scale')["cena"]