CodeBook for Getting and Cleaning Course Project
=======

### Raw Data
- The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

- The data for the project can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data Processing
Run_analysis.R script performs the following steps to clean and get a tidy data set:

- Reading data
Read X_train.txt, y_train.txt and subject_train.txt and store them as TrainingSet, TrainingLabel and TrainingSubject.
Read X_test.txt, y_test.txt and subject_test.txt and store them as TestSet, TestLabel and TestSubject.

- Merging data
Merged TrainingSet and TestSet, stored them as CombinedSet.
Merged TrainingLabel and TestLabel, stored them as CombinedLabel.
Merged TrainingSubject and TestSubject, stored them as CombinedSubject.

- Selecting data
Read features.txt, stored it as feature.
Extracted only the measurements on mean and standard deviation for each measurement. 

- Cleaning data
Cleaned the variable names, removed "()" symbols.

- Creating new Tidy data set.
Read activity.txt and stored it as activity.
Merged CombinedSet, CombinedLabel and CombinedSubject.
Labeled the columns.
Created a second, independent tidy data set with the average of each variable for each activity and each subject.
Saved the table as "TidyDataSet.txt"





