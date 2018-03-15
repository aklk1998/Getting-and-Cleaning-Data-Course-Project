# Getting-and-Cleaning-Data-Course-Project

##
##  Objectives of the exercise are: 
##    1.  Extracts data from Human Activity Recognition Using Smartphones Data Sets
##        (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) into R
##    2.  Merges the Train and Test data files (including measurements, activity, subject)
##    3.  Labels the columns in the data set in 2 with descriptive column names
##    4.  Extracts the measurements on the mean and standard deviation for each measurement from the data set in step 3.
##    5.  Uses descriptive activity names to name the activities in the data set in step 4
##    6.  Creates a new data set with the average of each measurement column by activity and subject from data set in 5.
##    7.  Output data sets in step 5 and step 6 to csv files.
##    8.  Create a R script file (analysis.R) to perform steps 1 to 7 from above
##   
##  Descriptions of the files in this Repo:
##    1.  README.md: A brief description of the objectives of the exericse and the R script
##    2.  run_analysis.R: The R script file that performs steps 1 to 7 above
##    3.  by_activity_subject_mean.csv: Data set which contains the average of ech measurement by activity and subject
##    4.  combined_train_test_data.csv: Data set which contains the merged Train and Test data sets
##    5.  Getting and Cleaning Data Course Project Code Book (column names).doc: The code book contains the descriptions of the columns
##        in the 2 csv files.
##
##  Summary of the script file analysis.R
##
##    Name of R script file: analysis.R
##    Purpose of analysis.R: To perform steps 1 to 7 from above "Objectives of the exercise are"
##    
##    Working folder name: C:\Data Files\Coursea\Getting_and_Cleaning_Data
##
##    Output File Names:
##        1.  by_activity_subject_mean.csv (data set created from step 6)
##        2.  combined_train_test_data.csv (data set created in step 5)
##
##    Brief descriptions of the source files:
##
##        1.  Source of data: Human Activity Recognition Using Smartphones Dataset
##                (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
##
##            Source data file names: 
##               (1) X_test.txt
##               (2) y_test.txt
##               (3) subject_text.txt)
##               (4) X_train.txt
##               (5) y_train.txt
##               (6) subject_train.txt
##
##            Source Column Names File/Descriptions: 
##               (1) features.txt
##               (2) features_info.txt
##
##            Source Readme File: README.txt
## 
##            All above files are copied to working folder: C:\Data Files\Coursea\Getting_and_Cleaning_Data 
##
##    Steps of the script:
##        (1) Extract source files into R
##        (2) Merges the training and the test sets to create one data set.
##        (3) Appropriately labels the data set with descriptive variable names. 
##        (4) Extracts only the measurements on the mean and standard deviation for each measurement. 
##        (5) Uses descriptive activity names to name the activities in the data set
##        (6) From the data set in step 5, creates a second, independent tidy data set with the average of
##            each variable for each activity and each subject.
##        (7) Write the 2 output tables to 2 csv files without row names
##            (7.1) combined_train_test_data to combined_train_test_data.csv (from step 5)
##            (7.2) by_activity_subject_mean to by_activity_subject_mean.csv (from step 6)
##
##   Output Table Names:
##        (1) combined_train_test_data
##        (2) by_activity_subject_mean
##
##   Output csv file names:
##        (1) combined_train_test_data.csv
##        (2) by_activity_subject_mean to by_activity_subject_mean.csv
##
##   Name of the code book that describes the column names in the 2 csv files:
##        (1) Getting and Cleaning Data Course Project Code Book (column names).doc
##
