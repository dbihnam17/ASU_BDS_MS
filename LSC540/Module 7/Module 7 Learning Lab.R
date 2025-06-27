#Daniel Bihnam
#LSC540: Module 7 Learning Lab

library(dplyr)
library(ggplot2)

TBI<- read.csv("https://raw.githubusercontent.com/jenbroatch/LSC540/main/DataSets/TBI.csv")

TBI <- stack(TBI) 

TBIsum <- TBI %>%    # Get mean & standard deviation by group 
  group_by(ind) %>%
  summarise_at(vars(values),
               list(mean = mean, sd = sd)) 
View(TBIsum)
ggplot(TBIsum,
       aes(x = ind,y = mean, colour = ind)) +
  theme_bw() +
  theme(legend.position = "none") +
  labs(x = "Group Type", y = "Brain water content (%)",
       title = "Brain Water Content by Treatment Type") +
  geom_errorbar(aes(ymin = mean - sd,
                    ymax = mean + sd)) +
  geom_point()

anovamod =aov(values~ind, data=TBI)
summary(anovamod) 

library(multcomp)

TukeyHSD(anovamod)

#Learning Lab Starter
titanicData =read.csv("https://raw.githubusercontent.com/jenbroatch/STP281/master/titanic.csv") 
View(titanicData)
levels(titanicData$survive) 
#Reorder the levels - just because I want to :) 
titanicData$survive <- factor(titanicData$survive, levels = c("yes", "no"))
#Create a contingency table 
class_survive_table <- table(titanic$passenger_class, titanic$survive)
class_survive_table
#Add marginals
class_survive_table2=addmargins(class_survive_table)
class_survive_table2
chisq.test(class_survive_table)

res1 <- chisq.test(class_survive_table)
res1$stdres
