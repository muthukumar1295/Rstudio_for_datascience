par(mfrow=c(3,1))
hist(iris$Sepal.Length [iris$Species=="setosa"],
    xlim=c(4,8),
    breaks=9,
    xlab="",
    main= "Setosa sepal length",
    col="red")
summary(iris)


hist(iris$Sepal.Length [iris$Species=="versicolor"],
     xlim=c(4,8),
     breaks=9,
     xlab="",
     main= "versicolor sepal length",
     col="blue")

hist(iris$Sepal.Length [iris$Species=="virginica"],
     xlim=c(4,8),
     breaks=9,
     xlab="",
     main= "virginica sepal length",
     col="green")
par(mfrow=c(1,1))
