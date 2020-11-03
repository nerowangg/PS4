#### Preamble ####
# Purpose: Perform some basic EDA
# Author: Lan Cheng, Liyuan Cao
# Data: 29 October 2020
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from X and save the folder that you're 
# interested in to inputs/data, run scripts 01-data_cleaning-survey.r

library(ggpubr)
source("scripts/01-data_cleaning-survey.r")

p1 <- ggdensity(survey_cleaned, x = "age",
                add = "mean", rug = TRUE,
                color = "gender", fill = "gender",
                palette = c("#00AFBB", "#E7B800")) + facet_wrap(~income)
p1