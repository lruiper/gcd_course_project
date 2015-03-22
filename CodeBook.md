Codebook for Getting and Cleaning Data Course Project
==================================

## Data

The raw data used during this course project is the result of an experiment carried out by Jorge L. Reyes-Ortiz et. alt. In this experiment, a group of 30 volunteers performed six activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The accelerometer and the gyroscope of the phone collected the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The collected signals where filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using a low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

The dataset provides the triaxial acceleration from the accelerometer and the estimated body acceleration, the triaxial angular velocity from the gyroscope, a vector with time and frequency domain variable, the activity label and an identifier of the subject that carried out the experiment. 

The data for this project can be found in
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The files used in this project are:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt'

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Variables

The following variables where defined during the project:

- testSubjects: stores the subject info from test/subject_test.txt
- testActivity: stores the activity info from test/y_test.txt
- testData: stores the collected data in test/X_test.txt 
- trainSubjects: stores the subject info from train/subject_train.txt
- trainActivity: stores the activity info from train/y_train.txt
- trainData: stores the collected train data containde in train/X_train.txt

- featureNames: stores the names of the features from the file features.txt
- activityLabels: stores the activity labels from the file  <- activity_labels.txt


-subjects: stores the row-wised binded info stored in --trainSubjects and testSubjects
-activity: stores the row-wised binded info stored in trainActivity and testActivity
-data: stores the row-wised binded info stored in trainData and testData
-mergedData: stores the column-wised binded info stored in  data, activity and subjects

-meanAndStdColumns: stores the columns that contain "-std()" or "-mean()", that is, the columns containing the mean or the standard deviation of the observation
-meanAndStdData: Stores the mean and the standard deviation for each observation

-dataSet2: dataset containing the mean for each pair of subject-activity.
