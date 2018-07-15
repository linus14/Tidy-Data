{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red249\green249\blue249;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;\cssrgb\c98039\c98039\c98039;}
\margl1440\margr1440\vieww16820\viewh12840\viewkind0
\deftab720
\pard\pardeftab720\sl320\partightenfactor0

\f0\b\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
Overview of Original Data \

\b0 \
Sensor signals were collected from a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone. The embedded accelerometer and gyroscope was used to collect the data. The dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. \
\

\i \ul \ulc2 Raw Signals\

\i0 \ulnone - Gyroscope body signal (BodyGyro)\
- The acceleration signal was separated into body and gravity acceleration signals (BodyAcc and GravityAcc)\
- Body linear acceleration and angular velocity were derived in time to obtain Jerk signals (BodyAccJerk and BodyGyroJerk)\
- The magnitude of all the above signals were calculated (BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag)\
- Fast Fourier Transform was applied to some of the signals to obtain the frequency domain signal\
\

\i \ul Variables in the Original Data\

\i0 \ulnone Several different values (for e.g. mean, std deviation, energy, entropy) were estimated for the signals. There were 561 such variables in the original dataset. They were stored in the X_train.txt and X_test.txt. The file \'91features.txt\'92 contained all the 561 variable names.\
\
Two categorical variables, subject ID and activity, were stored in the following files: subject_train.txt, subject_test.txt, y_train.txt, y_test.txt. Each row in the subject files identifies the subject who performed the activity. Its range is from 1 to 30.\
\
\
\pard\pardeftab720\sl320\partightenfactor0

\b \cf2 Overview of Tidy Data\
\pard\pardeftab720\sl320\partightenfactor0

\b0 \cf2 \
The R packages \'91dplyr\'92 and \'91data.table\'92 were used to generate the tidy data.\
\
The following steps were taken to create the tidy data set:\
1) Data was read from the text files containing the subject ID, activity code, and the 561 variables. They were stored in 3 different data frames (3 each for test and training sets).\
2) The 3 data frames were combined using column binding. This was done for both the training data and test data.\
3) Training and test data frames were then combined using row binding.\
4) Variable names for the combined dataset were created by reading and storing the contents of \'91features.txt\'92.\
5) The variables containing \'91mean\'92 or \'91std\'92 in their names were extracted and stored in a new data frame.\
6) The activity and subject ID variables of the newly created data frame were converted to the \'91factor\'92 class\
7) The data frame was grouped by subject ID and activity. The mean of each group was calculated and stored in a new data frame\
8) This final data frame with 180 means (corresponding to 30 subjects and 6 activities) was written out as a .csv file. The tidy data contains 2 factor variables and 81 numeric variables.\
\

\i \ul Variables in the tidy data set\

\i0 \ulnone The first two columns contain the factor variables \'91Subject ID\'92 and \'91ActivityLabel\'92. The SubjectID range is from 1 to 30. The ActivityLabel is a factor with 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING\
\
Naming of the numeric variables was performed by appending together the following components (separated by \'91.\'92):\
- prefix \'92t\'92 or \'91f to indicate time or frequency domain signal, respectively\
- the name of the raw signal (for e.g. BodyGyroJerk) \
- the estimated value (for e.g. \'91std\'92 for standard deviation)\
- suffix X, Y, Z to indicate the axial coordinates\
Some typical examples of a variable name are: tBodyAcc.mean.X, fBodyAccJerk.std.Y\
\

\i \ul Units of the Variables\

\i0 \ulnone - All acceleration related variables (with \'91Acc\'92 in the name) - Standard gravity unit \'91g\'92.\
- All angular velocity or gyroscope related variables (with \'91Gyro\'92 in the name) - Radians/second \
\

\i \ul Notes
\i0 \ulnone \
- All numeric data are bound within [-1,1]}