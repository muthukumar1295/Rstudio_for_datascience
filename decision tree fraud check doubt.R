library(caret)
library(C50)


cat_tax<-cut(Fraud_check$Taxable.Income,breaks = c(0,30000,100000),labels = c('good','Risky'))
Fraudcheckdata<-Fraud_check[,-3]
Fraudcheckdata['Tax_category']<-cat_tax[1:600]

str(Fraudcheckdata)
Fraudcheckdata$Undergrad<-as.factor(Fraudcheckdata$Undergrad)
Fraudcheckdata$Marital.Status<-as.factor(Fraudcheckdata$Marital.Status)
Fraudcheckdata$Urban<-as.factor(Fraudcheckdata$Urban)

str(Fraudcheckdata)


traininglocal<-createDataPartition(Fraudcheckdata$Tax_category,p=0.7,list=F)
traindata<-Fraudcheckdata[traininglocal,]
testdata<-Fraudcheckdata[-traininglocal,]

model<-C5.0(Tax_category~.,data= traindata )
summary(model)

predict1<-predict.C5.0(model, newdata = testdata[,-6])
check<-table(testdata$Tax_category,predict1)
sum(diag(check)/sum(check))

plot(model)

pred<-predict(model,Fraudcheckdata[,-6])
pred

