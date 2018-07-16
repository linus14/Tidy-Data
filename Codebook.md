**Overview of Original Data**

Sensor signals were collected from a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone. The embedded accelerometer and gyroscope was used to collect the data. The dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

*Raw Signals*
- Gyroscope body signal (BodyGyro)
- The acceleration signal was separated into body and gravity acceleration signals (BodyAcc and GravityAcc)
- The magnitude of all the above signals were calculated (BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag)
- Fast Fourier Transform was applied to some of the signals to obtain the frequency domain signal

*Variables in the Original Data*
- Several different values (for e.g. mean, std deviation, energy, entropy) were estimated for the signals. There were 561 such variables in the original dataset. They were stored in the X_train.txt and X_test.txt. The file ‘features.txt’ contained all the 561 variable names.
- Two categorical variables, subject ID and activity, were stored in the following files: subject_train.txt, subject_test.txt, y_train.txt, y_test.txt. Each row in the subject files identifies the subject who performed the activity. Its range is from 1 to 30.



**Overview of Tidy Data**

The following steps were taken to create the tidy data set:
- Data was read from the text files containing the subject ID, activity code, and the 561 variables. They were stored in 3 different data frames (3 each for test and training sets).
- The 3 data frames were combined using column binding. This was done for both the training data and test data.
- Training and test data frames were then combined using row binding.
- Variable names for the combined dataset were created by reading and storing the contents of ‘features.txt’.
- The variables containing ‘mean’ or ‘std’ in their names were extracted and stored in a new data frame.
- The activity and subject ID variables of the newly created data frame were converted to the ‘factor’ class
- The data frame was grouped by subject ID and activity. The mean of each group was calculated and stored in a new data frame
- This final data frame with 180 means (corresponding to 30 subjects and 6 activities) was written out as a .csv file. The tidy data contains 2 factor variables and 81 numeric variables.

*Variables in the Tidy Data Set*

The first two columns contain the factor variables ‘Subject ID’ and ‘ActivityLabel’. The SubjectID range is from 1 to 30. The ActivityLabel is a factor with 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

Naming of the numeric variables was performed by appending together the following components (separated by ‘.’):
- prefix ’t’ or ‘f to indicate time or frequency domain signal, respectively
- the name of the raw signal (for e.g. BodyGyroJerk)
- the estimated value (for e.g. ‘std’ for standard deviation)
- suffix X, Y, Z to indicate the axial coordinates
Some typical examples of a variable name are: tBodyAcc.mean.X, fBodyAccJerk.std.Y

*Units of the Variables*
- All acceleration related variables (with ‘Acc’ in the name) - Standard gravity unit ‘g’.
- All angular velocity or gyroscope related variables (with ‘Gyro’ in the name) - Radians/second

*Notes*
- All numeric data are bound within [-1,1]
