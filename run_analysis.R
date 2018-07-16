library(data.table)
library(dplyr)

# Read the data from y_train.txt, subject_train.txt, and X_train.txt. Combine into one data frame
act_train <- read.table("y_train.txt")
sub_train <- read.table("subject_train.txt")
train <- fread("X_train.txt")
train <- cbind(sub_train, act_train, train)

# Read the data from y_test.txt, subject_test.txt, and X_test.txt. Combine into one data frame
act_test <- read.table("y_test.txt")
sub_test <- read.table("subject_test.txt")
test <- fread("X_test.txt")
test <- cbind(sub_test, act_test, test)

# Merge training and test datasets
combined <- rbind(train,test)

# Read in variable names and assign to the variables in the combined dataset
con <- file("features.txt")
features <- readLines(con)
close(con)
var_names <- c("SubjectID", "ActivityLabel", features)
colnames(combined) <- var_names

# Extract variables with 'mean' or 'std' in their names
subset_combined <- combined %>% select("SubjectID", "ActivityLabel", grep("mean|std", names(combined)))

# Convert the variables ActivityLabel and SubjectID to factor class
subset_combined <- subset_combined %>% mutate(ActivityLabel=factor(ActivityLabel, labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING")))  %>% mutate(SubjectID=factor(SubjectID))

# Clean up variable names by removing brackets, hyphens and numerals
colnames(subset_combined) <- gsub("^[0-9]+ ","",names(subset_combined))
names(subset_combined) <- gsub("\\()","",names(subset_combined))
names(subset_combined) <- gsub("\\-",".",names(subset_combined))

# Group by factor variables subject id and activity. Calculate mean of each group. Write tidy data as .csv file
tidyData <- subset_combined %>% group_by(SubjectID,ActivityLabel) %>% summarize_all(mean)
write.table(tidyData,"tidyData.txt", row.names=FALSE)
