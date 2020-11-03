#### Preamble ####
# Purpose: Prepare and clean the survey data downloaded from [https://www.voterstudygroup.org/downloads?key=196fe68b-363c-46f1-880b-75b48cd5dc4d]
# Author: Lan Cheng, Liyuan Cao
# Data: 28 October 2020
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from X and save the folder that you're 
# interested in to inputs/data 



#### Workspace setup ####
library(haven)
library(tidyverse)
# Read in the raw data (You might need to change this if you use a different dataset)
raw_data <- read_dta("inputs/data/ns20200625/ns20200625.dta")
# Add the labels
raw_data <- labelled::to_factor(raw_data)
# Just keep some variables
reduced_data <- 
  raw_data %>% 
  select(interest,
         registration,
         vote_2016,
         vote_intention,
         vote_2020,
         ideo5,
         employment,
         foreign_born,
         gender,
         census_region,
         hispanic,
         race_ethnicity,
         household_income,
         education,
         state,
         congress_district,
         age)


####the response is Trump, 1 = will vote, 0 = vote Biden
#### keep variables and recode them to be consistent with ACS data
reduced_data_formatted <- reduced_data %>%
  rename('race' = 'race_ethnicity') %>%
mutate( 
      
      Trump = ifelse(vote_2020 == "Donald Trump",1,
                     ifelse(vote_2020 == "Joe Biden",0,NA)),
      
      gender = tolower(gender),
       
       education = ifelse(education == "College Degree (such as B.A., B.S.)",
                          "Bachelor degree",
                   ifelse(education == "Masters degree", "Master's degree",
                   ifelse(education == "Doctorate degree", "Doctoral degree", "Other"     
                         ))),
       race = ifelse(race == "White","White",
                     ifelse(race == "Black, or African American","Black","Other")),
       
       
       employment = ifelse(employment %in% c("Full-time employed","Homemaker",
                                             "Part-time employed","Self-employed"),
                           "Yes",ifelse(employment %in% c("Retired",
                                                          "Unemployed or temporarily on layoff",
                                                          "Permanently disabled", "Student"),
                                                          "No","Other")),
       income = ifelse(household_income %in%
                        c( "Less than $14,999", "$15,000 to $19,999", "$20,000 to $24,999" ,"$25,000 to $29,999",
                           "$30,000 to $34,999",   "$35,000 to $39,999" ,  "$40,000 to $44,999" ,  "$45,000 to $49,999"  )
                       ,"Low",ifelse(household_income %in%
                        c("$50,000 to $54,999" ,  "$55,000 to $59,999",   "$60,000 to $64,999" ,  "$65,000 to $69,999",
                          "$70,000 to $74,999" ,  "$75,000 to $79,999" ,  "$80,000 to $84,999",   "$85,000 to $89,999"),
                        "Middle","High")
                       )) %>%
select(Trump, gender, age, race, education, employment, income, state) %>% drop_na()  


survey_cleaned <- reduced_data_formatted
