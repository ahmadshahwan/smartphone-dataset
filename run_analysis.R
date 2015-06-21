# Generic function to read training and test data
readDataset <- function(type, rel.ftr, col.names) {
    # Provide col.names so that this script:
    # 3. Uses descriptive activity names to name the activities in the data set
    x <- read.fwf(paste("./UCI HAR Dataset/", type, "/X_", type, ".txt", sep = ""), widths=ifelse(rel.ftr, 16, -16), col.names = col.names)
    y <- read.fwf(paste("./UCI HAR Dataset/", type, "/y_", type, ".txt", sep = ""), widths=1, col.names = "Activity.ID")
    s <- read.fwf(paste("./UCI HAR Dataset/", type, "/subject_", type, ".txt", sep = ""), widths=2, col.names = "Subject.ID")
    x <- cbind(x, y, s)
}


# Read features vector
ftr <- read.table("./UCI HAR Dataset/features.txt")
# Select features that contains mean() and std() in their names, so that this script:
# 4. Appropriately labels the data set with descriptive variable names. 
rel.ftr <- grepl("mean[(][)]", ftr[, 2]) | grepl("std[(][])]", ftr[, 2])
col.names = ftr[, 2][rel.ftr]

# Read training data
train <- readDataset("train", rel.ftr, col.names)
# Read test data
test  <- readDataset("test", rel.ftr, col.names)

# This script:
# 1. Merges the training and the test sets to create one data set.
data  <- rbind(train, test)

# Read in activity labels
act <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("Activity.ID", "Activity.Label"))
# Merge with activity labels so that this script:
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- merge(data, act)

# This script:
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summary <- data[, 2:length(data)]
suppressPackageStartupMessages(library(plyr))
summary <- ddply(summary, c("Activity.Label", "Subject.ID"), numcolwise(mean))
write.table(summary, row.name=FALSE, "./summary.txt")
