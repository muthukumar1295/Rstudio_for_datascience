


x  <- c(0.193, 0.042, 0.129, 0.191, 0.031, 0.793, 0.219, 0.092, 0.018)
t.test(x, alternative="greater", mu=0.3)

control<-c( 91, 87, 99, 77, 88, 91) 
 
treat <-c( 101, 110, 103, 93, 99, 104) 
t.test(treat, control, alternative="two.sided")
 
 
 
 
 
 