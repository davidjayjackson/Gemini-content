## Our World In Data :http://ourworldindata.org
## Feb. 13, 2021
# prevalence-of-drug-use-disorders-by-age
# David Jackson
# Youtube: https://www.youtube.com/channel/UCEYlsdkxG4hY6c5-5d3gxCw
# Gemini Browser: 
# Gemini Capsule: gemini://gemlog.blue/users/cariboudatascienc
##
library(ggplot2)
library(scales)
library(dplyr)
library(janitor)
## Read Data
rm(list=ls())
df <- read.csv("./prevalence-of-drug-use-disorders-by-age.csv")
df <- clean_names(df)
colnames(df) <- c("County","Code","Year","age_14","age_19","age_24",
                  "age_29","age_34","all_age_percent","male_14","age_49",
                                   "age_70","standard_percent")
US <- df %>% filter(Code=="USA") %>% select(Year:standard_percent)
str(df)
## 
ggplot(US) + geom_line(aes(x=Year,y=standard_percent)) +
  labs(title="Standard Percent")
##
ggplot(US) + geom_line(aes(x=Year,y=age_14,col="age_14")) +
  geom_line(aes(x=Year,y=age_19,col="age_19")) +
  geom_line(aes(x=Year,y=age_24,col="age_24")) +
  geom_line(aes(x=Year,y=age_24,col="age_24")) +
  geom_line(aes(x=Year,y=age_29,col="age_29")) +
  geom_line(aes(x=Year,y=age_34,col="age_34")) +
  geom_line(aes(x=Year,y=age_49,col="age_49")) +
  labs(title = "prevalence-of-drug-use-disorders-by-age: 12-49",
       y="prevalence (%) ") +
  guides(color = guide_legend(override.aes = list(size = 2)))
