Getting-and-Cleaning-Data
=========================
Peer Reviewed Assessment

Introduction

  This repository contains the answer to the Peer reviewed assessment of the course "Getting and Cleanin Data"
  
The Script

  The R script "run_analysis.R" does the following. 

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement. 
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names. 
    From the recently created data set, it creates a second, independent tidy data set with the average of each            variable for each activity and each subject.

  Steps to work on this course project

    Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.
    Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd()        function in RStudio.
    Run source("run_analysis.R") and it will generate a new file tiny_data.txt in your working directory.

Dependencies

    The "run_analysis.R" file depends on reshape2 and data.table. 
