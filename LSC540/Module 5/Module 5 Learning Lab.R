#Daniel Bihnam
#Module 5 Learning Lab

library(dplyr)
library(ggplot2)

brainstroke <- read.csv('https://raw.githubusercontent.com/jenbroatch/LSC540/main/DataSets/brainstroke.csv')
brainstroke
#load data

ggplot(data=brainstroke,aes(x=bmi))+
  geom_histogram(bins=35,fill='navy')+
  ggtitle('DB-Distribution of BMI')+
  xlab('BMI')
#Plot BMI histogram

t.test(brainstroke$bmi)
#BMI 95% CI and p-value

t.test(brainstroke$bmi,mu=25)
#Hypothesis test

t.test(bmi~stroke,data=brainstroke)
#2 sample t-test