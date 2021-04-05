str(SalaryData_Train(1))
traindata<-`SalaryData_Train(1)`    
testdata<-`SalaryData_Test(1)`
    
traindata$workclass<-as.factor(traindata$workclass)
traindata$education<-as.factor(traindata$education)
traindata$maritalstatus<-as.factor(traindata$maritalstatus)
traindata$occupation<-as.factor(traindata$occupation)
traindata$relationship<-as.factor(traindata$relationship)
traindata$race<-as.factor(traindata$race)
traindata$sex<-as.factor(traindata$sex)
traindata$native<-as.factor(traindata$native)
traindata$Salary<-as.factor(traindata$Salary)



testdata$workclass<-as.factor(testdata$workclass)
testdata$education<-as.factor(testdata$education)
testdata$maritalstatus<-as.factor(testdata$maritalstatus)
testdata$occupation<-as.factor(testdata$occupation)
testdata$relationship<-as.factor(testdata$relationship)
testdata$race<-as.factor(testdata$race)
testdata$sex<-as.factor(testdata$sex)
testdata$native<-as.factor(testdata$native)
testdata$Salary<-as.factor(testdata$Salary)
    
library(ggplot2)
library(dplyr)
install.packages('naivebayes')
library(naivebayes)
install.packages('psych')
library(psych)
library(magrittr)
library(caret)

    
    
#Visualisation
    
traindata %>%
  ggplot(aes(x=Salary,y=educationno,fill=Salary))+
  geom_boxplot()+
  ggtitle('Salary according to Occupation')

traindata %>%
  ggplot(aes(x=Salary,y=hoursperweek,fill=Salary))+
  geom_boxplot()+
  ggtitle('Salary according to Occupation')

traindata %>% ggplot(aes(x=age,fill=Salary))+
  geom_density(alpha=0.8,col='Black')+
  ggtitle('Age VS Salary')

model<-naive_bayes(Salary~.,data=traindata,laplace = 1)
model

plot(model)

pred<-predict(model,traindata,type = 'prob')
head(cbind(traindata,pred))

pred1<-predict(model,testdata)
head(pred1)

conf<-table(testdata[,14],pred1)
conf
acc<-sum(diag(conf))/sum(conf)
acc

