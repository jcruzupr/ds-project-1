##Project for Getting and Cleaning Data Course

The purpose of this project is to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis.

The following tasks are required:

1) prepare tidy data set, use it for analysis, then upload the results.

2) upload the R script, CodeBook and related files to a Github repository (including this README.md)

The data for this project was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For complete information about the original data source, please see:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script called run_analysis.R performs the following steps. 

    -- Merges 6 training and the test sets to create one tidy data set.
    -- Extracts only the measurements on the mean and standard deviation for each measurement. 
    -- Uses descriptive activity names to name the activities in the data set
    -- Appropriately labels the data set with descriptive variable names. 
    -- Creates a second, independent tidy data set with the average of each variable
       for each activity and each subject. 

Please see the detailed comments within the R script that describe each step in more detail.

=============================================================================
