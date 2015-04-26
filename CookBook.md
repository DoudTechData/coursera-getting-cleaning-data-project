---
title: "Cook Book"
author: "Edouard Chevalier"
date: "25/04/2015"
output: html_document
---

The dataset is a single file named 'UCI HAR dataset Means Per Activity And Subject.txt'. 
It is a table of 180 records of 59 variables that summarizes main data of the 'Human Activity Recognition Using Smartphones Dataset' <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

### Dataset description
30 volunteers performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. For each activity (first variable) and each subject (second variable) we provide:

* mean and standard deviation of signals from sensors (accelerometer and gyroscope) over time : tBodyAcc-XYZ, tGravityAcc-XYZ and tBodyGyro-XYZ (9 * 2  =  18 variables).
* mean and standard deviation of derived signals (Jerk) over time : tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ ( 6 * 2 = 12 variables).
* mean, standard deviation and mean frequency (Weighted average of the frequency components) of some of the previous signals in frequency domain  : fBodyAcc-XYZ, fBodyAccJerk-XYZ and fBodyGyro-XYZ ( 9 * 3 = 27 variables).

Activity and Subject feature are identified with variable name 'Activity' and 'SubjectId' respectively. 
Values of activities are factors (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Values of SubjectId is simply an integer.
Signal variable names consists of three parts (separated by dots):

* First part of name describe the signal:
    * prefix "t" or "f" means that signals is in the time ('t') or frequency ('f') domain.
    * Following 'Body' or 'Gravity' indicates the 'origin' of the signal: moves of the body of subject or just gravity.
    * Following 'Acc' or 'Gyro' indicates the sensor 'origin': accelerometer or gyroscope.
    * Additional 'Jerk' indicates whether signals is a derived one.
* Second part indicates the statistical value type ('mean' for mean, 'std' for standard deviation and 'meanFreq' for mean frequency.)
* As variable are three dimensional variable (one value over X axis, another over Y axis and last value over Z axis), in dataset each component of this variable is identified by its corresponding suffix ("X", "Y" or "Z").

Please note, that these signals values are 'double' values, without any unit (they are normalized and bounded within [-1,1]).

### How to compute Dataset

The original data set already provides the values but splitted in different files in two data subsets (test and train) and for 'windows' of 2.56 seconds (one record per window).
In this chapter, paths to file are relative to the directory of the UCI HAR dataset. All files are serialized tables with one line per record using space as the separator, but without  variable names as header.

#### Select data

For each subset, we have to select data from different tables and then merge them.
Features from signals are loaded from respectively 'train/X_train.txt' and 'test/X_test.txt' using variable names from column 2 of  'features.txt'. We then select variables we are interested in (variables with names containing either 'mean', 'std' or 'meanFreq').
We merge them with Activity (encoded as an integer code) from respectively 'train/Y_train.txt' and 'test/Y_test.txt' and with Subject (already encoded as an integer code) from respectively 'train/subject_train.txt' and 'test/subject_test.txt'.

We then concatenate train and test records. 
We then replace the coding of values of Activity as integer with more descriptive values (string factors 'WALKING','SITTING', etc...) using 'join' table from file 'activity_labels.txt'.

Result is a table of 10299 records using 59 variables.

#### summarize data

Latter table is then summarized by aggregating records per Activity and per SubjectId, and then computing average for each other variable (signals variables).
Result is the table of 180 observations (one for each Activity (6 possible values) and one for each subject (30 volunteers): 6 * 30 = 180) of 59 variables. That table is the expected dataset.




