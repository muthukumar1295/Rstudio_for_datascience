startups$State<-as.integer(as.factor(startups$State))

startups1<-scale(startups)

startups1<-as.data.frame(startups1)

library(caret)

train<-createDataPartition(startups1$Profit,p=0.7,list = F)
traindata<-startups1[train,]
testdata<-startups1[-train,]

library(neuralnet)

neuralmodel<-neuralnet(formula = Profit~.,data=traindata,stepmax = 1e6)
result<-compute(neuralmodel,testdata[,-5])
result                 
cor(result$net.result,testdata$Profit)

