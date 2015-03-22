library(data.table)
library(plyr)


## Part 0: Loading files

# Read test data

testSubjects <- read.table("test/subject_test.txt")
testActivity <- read.table("test/y_test.txt")
testData <- read.table("test/X_test.txt")

# Read training data

trainSubjects <- read.table("train/subject_train.txt")
trainActivity <- read.table("train/y_train.txt")
trainData <- read.table("train/X_train.txt")

# Read feature names and activity labels

featureNames <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt", header = FALSE)

## Part 1: Merging test and train datasets

subjects <-rbind(trainSubjects, testSubjects)
activity <- rbind(trainActivity, testActivity)
data <- rbind(trainData, testData)

colnames(activity) = "Activity"
colnames(subjects) = "Subject"
colnames(data) <- t(featureNames[2])

mergedData <- cbind(data, activity, subjects)

## Part 2: Extract only mean and std for each measurement

# Looks for the names in mergedData containing the string -std() or -mean()

meanAndStdColumns <- grepl("-std\\(\\)|-mean\\(\\))", names(mergedData))

#Using the previous result, we stract the mean or the standard deviation for each measurement
meanAndStdData <- mergedData[,meanAndStdColumns]

## Part 3: Uses descriptive activity names to name the activities in the data set


#Cast column "Activity" to character
mergedData$Activity <- as.character(mergedData$Activity)

#We substitute each activity code (from 1 to 6) with its corresponding activity

mergedData$Activity[mergedData$Activity == 1] <- "Walking"
mergedData$Activity[mergedData$Activity == 2] <- "Walking Upstairs"
mergedData$Activity[mergedData$Activity == 3] <- "Walking Downstairs"
mergedData$Activity[mergedData$Activity == 4] <- "Sitting"
mergedData$Activity[mergedData$Activity == 5] <- "Standing"
mergedData$Activity[mergedData$Activity == 6] <- "Laying"

#Recast as factor

mergedData$Activity <- as.factor(descMergedData$Activity)

## Part 4: Appropriately labels the data set with descriptive names.

names(mergedData) <- gsub('\\(|\\)',"",names(mergedData), perl = TRUE)


names(mergedData) <- gsub('Acc',"Acceleration",names(mergedData))
names(mergedData) <- gsub('GyroJerk',"AngularAcceleration",names(mergedData))
names(mergedData) <- gsub('Gyro',"AngularSpeed",names(mergedData))
names(mergedData) <- gsub('Mag',"Magnitude",names(mergedData))
names(mergedData) <- gsub('^t',"TimeDomain.",names(mergedData))
names(mergedData) <- gsub('^f',"FrequencyDomain.",names(mergedData))
names(mergedData) <- gsub('\\.mean',".Mean",names(mergedData))
names(mergedData) <- gsub('\\.std',".StandardDeviation",names(mergedData))
names(mergedData) <- gsub('Freq\\.',"Frequency.",names(mergedData))
names(mergedData) <- gsub('Freq$',"Frequency",names(mergedData))


## Part 5: 

# Find the mean for each combination of subject and activity

dataSet2 <- aggregate(. ~Subject + Activity, mergedData, mean)

# Create the new dataset
dataSet2 <- dataSet2[order(dataSet2$Subject,dataSet2$Activity),]

# Store the dataset in the file tidydata.txt

write.table(dataSet2, file = "tidydata.txt",row.name=FALSE)
