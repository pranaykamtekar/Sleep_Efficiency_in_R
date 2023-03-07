#Reading the csv
a <- read.csv(file ='Sleep_Efficiency.csv')
#Structuring the DF
str(Sleep_Efficiency)

#Installing the package
install.packages("tidyverse")
library(tidyverse)

#Checking the NA value in DF
#At present we have 65 NA in dataset
sum(is.na(Sleep_Efficiency))
#Finding at which column NA is present
colSums(is.na(Sleep_Efficiency))
str(Sleep_Efficiency)

#Data cleaning of NA 
clean.data <- na.omit(Sleep_Efficiency)
sum(is.na(clean.data))
view(clean.data)
head(clean.data,10)
tail(clean.data,10)
summary(clean.data$Sleep.duration)
summary(clean.data$Sleep.efficiency)

#Installing the skimr for advanced stats of dataset
library(skimr)
skim(clean.data)
clean.data%>%
  dplyr::group_by(Sleep.duration)%>%
  skim()

#Data Visualisation
plot(clean.data,col="Green")
plot(clean.data$Age, clean.data$Sleep.duration,col="Red",xlab = "Age",ylab = "Sleep duration")
#abline(clean.data$Age, clean.data$Sleep.duration) (Drawing the trend line)

ggplot(data = clean.data,aes(x = Age,y = Sleep.efficiency))+ geom_point(aes(color=Smoking.status))+geom_smooth(col="white")
ggplot(data = clean.data,aes(x = Age,y = Sleep.duration))+ geom_point(aes())+geom_smooth(col="red")
ggplot(data = clean.data,aes(x = Age,y = Deep.sleep.percentage))+ geom_point(aes())+geom_smooth(col="white")
ggplot(data = clean.data,aes(x = Age,y = Light.sleep.percentage))+ geom_point(aes())+geom_smooth(col="white")


#Drawing the multiple plots in one
par(mfrow=c(2,2))
plot(clean.data$Age,clean.data$Sleep.efficiency)
plot(clean.data$Age,clean.data$Light.sleep.percentage)
plot(clean.data$Age,clean.data$Caffeine.consumption)
plot(clean.data$Age,clean.data$Alcohol.consumption)

#Summarizing the all
summary(clean.data)


