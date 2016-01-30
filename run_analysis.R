rm(list=ls())

##Downloading and unzipping the dataset

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "data.zip"

if (!file.exists(filename)){
        download.file(url = fileurl,filename)
}

if (!file.exists("UCI HAR Dataset")){
        unzip(filename)
}

#Loading and cleaning activity labels and features

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)

features[,2] <- gsub("[-(),]","",features[,2])
features[,2] <- gsub("mean","Mean",features[,2])
features[,2] <- gsub("std","Std",features[,2])

features_selected <- grep(".*Mean.*|.*Std.*",features[,2])
features_names <- grep(".*Mean.*|.*Std.*",features[,2],value = TRUE)


#Loading train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")[,features_selected]
activities_train <- read.table("UCI HAR Dataset/train/Y_train.txt")

train <- cbind(subject_train,activities_train,X_train)

#Loading test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")[,features_selected]
activities_test <- read.table("UCI HAR Dataset/test/Y_test.txt")

test <- cbind(subject_test,activities_test,X_test)

#Merging tain and test datasets for the features selected
merged_data <- rbind(train,test)

#Describing variable names and activity names
colnames(merged_data) <- c("subject","activity",features_names)
merged_data$activity <- factor(merged_data$activity,levels = activity_labels[,1],labels = activity_labels[,2])

#Averaging each variable for each activity and each subject
library(reshape2)
melted_data <- melt(merged_data,id = 1:2,na.rm = TRUE)
final_data <- dcast(melted_data,subject + activity ~ variable, mean)

write.table(final_data,"tidydata.txt",append = FALSE,quote = FALSE, row.names = FALSE)