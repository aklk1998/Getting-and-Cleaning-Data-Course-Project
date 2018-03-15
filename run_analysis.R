##
## Name of the script: run_analysis.R
##
## Creation Date: Mar 14, 2018
##
## Source of data: Human Activity Recognition Using Smartphones Dataset
##                (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
##
##     Source data file names: 
##        (1) X_test.txt
##        (2) y_test.txt
##        (3) subject_text.txt)
##        (4) X_train.txt
##        (5) y_train.txt
##        (6) subject_train.txt
##
##     Column Names File/Descriptions: 
##        (1) features.txt
##        (2) features_info.txt
##
##     README.txt
## 
##     All above files are copied to folder: C:\Data Files\Coursea\Getting_and_Cleaning_Data
##
## Description of the source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## Purpose of this script "run_analysis.R:
##
## (1) Merges the training and the test sets to create one data set.
## (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## (3) Uses descriptive activity names to name the activities in the data set
## (4) Appropriately labels the data set with descriptive variable names. 
## (5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## (6) Write output table to a txt file without row names
##     (6.1) by_activity_subject_mean to by_activity_subject_mean.txt
##
## Output Table Names:
##
##   (1) combined_train_test_data
##   (2) by_activity_subject_mean
##
## Output txt file names:
##
##   (1) by_activity_subject_mean to by_activity_subject_mean.txt
##
##   output file directory: C:\Data Files\Coursea\Getting_and_Cleaning_Data
##

##
## Beginning of the script
##

##
## Loadings of packages used later
##
library(dplyr)

##
## Assign the location of Test data
##
url_test_measurements="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\X_test.txt"
url_test_activity="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\y_test.txt"
url_test_subject="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\subject_test.txt"

##
## Assign the location of Train Data
##
url_train_measurements="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\X_train.txt"
url_train_activity="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\y_train.txt"
url_train_subject="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\subject_train.txt"

##
## Load Test Data
##
test_measurements<-read.table(url_test_measurements,header=FALSE)
test_activity<-read.table(url_test_activity,header=FALSE)
test_subject<-read.table(url_test_subject,header=FALSE)

##
## Load Train Data
##
train_measurements<-read.table(url_train_measurements,header=FALSE)
train_activity<-read.table(url_train_activity,header=FALSE)
train_subject<-read.table(url_train_subject,header=FALSE)

##
## Rename the columns in test data: test_subject and test_activity to more descriptive names
##
colnames(test_subject)<-"subject"
colnames(test_activity)<-"activity"

##
## Rename the columns in train data: train_subject and train_activity to more descriptive names
##
colnames(train_subject)<-"subject"
colnames(train_activity)<-"activity"

##
## Combine All 3 test data frames (test_measurements,test_subject, test_activity)
## into 1 test_matrix
##
test_matrix<-cbind(test_measurements,test_subject,test_activity)

##
## Using cbind to combine All 3 train data frames (train_measurements, train_subject, train_activity)
## into train_matrix
##
train_matrix<-cbind(train_measurements,train_subject,train_activity)

##
## Using rbind to append the test_matrix to train_matrix into a temp_matrix
## for further manipulation
##
temp_matrix<-rbind(train_matrix,test_matrix)

