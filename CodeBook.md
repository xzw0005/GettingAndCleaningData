# Code Book

This code book describes the variables, the data, and transformations or work that I performed to clean up the data. 

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

Our output dataset "tidyData.txt" has 180 rows and 81 columns. The first 79 columns represent the 79 measurements on the mean and standard deviation for each measurement, and we have additional two varialbles "activity" and "subject". And each of the 180 rows represent the average of each variable for each activity and each subject. Note we have 6 levels of activities and 30 different subjects, thus we obtained 180 rows. Our output data is tidy (Each variable is in one column, and ach different observation of that variableis in a different row).

We list the 81 variables as follows:
```
 [1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [3] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
 [5] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
 [7] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
 [9] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"             
[11] "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
[13] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[15] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
[17] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
[19] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
[21] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[23] "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
[25] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
[27] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
[29] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
[31] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[33] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[35] "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
[37] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
[39] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
[41] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
[43] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
[45] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"
[47] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
[49] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
[51] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[53] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
[55] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
[57] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[59] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
[61] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
[63] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
[65] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"         
[67] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
[69] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
[71] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
[73] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
[75] "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
[77] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"         
[79] "fBodyBodyGyroJerkMag-std()"      "activity"                       
[81] "subject" 
```
