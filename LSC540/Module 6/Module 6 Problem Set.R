#Daniel Bihnam
#LSC540:Module 6 Problem Set

library(Lock5Data)
library(ggplot2)
data <- SleepStudy

reg1 <- lm(data$Happiness~data$AverageSleep)
plot(data$AverageSleep,data$Happiness,
     xlab='Amount of Sleep',ylab='Happiness',main='DB-Effect of Amount of Sleep
     On Happiness of College Students')
abline(reg1)
summary(reg1)


plot(data$Drinks,data$GPA,xlab='x',ylab='y')

ggplot(data,aes(x=as.factor(AllNighter),y=GPA))+
  geom_boxplot()

reg2 <- lm(data$GPA~data$AllNighter+data$Drinks)
summary(reg2)


