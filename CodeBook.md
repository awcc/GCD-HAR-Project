Code Book
===============

Summary
---------------

This project takes data from the Human Activity Recognition Using Smartphones dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and produces an output table of averaged means and standard deviations for measurements for each pair of 30 subjects and 6 activities.

The R script run\_averages.R (described below) produces the output file har\_averages.txt (also described below).

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


R script run\_analysis.R
---------------

The file run\_analysis.R reads in data from the UCI Human Activity Recognition (HAR) Dataset.

Training and test data are read in, selecting only variables corresponding to the mean or standard deviation of a measurement. Proper variable names are read in from the features.txt file and cleaned up, and activity names are read in and used to convert the activity numbers to a well-named factor. The data are then merged into one data frame using rbind and cbind.

The data frame har\_data is the large, unaveraged data frame requested in item 4 of the specification. It contains one observation per row, with the subject and activity in the first two columns and each measurement's mean and standard deviation as a variable.

The data frame har\_ave and the output file har\_averages.txt contain averages for each feature, as requested in item 5 of the specification. These meet the tidy data specification:

I have chosen the "wide" style of tidy data because each of the many variables is in fact all part of the same observation. See Hadley Wickham's paper on tidy data: http://vita.had.co.nz/papers/tidy-data.pdf especially Table 12, as well as the course discussion thread discussing wide and narrow tidy data: https://class.coursera.org/getdata-008/forum/thread?thread_id=94
