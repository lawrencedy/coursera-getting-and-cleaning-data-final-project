library(dplyr)
library(tidyr)

# Create new directory
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip file into directory
setwd("./data")
download.file(fileURL, "UCI-HAR-Dataset.zip", method = "curl")
unzip("UCI-HAR-Dataset.zip")

# Import all txt files as elements of a list
setwd("./UCI HAR Dataset/test")
temp = list.files(pattern="*.txt")
TestIDFiles = lapply(temp, read.table)

setwd("./Inertial Signals")
temp = list.files(pattern="*.txt")
TestInertialSignals = lapply(temp, read.table)

setwd("../../train")
temp = list.files(pattern="*.txt")
TrainIDFiles = lapply(temp, read.table)

setwd("./Inertial Signals")
temp = list.files(pattern="*.txt")
TrainInertialSignals = lapply(temp, read.table)

setwd("../../..")  # go back to data directory

# Import and fix labels to be tidy
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels$V2 <- gsub("_", " ", tolower(activity_labels$V2))

feature_names <- read.table("./UCI HAR Dataset/features.txt", colClass = "character")

# Combine training and test sets
subject <- rbind(TestIDFiles[[1]], TrainIDFiles[[1]])
measurement <- rbind(TestIDFiles[[2]], TrainIDFiles[[2]])
activity <- rbind(TestIDFiles[[3]], TrainIDFiles[[3]])

# Substitute activity labels into the activity vector
activity[,1] <- gsub(activity_labels$V1[1], activity_labels$V2[1], activity[,1])
activity[,1] <- gsub(activity_labels$V1[2], activity_labels$V2[2], activity[,1])
activity[,1] <- gsub(activity_labels$V1[3], activity_labels$V2[3], activity[,1])
activity[,1] <- gsub(activity_labels$V1[4], activity_labels$V2[4], activity[,1])
activity[,1] <- gsub(activity_labels$V1[5], activity_labels$V2[5], activity[,1])
activity[,1] <- gsub(activity_labels$V1[6], activity_labels$V2[6], activity[,1])
activity[,1] <- factor(activity[,1], levels = activity_labels$V2)

all_data <- cbind(subject, activity, measurement)  # Combining the separate variables of the combined set
colnames(all_data) <- c("Subject", "Activity", feature_names[ ,2])  # Substutude feature names into variables

# Select columns or variables only pertaining to mean or standard deviation
all_data <- select(all_data, Subject, Activity, contains("mean()"), contains("std()"))

# Renaming the variables
names(all_data) <- gsub("^t", "Time ", names(all_data))
names(all_data) <- gsub("^f", "Frequency ", names(all_data))
names(all_data) <- gsub("-", " ", names(all_data))
names(all_data) <- gsub("Body", "Body ", names(all_data))
names(all_data) <- gsub("Gravity", "Gravity ", names(all_data))
names(all_data) <- gsub("Acc", "Accelerometer", names(all_data))
names(all_data) <- gsub("Jerk", " Jerk", names(all_data))
names(all_data) <- gsub("Mag", " Magnitude", names(all_data))
names(all_data) <- gsub("Body Body", "Body", names(all_data))
names(all_data) <- gsub("Gyro", "Gyroscope", names(all_data))
names(all_data) <- gsub("mean\\(\\)", "Mean", names(all_data))
names(all_data) <- gsub("std\\(\\)", "Standard Deviation", names(all_data))
names(all_data) <- gsub("X$", "X-Axis", names(all_data))
names(all_data) <- gsub("Y$", "Y-Axis", names(all_data))
names(all_data) <- gsub("Z$", "Z-Axis", names(all_data))

# Create summary data set of the mean of each variable for each activity and subject
summary <- all_data %>% 
            group_by(Subject, Activity) %>% 
            summarize_all(mean)

# Export as txt file to data directory
write.table(summary, "./summary.txt", row.names = FALSE)


