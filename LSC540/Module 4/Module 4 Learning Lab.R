#Daniel Bihnam
#LSC540

library(binom)
library(samplingbook)

Stroke <- read.csv('https://raw.githubusercontent.com/jenbroatch/LSC540/main/DataSets/brainstroke.csv')
View(stroke)
#Open file

hypertension <- table(Stroke$hypertension,dnn='Hypertension: 1=Y 0=N')
hypertension
#Create and view a table of only hypertension

prop.table(hypertension)
#Proportion of people with Hypertension

binom.confint(479,4981,0.95,methods='exact')
#0.95 Confidence Interval

my.ctable2 <- table(Stroke$stroke,Stroke$hypertension, dnn=c('Hypertension 1=Y 0=N','Stroke 1=Y 0=N'))
my.ctable2
#Create table comparing hypertension and stroke proportions

prop.table(my.ctable2)
#Prop table so I don't have to do math lol

Stroke$stroke <- factor(Stroke$stroke,levels=c('1','0'))
Stroke$hypertension <- factor(Stroke$hypertension,levels=c('1','0'))
leTable <- addmargins(table(Stroke$hypertension,Stroke$stroke))

prop.test(table(Stroke$stroke,Stroke$hypertension))