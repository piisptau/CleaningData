CodeBook for the final tidy dataset produced by run_analysis script
==========================================

### Source data

Original Human Activity Recognition Using Smartphones Data Set raw data was fetched from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This zipfile was unzipped and the relevant source text files were picked from the unzipped UCI HAR Dataset directory.

Original raw data format is described in  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source files used were
* features.txt
* activity_labels.txt
* test/subject_test.txt
* train/subject_train.txt
* test/Y_test.txt
* train/Y_train.txt
* test/X_test.txt
* train/X_train.txt


### Transformation done to the original data

The measurement data is normalized and has values between [-1,1].

Only those measurement columns that were related to mean or standard deviation were included. The columns were selected based on the column name. If the column name had string 'mean' or 'std' as part of the name then it was concluded that the column contains mean or standard deviation measurement data and it was included in the final set.

### Data columns in the final data set
Subject : the subject for whom the data was collected
Activity  : the name of activity
tBodyAcceleration.Mean.X
tBodyAcceleration.Mean.Y
tBodyAcceleration.Mean.Z
tBodyAcceleration.StandardDeviation.X
tBodyAcceleration.StandardDeviation.Y
tBodyAcceleration.StandardDeviation.Z
tGravityAcceleration.Mean.X
tGravityAcceleration.Mean.Y
tGravityAcceleration.Mean.Z
tGravityAcceleration.StandardDeviation.X
tGravityAcceleration.StandardDeviation.Y
tGravityAcceleration.StandardDeviation.Z
tBodyAccelerationJerk.Mean.X
tBodyAccelerationJerk.Mean.Y
tBodyAccelerationJerk.Mean.Z
tBodyAccelerationJerk.StandardDeviation.X
tBodyAccelerationJerk.StandardDeviation.Y
tBodyAccelerationJerk.StandardDeviation.Z
tBodyGyro.Mean.X
tBodyGyro.Mean.Y
tBodyGyro.Mean.Z
tBodyGyro.StandardDeviation.X
tBodyGyro.StandardDeviation.Y
tBodyGyro.StandardDeviation.Z
tBodyGyroJerk.Mean.X
tBodyGyroJerk.Mean.Y
tBodyGyroJerk.Mean.Z
tBodyGyroJerk.StandardDeviation.X
tBodyGyroJerk.StandardDeviation.Y
tBodyGyroJerk.StandardDeviation.Z
tBodyAccelerationMagnitude.Mean
tBodyAccelerationMagnitude.StandardDeviation
tGravityAccelerationMagnitude.Mean
tGravityAccelerationMagnitude.StandardDeviation
tBodyAccelerationJerkMagnitude.Mean
tBodyAccelerationJerkMagnitude.StandardDeviation
tBodyGyroMagnitude.Mean
tBodyGyroMagnitude.StandardDeviation
tBodyGyroJerkMagnitude.Mean
tBodyGyroJerkMagnitude.StandardDeviation
fBodyAcceleration.Mean.X
fBodyAcceleration.Mean.Y
fBodyAcceleration.Mean.Z
fBodyAcceleration.StandardDeviation.X
fBodyAcceleration.StandardDeviation.Y
fBodyAcceleration.StandardDeviation.Z
fBodyAcceleration.MeanFrequency.X
fBodyAcceleration.MeanFrequency.Y
fBodyAcceleration.MeanFrequency.Z
fBodyAccelerationJerk.Mean.X
fBodyAccelerationJerk.Mean.Y
fBodyAccelerationJerk.Mean.Z
fBodyAccelerationJerk.StandardDeviation.X
fBodyAccelerationJerk.StandardDeviation.Y
fBodyAccelerationJerk.StandardDeviation.Z
fBodyAccelerationJerk.MeanFrequency.X
fBodyAccelerationJerk.MeanFrequency.Y
fBodyAccelerationJerk.MeanFrequency.Z
fBodyGyro.Mean.X
fBodyGyro.Mean.Y
fBodyGyro.Mean.Z
fBodyGyro.StandardDeviation.X
fBodyGyro.StandardDeviation.Y
fBodyGyro.StandardDeviation.Z
fBodyGyro.MeanFrequency.X
fBodyGyro.MeanFrequency.Y
fBodyGyro.MeanFrequency.Z
fBodyAccelerationMagnitude.Mean
fBodyAccelerationMagnitude.StandardDeviation
fBodyAccelerationMagnitude.MeanFrequency
fBodyBodyAccelerationJerkMagnitude.Mean
fBodyBodyAccelerationJerkMagnitude.StandardDeviation
fBodyBodyAccelerationJerkMagnitude.MeanFrequency
fBodyBodyGyroMagnitude.Mean
fBodyBodyGyroMagnitude.StandardDeviation
fBodyBodyGyroMagnitude.MeanFrequency
fBodyBodyGyroJerkMagnitude.Mean
fBodyBodyGyroJerkMagnitude.StandardDeviation
fBodyBodyGyroJerkMagnitude.MeanFrequency
angletBodyAccelerationMean.gravity
angletBodyAccelerationJerkMean.gravityMean
angletBodyGyroMean.gravityMean
angletBodyGyroJerkMean.gravityMean
angleX.gravityMean
angleY.gravityMean
angleZ.gravityMean


