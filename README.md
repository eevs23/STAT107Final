# STAT107Final
STAT 107 Final Project

Who Voted for Whom in 2024? Demographics, Social Class and Party Identification in U.S. Presidential Vote Choice
This project uses data from the 2024 American National Election Studies (ANES) to ask which demographic characteristics and political identities are associated with voting for the Democratic or the Republican candidate in the 2024 U.S. presidential election. After cleaning the survey data, we kept the 3,603 respondents who reported voting for one of the two major-party candidates and studied their age, gender, race and ethnicity, education, self-reported social class and party identification. Preliminary visualizations and tests show that vote choice differs significantly across every characteristic we examined, although the age difference is small. Party identification has by far the strongest relationship with vote choice, since about 98% of Democratic identifiers and 94% of Republican identifiers voted for their party's candidate. Among the demographic characteristics, race, education and gender show the largest differences, while age has a small effect and social class follows a non-linear pattern. These results are associations in an unweighted sample and do not show causation. Next, we plan to fit logistic regression models with and without party identification, evaluate their predictive accuracy with cross-validation, and check the robustness of the results with survey weights

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
