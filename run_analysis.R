## Getting and Cleaning Data - Course Project
## November 16, 2015

######### Clear workspace and initialize needed libraries #########

rm(list = ls(all = TRUE))

library(data.table)
library(plyr)
library(markdown)
library(knitr)



######### Load data #########

#Training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#Testing data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#Features list for the column names
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

#Modify the column names on the training and testing sets
colnames(x_train) <- t(features[2])
colnames(x_test) <- t(features[2])

#Add activites and participants to the x_train and x_test sets
x_train$activities <- y_train[, 1]
x_train$participants <- subject_train[, 1]
x_test$activities <- y_test[, 1]
x_test$participants <- subject_test[, 1]



######### Merge the training and test sets into one data set and remove duplicates#########

merged <- rbind(x_train, x_test)
duplicated(colnames(merged))
merged <- merged[, !duplicated(colnames(merged))]



######### Extract measurements on the mean and standard deviation for each measurement #########

mean <- grep("mean()", names(merged), value = FALSE, fixed = TRUE)
mean <- append(merged, 471:477)
#InstrumentMeanMatrix <- merged[mean]

std <- grep("std()", names(merged), value = FALSE)
#InstrumentSTDMatrix <- merged[std]



######### Use descriptive activity names to name the activites in the data set #########

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

merged$activities[merged$activities == 1] <- as.character(activity_labels[1,2])
merged$activities[merged$activities == 2] <- as.character(activity_labels[2,2])
merged$activities[merged$activities == 3] <- as.character(activity_labels[3,2])
merged$activities[merged$activities == 4] <- as.character(activity_labels[4,2])
merged$activities[merged$activities == 5] <- as.character(activity_labels[5,2])
merged$activities[merged$activities == 6] <- as.character(activity_labels[6,2])
merged$activities <- as.factor(merged$activities)



######### Label the data set with descriptive variable names #########

names(merged) <- gsub("Acc", "Acceleration", names(merged))
names(merged) <- gsub("Mag", "Magnitude", names(merged))
names(merged) <- gsub("Gyro", "Gyroscope", names(merged))
names(merged) <- gsub("^t", "time", names(merged))
names(merged) <- gsub("^f", "frequency", names(merged))



######### Create a second independent tidy data set with the average of each variable #########
######### for each activity and each subject.                                         ######### 

merged.dt <- data.table(merged)
tidy_data <- merged.dt[, lapply(.SD, mean), by = 'participants,activities']
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)

