Salary<- Salary_Data
plot(Salary$YearsExperience,Salary$Salary,main='scatterplot')
cor(Salary$YearsExperience,Salary$Salary)
model1<-lm(Salary$Salary~Salary$YearsExperience)
summary(model1)

library(car)
residualPlot(model1)
avPlots(model1)

qqPlot(model1)
influenceIndexPlot(model1)

Salary1<-Salary[-24,]

model2<-lm(Salary~YearsExperience,data = Salary1)
summary(model2)

residualPlot(model2)
avPlots(model2)
qqPlot(model2)
influenceIndexPlot(model2)

Salary2<- Salary[-c(24,2),]
model3<-lm(Salary~YearsExperience,data = Salary2)
summary(model2)

#Residual standard error: 5508 on 27 degrees of freedom
#Multiple R-squared:  0.9597,	Adjusted R-squared:  0.9582 
#F-statistic: 642.7 on 1 and 27 DF,  p-value: < 2.2e-16
