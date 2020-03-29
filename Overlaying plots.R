library(datasets)
?lynx
lynx
hist(lynx)
hist(lynx,
     breaks=14,
     col= "pink",
     freq= FALSE,
     main=paste("Lynx trappings in the forest",
            "in Canada, from 1821-1934"))
curve(dnorm(x,mean=mean(lynx),sd=sd(lynx)),
      col="blue",
      lwd= 2,
      add= TRUE)

lines(density(lynx),
      col= "green",
      lwd=2)
lines(density(lynx, adjust=3),
      col= "purple",
      lwd=2)
rug(lynx,lwd=2,col="red")
