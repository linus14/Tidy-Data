{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;}
{\*\listtable{\list\listtemplateid1\listhybrid{\listlevel\levelnfc0\levelnfcn0\leveljc0\leveljcn0\levelfollow0\levelstartat1\levelspace360\levelindent0{\*\levelmarker \{decimal\}.}{\leveltext\leveltemplateid1\'02\'00.;}{\levelnumbers\'01;}\fi-360\li720\lin720 }{\listname ;}\listid1}}
{\*\listoverridetable{\listoverride\listid1\listoverridecount0\ls1}}
\margl1440\margr1440\vieww16840\viewh11440\viewkind0
\deftab720
\pard\pardeftab720\sl360\sa320\partightenfactor0

\f0\fs32 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 The code to create the tidy data set is called 'run_analysis.R'.\
The tidy data set is called 'tidyData.csv'. It contains 81 numeric variables and 2 factor variables (SubjectID and ActivityLabel). The number of values (rows) is 180 corresponding to 30 subjects and 6 activities.\
The code to generate the tidy data set uses the 'dplyr' and 'data.table' packages. The code does the following steps:\
\pard\tx220\tx720\pardeftab720\li720\fi-720\sl360\partightenfactor0
\ls1\ilvl0\cf2 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	1.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 reads in data from the training data files y_train.txt, subject_train.txt, and X_train.txt and combines them into one data frame\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	2.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 reads in data from the test data files y_test.txt, subject_test.txt, and X_test.txt and combines them into one data frame\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	3.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 combines the training and test data frames created in steps 1 and 2\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	4.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 reads in variable names from features.txt and assign to the variables in the combined dataset. Two additional variable names subjectID and ActivityLabel are also added\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	5.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 extracts variables with 'mean' or 'std' in their names and assigns to new data frame. This data frame contains 81 numeric variables and subjectID and ActivityLabel\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	6.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 converts the variables ActivityLabel and SubjectID to factor class\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	7.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 groups by factor variables subjectID and ActivityLabel. Calculates mean of each group. Assigns these means to a new data frame\
\ls1\ilvl0\kerning1\expnd0\expndtw0 \outl0\strokewidth0 {\listtext	8.	}\expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 writes the tidy data set as a .csv file\
}