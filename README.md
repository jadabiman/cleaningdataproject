# cleaningdataproject

## The Data
Data collected from the accelerometers from the Samsung Galaxy S smartphone in experiments on 30 volunteers 19-48 years old. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were also recorded

## The Project
Final programming assignment for Coursera Getting & Cleaning Data course. The purpose of the project is to demonstrate an ability to collect, work with, and clean a data set. A signe R script was used to process and combine the original data into a tidy data set which was then used to generate a new data set for each subject and activity.

## The Files
1. README.md: this document outlines the contained files and analysis process
2. run_analysis.R: R script used to analyze original data and generate data2
3. summary.csv: output from run_analysis.R 
4. CodeBook.md: code book that describes the variables,  data, and transformations 

## Using run_analysis.R
- Download original data into working directory from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Run script run_analysis.R
- Tidy data will be exported as a .txt file
