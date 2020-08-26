library(e1071)

str(`SalaryData_Train(1)`)
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

str(traindata)
str(testdata)
library(kernlab)
install.packages('kernlab')

model<-ksvm(traindata$Salary~.,data=traindata,kernel='vanilladot')

pred<-predict(model,testdata)
pred

conf<-table(pred,testdata$Salary)
conf
acc<-sum(diag(conf))/sum(conf)
acc

model1<-svm(traindata$Salary~.,data=traindata,kernel='radial')

pred1<-predict(model1,testdata)
pred1

conf1<-table(pred1,testdata$Salary)
conf1
acc1<-sum(diag(conf1))/sum(conf1)
acc1
