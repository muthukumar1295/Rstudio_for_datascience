#heirarchical clustering

crime<- scale(crime_data[,c(2:5)])
a1<-dist(crime,method = 'euclidean')
clust<- hclust(a1,method = 'average')
clust
clas<- cutree(clust,k=4)
plot(clas)
plot(clust)

rect.hclust(clust,k=4, border='red')

clusters<-data.frame( 'City_Name'= crime_data[,1],'Cluster'=clas)
View(clusters)

# to know the appropraite number of clusters to be formed

k.max<- 12
wss<-c()
num_clust<- list()
for (i in 1:k.max) {
 value1<- kmeans(crime,i)
  wss[i]<- value1$tot.withinss
  num_clust[[i]]<- value1$size
  
}
plot(1:k.max,wss,
     type='b',pch=19,
     xlab = 'k value',ylab = 'wss value')

## Kmeans clustering
km<- kmeans(crime,4)
km$centers
km$cluster
km
