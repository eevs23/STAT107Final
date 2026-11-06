# STAT107Final
STAT 107 Final Project

Who Voted for Whom in 2024? Demographics, Social Class and Party Identification in U.S. Presidential Vote Choice
We pulled from the 2024 American National Election Studies (ANES) to ask which characteristics are associated with voting either Democrat or Republican for th the 2024 presidential election. We cleaned the data and kept the 3,603 respondents who reported voting for either R or D and studied their characteristics (ex: age, gender, ethnicity, education level, party identification, etc). Preliminary visualizations and tests show that the vote choice significantly differs across every characteristic except age difference, with party ID being the strongest relationship. Next, we plan to fit logistic regression models with and without party ID to evaluate their predictive accuracy. 

# Files Used

00_requirements.R is the R document with all of the libraries and packages needed for the code to run. 

01_funct_Plots.R is the base functions for the visualization and the tests of the vote analysis.

11_DataCleaning.Rmd is all the data cleaning we did on the initial dataset 

12_cleanedElectionData.RData is our cleaned data. 

13_Analysis.Rmd is our analysis on the data, which has some visualizations 

21_DataProcessing is more data processing and produces 22_processedElection Data. Then 31_DataVisualization.Rmd uses 22_processedElection Data to create visualizations. These 3 are split from 13_analysis Rmd. 

FinalReport.Rmd is our final report. 

Stat107Final.RProj is just the internal code that saves our environment. 

anes.csv is our dataset of election data 

# Reproducibility 

First run the libraries and functions in 00 and 01. Then, run 11_DataClearning.Rmd for the initial data cleaning. Then once that is done, that will load into 12_Cleaned Election Data. Then From there, we analyzed the data in 13_Analysis.Rmd (and then later split 13 into 21,22, and 31 because that was what the instructions said to do). Then we synthesized and analyzed in FinalReport.Rmd. 
