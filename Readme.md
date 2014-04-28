## This repository contains the assignment file(s) for Getting and Cleaning Data Project. Script was prepared and run on Windows.

### Follow below steps to understand and execute the script to generate required tidy data.

1. Create a folder and download the zip file and extract all files into it. 

2. For this script folder name is "C:\Data Science\3. Getting and Cleaning Data\Week3\UCI HAR Dataset".

3. Script sets the working directory to above folder. If you extract the file to any other location, please update directory in the following line of code:

	setwd("C:\\Data Science\\3. Getting and Cleaning Data\\Week3\\UCI HAR Dataset")

4. Please note that for windows based system "\\" is used. If you are using unix or mac based system, please use "/" for the directory.

5. Next Load the subject data from subject_test.txt and subject_train.txt fro the subfolders of "UCI HAR Dataset".

6. Please note that once the working directory is set, relative path is used to navigate to rest of the files.

7. Subject data from test and training set is combined into one set and named as allSub dataframe.

8. Next, labels from test and training data is read and combined into one set and named as allLabels dataframe.

9. Since the labels contain activity IDs, its column name is set to ActivityID

10. Next, activity_labels.txt file containing the mapping between Activity ID and Name is Loaded.

11. As per requirement, Activity Id in the allLabels data frame is replaced with Activity Name using the match feature of R. Accordingly column name is changed to ActivityName.

12. Next, input features from test (X_test.txt) and training (X_train.txt) set in loaded and combined into one dataset called allInput dataframe.

13. Name of the allInput dataframe is set with the feature names from the features.txt file. 

14. as per requirement, features index containing mean and std word in the feature name is selected into a vector call  meanStdColumns.

15. A vertical subset of allInput data frame is created by selecting only mean and std columns from all Input data. This dataframe is named as stdMeanInput.

16. Next, Subject, ActivityName columns is binded to stdMeanInput dataframe such that Subject is first column, ActivityName is next column and rest mean and std columns of input features.

17. this new dataframe is call tidyData, with only relevant columns for aggregation.

18. Next tidyData is melted with  ID as "Subject" and "ActivityName" for aggregating mean and standard columns as measure columns.

19. dcast function is  used to get mean of all mesures and group it by Subject and ActivityName.

20. This final dataset is called as tidyDataMean dataframe and written to the working directory as tidy_data_mean.txt file. This file is single space separated and without column names.




