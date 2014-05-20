# Getting and Cleaning Data Course Project

# Merges the training and the test sets to create one data set.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

setwd('C:/Users/dsbmac/Documents/Professional Development/Getting and Cleaning Data/Project')

X_train = read.table("./data/train/X_train.txt")
y_train = read.table("./data/train/y_train.txt")

headings = read.table("./data/features.txt")
colnames(X_train) = headings$V2
colnames(y_train) = c("yTrain")


# Extracts only the measurements on the mean and standard deviation for each measurement. 

# extract mean
# df[,grep("^[Bb]", names(df), value=TRUE)]
sample = X_train[1:5,1:10]
str(sample)

pattern = "mean|std"
extract = sample[,grep(pattern , names(sample), value=TRUE)]
labels(extract)

str(extract)

extract = X_train[,grep(pattern , names(X_train), value=TRUE)]
str(extract)

mergedData = extract
mergedData$yTrain = y_train$yTrain
str(mergedData)