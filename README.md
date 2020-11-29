# coursera-getting-and-cleaning-data-final-project
Final project submission for course "Getting and Cleaning Data" from Johns Hopkins University on Coursera.

## Introduction
This repository contains four files: 
* **run_analysis.R** - the R script used to analyze the UCI HAR dataset
* **summary.txt** - the tidy data table containing the summary of the variables in the dataset in a txt file
* **README.md** - contains general information for this repository and how the script works
* **CodeBook.md** - contains information about the variables, lifted from features_info.txt file in the UCI HAR dataset

This project is made as part of the requirement for the Coursera course "Getting and Cleaning Data".


## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "UCI HAR Dataset")

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How the Script Works
1. Loads the tidyr and dplyr libraries.
2. Imports the various text files in the zip file into list objects in R. **[STEP 1]**
* First checks whether a subdirectory data exists and creates it if there is none.
* Sets the working directory to the data subdirectory, then downloads and unzips the UCI HAR Dataset zip folder.
* Imports all the text files into list objects according to their position in the subdirectory. Text files in "./UCI HAR Dataset/test" are imported into the list object TestIDFiles. Text files in "./UCI HAR Dataset/test/Inertial Signals" are imported into TestInertialSignals. Similarly for TrainIDFiles and TrainInertialSignals.
* activity_labels.txt is imported as a separate object.
3. Substitute the activity labels in the first element of the activity list with the labels given in activity_labels.txt. **[STEP 3]**
4. Combines training and test sets using rbind, yielding three data frames: subject, measurement, and activity. The three data frames are combined into one data table called all_data using cbind. **[STEP 1]**
5. Selects the columns in all_data that pertain to the mean and standard deviation of the measurement variables, as well as the two ID variables: subject and activity. **[STEP 2]**
6. Renames the measurement variables in all_data into understandable English by applying gsub many times to add spaces and expand abbreviations. **[STEP 4]**
7. Creates the requisite summary data frame (summary.txt) with the average of each variable grouped by activity and subject using summarize_all. **[STEP 5]**
8. Exports summary.txt into the working directory.


