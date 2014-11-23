# R script to read UCI HAR Datasets and produce a tidy dataset in required format 

# Note: I have jumbled the questions given in Problem statement because I prefer to work on a tidy data,
# So, I have first merged given data, given appropriate column names and then subsetted this data as required.
# The result produced by this is the same as that produced when following given sequence in problem statement

# Working directory is assumed to be "UCI HAR Dataset" which contains test and train folders and activity_label.txt,
# features.txt, features_info.txt and README.txt files

# Read txt file names in train directory
files.train <- list.files("./train/", pattern="\\.txt$", full.names=T)

#Read txt files in train directory
data.train.list <- lapply(files.train, read.table)

# Merge train dataset in a single data frame
data.train <- cbind(data.train.list[[1]], data.train.list[[2]], data.train.list[[3]])

# Read txt file names in test directory
files.test <- list.files("./test/", pattern="\\.txt$", full.names=T)

#Read txt files in test directory
data.test.list <- lapply(files.test, read.table)

# Merge test dataset in a single data frame
data.test <- cbind(data.test.list[[1]], data.test.list[[2]], data.test.list[[3]])

# Merge the training and the test sets to create one data set [Q1]
data <- rbind(data.train, data.test)

# Read features file
features <- read.table("features.txt", sep="", stringsAsFactors=F)

# Read activity labels file
activity.labels <- read.table("activity_labels.txt", sep="")

# Appropriately label the data set with descriptive variable names [Q4]
colnames(data) <- c("subject", features[,2], "labels")

# Use descriptive activity names to name the activities in the data set [Q3]
data$labels <- factor(data$labels, labels=activity.labels[,2])


# Extract only the measurements on the mean and standard deviation for each measurement [Q2]
# Including columns which contains mean() and std()
# Included subject and labels columns
sub <- subset(data, select = colnames(data)=="subject"|
                  grepl("mean\\(\\)",colnames(data)) |
                  grepl("std\\(\\)",colnames(data))|
                  colnames(data)=="labels")

# Split subsetted data by subject and labels and then calculate mean of each set
# Use of aggregate funtion does this with ease and produces a data frame with columns - subject,activity and
# separate column for each feature (wide format)
split.mean <- aggregate(subset(sub, select=-c(subject,labels)),by=list(sub$subject, sub$labels), mean)
colnames(split.mean)[1:2] <- c("subject","activity")

library(reshape2)

# Independent tidy data set with the average of each variable for each activity and each subject (long format) [Q5]
tidy.data <- melt(split.mean, id.vars=c("subject","activity"), variable.name="feature", value.name="mean")

# Alternate way to produce tidy data in long format
#library(tidyr)
#tidy.data <- gather(split.mean,feature,mean, -c(subject,activity))

# Store the tidy data set produced in a text file with row.names=FALSE 
write.table(tidy.data, file="tidy_data.txt", row.names=FALSE)
