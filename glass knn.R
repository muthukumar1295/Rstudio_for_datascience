library(class)
library(caret)
glass$Type<-as.factor(glass$Type)



intraininglocal<-createDataPartition(glass$Type,p=0.7,list = F)
traindata<-glass[intraininglocal,]
testdata<-glass[-intraininglocal,]

trainlabel<-traindata[,10]
testlabel<-testdata[,10]

traindata<-scale(traindata[,-10])
testdata<-scale(testdata[,-10])

knnresult<-knn(traindata,testdata,cl=trainlabel,k=13)
conf_matrix<-table(knnresult,testlabel)
conf_matrix
acc<-sum(diag(conf_matrix))/sum(conf_matrix)
acc

knnresult<-knn(traindata,testdata,cl=trainlabel,k=4)
conf_matrix<-table(knnresult,testlabel)
conf_matrix
acc<-sum(diag(conf_matrix)/nrow(testlabel))
acc

knnresult<-knn(traindata,testdata,cl=trainlabel,k=1)
conf_matrix<-table(knnresult,testlabel)
conf_matrix
acc<-sum(diag(conf_matrix)/nrow(testlabel))
acc
