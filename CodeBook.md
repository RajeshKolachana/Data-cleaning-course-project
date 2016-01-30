# Code Book
This code book contains updated description of variables, data and the transformations performed in processing the data.

## Data Source
The source of the raw data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description of the data used in this project can be found at [The UCI Machine Learning Repository]("http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones").

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Description of variables
* `subject_train`/`subject_test` contains the ids of train/test subjects. The subject ids of the observations in train dataset can be found in UCI HAR Dataset/train/subject_train.txt and the subject ids of the observations in test dataset can be found in UCI HAR Dataset/test/subject_test.txt
* `activities_train`/`activities_test` contains the type of activity performed when the corresponding measurements were taken. The activity ids of the observations in train dataset can be found in UCI HAR Dataset/train/y_train.txt and the activity ids of the observations in test dataset can be found in UCI HAR Dataset/test/y_test.txt. The mapping of the activity ids and their labels can be found in UCI HAR Dataset/activity_labels.txt
* The test and train datasets(`X_train` and `X_test`) contain measurements of 561 features. A list of all feature names can be found in UCI HAR Dataset/features.txt.

## Data processing
The data processing for the current test and train datasets involves the following tranformation steps.

* Loading and cleaning activity labels and features. Non alphanumeric characters such as "()", "-", "," are removed from the feature names. Their values are stored in `activity_labels` and `features`.
* Merging tain and test datasets to create one dataset `merged_data`. The merged dataset contains observations from X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt.
* Extracting only the measurements on the mean and standard deviation for each measurement.
* Using descriptive activity names to name the activities in the data set.
* Appropriately labeling the data set with descriptive variable names using `features_names`.
* Creating an independent tidy data set with the average of each variable for each activity and each subject as `final_data` which is in turn written as tidydata.txt.
