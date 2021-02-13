## Our World In DAta (http://ourworldindata.org)
install.packages("ggplot2")
library(ggplot2)
rm(list=ls())
df <- read.csv("./prevalence-of-drug-use-disorders-males-vs-females.csv")
US <- subset(df,Code =="USA" & Year >="1990")
## Plot1:
plot(US$Year,US$Male,main="Male",type="l")
grid(col="gray")
## Plot2:
plot(US$Year,US$Female,type="l",main="Female")
grid(col="gray")
## Plot 3:
ggplot(US) + geom_line(aes(x=Year,y=Male,col="Males")) +
  geom_line(aes(x=Year,y=Female,col="Female")) +
  labs(title="Share(%) of population suffering from drug use disorders: males versus females",y="Drug use prevalence ")