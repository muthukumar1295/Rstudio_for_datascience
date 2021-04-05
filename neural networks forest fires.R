str(forestfires)

forestfires$MONTH<-as.integer(as.factor(forestfires$month))
forestfires$DAY<-as.integer(as.factor(forestfires$day))
forestfires$CATEGORY<-as.integer(as.factor(forestfires$size_category))


forest<-scale(forestfires[,-c(1,2,31)])
forest<-as.data.frame(forest)

install.packages('neuralnet')
library(neuralnet)

library(caret)
traininglocal<-createDataPartition(forest$area,p=0.7,list=F)
traindata<-forest[traininglocal,]
testdata<-forest[-traininglocal,]

model<-neuralnet(formula = area~.,data = traindata,stepmax = 1e7)

result<-compute(model,testdata[,-9])
predicted_strength<-result$net.result
predicted_strength
cor(predicted_strength,testdata$area)

model1<-neuralnet(formula = area~.,data = traindata,hidden=2,stepmax = 1e7)

result<-compute(model1,testdata[,-9])
predicted_strength<-result$net.result
predicted_strength
cor(predicted_strength,testdata$area)
