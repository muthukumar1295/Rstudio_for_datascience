cutlets<-read.csv(file.choose(),header = T)
shapiro.test(cutlets$Unit.A)# to check if the sample distribution is normal
shapiro.test(cutlets$Unit.B)
#Ho:The mean values of both the samples are equal.
#Ha:The mean values of both the samples are not equal.
sample1<-cutlets$Unit.A
sample2<-cutlets$Unit.B
t.test(sample1,sample2,mu=0,alternative='two.sided')
