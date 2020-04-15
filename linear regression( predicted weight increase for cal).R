cal<- calories_consumed

install.packages('lattice')
library(lattice)
 
plot(cal$Calories.Consumed,cal$Weight.gained..grams.,main = 'Calories consumed by weight gained',pch=19, col='red')

colnames(cal)

model<-lm(Weight.gained..grams.~ Calories.Consumed,data = calories_consumed)
summary(model)

#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)       -625.75236  100.82293  -6.206 4.54e-05 ***
# Calories.Consumed    0.42016    0.04115  10.211 2.86e-07 ***

#Residual standard error: 111.6 on 12 degrees of freedom
#Multiple R-squared:  0.8968,	Adjusted R-squared:  0.8882 
#F-statistic: 104.3 on 1 and 12 DF,  p-value: 2.856e-07

data1<-data.frame(Calories.Consumed=c(1600,2500,4500))
predicted_value<-predict(model,newdata = data1)
predicted_value
#> predicted_value
#1          2          3 
#46.49826  424.63924 1264.95251 