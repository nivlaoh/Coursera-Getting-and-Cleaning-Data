library(plyr)

# 1: Merge the training and test sets to create one data set
################################################################

x_train <- read.table("dataset/train/X_train.txt")
y_train <- read.table("dataset/train/y_train.txt")
subject_train <- read.table("dataset/train/subject_train.txt")

x_test <- read.table("dataset/test/X_test.txt")
y_test <- read.table("dataset/test/y_test.txt")
subject_test <- read.table("dataset/test/subject_test.txt")

x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

# 2: Extract only the measurements on the mean and standard deviation for each measurement
################################################################

features <- read.table("dataset/features.txt")
# extract only mean or std in features
featuresNeeded <- grep("-(mean|std)\\(\\)", features[,2])
x_merged <- x_merged[, featuresNeeded]
names(x_merged) <- features[featuresNeeded, 2]

# 3: Use descriptive activity names to name the activities in the data set
################################################################

activities <- read.table("dataset/activity_labels.txt")
y_merged[, 1] <- activities[y_merged[, 1], 2]
names(y_merged) <- "activity"

# 4: Appropriately label the data set with descriptive variable names
################################################################

names(subject_merged) <- "subject"
# no need for brackets as names
names(x_merged) <- gsub("\\(\\)", "", names(x_merged))
# more descriptive domains
names(x_merged) <- gsub("^t", "TimeDomain", names(x_merged))
names(x_merged) <- gsub("^f", "FrequencyDomain", names(x_merged))
combined_data <- cbind(x_merged, y_merged, subject_merged)

# 5: Create a second, independednt tidy data set with the average of each variable for each activity and each subject
################################################################

avg_data <- ddply(combined_data, c("subject", "activity"), numcolwise(mean))
write.table(avg_data, "tidy_data.txt", row.name=FALSE, quote=FALSE)