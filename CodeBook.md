## Code Book

This code book contains an overview of the data files and cleaning process used to generate the tidy data set for the Coursera "Getting and Cleaning Data" class project.

### Data file overview

The files used where downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The raw data in the "Inertial Signals" folders were not used for this project.

The data is collected from 30 subjects recording data from the 6 following activites:

* Walking
* Walking upstars
* Walking downstairs
* sitting
* standing
* laying

The data used and their content is as follows:

* subject_train.txt: vector of lenght 7352, containing the subject id related to the observations in x_train 
* subject_test.txt: vector of lenght 2947, containing the subject id related to the observations in x_test
* x_train: training set containing 7352 observations of the 561 features 
* x_test: test set containing 2947 observations of the 561 features
* y_train.txt: vector of lenght 7352, containing the activity id related to the observations in x_train 
* y_test.txt: vector of lenght 2947, containing the activity id related to the observations in x_test
* features.txt: vector of lenght 561, containing the names of the features
* activity_labels.txt: 6 columns and 2 rows, releating the activity ID to the names of the activities

See the readme.txt and features_info.txt contained in the download folder for more information on the data files.

### Data cleaning process

The data was cleaned and output to the file [tidyData.txt](tidyData.txt) using the following steps:

1. The 8 files listed above were read into data frames, with column names given to the "subject" and "activity" columns from the "subject" and "y" files.
2. The columns of the x-files were given names using the names given in the features file.
3. The subject, y and x-files where combined column-wise using cbind, for both the training and test sets.
4. The training and test sets were merged using rbind.
5. The columns containing "mean()" and "std()" were extracted using grep, per the instructions for the project. This would ideally be done using select() from dplyr, but was not possible due to duplicate column names. The data frame was then reduced by slicing extracting only the first two columns(subject and activity) and the mean and std columns.
6. The values of the activites column was set to factors, linking the values to the activity names given in the activity_labels file.
7. An independent tidy data frame was created by grouping the merged data set by subject and activity, then summarizing each feature column using the mean, and finally arranging by subject and activity. This was done using chained calls made available using the dplyr package.
8. The tidy data set was written to the file [tidyData.txt](tidyData.txt) using write.table()





