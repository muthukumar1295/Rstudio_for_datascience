library(datasets)
?mtcars
mtcars
mtcars(head)
head(mtcars)
barplot(mtcars$am)
geartype <- table(mtcars$am)
barplot(geartype)
barplot(gear)
barplot(mtcars$gear)
gearcount <- table(mtcars$gear)
barplot(gearcount)
cylindercount<-table(mtcars$cyl)
barplot(cylindercount)
table(mtcars$gear)

