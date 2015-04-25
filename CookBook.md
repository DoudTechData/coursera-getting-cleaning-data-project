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

### How to compute Dataset
