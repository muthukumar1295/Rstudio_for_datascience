library(lattice)
delivery<-delivery_time
plot(delivery_time$Sorting.Time,delivery_time$Delivery.Time,main='delivery time vs sorting time',pch=19,col='blue')

model<-lm(Delivery.Time~Sorting.Time,data=delivery)
model
summary(model)
#Coefficients:
 # Estimate Std. Error t value Pr(>|t|)    
#(Intercept)    6.5827     1.7217   3.823  0.00115 ** 
 # Sorting.Time   1.6490     0.2582   6.387 3.98e-06 ***
 
#Residual standard error: 2.935 on 19 degrees of freedom
#Multiple R-squared:  0.6823,	Adjusted R-squared:  0.6655 
#F-statistic:  40.8 on 1 and 19 DF,  p-value: 3.983e-06

data1<-data.frame(Sorting.Time=c(3,6,8,9.5))
pred1<-predict(model,newdata = data1)
pred1

# 1        2        3        4 
#11.52979 16.47685 19.77489 22.24842