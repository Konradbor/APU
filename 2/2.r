  library(ahp)
  
  ahpFile <- file.path("./dane.ahp")
  data <- Load(ahpFile)
  
  Calculate(data)
  Analyze(data)
  AnalyzeTable(data)
    

                                                                                                                        