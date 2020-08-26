forest<-forestfires[,c(1:10,31)]

forest$month<-as.factor(forest$month)
forest$day<-as.factor(forest$day)
forest$size_category<-as.factor(forest$size_category)

library(kernlab)
library(e1071)
library(caret)

local<-createDataPartition(forest$size_category,p=0.7,list = F)
traindata<-forest[local,]
testdata<-forest[-local,]

model<-ksvm(traindata$size_category~.,data=traindata,kernel='vanilladot')
summary(model)
model

pred<-predict(model,testdata)
pred

acc<-table(pred,testdata$size_category)
acc
accuracy<-sum(diag(acc))/sum(acc)
accuracy

model1<-svm(traindata$size_category~.,data=traindata,kernel='radial')
model1

pred1<-predict(model1,testdata)
pred1

conf1<-table(pred1,testdata$size_category)
acc1<-sum(diag(conf1))/sum(conf1)
acc1
