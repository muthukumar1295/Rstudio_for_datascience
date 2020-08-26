str(creditcard)
creditcard<-creditcard[,-1]

creditcard$card<-as.factor(creditcard$card)
creditcard$owner<-as.numeric(as.factor(creditcard$owner))
creditcard$selfemp<-as.numeric(as.factor(creditcard$selfemp))


library(caret)
local<-createDataPartition(creditcard$card,p=0.7,list=F)
traindata<-creditcard[local,]
testdata<-creditcard[-local,]

model<-glm(traindata$card~.,family = 'binomial',data = traindata)
summary(model)

pred<-predict(model,traindata,type = 'response')
pred

tapply(pred,traindata$card,mean)
conf<-table(pred>0.5,traindata$card)
conf
acc<-sum(diag(conf))/sum(conf)
acc
pred1<-predict(model,testdata[,-1],type = 'response')
pred1
tapply(pred1,testdata$card,mean)
conf1<-table(pred1>0.5,testdata$card)
conf1



