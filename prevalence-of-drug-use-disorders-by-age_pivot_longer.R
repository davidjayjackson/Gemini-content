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
