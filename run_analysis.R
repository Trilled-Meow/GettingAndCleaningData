# Load required packages. First use install.packages("reshape2") if
# the package is not already installed. The working directory
# should be set to the UCI HAR Dataset folder.

library(reshape2)

activity_labels <- read.table("./activity_labels.txt",
                              col.names=c("activity_id", "activity_name"))

features <- read.table("features.txt")
featureNames <- features[,2]

test <- read.table("./test/X_test.txt")
colnames(test) <- featureNames

train <- read.table("./train/X_train.txt")
colnames(train) <- featureNames

train_subject_id <- read.table("./train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"

train_activity_id <- read.table("./train/y_train.txt")
colnames(train_activity_id) <- "activity_id"

test_subject_id <- read.table("./test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"

test_activity_id <- read.table("./test/y_test.txt")
colnames(test_activity_id) <- "activity_id"

testData <- cbind(test_subject_id , test_activity_id , testdata)

trainData <- cbind(train_subject_id , train_activity_id , traindata)

#Merge train and test data
data <- rbind(testData, trainData)

meanCol <- grep("mean",names(data), ignore.case=TRUE)
meanNames <- names(data)[meanCol]

sdCol <- grep("std", names(data), ignore.case=TRUE)
sdNames <- names(data)[sdCol]

means_sd <-data[,c("subject_id", "activity_id",
                          meanNames, sdNames)]

act_means_sd <- merge(activity_labels, means_sd, by.x="activity_id", 
                    by.y="activity_id", all=TRUE)

data2 <- melt(act_means_sd, id=c("activity_id", "activity_name", "subject_id"))

means_data <- dcast(data2, activity_id + activity_name + subject_id ~ variable, mean)

write.table(means_data,"./tidy_data.txt")