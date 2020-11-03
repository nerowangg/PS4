#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from [https://usa.ipums.org/usa/index.shtml]
# Author: Shabier Zulihumaer, Zijian Wang
# Data: 29 October 2020
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data



#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data2 <- read_dta("inputs/data/usa_00002.dta")
# Add the labels
raw_data2 <- labelled::to_factor(raw_data2)

# keep some variables 
names(raw_data2)

reduced_data2 <- 
  raw_data2 %>% 
  select( stateicp,
         sex, 
         age, 
         race, 
         educd,
         labforce,
         inctot)

#keep the same format with survey data
#recode variables
reduced_data2_formatted <- reduced_data2 %>% 
  
  rename('gender' = 'sex','education' = 'educd') %>%
  
  mutate(  education = ifelse(education == "bachelor's degree",
                                  "Bachelor degree",
                                  ifelse(education == "master's degree", "Master's degree",
                                        ifelse(education == "doctoral degree", "Doctoral degree", "Other"     
                                        ))),
           race = ifelse(race == "white","White",
                         ifelse(race == "black/african american/negro","Black","Other")),
           
           employment = ifelse(labforce == "no, not in the labor force","No",
                               ifelse(labforce == "yes, in the labor force","Yes","Other")),
           
           income = ifelse(inctot == 9999999, NA, 
                           ifelse(inctot <= 49999,"Low",
                                  ifelse(inctot < 89999,"Middle","High"))),
           
           state = c(state.abb, "DC")[match(stateicp,c(tolower(state.name),"district of columbia"))],
           
           age = ifelse(age == "90 (90+ in 1980 and 1990)", "90",age),
           
           age = as.numeric(age),
           
           age = ifelse(93 >= age & age >= 18,age,NA)
           
           ) %>%
  
  select(gender, age, race, education, employment, income, state) %>% drop_na() 
rm(raw_data2)
         
post_cleaned <- reduced_data2_formatted
####EDA####





         