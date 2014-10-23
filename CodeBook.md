Code Book
===============

Summary
---------------

This project takes data from the Human Activity Recognition Using Smartphones dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and produces an output table of averaged means and standard deviations for measurements for each pair of 30 subjects and 6 activities.

The R script run\_averages.R (described in README.md) produces the output file har\_averages.txt (described below).

Output file har\_averages.txt
---------------

The har_averages.txt file contains 180 rows and 68 columns with a single space as the delimiter. The first two columns are:

Subject
Activity

These list the subject, numbered from 1 to 30, and the activity, which is one of the six of:

WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING

This gives 30 subjects times 6 activities equals 180 rows. Rows are grouped first by subject, then in order by activity.

The remaining 66 columns are averaged means and standard deviations of measurements for each subject-activity pair, all numeric.

###Description of variable names

Those variable names preceded by t are time domain and those preceded by f are frequency domain. These are broken down into Body and Gravity components and then linear acceleration Acc, angular velocity Gyro, and their derivatives AccJerk and GyroJerk are given. Magnitudes are listed with an ending Mag and the X, Y, and Z components are given by a suffix .X, .Y, or .Z

In this file we have averaged the means and standard deviations of each of these over all observations for the given subject-activity pair. For each measurement, there is a .Mean and a .SD version for each (preceding the .X, .Y, or .Z if the variable has three components).

Here is the list, in order, leaving out .Mean or .SD and grouping as .XYZ the three components. In the file, these measurements appear in this order, with the .Mean (.X then .Y then .Z, if three-component) followed by the .SD (again .X then .Y then .Z if three-component) versons:

tBodyAcc.XYZ
tGravityAcc.XYZ
tBodyAccJerk.XYZ
tBodyGyro.XYZ
tBodyGyroJerk.XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc.XYZ
fBodyAccJerk.XYZ
fBodyGyro.XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

To clarify, the first of these variables in the file is tBodyAcc.Mean.X, the second is tBodyAcc.Mean.Y, and the last is fBodyGyroJerkMag.SD
