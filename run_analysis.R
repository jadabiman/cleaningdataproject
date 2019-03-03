## LOAD DATA
# read test data
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# read train data
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

## MERGE DATA
# combine rows of each data type
subjectAll <- rbind(subjectTrain, subjectTest)
featuresAll <- rbind(featuresTrain, featuresTest)
activityAll <- rbind(activityTrain, activityTest)

# assign variable names
names(subjectAll) <- c("subject")
names(activityAll) <- c("activity")

featuretxt <- read.table( "./UCI HAR Dataset/features.txt")
featurelabel <- featuretxt$V2
names(featuresAll) <- featurelabel

# combine into one data frame
combined <- cbind(subjectAll, activityAll)
data <- cbind(featuresAll,combined)

## EXTRACT MEAN / SD INFORMATION
# identify columns which express mean or standard deviation
meansd <- featurelabel[grep("std\\(\\)|mean\\(\\)" ,featurelabel)]

# subset original data with mean, sd, subject, and activity columns
subsetnames <- c(as.character(meansd), "subject", "activity")
datasubset <- subset (data, select = subsetnames)

## RENAME ACTIVITY VARIABLES TO BE MORE DESCRIPTIVE
activitynames <- c("walking","walkingupstairs","walkingdownstairs","sitting","standing","laying")
# loop that replaces 1 with "walking, 2 with "walkingupstairs" through 6 with "laying"
for (i in 1:6){
  datasubset$activity[datasubset$activity == i] <- activitynames[i]
}
  
## RECODE FEATURE VARIABLES TO BE MORE DESCRIPTIVE
# replace t with time, f with frequency
names(datasubset) <- gsub("^t", "time", names(datasubset))
names(datasubset) <- gsub("^f", "frequency", names(datasubset))

# replace Acc with accelorometer, Gyro with gyrometer, Mag with magnitude
names(datasubset) <- gsub("Acc", "accelerometer", names(datasubset))
names(datasubset) <- gsub("Gyro", "gyrometer", names(datasubset))
names(datasubset) <- gsub("Mag", "magnitude", names(datasubset))

# remove ( and ) and - for cleaner variable names
names(datasubset) <- gsub("\\(", "", names(datasubset))
names(datasubset) <- gsub("\\)", "", names(datasubset))
names(datasubset) <- gsub("\\-", "", names(datasubset))

## CREATE SECOND DATA SET OF VARIABLE MEANS GROUPED BY SUBJECT AND ACTIVITY
datasubset %>% group_by(subject,activity) %>% summarize_all(mean) %>% write.csv(file = "./UCI HAR Dataset/summary.csv")
