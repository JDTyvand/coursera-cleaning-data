## coursera-cleaning-data
Class project repo for the ["Getting and cleaning data"](https://www.coursera.org/learn/data-cleaning) course from Johns Hopkins University on Coursera.

The goal of the project was to read in data collected from human activites recorded on smartphones, and to ouput this data in a tidy data set containing the mean values for each activity ordered by user. 

**The tidy data set can be generated with the [run_analysis.R](run_analysis.R) by doing the following:**

1. Download and unzip the [smartphone activity data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Place the following files in the same folder as the run_analysis.R script:
	* subject_train.txt
	* subject_test.txt
	* X_train.txt
	* X_test.txt
	* y_train.txt
	* y_test.txt
	* features.txt
	* activity_labels.txt
3. Run the run_analysis.R script making sure that the working directory is set to the one containing the files and script. **The script relies the dyplr package.**

**The generated tidy data set can be found in the text file [tidyData.txt](tidyData.txt).**


For more information about the data files and the cleaning process used to generate the tidy data set, please see the supplied [code book](CodeBook.md)
