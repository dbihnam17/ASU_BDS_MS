#Daniel Bihnam
#Module 4 Problem Set

library(binom)
library(samplingbook)
library(dplyr)
library(ggplot2)

binom.confint(85,150,0.95,methods='exact')
#95% Confidence interval

sample.size.prop(0.05,0.38,N=Inf,0.95)
#Sample size proportion

cirrhosis <- read.csv('https://raw.githubusercontent.com/jenbroatch/LSC540/main/DataSets/cirrhosis.csv')
#Read cirrhosis CSV

hepat <- table(cirrhosis$Hepatomegaly)
hepat

prop.table(hepat)

binom.confint(160,312,0.95,methods='exact')

my.ctable <- table(cirrhosis$Ascites,cirrhosis$Drug,dnn=c('Ascites Presence','Drug/Placebo'))
my.ctable
addmargins(my.ctable)

prop.test(my.ctable)

prop.test(table(cirrhosis$Drug,cirrhosis$Ascites))

ascites <- table(cirrhosis$Ascites,cirrhosis$Drug,dnn=c('Ascites Presence','Drug/Placebo'))
addmargins(ascites)

prop.test(c(14,10),c(158,154))