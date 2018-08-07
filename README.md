# GettingandCleaningData_Assignment

This repository is created for the purposes of solving the final assignment of **Getting and Cleaning Data** course from Coursera. 

## Overview of the Assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Information about data 
Data is about experiments carried out to determine human activity using smartphones. These experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Instructions for the Assignment
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Code Execution - How to run it?
1. Extract the data from the Course website into a folder and unzip it
2. Download the **Peer Graded Assignment - Run_Analysis.R** code into the folder
3. Execute the code to get the tidy data

## Code Execution - What does the code do? Numbers below indicate steps
1. Reads the 3 datasets available in train & test folder - X, y & subject
2. Reads the features data. This data contains the names of the columns
3. Reads the activity labels data. This data contains the names of the activity
4. Combines the respective train & test data - X_combined, y_combined, subject_combined
5. Features which are mean or std.deviation of the measurements are extracted. They are extracted by the keywords - mean, std. The X data is subsetted only for these features
6. Activity labels data is used to label the activity numbers in the y dataset
7. Variables names of all three datasets - X, y & subject are given descriptive names
8. All the three have been combined to form one large dataset and summarised to give mean values for each subject & activity thus resulting in tidy data

