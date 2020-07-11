kaggle<-read.csv("modelfinal_Noshow3.csv")
install.packages("gaselect")
library(gaselect)

ctrl <- genAlgControl(populationSize = 100, numGenerations = 15, minVariables = 5,
                      maxVariables = 9, verbosity = 1)
evaluatorSRCV <- evaluatorPLS(numReplications = 2, innerSegments = 7, testSetSize = 0.4,
                              numThreads = 1)


kaggle=data.frame(sapply(kaggle,as.numeric))
kaggle$No.show=factor(kaggle$No.show)

X <- as.matrix(kaggle[,-8])
y <-as.numeric(kaggle[,8])
resultSRCV <- genAlg(y, X, control = ctrl, evaluator = evaluatorSRCV, seed = 1000)

subsets(resultSRCV, 1:5)
