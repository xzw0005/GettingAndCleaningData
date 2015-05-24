# Code Book
=====================================================================================
This code book describes the variables, the data, 
and transformations or work that I performed to clean up the data. 
=====================================================================================

## Input Data

The input dataset is the Human Activity Recognition Using Smartphones Dataset which could be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

## Transformations

As required, I created one R script called run_analysis.R that did the following. 

1. Merges the training and the test sets to create one data set, which is called "mergedData".

2. Extracts only the measurements on the mean and standard deviation for each measurement. By using the grep command in R to grep
the variables whose name includes "mean()" or "std()", we obtained a subset of "mergedData", and call the dataset "myData".

3. Uses descriptive activity names to name the activities in the data set. 
The activities for each observation could be read from "y_train.txt" for training data and "y_test.txt" for testing data. 
And we can obtain specific activities from the "activity_labels.txt" for each of the 6 activities.
We ran a for loop on each observation of "myData" and transformed the activities into their specific names.

4. Appropriately labels the data set with descriptive variable names. By reading "features.txt", we obtained the names of the 561 variables (i.e., columns) for the original training and tesing data,
which is clear enough to describe the meaning of the variables. And we have 2 additional variables: "activity" and "subject". 
Note the "subject" variable is read from the "subject_train.txt" and "subject_test.txt" for training data and testing data, respectively.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is our output dataset, and we wrote it into "tidyData.txt".

## Output Data

The 
