library(caret)
library(randomForest)
install.packages('e1071')
library(e1071)
cat_sales<-cut(Company_Data$Sales,breaks = c(0,4,8,12,18), labels = c('Poor','Average','Good','Higly Profitable'))
company<-Company_Data[,-1]
company['Sales type']<- cat_sales[1:400]

company$ShelveLoc<-as.factor(company$ShelveLoc)
company$Urban<-as.factor(company$Urban)
company$US<-as.factor(company$US)
str(company)

model<-randomForest(data$`Sales type`~.,data= company,ntree= 1000,na.action = na.roughfix)
model
importance(model)

pred<-predict(model,company[,-11])
pred
table(pred,company$`Sales type`)
confusionMatrix(table(pred,company$`Sales type`))








