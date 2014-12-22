
require("data.table")
require("reshape2")
# Get activity labels
actlab <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]
# Get data column names
features <- read.table("UCI HAR Dataset/features.txt")[,2]
# Get measurements on the mean and standard deviation for each measurement.
extfeat <- grepl("mean|std", features)
# Get and process X_test & y_test data.
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features
# Get the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,extfeat]
# Read activity labels
y_test[,2] = actlab[y_test[,1]]
names(y_test) = c("ActivityID", "ActivityLabel")
names(subtest) = "subject"
# Bind data
tedata <- cbind(as.data.table(subtest), y_test, X_test)
# Load and process X_train & y_train data.
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features
# Get the measurements of mean and standard deviation in each measurement.
X_train = X_train[,extfeat]
# Get activity data
y_train[,2] = actlab[y_train[,1]]
names(y_train) = c("ActivityID", "ActivityLabel")
names(subtrain) = "subject"
# Bind data
trdata <- cbind(as.data.table(subtrain), y_train, X_train)
# Merge the data
data = rbind(tedata, trdata)
idlabels = c("subject", "ActivityID", "ActivityLabel")
dlabels = setdiff(colnames(data), idlabels)
meltdata = melt(data, id = idlabels, measure.vars = dlabels)
# Apply mean function using dcast
tidydata = dcast(meltdata, subject + ActivityLabel ~ variable, mean)
write.table(tidydata, file = "UCI HAR Dataset/tidy_data.txt")