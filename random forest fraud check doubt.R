library(caret)
install.packages('randomForest')
library(randomForest)

fact_tax<-cut(Fraud_check$Taxable.Income,breaks = c(0,30000,100000),labels=c('good','risky'))
checkdata<- Fraud_check[,-3]
checkdata['Tax Slab']<-fact_tax[1:600]
str(checkdata)
checkdata$Undergrad<-as.factor(checkdata$Undergrad)
checkdata$Marital.Status<-as.factor(checkdata$Marital.Status)
checkdata$Urban<-as.factor(checkdata$Urban)
model<-randomForest(checkdata$`Tax Slab`~.,data = checkdata,ntree=1000)
print(model)

print(importance(model))

pred<-predict(model,checkdata[,-6])
pred
table(pred,checkdata$`Tax Slab`)
