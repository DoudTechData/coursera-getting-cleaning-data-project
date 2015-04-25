
# Coursera Getting and cleaning data project
### Average values from 'Human Activity Recognition Using Smartphones Dataset'

This tool analysis provides a 'summary' data view of the 'Human Activity Recognition Using Smartphones Dataset'
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> [1]

### Dataset
30 volunteers performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
The file 'UCI HAR dataset Means Per Activity And Subject.txt' provides different
interesting values for each subject and activity they do. 
It can be loaded into R with command read.table("UCI HAR dataset Means Per Activity And Subject.txt",header=TRUE).
For more details on the dataset and how it was built, please refer to CodeBook.md.

### Rebuilding Dataset
To rebuild data set (or do your own 'reshapes'), you should download and unzip 
the dataset file <http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip> .
Please check that it is unzipped in directory 'UCI HAR Dataset'. (If you are out of space, 
please note that sub-directories 'Inertial Signals' could be removed).
You can then run the script run_analysis.R by sourcing it in R to rebuild the dataset from scratch.
For details on the different steps, please have a look to comments in the script file.


This dataset and source code is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
