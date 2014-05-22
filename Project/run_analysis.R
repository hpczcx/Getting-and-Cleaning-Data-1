# Getting and Cleaning Data Course Project


# Merges the training and the test sets to create one data set.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

setwd('C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Project')

# load libraries
library(plyr)
install.packages("reshape")
library(reshape)



# give them headings, and turn the numeric activities into something easier to read

xTrain = read.table("./train/X_train.txt")
yTrain = read.table("./train/y_train.txt")
subjectTrain = read.table("./train/subject_train.txt")

# test set
xTest = read.table("./test/X_test.txt")
yTest = read.table("./test/y_test.txt")
subjectTest = read.table("./test/subject_test.txt")


## Format x values (xTrain and xTest)

# format variable names
#Don't use underscores ( _ ) or hyphens ( - ) in identifiers
# load headings from file
featuresdf = read.table("./features.txt")
headings = featuresdf$V2
activityLabels = levels(activitydf$V2)
activityLabels 

# 561 obs of 477 different types
str(featuresdf)
head(headings)
str(headings)
nrow(headings)
unique(featuresdf$V1)
tail(featuresdf$V1)
headings
featuresdf$V1

# transfer headings to data set
colnames(xTrain) = headings
colnames(xTest) = headings

str(xTest)
names(xTest)
xTest


### format y values (yTest and yTrain)
# change V1 variable to something descriptive "activity"
yTest <- rename(yTest, c(V1="activity"))
yTrain <- rename(yTrain, c(V1="activity"))

# change data in yTest according to activity_labels.txt file
# there are 6 activities
activitydf  = read.table("./activity_labels.txt")

# convert variable names to lowercase
activityLabels = tolower(levels(activitydf$V2))
activityLabels 

# convert $activity to factor and add descriptive labels
yTest$activity = factor(
  yTest$activity, 
  labels = activityLabels
)

yTrain$activity = factor(
  yTrain$activity, 
  labels = activityLabels
)

str(yTest$activity)
str(yTrain$activity)

head(yTest$activity)
head(yTrain$activity)

yTest$activity
levels(yTest$activity)
str(activitydf)
levels(activitydf$V2)

# convert variable names to lowercase
# tolower()

### Format subject variables (subject_train subject_test)
# change subject variable to name to something descriptive
subjectTrain <- rename(subjectTrain, c(V1="subjectid"))
subjectTest <- rename(subjectTest, c(V1="subjectid"))


### Merge the training and the test sets to create one data set.

# combine (x,y,subject) for the training and test sets

str(testMerged)
tail(testMerged)
train = cbind(xTrain, subjectTrain, yTrain)
test = cbind(xTest, subjectTest, yTest)

str(train)
names(train)

# combine train and test set
fullData = rbind(train, test)
str(fullData)


# format variable names
# Don't use underscores ( _ ) or hyphens ( - ) in identifiers
# remove capital letters



names(fullData)



# Extracts only the measurements on the mean and standard deviation for each measurement. 

# extract mean & std values

pattern = "mean|std|subjectid|activity"

tidyData = fullData[,grep(pattern , names(fullData), value=TRUE)]
str(tidyData )
names(tidyData)

# remove parentheses, dash, commas
cleanNames = gsub("\\(|\\)|-|,", "", names(tidyData))
names(tidyData) <- tolower(cleanNames)

# summarize data

result = ddply(tidyData, .(activity, subjectid), numcolwise(mean))
str(result)

