GCD-HAR-Project
===============

Human Activity Recognition project for the Getting and Cleaning Data coursera course

This project consists of an R script run\_analysis.R, this readme file README.md, a code book CodeBook.md describing the variables, data, and the process used in the R script, and an output file har\_averages.txt

See the file CodeBook.md for an extensive description of the output format.

Summary
---------------

This project takes data from the Human Activity Recognition Using Smartphones dataset at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and produces an output table of averaged means and standard deviations for measurements for each pair of 30 subjects and 6 activities.

The R script run\_averages.R (described below) produces the output file har\_averages.txt (described in CodeBook.md).


R script run\_analysis.R
---------------

The file run\_analysis.R reads in data from the UCI Human Activity Recognition (HAR) Dataset.

Training and test data are read in, selecting only variables corresponding to the mean or standard deviation of a measurement. Proper variable names are read in from the features.txt file and cleaned up, and activity names are read in and used to convert the activity numbers to a well-named factor. The data are then merged into one data frame using rbind and cbind.

The data frame har\_data is the large, unaveraged data frame requested in item 4 of the specification. It contains one observation per row, with the subject and activity in the first two columns and each measurement's mean and standard deviation as a variable.

The data frame har\_ave and the output file har\_averages.txt contain averages for each feature, as requested in item 5 of the specification. These meet the tidy data specification:

I have chosen the "wide" style of tidy data because each of the many variables is in fact all part of the same observation. See Hadley Wickham's paper on tidy data: http://vita.had.co.nz/papers/tidy-data.pdf especially Table 12, as well as the course discussion thread discussing wide and narrow tidy data: https://class.coursera.org/getdata-008/forum/thread?thread_id=94
