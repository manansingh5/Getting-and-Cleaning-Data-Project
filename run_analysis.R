library(plyr)

## loading data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## combining datasets( binding by rows)
datax <- rbind(x_test, x_train)
datay <- rbind(y_test, y_train)
datasubject <- rbind(subject_test, subject_train)

## finding columns only with mean and std
features_mnstd <- grep("-(mean|std)\\(\\)", features[, 2])

## subsetting the dataset on the basis of mean & standard deviation
datax <- datax[, features_mnstd]
## giving column names
names(datax) <- features[features_mnstd,2]

## giving column names to the dataset using descriptive activity names
datay[,1] <- activity_labels[datay[,1], 2]
names(datasubject) <- "Subject"
names(datay)<- "Activity"


## compiling the final dataset by joining x and y datasets
data_together <- cbind(datax, datay, datasubject)

## forming the final tidy dataset according to each activity & subject
tidy_data<- ddply(data_together, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

## writing the final compiled data to a text file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)




