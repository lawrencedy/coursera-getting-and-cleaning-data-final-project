# CodeBook.md

## Data in UCI HAR Dataset
The data in this project comes from the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The dataset summary.txt contains two ID variables, as follows:
* **Subject** - The identifier for the subject in the experiment. Integer from 1 to 30.
* **Activity** - The activity that was performed for the observation. Factor variable with 6 levels: walking, walking upstairs, walking downstairs, sitting, standing, laying.

The dataset summary.txt also contains a summary of 66 measure variables. These are the average of the mean and standard deviation of the observed values of the following 33 measurements:
* Time Body Accelerometer X-Axis
* Time Body Accelerometer Y-Axis
* Time Body Accelerometer Z-Axis
* Time Gravity Accelerometer X-Axis
* Time Gravity Accelerometer Y-Axis
* Time Gravity Accelerometer Z-Axis
* Time Body Accelerometer Jerk X-Axis
* Time Body Accelerometer Jerk Y-Axis
* Time Body Accelerometer Jerk Z-Axis
* Time Body Gyroscope X-Axis
* Time Body Gyroscope Y-Axis
* Time Body Gyroscope Z-Axis
* Time Body Gyroscope Jerk X-Axis
* Time Body Gyroscope Jerk Y-Axis
* Time Body Gyroscope Jerk Z-Axis
* Time Body Accelerometer Magnitude
* Time Gravity Accelerometer Magnitude
* Time Body Accelerometer Jerk Magnitude
* Time Body Gyroscope Magnitude
* Time Body Gyroscope Jerk Magnitude
* Frequency Body Accelerometer X-Axis
* Frequency Body Accelerometer Y-Axis
* Frequency Body Accelerometer Z-Axis
* Frequency Body Accelerometer Jerk X-Axis
* Frequency Body Accelerometer Jerk Y-Axis
* Frequency Body Accelerometer Jerk Z-Axis
* Frequency Body Gyroscope X-Axis
* Frequency Body Gyroscope Y-Axis
* Frequency Body Gyroscope Z-Axis
* Frequency Body Accelerometer Magnitude
* Frequency Body Accelerometer Jerk Magnitude
* Frequency Body Gyroscope Magnitude
* Frequency Body Gyroscope Jerk Magnitude

Each measure variable is normalized between -1 and 1. The meaning of the measured variables as well as the methodology may be found in features_info.txt and README.txt files in the UCI HAR Dataset.
### Experiment Design
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### Measurement
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean

## Code Book
This section describes the functions used and the objects generated within run_analysis.R. The READme.md file descirbes how the script works.

### Important Functions
1. unzip - Used to unzip the downloaded zip file.
2. list.files - Get a list of the files ending in .txt to be imported.
3. lapply - Returns a list containing the data tables of each .txt file.
4. read.table - Reads in the .txt files provided into a table.
5. rbind - Used to combine the test and training set data into one data set.
6. cbind - Used to combine the tables with different variables contained in the list into one data set containing all of these variables.
7. gsub - Substitute the labels into the vector specified. Used to rename the activity and feature variables into tidy labels.
8. summarize_all - Summarizes the dataset by a specified function (mean) and grouped by the identification variables.
9. write.table - Exports the tidy dataset into the working directory.

### Objects
1. TestIDFiles - List containing the imported .txt files in the directory "./UCI HAR Dataset/test". Each element in the list corresponds to one data frame generated from one .txt file.
2. TrainIDFiles - List containing the imported .txt files in the directory "./UCI HAR Dataset/train".
3. TestInertialSignals - List containing the imported .txt files in the directory "./UCI HAR Dataset/test/Inertial Signals".
4. TrainInertialSignals - List containing the imported .txt files in the directory "./UCI HAR Dataset/train/Inertial Signals".
5. fileURL - The download link for the dataset.
6. activity_labels - 2 x 6 data frame containing the factor variables for Activity. First column is the numbers 1 to 6 (used to denote the value of the Activity variable in y_test.txt and y_train.txt) with a corresponding label on the second column.
7. all_data - Data frame containing the 68 variables (2 ID variables, 66 measurement variables) with 2,947 observations.
8. summary - The object corresponding to summary.txt, containing the tidy dataset of values of the 68 variables summarized by subject and activity ID variables.

