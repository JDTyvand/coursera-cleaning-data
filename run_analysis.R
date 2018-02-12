library(dplyr)

## Note that the steps given in the course project description are
## not followed in numerical order. They are however given as comments
## before the code segments fulfilling the step requirements.

## Read the data files into data frames and fulfill required step
# "Appropriately labels the data set with descriptive variable names."

subjectTrain <- read.table("subject_train.txt", col.names = "subject")
subjectTest <- read.table("subject_test.txt", col.names = "subject")
xTrain <- read.table("X_train.txt")
xTest <- read.table("X_test.txt")
yTrain <- read.table("y_train.txt", col.names = "activity")
yTest <- read.table("y_test.txt", col.names = "activity")

features <- read.table("features.txt")
activities <- read.table("activity_labels.txt", col.names=c("activityID","activity"))

colnames(xTrain) <- as.character(features$V2)
colnames(xTest) <- as.character(features$V2)

## "Merges the training and the test sets to create one data set."

training <- cbind(subjectTrain, yTrain, xTrain)
test <- cbind(subjectTest, yTest, xTest)

merged <- rbind(training, test)

## "Extracts only the measurements on the 
##  mean and standard deviation for each measurement." 

extractedCols <- grep("mean\\(\\)|std\\(\\)", colnames(merged))

merged <- merged[,c(1, 2, extractedCols)]

## "Uses descriptive activity names to name the activities in the data set"

merged$activity <- as.factor(merged$activity)
levels(merged$activity) <- activities$activity

## "From the data set in step 4, creates a second, independent tidy 
## data set with the average of each variable for each activity and each subject."

tidyData <- merged %>% 
        group_by(subject, activity) %>%
        summarise_all(funs(mean)) %>% 
        arrange(subject, activity)

## Write the tidy data set to the required .txt file

write.table(tidyData, "tidyData.txt", row.names=FALSE)