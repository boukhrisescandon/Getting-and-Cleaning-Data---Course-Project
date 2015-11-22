## Getting and Cleaning Data - Course Project
## November 16, 2015

######### Clear workspace, set working directory, and initialize needed libraries #########

rm(list = ls(all = TRUE))

setwd("~/Desktop/Johns Hopkins - Data Science Certification/03_Getting and Cleaning Data/Course Project")

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
data_features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

subject <- rbind(subject_train, subject_test)
features <- rbind(x_train, x_test)
activity <- rbind(y_train, y_test)

#Modifiy the column names
names(subject) <- c("subject")
names(activity) <- c("activity")
names(features) <- data_features$V2

######### Merge the training and test sets into one data set #########

subject_activity <- cbind(subject, activity)
merged <- cbind(features, subject_activity)

######### Only keep mean and standard deviation #########

mean_std_names <- data_features$V2[grep("mean\\(\\)|std\\(\\)", data_features$V2)]


include_names <- c(as.character(mean_std_names), "subject", "activity")
merged <- subset(merged, select=include_names)


######### Label the data set with descriptive variable names #########

names(merged) <- gsub("Acc", "Acceleration", names(merged))
names(merged) <- gsub("Mag", "Magnitude", names(merged))
names(merged) <- gsub("Gyro", "Gyroscope", names(merged))
names(merged) <- gsub("^t", "Time", names(merged))
names(merged) <- gsub("^f", "Frequency", names(merged))
names(merged) <- gsub("BodyBody", "Body", names(merged))


######### Create a second independent tidy data set with the average of each variable #########
######### for each activity and each subject.                                         ######### 

merged_final <- aggregate(. ~subject + activity, merged, mean)
tidy_data <- merged_final[order(merged_final$subject, merged_final$activity), ]
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)


######### Create Codebook #########

knit2html("code_book.Rmd");


