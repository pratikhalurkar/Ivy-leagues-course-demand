setwd('D:/NEU/ALY 6000/Project module 6')
library(tidyverse)
library(ggplot2)


csv <- read.csv("appendix.csv")

head(csv)
summary(csv)
#How is the particiaption per year going on?
harvardX %>%
  ggplot(aes(Year, Participants..Course.Content.Accessed.))+
  geom_smooth(method =glm, se =F, colour = "red")+
  labs( title = "Participation in course content per year")+
  xlab('Year')+  ylab('Course Content Access')+
  theme_bw()

#How many lectures did each institution have
csv %>%
  ggplot(aes(Institution)) + geom_bar(aes(fill=Institution)) +
  xlab('Institution') + ylab('Count')

#Did the number of lectures increase?
harvardX <- csv[csv$Institution == "HarvardX",]
mitX <- csv[csv$Institution =="MITx",]
Harvard <- ggplot(harvardX, aes(harvardX$Year)) + 
                    geom_bar(aes(fill=harvardX$Course.Subject))+ xlab('Year') + ylab('Count') + labs(title='Harvard',fill='Institution')
MIT <- ggplot(mitX, aes(mitX$Year)) +
  geom_bar(aes(fill=mitX$Course.Subject)) +xlab('Year') +ylab('Count')+ labs(title='MIT',fill='Institution')
Harvard
MIT

                  