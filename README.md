# Tidy-Data

The code to create the tidy data set is called 'run_analysis.R'.

The tidy data set is called 'tidyData.csv'. It contains 81 numeric variables and 2 factor variables (SubjectID and ActivityLabel). The number of values (rows) is 180 corresponding to 30 subjects and 6 activities.

The code to generate the tidy data set uses the 'dplyr' and 'data.table' packages. 

The code does the following steps:
- reads in data from the training data files y_train.txt, subject_train.txt, and X_train.txt and combines them into one data frame
- reads in data from the test data files y_test.txt, subject_test.txt, and X_test.txt and combines them into one data frame 
- combines the training and test data frames created in steps 1 and 2
- reads in variable names from features.txt and assigns names to the variables in the combined dataset. Two additional variable names subjectID and ActivityLabel are also created.
- extracts variables with 'mean' or 'std' in their names and assigns to new data frame. This data frame contains 81 numeric variables and subjectID and ActivityLabel
- converts the variables ActivityLabel and SubjectID to factor class
- groups by factor variables subjectID and ActivityLabel. Calculates mean of each group. Assigns these means to a new data frame
- writes the tidy data set as a .txt file

