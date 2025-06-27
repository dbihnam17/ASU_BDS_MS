library(ggplot2)
library(dplyr)

stroke %>%
  ggplot(aes(x=smoking_status))+
  geom_bar(fill='turquoise')+
  labs(
    title='Smoking Status Amongst Stroke Victims',
    x='Smoking Status'
  )+
  theme_bw()
#Bar Graph

my.ctable <- table(stroke$smoking_status, stroke$stroke, dnn=c('Smoking Status','Stroke (1-Yes, 0=No)'))
my.ctable
#Contingency Table

stroke %>%  
  count(stroke, smoking_status) %>% 
  group_by(smoking_status) %>% 
  mutate(freq = n/sum(n)) %>% 
  ggplot(aes(x = smoking_status, y = freq, fill = as.factor(stroke))) + 
  geom_bar(stat="identity", position="dodge")+
  labs(
    title = "Side by Side Bar Graph", 
    x = "Smoking Status", 
    y = "Proportion",
    fill= "Stroke (1=Yes, 0=No)"
  ) + 
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1))
#Side-by-Side

mean(stroke$bmi)
#Mean BMI
  
median(stroke$avg_glucose_level)  
#Median Glucose Level

sd(stroke$avg_glucose_level)
#Standard Deviation of Average Glucose Level

formerlySmoked <- stroke %>% filter(smoking_status=='formerly smoked')
mean(formerlySmoked$bmi)
#Average BMI of Former Smokers

ggplot(data=stroke,aes(x=avg_glucose_level))+
  geom_histogram(bins=35,fill='red')+
  ggtitle('Average Glucose Levels Freq')+
  xlab('Average Glucose Level')
#Average Glucose Level Histogram

ggplot(stroke, aes(x=as.factor(stroke), y=avg_glucose_level)) + geom_boxplot() +
  ggtitle("Distribution of Average Glucose Levels ") +
  ylab("Average Glucose Level") + 
  xlab("Stroke (1=Yes, 0=No)")
#Boxplot

cor(stroke$age,stroke$bmi)
#Correlation Coefficient Between Age and BMI

my.plot2 <- ggplot(data = stroke, aes(x = age, y = bmi)) + geom_point(color = "black") + 
  geom_point(aes(color = factor(stroke)) ) + 
  ggtitle("Relationship between Age and Max HR") +
  xlab("Age (in years) ") + 
  ylab("Max HR (beats/minute)") +
  scale_color_discrete(name="Heart Disease")
my.plot2