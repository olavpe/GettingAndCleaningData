

# Code Book for Course Project

## The Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

***mean(): Mean value***
***std(): Standard deviation***
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## The Variables in the Script

  * **activity_labels:** Dataframe of the contents in ***activity_labels.txt***
  * **features:** Vector of the contents in ***features.txt***
  * **subject_test:** Vector of the contents in ***subject_test.txt***
  * **X_test:** Dataframe of the contents in ***X_test.txt***
  * **y_test:** Vector of the contents in ***y_test.txt***
  * **subject_train:** Vector of the contents in ***subject_train.txt*** 
  * **X_train:** Dataframe of the contents in ***X_train.txt***
  * **y_train:** Vector of the contents in ***y_train.txt***
  * **XDataSets:** Contains merged table of ***X_test*** and ***X_train***
  * **activityID:** Contains the merged content of ***y_test*** and ***y_train***
  * **Subject:** Contains the merged content of ***subject_test*** and ***subject_train***
  * **DataSets:** Merged dataset of `XDataset`,`Subject`, and `activityID` completely labeled with content from `features`
  * **meanCols:** Feature columns numbers that contain "mean"
  * **stdCols:** Feature columns numbers that contain "std"
  * **extractCols:** Combination of `meanCols` and `stdCols`
  * **tidyData:** Dataset containing columns specified by `extractCols`, as well as *Subject* and *Activity* variables
