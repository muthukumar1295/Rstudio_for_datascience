Coke<-CocaCola_Sales_Rawdata
str(Coke)
install.packages('xts')
library(xts)

Coke$Quarter<-as.factor(Coke$Quarter)

timemodel<-ts(Coke$Sales,frequency = 4, start = c(1986,1))
class(Coke)
class(timemodel)
timemodel

plot(timemodel)
abline(reg=lm(timemodel~time(timemodel)))

cycle(timemodel)
boxplot(timemodel~cycle(timemodel))

traincoke<-timemodel[1:36]
testcoke<-timemodel[37:42]

plot(log(timemodel))
plot(diff(log(timemodel)))

acf(timemodel)
acf(diff(log(timemodel)))

pacf(diff(log(timemodel)))

model1<-arima(log(timemodel),c(0,1,1),seasonal = list(order=c(0,1,1),period=4))
pred1<-predict(model1,n.ahead = 2*4)

pred1<-2.718^pred1$pred1
pred1
