mtcars
best_cars <- scale(mtcars[,2:7])
a <- dist(best_cars, method = 'euclidean')
f1 <- hclust(a,method = 'average')
f1
plot(f1)
groups <- cutree(f1, k= 4)
rect.hclust(f1,k=4, border = 'blue')
clusters= data.frame('Car groups'=mtcars[,1],'Cluster'=groups)
clusters
