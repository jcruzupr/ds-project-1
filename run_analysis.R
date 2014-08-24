# run_analysis.R 
# This script assumes that project data is in the same working directory and
# this script requires the reshape2 package (the script does not install it).
library(reshape2)

# READ/IMPORT LABELS from main directory and tidy them ========================

# import list of FEATURES with 561 obs. and 2 variables into a data.frame
features <- read.table("UCI HAR Dataset/features.txt")

# remove punctuation from FEATURES labels, multi-word labels retain "camel case"
features[,2] <- gsub(pattern="[[:punct:]]", features[,2], replacement="")

# import list of ACTIVITY LABELS with 6 obs. and 2 variables into a data.frame
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# convert ACTIVITY LABELS to lowercase
labels[,2] <- tolower(labels[,2])

# remove underscores from the ACTIVITY LABELS
labels[,2] <- gsub("_", "", labels[,2])


# READ/IMPORT TRAINING DATA from training directory ===========================

# import training SET with 7352 obs. of 561 variables into a data.frame
X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt")

# import training LABELS with 7352 obs. of 1 variables into a data.frame
y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt")

# import training subject ID with 7352 obs. of 1 variables into a data.frame
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt")

# READ/IMPORT TESTING DATA from test directory ================================

# import testing SET with 2947 obs. of 561 variables into a data.frame
X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt")

# import testing LABELS with 2947 obs. of 1 variables into a data.frame
y_test_data <- read.table("UCI HAR Dataset/test/y_test.txt")

# import testing subject ID with 2947 obs. of 1 variables into a data.frame
subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt")

# COMBINE the ROWS of the training and test data sets =========================
X_data <- rbind(X_train_data,X_test_data)
y_data <- rbind(y_train_data,y_test_data)
subject_data <- rbind(subject_train_data, subject_test_data)

# RENAME column names
colnames(X_data) <- features[,2]
colnames(y_data) <- "activity"
colnames(subject_data) <- "subject"
colnames(labels) <- c("activityid", "activitylabel")

# replace activity ids with descriptive activity labels in y_data
y_data[,1] <- labels[y_data[,1], 2]

# use regex to select features that contain the "Mean", "mean" OR "std"
mean_std_features <- features[grep("Mean|mean|std", features[,2]),]

# use mean_std_features to select specific columns of the X_data
X_data_mean_std <- X_data[,mean_std_features[,1]]

# COMBINE all the parts (subject#, activity label and selected columns)  
merged_mean_std_data <- cbind(subject_data, y_data, X_data_mean_std)

#write merged "mean and std" data set to a CSV file
write.table(merged_mean_std_data, file="merged_mean_std_data.txt", row.names=FALSE)

# create a second data set that summarizes variables ========================== 
# MELT DATA, create a tall/skinny data set (see header below)
#  ----------------------------------------------
#    subject activity      variable     value
#  1       1 standing tBodyAccmeanX 0.2885845
#  2       1 standing tBodyAccmeanX 0.2784188
#  ----------------------------------------------
melted_data <- melt(merged_mean_std_data, id.var=c("subject", "activity"))

# DCAST with casting formula that combines subject & activity columns and
# calculates the corresponding means
mean_measures_data <- dcast(melted_data, subject+activity ~ variable,mean)

#write mean measures data set to a TXT file 
write.table(mean_measures_data, file="mean_measures_data.txt", row.names=FALSE)

#The following produces a similar file with comma separated values
#write.csv(mean_measures_data, file="mean_measures_data.csv", row.names=FALSE)

# =============================================================================
