# run_analysis.R

# This file reads in data from the UCI Human Activity Recognition (HAR) Dataset
# which is assumed to be located in PATH (below).

# Training and test data is read in, selecting only variables corresponding to
# the mean or standard deviation of a measurement. Proper variable names are read
# in and cleaned up, and activity names are read in and used. The data are then merged
# into one data frame.

# The data frame har_data is the large, unaveraged data frame requested in
# item 4 of the specification. The data frame har_ave and the output file
# har_averages.txt contains averages for each feature, as requested in item 5
# of the specification.

# I have chosen the "wide" style of tidy data because each of the many variables
# are in fact all part of the same observation.
# See Hadley Wickham's paper on tidy data: http://vita.had.co.nz/papers/tidy-data.pdf
# especially Table 12, as well as the course discussion thread discussing wide
# and narrow tidy data: https://class.coursera.org/getdata-008/forum/thread?thread_id=94

library(reshape2)

OLDPATH <- getwd()
PATH <- "~/Documents/Code/R/gettingcleaningdata/project/UCI HAR Dataset/"
setwd(PATH)

# read in list of activities, for later use in making a factor variable
activities <- read.table("activity_labels.txt", stringsAsFactors = F)

# read in list of features (variables for the data to come) and identify the subset of these
# which are a mean or a standard deviation. These contain "mean()" or "std()"
features <- read.table("features.txt", stringsAsFactors = F)
col_indices <- grep("mean\\(\\)|std\\(\\)", features[,2])

# clean up these names and put them into a proper format for a variable name in a data frame
features[col_indices,2] <- sub("mean\\(\\)", "Mean", features[col_indices,2])
features[col_indices,2] <- sub("std\\(\\)", "SD", features[col_indices,2])

# set up the columns to keep in col_classes and their names in col_names
# using the features table we just read in and the col_indices to keep
tot_col = dim(features)[1]            # total number of features
col_classes = rep("NULL", tot_col)    # listing a column class as "NULL" means it won't be kept
col_classes[col_indices] = "numeric"  # these are the columns to keep from x_test and x_train
col_names = rep("NULL", tot_col)
col_names[col_indices] = features[col_indices,2]   # these are the variable names

# x_test and x_train contain the movement readings for each observation (row) 
# we include the col_classes and col_names lists of columns to keep and
# their descriptive names we read in from the features file
x_test <- read.table("test/X_test.txt", colClasses = col_classes, col.names = col_names)
x_train <- read.table("train/X_train.txt", colClasses = col_classes, col.names = col_names)
x_all = rbind(x_test,x_train)

# y_test and y_train list the activity taking place for each observation
# we convert this to a factor using the activity table we read in
y_test <- read.table("test/y_test.txt", col.names = "Activity")
y_train <- read.table("train/y_train.txt", col.names = "Activity")
y_all = rbind(y_test,y_train)
y_all[,1] <- factor(y_all[,1], levels = activities[,1], labels = activities[,2])

# subject_test and subject_train list the subject (numbered 1 to 30)
# corresponding to each observation.
subject_test <- read.table("test/subject_test.txt", col.names = "Subject")
subject_train <- read.table("train/subject_train.txt", col.names = "Subject")
subject_all <- rbind(subject_test,subject_train)

# now we can bind the subject, activity, and measurement data frames
# each already has descriptive column names
# this is the data set requested in item 4 of the specification
har_data <- cbind(subject_all,y_all,x_all)

# now we melt the data in preparation for averaging using dcast
har_melt <- melt(har_data, c("Subject", "Activity"), variable.name = "Measurement")

# now we cast the molten data into our final tidy data frame with one row per
# subject-activity pair, and columns containing the averages of the 
# means and standard deviations of each feature for that pair
har_ave <- dcast(har_melt, Subject + Activity ~ Measurement, mean)

# write out the tidy, averaged data
outfile <- "har_averages.txt"
write.table(har_ave, outfile, row.name = F, quote = F)

# revert working directory
setwd(OLDPATH)