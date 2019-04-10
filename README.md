# Tidy Smartphone Dataset

## How the script works

The script takes the "Human Activity Recognition Using Smartphones Data Set" from the UCI Machine Learning Repository and extracts the averages of the means and standard deviation for each activity and subject.

The first part of the script reads the data from the .txt files into R, as long as the **UCI.HAR.Dataset** folder is in the working directory. The test and training data set at this point are each separated into subject list, activity list and values list. The script then reads the feature list from the "features.txt" file, takes only the second column containing the feature names, and fixes some erreneous feature names.

Next the script renames the activity list from the number-coded list in the original data set to the actual activity name. To do this, the list has to be coerced into a vector first before being coerced back to a data frame after renaming.

The separated subject list, activity list and values list are then merged to create test and training data sets. The variables in both sets are then renamed according to the feature list (with some new additions, "Subject" and "Activity"). The test and training data sets are then merged into one data set.

*grep* is then used to extract only variables involving the mean and standard deviation from the features list, and this is then used to subset the data set into only those for the mean and standard deviation, plus the "Subject" and "Activity" columns.

The data set above is then split according to "Subject" and "Activity", and *sapply* is used to calculate the average for each variable. Transposing, *t()*, is done since *sapply* coerces the values into a matrix, but the subjects and activities become columns. This creates two tables, **acts** and **subs** that contains averages of each variable for each activity and each subject respectively.

Finally, **acts** and **subs** are merged so that it can be written into a .txt file with the rows for activities at the top.

Original data set obtained from:  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).