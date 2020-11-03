#### Preamble ####
# Purpose: Build Model on survey data
# Author: Lan Cheng, Liyuan Cao, Lan Cheng, Liyuan Cao
# Data: 30 October 2020
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from X and save the folder that you're 
# interested in to inputs/data, run the scripts 01-data_cleaning-survey.r 
# in the scripts folder to obtain the cleaned survey training data named 'survey_cleaned'

library(glmmTMB)
library(Pmisc)
library(ggplot2)

source("scripts/01-data_cleaning-survey.r")

#build the GLMM model with state as random effects
Model = glmmTMB(Trump ~ age + gender + race + education + employment + 
                         income + (1 | state), data = survey_cleaned,
                      family = binomial(link = "logit"))






