library(dplyr)

setwd('Misc Files\\UCI HAR Dataset')

## Loading all the files to use

subject_test <- read.table('test\\subject_test.txt', sep = '')
subject_train <- read.table('train\\subject_train.txt', sep = '')
X_test <- read.table('test\\X_test.txt', sep = '')
X_train <- read.table('train\\X_train.txt', sep = '')
y_test <- read.table('test\\y_test.txt', sep = '')
y_train <- read.table('train\\y_train.txt', sep = '')

# And the ones with the labels of X and Y

features <- read.table('features.txt')
labelNames <- read.table('activity_labels.txt')

# Merging each test-train pairs

subject <- rbind.data.frame(subject_test, subject_train)
X_data <- rbind.data.frame(X_test, X_train)
y_data <- rbind.data.frame(y_test, y_train)

# Merging Y with its labels

y_data <- merge(y_data, labelNames, by = 'V1')

# Renaming all the columns

names(X_data) <- make.names(features$V2, unique = TRUE, allow_ = TRUE)
names(y_data) <- c('activityId', 'activityName')
names(subject) <- 'subject'

# Deleting the initial files

rm(subject_test, subject_train, 
   X_test, X_train, y_test, y_train,
   features, labelNames)

# Merging all data in a single data frame

complete <- cbind.data.frame(subject, y_data)
complete <- cbind.data.frame(complete, X_data)

# Vector with the columns with mean. or std. in their name

names <- grep('mean\\.|std\\.', names(complete), value = TRUE)

# Subset of the complete data frame using only the descriptive columns
#  and the ones selected in the vector 'names'

df1 <- select(complete, subject:activityName, names) %>%
   arrange(subject, activityId)

write.table(df1, 'dataset 1.txt', row.name = FALSE)

# Independent grouping of the data frame 'df1' by 'subject' and 'activityId'

df2 <- group_by(df1, subject, activityName) %>%
   arrange(subject, activityId)

# Summary of the data frame with the mean of each variable

df2 <- summarise_all(df2, mean)

write.table(df2, 'dataset 2.txt', row.name = FALSE)
