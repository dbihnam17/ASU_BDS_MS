#Daniel Bihnam
#LSC540:Module 6 Learning Lab

library(Lock5Data)
View(SleepStudy)

data <- SleepStudy

reg1 <- lm(data$DepressionScore~data$PoorSleepQuality)
plot(data$PoorSleepQuality,data$DepressionScore,
     xlab='Poor Sleep Quality',ylab='Depression Score')
abline(reg1)
summary(reg1)

reg2 <- lm(data$DepressionScore~data$PoorSleepQuality+data$Stress)
summary(reg2)
