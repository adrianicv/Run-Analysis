# Getting and Cleaning Data Exercise

#set the directory to data sets
setwd("C:\\Data Science\\3. Getting and Cleaning Data\\Week3\\UCI HAR Dataset")

#Load subject data and combine into one data set
subTest <- read.table("./test/subject_test.txt")
subTrain <- read.table("./train/subject_train.txt")
allSub <- rbind(subTest, subTrain)
colnames(allSub) <- "Subject"


# read labels from Test and Trainig labels and combine into one data set
yTest <- read.table("./test/y_test.txt")
yTrain <- read.table("./train/y_train.txt")
allLabels  <- rbind(yTest, yTrain)
colnames(allLabels) <- c("ActivityID")

# Read the activity ID and Name from activity label table
actLabels <- read.table("./activity_labels.txt")
colnames(actLabels) <- c("ActivityID", "ActivityName")

#Replace ID with name
allLabels[,1] <- as.vector(actLabels[match(allLabels$ActivityID, actLabels$ActivityID),2])
colnames(allLabels) <- c("ActivityName")

#Load test and training inoutset and combine into one dataframe
xTest <- read.table("./test/X_test.txt")
xTrain <- read.table("./train/X_train.txt")
allInput <- rbind(xTest, xTrain)

# Read the file features containing the feature names and assign it to the name of all Input
featureTable <- read.table("./features.txt")
names(allInput) <- featureTable[,2]

#Subset the all Inout data with columns containing only mean and std in the column name
meanStdColumns <- c(grep("mean", featureTable[,2], ignore.case=TRUE), grep(c("std"), featureTable[,2], ignore.case=TRUE))
stdMeanInput <- allInput[,meanStdColumns]

# append subject and label columns to the stdMeanInout dataset to get the tidy data as per requirement
tidyData <- cbind(allSub, allLabels, stdMeanInput)

# Group by Subject and ActivityName using melt and dcast function
library(reshape2)
tidyDataMelt <- melt(tidyData, id=c("Subject", "ActivityName"))
tidyDataMean <- dcast(tidyDataMelt, Subject + ActivityName ~ variable, mean)

# Write the mean file to folder
write.table(tidyDataMean, file = "tidy_data_mean.txt", col.names = FALSE, sep=" ", quote=FALSE, row.names = FALSE)


#end