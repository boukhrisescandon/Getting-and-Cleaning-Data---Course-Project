---
title: "Code Book for Getting and Cleaning Data - Course Project"
date: "November 22, 2015"
---

The purpose of this project was to demontrate the ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. 

The deliverable for this project was to create one R script called run_analysis.R that 
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activites in the data set
* Appropriately labels the data set with descriptive variable names
* From that data, then create a second independent tidy data set with the average of each variable for each activity and each subject.

The code below is used to get a list of the variables used for the column names:


```r
names(tidy_data)
```

```
##  [1] "subject"                                      
##  [2] "activity"                                     
##  [3] "TimeBodyAcceleration-mean()-X"                
##  [4] "TimeBodyAcceleration-mean()-Y"                
##  [5] "TimeBodyAcceleration-mean()-Z"                
##  [6] "TimeBodyAcceleration-std()-X"                 
##  [7] "TimeBodyAcceleration-std()-Y"                 
##  [8] "TimeBodyAcceleration-std()-Z"                 
##  [9] "TimeGravityAcceleration-mean()-X"             
## [10] "TimeGravityAcceleration-mean()-Y"             
## [11] "TimeGravityAcceleration-mean()-Z"             
## [12] "TimeGravityAcceleration-std()-X"              
## [13] "TimeGravityAcceleration-std()-Y"              
## [14] "TimeGravityAcceleration-std()-Z"              
## [15] "TimeBodyAccelerationJerk-mean()-X"            
## [16] "TimeBodyAccelerationJerk-mean()-Y"            
## [17] "TimeBodyAccelerationJerk-mean()-Z"            
## [18] "TimeBodyAccelerationJerk-std()-X"             
## [19] "TimeBodyAccelerationJerk-std()-Y"             
## [20] "TimeBodyAccelerationJerk-std()-Z"             
## [21] "TimeBodyGyroscope-mean()-X"                   
## [22] "TimeBodyGyroscope-mean()-Y"                   
## [23] "TimeBodyGyroscope-mean()-Z"                   
## [24] "TimeBodyGyroscope-std()-X"                    
## [25] "TimeBodyGyroscope-std()-Y"                    
## [26] "TimeBodyGyroscope-std()-Z"                    
## [27] "TimeBodyGyroscopeJerk-mean()-X"               
## [28] "TimeBodyGyroscopeJerk-mean()-Y"               
## [29] "TimeBodyGyroscopeJerk-mean()-Z"               
## [30] "TimeBodyGyroscopeJerk-std()-X"                
## [31] "TimeBodyGyroscopeJerk-std()-Y"                
## [32] "TimeBodyGyroscopeJerk-std()-Z"                
## [33] "TimeBodyAccelerationMagnitude-mean()"         
## [34] "TimeBodyAccelerationMagnitude-std()"          
## [35] "TimeGravityAccelerationMagnitude-mean()"      
## [36] "TimeGravityAccelerationMagnitude-std()"       
## [37] "TimeBodyAccelerationJerkMagnitude-mean()"     
## [38] "TimeBodyAccelerationJerkMagnitude-std()"      
## [39] "TimeBodyGyroscopeMagnitude-mean()"            
## [40] "TimeBodyGyroscopeMagnitude-std()"             
## [41] "TimeBodyGyroscopeJerkMagnitude-mean()"        
## [42] "TimeBodyGyroscopeJerkMagnitude-std()"         
## [43] "FrequencyBodyAcceleration-mean()-X"           
## [44] "FrequencyBodyAcceleration-mean()-Y"           
## [45] "FrequencyBodyAcceleration-mean()-Z"           
## [46] "FrequencyBodyAcceleration-std()-X"            
## [47] "FrequencyBodyAcceleration-std()-Y"            
## [48] "FrequencyBodyAcceleration-std()-Z"            
## [49] "FrequencyBodyAccelerationJerk-mean()-X"       
## [50] "FrequencyBodyAccelerationJerk-mean()-Y"       
## [51] "FrequencyBodyAccelerationJerk-mean()-Z"       
## [52] "FrequencyBodyAccelerationJerk-std()-X"        
## [53] "FrequencyBodyAccelerationJerk-std()-Y"        
## [54] "FrequencyBodyAccelerationJerk-std()-Z"        
## [55] "FrequencyBodyGyroscope-mean()-X"              
## [56] "FrequencyBodyGyroscope-mean()-Y"              
## [57] "FrequencyBodyGyroscope-mean()-Z"              
## [58] "FrequencyBodyGyroscope-std()-X"               
## [59] "FrequencyBodyGyroscope-std()-Y"               
## [60] "FrequencyBodyGyroscope-std()-Z"               
## [61] "FrequencyBodyAccelerationMagnitude-mean()"    
## [62] "FrequencyBodyAccelerationMagnitude-std()"     
## [63] "FrequencyBodyAccelerationJerkMagnitude-mean()"
## [64] "FrequencyBodyAccelerationJerkMagnitude-std()" 
## [65] "FrequencyBodyGyroscopeMagnitude-mean()"       
## [66] "FrequencyBodyGyroscopeMagnitude-std()"        
## [67] "FrequencyBodyGyroscopeJerkMagnitude-mean()"   
## [68] "FrequencyBodyGyroscopeJerkMagnitude-std()"
```

The code below displays the number of rows and columns of the final tidy dataset:

```r
nrow(tidy_data)
```

```
## [1] 180
```

```r
ncol(tidy_data)
```

```
## [1] 68
```