##
## rename the columns to the original names (the names contain the word "mean" or "std) 
## from the source data set on the basis of the document: features.txt
##
colnames(temp_matrix)[c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,
                    123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                    227,228,240,241,253,254,266,267,268,269,270,271,294,295,
                    296,345,346,347,348,349,350,373,374,375,424,425,426,427,
                    428,429,452,453,454,503,504,513,516,517,526,529,530,539,
                    542,543,552)]<-
                    c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y",
                            "tBodyAcc-mean()-Z","tBodyAcc-std()-X",
                            "tBodyAcc-std()-Y","tBodyAcc-std()-Z",
                            "tGravityAcc-mean()-X","tGravityAcc-mean()-Y",
                            "tGravityAcc-mean()-Z","tGravityAcc-std()-X",
                            "tGravityAcc-std()-Y","tGravityAcc-std()-Z",
                            "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y",
                            "tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X",
                            "tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                            "tBodyGyro-mean()-X","tBodyGyro-mean()-Y",
                            "tBodyGyro-mean()-Z","tBodyGyro-std()-X",
                            "tBodyGyro-std()-Y","tBodyGyro-std()-Z",
                            "tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y",
                            "tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X",
                            "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z",
                            "tBodyAccMag-mean()","tBodyAccMag-std()",
                            "tGravityAccMag-mean()","tGravityAccMag-std()",
                            "tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()",
                            "tBodyGyroMag-mean()","tBodyGyroMag-std()",
                            "tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()",
                            "fBodyAcc-mean()-X","fBodyAcc-mean()-Y",
                            "fBodyAcc-mean()-Z","fBodyAcc-std()-X",
                            "fBodyAcc-std()-Y","fBodyAcc-std()-Z",
                            "fBodyAcc-meanFreq()-X","fBodyAcc-meanFreq()-Y",
                            "fBodyAcc-meanFreq()-Z","fBodyAccJerk-mean()-X",
                            "fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z",
                            "fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
                            "fBodyAccJerk-std()-Z","fBodyAccJerk-meanFreq()-X",
                            "fBodyAccJerk-meanFreq()-Y",
                            "fBodyAccJerk-meanFreq()-Z",
                            "fBodyGyro-mean()-X","fBodyGyro-mean()-Y",
                            "fBodyGyro-mean()-Z","fBodyGyro-std()-X",
                            "fBodyGyro-std()-Y","fBodyGyro-std()-Z",
                            "fBodyGyro-meanFreq()-X","fBodyGyro-meanFreq()-Y",
                            "fBodyGyro-meanFreq()-Z","fBodyAccMag-mean()",
                            "fBodyAccMag-std()","fBodyAccMag-meanFreq()",
                            "fBodyBodyAccJerkMag-mean()",
                            "fBodyBodyAccJerkMag-std()",
                            "fBodyBodyAccJerkMag-meanFreq()",
                            "fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()",
                            "fBodyBodyGyroMag-meanFreq()",
                            "fBodyBodyGyroJerkMag-mean()",
                            "fBodyBodyGyroJerkMag-std()",
                            "fBodyBodyGyroJerkMag-meanFreq()"
                            )

##
## Select subject, activity, the mean, std columns (column names with the word mean or std 
## from temP_matrix and assign it to combined_train_test_data
##
combined_train_test_data<-tbl_df(temp_matrix[c(562,563,1,2,3,4,5,6,41,42,43,44,45,
                                         46,81,82,83,84,85,86,121,122,123,124,
                                         125,126,161,162,163,164,165,166,201,
                                         202,214,215,227,228,240,241,253,254,
                                         266,267,268,269,270,271,294,295,296,
                                         345,346,347,348,349,350,373,374,375,
                                         424,425,426,427,428,429,452,453,454,
                                         503,504,513,516,517,526,529,530,539,
                                         542,543,552)])

##
## Convert the activity from numeric label to descriptive descriptions based on the document: activity_labels.txt
## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING
##
combined_train_test_data[combined_train_test_data[,"activity"]==1,"activity"]<-"WALKING"
combined_train_test_data[combined_train_test_data[,"activity"]==2,"activity"]<-"WLAKING_UPSTAIRS"
combined_train_test_data[combined_train_test_data[,"activity"]==3,"activity"]<-"WLAKING_DOWNSTAIRS"
combined_train_test_data[combined_train_test_data[,"activity"]==4,"activity"]<-"SITTING"
combined_train_test_data[combined_train_test_data[,"activity"]==5,"activity"]<-"STANDING"
combined_train_test_data[combined_train_test_data[,"activity"]==6,"activity"]<-"LAYING"

##
## Group Data by activity and subject to by_activity_subject
##
by_activity_subject<-group_by(combined_train_test_data,activity,subject)

##
## Use summarise_each to summarise the mean of each column by activity and subject and store result to
## by_activity_subject_mean
##
by_activity_subject_mean<-summarise_each(by_activity_subject,funs(mean))

##
## Write the output table to txt file:
##   (1) by_activity_subject_mean to by_activity_subject_mean.txt
##

##
## Write 1 txt file
##
write.table(by_activity_subject_mean,file="C:\\Data Files\\Coursea\\Getting_and_Cleaning_Data\\by_activity_subject_mean.txt",row.names=FALSE)

##
## End of the script
##