
#First we remove the type column

wine_data<-wine[,-1]
wine_data

# for finding the total number of clusters

wss<-c()
kmax=10
for (i in 1:kmax) { 
  value2<-kmeans(wine_data,i)
    wss[i]<- value2$tot.withinss
}
plot(1:kmax,wss,
     type='b',pch=19,
     xlab = 'Value of K',
     ylab = 'Withinss value')

# Thus we get the optimum number of clusters as 3 or 4 by kmeans without applying PCA

#Applying PCA

result<-princomp(wine_data)
summary(result)
pca_wine<-result$scores[,1:3]#considering only the first 3 PC's

wss<-c()
kmax=11
for (i in 1:kmax) {
  value3<-kmeans(pca_wine,i)
  wss[i]<-value3$tot.withinss
   }
plot(1:kmax,wss,
     type ='b', pch=19,
     xlab = 'kvalue',
     ylab = 'value of wss')

#Even after applying PCA, we get the optimum number of clusters as 3 or 4 by kmeans.

#Applying Heirarchical clustering

winescale<-scale(wine_data)
a1<-dist(winescale,method = 'euclidean')
cluster<-hclust(a1,method = 'average')
plot(cluster)
rect.hclust(cluster,k=3,border = 'red')

groups<-cutree(cluster,k=3)
Clusters<-data.frame('Index'=wine[,1],'Cluster'=groups)
Clusters
 
#applying Kmeans

winek<-kmeans(wine_data,3)
winek$cluster
