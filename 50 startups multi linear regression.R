startups<- `50_Startups`[,-4]
model1<-lm(Profit~.,data= startups)
summary(model1)
#Multiple R-squared:  0.9507,	Adjusted R-squared:  0.9475

plot(model1)

library(MASS)

library(car)
residualPlots(model1)
avPlots(model1)

qqPlot(model1)

influenceIndexPlot(model1)
car::vif(model1)


startups<- `50_Startups`[-c(46,50),-4]
model2<-lm(Profit~.,data=startups)
summary(model2)
#Multiple R-squared:  0.9633,	Adjusted R-squared:  0.9608 

plot(model2)
influenceIndexPlot(model2)
stepAIC(model2)

startups<- `50_Startups`[-c(46,50),-c(2,4)]
model3<-lm(Profit~.,data=startups)
summary(model3)
#Multiple R-squared:  0.963,	Adjusted R-squared:  0.9614 