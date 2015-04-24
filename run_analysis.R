library(dplyr)
tidyData <- function(){
    #extracting feature names
    featuresNames <- read.table("UCI HAR Dataset//features.txt", stringsAsFactors = FALSE)$V2

    #reading observations
    test <- read.table("UCI HAR Dataset//test//X_test.txt", col.names=featuresNames)
    train <- read.table("UCI HAR Dataset//train//X_train.txt", col.names=featuresNames)

    #remove variables with duplicate names (anyway we do not need them, it is bandsEnergy variables)
    test <- test[!duplicated(names(test))]
    train <- train[!duplicated(names(train))]
    
    #select only mean and standart deviation of signals over time but also mean frequency.
    test <- select(test, contains("mean.."), contains("std.."), contains("meanFreq.."))
    train <- select(train, contains("mean.."), contains("std.."), contains("meanFreq.."))
    
    #adding subject and activity code
    test <- mutate(test, SubjectId = read.table("UCI HAR Dataset/test/subject_test.txt")$V1, ActivityCode = read.table("UCI HAR Dataset/test/y_test.txt")$V1)
    train <- mutate(train, SubjectId = read.table("UCI HAR Dataset/train/subject_train.txt")$V1, ActivityCode = read.table("UCI HAR Dataset/train/y_train.txt")$V1)
    
    #concatenating
    res <- rbind(train, test)
    
    #loading activity factor
    activity_factor <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityCode","Activity"))
    #merging activity in data set (note that the common id is "ActivityCode")
    res <- merge(res, activity_factor)
    
    #removing Activity code
    res <- select(res, -ActivityCode)
    res
}
#sumarize data by computing means of measurements by activity and subject
summarizeData <- function(dataset){
    aggregate(. ~ Activity + SubjectId , data = dataset, mean)
}

#write summary as a table in a file.
# can be loaded in with read.table("UCI HAR dataset Means Per Activity And Subject.txt",header=TRUE)
writeSummary <- function(tab,filename="UCI HAR dataset Means Per Activity And Subject.txt"){
    write.table(tab, file=filename, row.names=FALSE)
}
#Do the job
writeSummary(summarizeData(tidyData()))


