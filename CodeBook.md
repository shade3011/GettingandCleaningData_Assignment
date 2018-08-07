# CodeBook.md

## Description
This contains additional information about the data. Also contains the steps followed in detail to process the raw data to convert it into tidy data

## Information about Data
**Abstract** - Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain

For each record, it is provided - 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Full description of data - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Source - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Datasets Used
1. Train
  - X_train.txt
  - y_train.txt
  - subject_train.txt
2. Test
  - X_test.txt
  - y_test.txt
  - subject_test.txt
3. features.txt
4. activity_labels.txt

## Data Processing Steps to Create Tidy Data in R v3.3.3
1. Combine both train & test datasets using rbind()
2. Out of the 561 features/variables, keep only the ones which have the keyword "mean" or "std". This is to only consider the features that are the mean or std.deviations of the measurements taken during the experiment. This is done using grep() command to create a logical vector that is then passed to the features dataframe to subset it
3. **y** dataset contains only the values of the activity. These values are converted to factors with their respective names using the activity_labels data. This is done using factor() command
4. The datasets don't contain descriptive column names and hence they are modified to indicate descriptive column names. These names were fetched from features dataset for **X** dataset. For **y** & **subject** dataset, the single columns were renamed to "activity" & "subject" respectively. This was all dones using names() command
5. Now all these **X**, **y** & **subject** datasets are combined into one large dataset using cbind()
6. Tidy data is obtained by summarising the above obtained large dataset to get means of all features at subjecy & activity level. Dplyr is used for this along with summarise_all() command.  
