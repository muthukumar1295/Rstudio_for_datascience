

Zoo$type<-as.factor(Zoo$type)

zoo<-as.data.frame(scale(Zoo[,-c(1,18)]))
zoo_train<-zoo[1:70,]
zoo_test<-zoo[71:101,]
zoo_train_label<- Zoo[1:70,18]
zoo_test_label<- Zoo[71:101,18]

zoo_pred<-knn(zoo_train,zoo_test,cl=zoo_train_label,k=10)
conf_matrix<-table(zoo_pred,Zoo[71:101,18])
conf_matrix
acc<-sum(diag(conf_matrix))/nrow(zoo_test)
acc

zoo_pred<-knn(zoo_train,zoo_test,cl=zoo_train_label,k=11)
conf_matrix<-table(zoo_pred,Zoo[71:101,18])
conf_matrix
acc<-sum(diag(conf_matrix))/nrow(zoo_test)
acc

zoo_pred<-knn(zoo_train,zoo_test,cl=zoo_train_label,k=4)
conf_matrix<-table(zoo_pred,Zoo[71:101,18])
conf_matrix
acc<-sum(diag(conf_matrix))/nrow(zoo_test)
acc
