#Library
library(dplyr)

#Set working directory
setwd("G:/My Drive/Sharan Biradar/Learning/Coursera/Data Science Specialisation/3. Getting and Cleaning Data/Assignments")

#Download the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "UCI HAR Dataset.zip")

#Check to see if it's downloaded
list.files()

#Extract the contents
unzip("UCI HAR Dataset.zip")
list.files()

#Read train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Read test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Read features data
features <- read.table("UCI HAR Dataset/features.txt")

#Read activity labels data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")


#Step 1 - Merge the training and test data to create one dataset
X_combined <- rbind(X_train, X_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)

#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement.
selected_features <- features[grep("mean|std",features$V2),]
X_combined_subset <- X_combined[,selected_features$V1]

#Step 3 - Use descriptive activity names to name the activities in the data set
y_combined_named <- y_combined %>% mutate(V1 = factor(V1, activity_labels$V1, labels = activity_labels$V2))
str(y_combined_named)

#Step 4 - Appropriately label the data set with descriptive variable names.
names(X_combined_subset) <- selected_features$V2
names(y_combined_named) <- "activity"
names(subject_combined) <- "subject"

#Step 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
all_combined_dataset <- cbind(subject_combined, X_combined_subset, y_combined_named)

tidy_data <- all_combined_dataset %>% 
    group_by(subject, activity) %>% 
    summarise_all(mean)

#Output the result
write.csv(tidy_data, "tidy_data.csv", row.names = FALSE)
