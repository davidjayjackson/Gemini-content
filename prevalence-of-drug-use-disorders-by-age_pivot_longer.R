## Our World In Data :http://ourworldindata.org
## Feb. 13, 2021
# prevalence-of-drug-use-disorders-by-age
# David Jackson
# Youtube: https://www.youtube.com/channel/UCEYlsdkxG4hY6c5-5d3gxCw
# Gemini Browser: 
# Gemini Capsule: gemini://gemlog.blue/users/cariboudatascienc
##disorders-by-age.csv")
US <- 
library(ggplot2)
library(scales)
library(dplyr)
library(readr)
library(tidyr)
library(janitor)
## Read Data
rm(list=ls())
df <- read_csv("./prevalence-of-drug-use-disorders-by-age.csv") %>%
filter(Code =="USA") %>% select(-Entity,-Code)

colnames(df) <- c("Year","age_14","age_19","age_24",
                  "age_29","age_34","all_age_percent","age5_14","age15_49",
                                    "age_70","standard_percent")
df <- df %>% select(Year,age_14,age_19,age_24,age_29,age_34,age5_14,
                    age15_49,age_70,all_age_percent,standard_percent)           

## Two Quick Plots:
ggplot(df) + geom_line(aes(x=Year,y=all_age_percent)) +
  labs(title="All Age Precent")
##
ggplot(df) + geom_line(aes(x=Year,y=standard_percent)) +
  labs(title="Age-standardized Percent")

### User dplyr pivot_longer to re-arrange longer
age_longer <- pivot_longer(df,cols=age_14:standard_percent)
age_longer$Percent <- age_longer$value /100

### Age 5-14 and Age 15-49

age_longer %>% filter(name=="age5_14") %>%
  ggplot() + geom_line(aes(x=Year,y=Percent,col=name)) +
  labs(title="Drug by Year for Ages 5 - 14",
       y="Percent of Drug Use") +
  scale_y_continuous(labels=percent)
  
age_longer %>% filter(name=="age15_49") %>%
  ggplot() + geom_line(aes(x=Year,y=Percent,col=name)) +
  labs(title="Drug by Year for Ages 15 - 49",y="Percent of Drug Use") +
  scale_y_continuous(labels=percent)

### Percent by Age Groups: 14 - 70

age_longer %>% filter (name !="all_age_percent") %>% filter( name !="standard_percent") %>%
  filter( name !="age15_49") %>% filter(name !="age5_14") %>%
    ggplot() + geom_line(aes(x=Year,y=Percent,col=name)) +
  scale_y_continuous(labels=percent) + guides(color = guide_legend(override.aes = list(size = 2))) +
  labs(title="Prevalence of Drug Use Disorders by Age")