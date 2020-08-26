install.packages('caret')
install.packages('C50')
library(caret)
library(C50)

#We need to convert the sales column which is numeric into a categorical column

catsales<-cut(Company_Data$Sales,breaks = c(0,5,10,15,18),labels = c('low sales','average sales','good sales','high sales'))

Company_Data<-Company_Data[,-1]
Company_Data["Sales_category"]<-catsales[1:400]


traininglocal<-createDataPartition(Company_Data$Sales_category,p=0.7,list = F)
train_data<-Company_Data[traininglocal,]
test_data<-Company_Data[-traininglocal,]

model<-C5.0(Sales_category~.,data = train_data)
summary(model)

prediction<-predict.C5.0(model,newdata = test_data[,-11])
check<-table(test_data$Sales_category,prediction)
sum(diag(check))/sum(check)

plot(model)
