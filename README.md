# Getting and Cleaning Data

## Course Project

You should create one R script called run_analysis.R that does the following-

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Write the tidy dataset to disk using write.table()

## Steps to work on course project

1. Download the data from source and unzip it. You'll get a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function.
3. Run ```source("run_analysis.R")```, then it will generate a file ```tidy_data.txt``` in your working directory. The generated file will be in long format.

## Dependencies

```run_analysis.R``` depends on ```reshape2``` package to convert wide format data to long format. Alternatively, you can use ```tidyr``` package to do the same.

##About Code Book

CodeBook.md file explains the transformations performed and the resulting data and variables.