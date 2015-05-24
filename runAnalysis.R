setwd("F:\\Coursera\\GettingAndCleaningData\\getdata-project")
train = read.table("./UCI HAR Dataset/train/X_train.txt")
dim(train)
print(object.size(train), unit = "MB")
test = read.table("./UCI HAR Dataset/test/X_test.txt")
dim(test)
print(object.size(test), unit = "MB")
head(test)

features = read.table("./UCI HAR Dataset/features.txt")
dim(features)
names(train) = features[, 2]
names(test) = features[, 2]
head(train)
train$tag = "train"
test$tag = "test"

trainLabel = read.table("./UCI HAR Dataset/train/y_train.txt")
testLabel = read.table("./UCI HAR Dataset/test/y_test.txt")
dim(trainLabel)
train$activity = trainLabel[, 1]
test$activity = testLabel[, 1]
head(test)

trainSubject = read.table("./UCI HAR Dataset/train/subject_train.txt")
testSubject = read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(trainSubject)
train$subject = trainSubject[, 1]
test$subject = testSubject[, 1]

dim(train)
dim(test)
mergedData = rbind(train, test)
dim(mergedData)
head(mergedData)
meanVars = grep("mean()", names(mergedData))
meanVars
stdVars = grep("std()", names(mergedData))
stdVars
actVar = grep("activity", names(mergedData))
actVar
subVar = grep("subject", names(mergedData))
myData = mergedData[, c(meanVars, stdVars, actVar, subVar)]
dim(myData)

for (i in 1:dim(myData)[1]) {
  if (myData$activity[i] == 1) {myData$activity[i] = "WALKING"}
  else if (myData$activity[i] == 2) {myData$activity[i] = "WALKING_UPSTAIRS"}
  else if (myData$activity[i] == 3) {myData$activity[i] = "WALKING_DOWNSTAIRS"}
  else if (myData$activity[i] == 4) {myData$activity[i] = "SITTING"}
  else if (myData$activity[i] == 5) {myData$activity[i] = "STANDING"}
  else if (myData$activity[i] == 6) {myData$activity[i] = "LAYING"}
}


myData = mergedData[, c(meanVars, stdVars, actVar, subVar)]
table(myData$activity)
table(myData$subject)
tidyData <- aggregate(myData, 
              by=list(myData$subject, myData$activity),FUN=mean)
tidyData = tidyData[, c(-1, -2)]
names(tidyData)
dim(tidyData)
head(tidyData)
for (i in 1:dim(tidyData)[1]) {
  if (tidyData$activity[i] == 1) {tidyData$activity[i] = "WALKING"}
  else if (tidyData$activity[i] == 2) {tidyData$activity[i] = "WALKING_UPSTAIRS"}
  else if (tidyData$activity[i] == 3) {tidyData$activity[i] = "WALKING_DOWNSTAIRS"}
  else if (tidyData$activity[i] == 4) {tidyData$activity[i] = "SITTING"}
  else if (tidyData$activity[i] == 5) {tidyData$activity[i] = "STANDING"}
  else if (tidyData$activity[i] == 6) {tidyData$activity[i] = "LAYING"}
}
write.table(tidyData, "./tidyData.txt",  row.name=FALSE)
