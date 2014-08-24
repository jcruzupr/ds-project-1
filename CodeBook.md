## CodeBook.md
This codebook provides additional information related to this project / repo.

## Data sources
A full and detailed description of the data is available from:
     http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Note: The data for this project was provided from:
     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	 The data is assumed to be unzipped into the same working directory as the script run_analysis.R.
	 
## Data sets used
The data sets are described in detail in the 'features_info.txt' and
'README.txt' files included with the data. A summary is provided below.

## Data used/manipulated in the script are:

### Labels (the list of features and activities)
 1- 'features.txt': List of features (described in features_info.txt).
 2- 'activity_labels.txt': Links the activity id labels with their activity name.

### Training Data 
 3- 'train/X_train.txt': Training set.
 4- 'train/y_train.txt': Training labels.
 5- 'train/subject_train.txt': Each row identifies the subject who performed the activity.

### Test Data
 6- 'test/X_test.txt': Test set.
 7- 'test/y_test.txt': Test labels.
 8- 'test/subject_test.txt': Each row identifies the subject who performed the activity.
 
## Two tidy data sets were generated:
 1- "merged_mean_std_data.txt"
 This file combines the rows of the training and test data sets:
     'train/X_train.txt' rows plus 'test/X_test.txt' rows
     'train/y_train.txt' rows plus 'test/y_test.txt' rows
     'train/subject_train.txt' rows plus 'test/subject_test.txt' rows
	
Punctuation was removed from the 'features.txt' labels and the
activity ids were replaced with descriptive activity labels in y_data

Then a subset of 'features.txt' labels is used to select only the columns
that include "Mean", "mean" OR "std" as part of the feature label, namely:
	
				1	 --	tBodyAccmeanX
				2	 --	tBodyAccmeanY
				3	 --	tBodyAccmeanZ
				4	 --	tBodyAccstdX
				5	 --	tBodyAccstdY
				6	 --	tBodyAccstdZ
				7	 --	tGravityAccmeanX
				8	 --	tGravityAccmeanY
				9	 --	tGravityAccmeanZ
				10	 --	tGravityAccstdX
				11	 --	tGravityAccstdY
				12	 --	tGravityAccstdZ
				13	 --	tBodyAccJerkmeanX
				14	 --	tBodyAccJerkmeanY
				15	 --	tBodyAccJerkmeanZ
				16	 --	tBodyAccJerkstdX
				17	 --	tBodyAccJerkstdY
				18	 --	tBodyAccJerkstdZ
				19	 --	tBodyGyromeanX
				20	 --	tBodyGyromeanY
				21	 --	tBodyGyromeanZ
				22	 --	tBodyGyrostdX
				23	 --	tBodyGyrostdY
				24	 --	tBodyGyrostdZ
				25	 --	tBodyGyroJerkmeanX
				26	 --	tBodyGyroJerkmeanY
				27	 --	tBodyGyroJerkmeanZ
				28	 --	tBodyGyroJerkstdX
				29	 --	tBodyGyroJerkstdY
				30	 --	tBodyGyroJerkstdZ
				31	 --	tBodyAccMagmean
				32	 --	tBodyAccMagstd
				33	 --	tGravityAccMagmean
				34	 --	tGravityAccMagstd
				35	 --	tBodyAccJerkMagmean
				36	 --	tBodyAccJerkMagstd
				37	 --	tBodyGyroMagmean
				38	 --	tBodyGyroMagstd
				39	 --	tBodyGyroJerkMagmean
				40	 --	tBodyGyroJerkMagstd
				41	 --	fBodyAccmeanX
				42	 --	fBodyAccmeanY
				43	 --	fBodyAccmeanZ
				44	 --	fBodyAccstdX
				45	 --	fBodyAccstdY
				46	 --	fBodyAccstdZ
				47	 --	fBodyAccmeanFreqX
				48	 --	fBodyAccmeanFreqY
				49	 --	fBodyAccmeanFreqZ
				50	 --	fBodyAccJerkmeanX
				51	 --	fBodyAccJerkmeanY
				52	 --	fBodyAccJerkmeanZ
				53	 --	fBodyAccJerkstdX
				54	 --	fBodyAccJerkstdY
				55	 --	fBodyAccJerkstdZ
				56	 --	fBodyAccJerkmeanFreqX
				57	 --	fBodyAccJerkmeanFreqY
				58	 --	fBodyAccJerkmeanFreqZ
				59	 --	fBodyGyromeanX
				60	 --	fBodyGyromeanY
				61	 --	fBodyGyromeanZ
				62	 --	fBodyGyrostdX
				63	 --	fBodyGyrostdY
				64	 --	fBodyGyrostdZ
				65	 --	fBodyGyromeanFreqX
				66	 --	fBodyGyromeanFreqY
				67	 --	fBodyGyromeanFreqZ
				68	 --	fBodyAccMagmean
				69	 --	fBodyAccMagstd
				70	 --	fBodyAccMagmeanFreq
				71	 --	fBodyBodyAccJerkMagmean
				72	 --	fBodyBodyAccJerkMagstd
				73	 --	fBodyBodyAccJerkMagmeanFreq
				74	 --	fBodyBodyGyroMagmean
				75	 --	fBodyBodyGyroMagstd
				76	 --	fBodyBodyGyroMagmeanFreq
				77	 --	fBodyBodyGyroJerkMagmean
				78	 --	fBodyBodyGyroJerkMagstd
				79	 --	fBodyBodyGyroJerkMagmeanFreq
				80	 --	angletBodyAccMeangravity
				81	 --	angletBodyAccJerkMeangravityMean
				82	 --	angletBodyGyroMeangravityMean
				83	 --	angletBodyGyroJerkMeangravityMean
				84	 --	angleXgravityMean
				85	 --	angleYgravityMean
				86	 --	angleZgravityMean                

Finally the merged data is written to a file in the working directory
	
2- "mean_measures_data.txt"
    This file starts with the merged data from the above steps.
    The melt function is applied to create a "tall/skinny" data set.
    Then the dcast function is applied that combines calculates the
    corresponding means for each subject + activity combination.
	
Finally the means data is written to a file in the working directory
