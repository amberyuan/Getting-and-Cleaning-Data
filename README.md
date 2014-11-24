Getting and Cleanning Data: Course Project
=================================================
###Raw Data
Unzip the data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 - The features are in x_test.txt file.
 - The activity labels are in y_test.txt file.
 - The test subjects are in subject_test.txt file.

###Data processing and results

 - Created run_analysis.R script to merge the training and test sets data, added the labels to Mean/Std related columns, created a tidy data set "Tidy.txt" with the average of each variable for each activity and each subject.
 - Created CodeBook.md which describes the variables, the data and any transformations.

