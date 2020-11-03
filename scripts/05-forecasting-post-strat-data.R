#### Preamble ####
# Purpose: Forecasting on post-strat data
# Author: Lan Cheng, Liyuan Cao, Lan Cheng, Liyuan Cao
# Data: 31 October 2020
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from X and save the folder that you're 
# interested in to inputs/data, run the scripts 04-model-survey-data.r 
# in the scripts folder to obtain the fitted model named 'Model'
# as well as  run the scripts 02-data_cleaning-post-strat
# in the scripts folder to obtain the cleaned post-strat data named 'post_cleaned'

source("scripts/02-data_cleaning-post-strat.r")
source("scripts/04-model-survey-data.r")

#predict the model on the post-strat data to obtain 
#probability to vote Trump 
prob_Trump <- predict(Model,post_cleaned,type="response")








