#CodeBook for the tidy dataset

## Description

Additional information about the variables, data and transformations used in the course project.

## Source Data

A full description of the data used in this project can be found at [The UCI Machine Learning Repository.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Note: Features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: tBodyAcc-mean()-X-mean, which means the mean value of tBodyAcc-mean()-X.

##Transformations

Following transformations are done to original dataset -

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is done as follows -

* Read `training` and `test` sets data into two different variables.
* Read `features` and `activity labels`.
* Merge the training and the test sets to create one data set.
* Appropriately label the data set with descriptive variable names using data from `features.txt`
* Use descriptive activity names to name the activities in the data set using data from `activity_labels.txt`
* Extract only the measurements on the `mean` and `standard deviation` for each measurement. Only used features that exactly contained mean() or std().
* `Split` subsetted data by `subject` and `labels` and then calculate `mean` of each set and store this a data frame.
* Transform above data to long format using `melt()` from `reshape2` package.
* Rename `feature` variable to reflect that its mean by appending `-mean` to it.

## Tidy Data

### ID Fields

* `subject` - The participant ("subject") ID
* `activity` - The label of the activity performed when the corresponding measurements were taken

### Activity Labels

* `WALKING` (value `1`)
* `WALKING_UPSTAIRS` (value `2`)
* `WALKING_DOWNSTAIRS` (value `3`)
* `SITTING` (value `4`)
* `STANDING` (value `5`)
* `LAYING` (value `6`)

### Features

* tBodyAcc-mean()-X-mean
* tBodyAcc-mean()-Y-mean
* tBodyAcc-mean()-Z-mean
* tBodyAcc-std()-X-mean
* tBodyAcc-std()-Y-mean
* tBodyAcc-std()-Z-mean
* tGravityAcc-mean()-X-mean
* tGravityAcc-mean()-Y-mean
* tGravityAcc-mean()-Z-mean
* tGravityAcc-std()-X-mean
* tGravityAcc-std()-Y-mean
* tGravityAcc-std()-Z-mean
* tBodyAccJerk-mean()-X-mean
* tBodyAccJerk-mean()-Y-mean
* tBodyAccJerk-mean()-Z-mean
* tBodyAccJerk-std()-X-mean
* tBodyAccJerk-std()-Y-mean
* tBodyAccJerk-std()-Z-mean
* tBodyGyro-mean()-X-mean
* tBodyGyro-mean()-Y-mean
* tBodyGyro-mean()-Z-mean
* tBodyGyro-std()-X-mean
* tBodyGyro-std()-Y-mean
* tBodyGyro-std()-Z-mean
* tBodyGyroJerk-mean()-X-mean
* tBodyGyroJerk-mean()-Y-mean
* tBodyGyroJerk-mean()-Z-mean
* tBodyGyroJerk-std()-X-mean
* tBodyGyroJerk-std()-Y-mean
* tBodyGyroJerk-std()-Z-mean
* tBodyAccMag-mean()-mean
* tBodyAccMag-std()-mean
* tGravityAccMag-mean()-mean
* tGravityAccMag-std()-mean
* tBodyAccJerkMag-mean()-mean
* tBodyAccJerkMag-std()-mean
* tBodyGyroMag-mean()-mean
* tBodyGyroMag-std()-mean
* tBodyGyroJerkMag-mean()-mean
* tBodyGyroJerkMag-std()-mean
* fBodyAcc-mean()-X-mean
* fBodyAcc-mean()-Y-mean
* fBodyAcc-mean()-Z-mean
* fBodyAcc-std()-X-mean
* fBodyAcc-std()-Y-mean
* fBodyAcc-std()-Z-mean
* fBodyAccJerk-mean()-X-mean
* fBodyAccJerk-mean()-Y-mean
* fBodyAccJerk-mean()-Z-mean
* fBodyAccJerk-std()-X-mean
* fBodyAccJerk-std()-Y-mean
* fBodyAccJerk-std()-Z-mean
* fBodyGyro-mean()-X-mean
* fBodyGyro-mean()-Y-mean
* fBodyGyro-mean()-Z-mean
* fBodyGyro-std()-X-mean
* fBodyGyro-std()-Y-mean
* fBodyGyro-std()-Z-mean
* fBodyAccMag-mean()-mean
* fBodyAccMag-std()-mean
* fBodyBodyAccJerkMag-mean()-mean
* fBodyBodyAccJerkMag-std()-mean
* fBodyBodyGyroMag-mean()-mean
* fBodyBodyGyroMag-std()-mean
* fBodyBodyGyroJerkMag-mean()-mean
* fBodyBodyGyroJerkMag-std()-mean


