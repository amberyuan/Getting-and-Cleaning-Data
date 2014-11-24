#Reading Data
TrainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
TrainingLabel <- read.table("./UCI HAR Dataset/train/y_train.txt") 
TrainingSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

TestSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
TestLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
TestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merging Data
CombinedSet <- rbind(TrainingSet, TestSet)
CombinedLabel <- rbind(TrainingLabel, TestLabel)
CombinedSubject <- rbind(TrainingSubject, TestSubject)

#Extracts only the measurements on the mean and standard deviation for each measurement.
feature <- read.table("./UCI HAR Dataset/features.txt")

MeanStd <- grep("mean\\(\\)|std\\(\\)", feature[, 2])
CombinedSet <- CombinedSet[, MeanStd]

names(CombinedSet) <- gsub("\\(\\)", "", features[MeanStd, 2])

#Use descriptive activity names to name the activities in the data set.
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", " ", activity[, 2]))
substr(activity[2,2],8,8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
ActivityLabel <- activity[CombinedLabel[, 1], 2]
CombinedLabel[ ,1] <- activityLabel
names(CombinedLabel) <- "activity"

#Appropriately labels the data set with descriptive variable names.
names(CombinedSubject) <- "subject"
data <- cbind(CombinedSubject, CombinedLabel, CombinedSet)
write.table(data, "Question4_data.txt")

#Create a second, independent tidy data set with the average of each variable for each activity and each subject.
SubjectLength <- length(table(CombinedSubject))
ActivityLength <- dim(activity)[1]
ColumnLength <- dim(data)[2]
TidyDataSet <- matrix(NA, nrow = SubjectLength * ActivityLength, ncol = ColumnLength)
TidyDataSet <- as.data.frame(TidyDataSet)
colnames(TidyDataSet) <- colnames(data)
row <- 1

for(i in 1:SubjectLength) {
        for(j in 1:ActivityLength) {
                TidyDataSet[row, 1] <- sort(unique(CombinedSubject)[, 1])[i]
                TidyDataSet[row, 2] <- activity[j, 2]
                bool1 <- i == data$subject
                bool2 <- activity[j, 1] == data$activity
                TidyDataSet[row, 3:ColumnLength] <- colMeans(data[bool1&bool2, 3:ColumnLength])
                row <- row + 1
        }
}
write.table(TidyDataSet, "TidyDataSet.txt")

