# Overview

This repo contains code and data for forecasting the US 2020 presidential election. It was created by NAME. The purpose is to create a report that summarises the results of a statistical model that we built. Some data is unable to be shared publicly. We detail how to get that below. The sections of this repo are: inputs, outputs, scripts.

The data sets are not included in the repo but could be found easily. We use two datasets: 
  
- [Survey data - Request access to the Democracy Fund + UCLA Nationscape ¡®Full Data Set¡¯: https://www.voterstudygroup.org/publication/nationscape-data-set.]
- [ACS data - We will use the American Community Surveys (ACS). Please create an account with IPUMS: https://usa.ipums.org/usa/index.shtml. You want the 2018 5-year ACS. Then you need to select some variables. Some options include: REGION, STATEFIP, AGE, SEX, MARST, RACE, HISPAN, BPL, CITIZEN, EDUC, LABFORCE, INCTOT.]

The data sets that are modified from the soures data are could be created using r files in scripts folder

- survey_cleaned,  
- post_cleaned 

Scripts contain R scripts that take sources of data sets and produce cleaned data sets as well as models, forecastings. These are:
  
  - 01_data_cleaning.R
  - 02_data_preparation.R
  - 03-data-survey-EDA.R
  - 04-model-survey-data.R
  - 05-forecasting-post-strat-data.R


Rmd, PDF files are main outcomes of the study which include our studies on the topicmodels::
