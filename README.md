# Getting and cleaning data Course Project.

This file contains information about the files in this repo. The data used during this project can be downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Files in this repo
* README.md -- you are reading it right now
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code

## Goals
The downloaded dataset must be proccesed in order to:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

The resulting script can be found in the file run_analysis.R. It must be run in a folder UCI HAR Dataset. The work directory must contain the following files and folders:
* activity_labels.txt
* features.txt
* test/
* train/

The script creates an output file named tidydata.txt

### run_analysis set up

The script first reads the test and training files and stores the information in different variable. The script also reads the names and labels of the features and the activities.

### Goal 1.

The script merges row-wise the info related to activities, subjects and data into three sub-datasets. Then labels the activities, the subjects and the features and merges it all to create a single dataset.

### Goal 2.

The script reads the names in the merged dataset and filters the ones containing -std() or -mean() in order to get the ones indicating the mean value and/or the standard deviation of each observation. Then uses those results to actually extract the mean and the std.

### Goal 3. 

The script reads the activity column in the dataset and substitutes each number (code) for its corresponding activity label.

### Goal 4.

The script substitutes abbreviations with descriptive labels and and replaces blank spaces with no spaces.

### Goal 5.

The script creates a new dataset containing the mean of each pair subject-activity and stores it in a file named tidydata.txt.

