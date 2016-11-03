


# README for Course Project

### Content and Overview

The project contains, in addition to this README.txt: 

  * The Raw Dataset in contained in the **UCI HAR Database** folder
    * This folder contains another *README.txt* from the provider of the data
  * The **run_analysis.R** script that manipulates the data in the *UCI HAR Database* folder  
  * The **CodeBook.md** explaining the variables and functions for the *run_analysis.R*
  * The **tidyData.txt** that contains a dataset of just the mean and standard devation features of the combind dataset produced in the *run_analysis.R* script.

The **run_analysis.R** script reads the provided **UCI HAR Database** and imports the data as dataobjects. It combines the data from the *"test"* and *"train"* X datasets and lables the variables based on the ***features.txt*** found within the database which indicates the variable. It adds the which subject and activity that was performed for each measurement. Note that the function does not read the files contained from the *"Inertial Signal"* folders contained within each respective ***test*** and ***train*** folder.
The script then extracts the variables that contain mean and standard deviation variables along with the subject and activities from the table. It then writes this dataobject called **tidyData.txt**. For more details view the **CodeBook.md**
 

### Project Details

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' within "UCI HAR Dataset" for more details. 

The run_analysis.R script produces a dataset that contains the following variables for each measurement
 
- An identifier of the subject who carried out the experiment.
- Its activity label. 
- A 561-feature vector with time and frequency domain variables. 
    + more information on the features can be found in the CodeBook.md

### Running the script

Note: For the script to run properly the **UCI HAR dataset** folder must be present in the folder index or an error will appear

There are two functions written at the top of the code:

  * **read()**
    * This function reads all `.txt` files in folder within the current working directory, except the *README.txt* and *features_info.txt*, and assigns them as dataframes based on their filenames
  * **readall()**
    * This function retrieves all of the subdirectories within the working directory and applies the `read()` function to read all the `.txt` files in all the subdirectories, except those specified by `"avoid = "` input. 

The script will check that the **"UCI HAR Dataset"** is found in the working directory of the script through the use `grep()` through string matching and if the string is not found the string function will produce an error.

The `readall()` function is then used to read all the `.txt` files besides the "Inerital Signals" folders. 

After the data has been read the data objects for *"X_test/train"*, *"y_test/train"*, and *"subject_test/train"* are put together in separate variables so the ***test*** data are the first elements. The *subject* and *activityID* are named manually while the "X_test/train" data is labeled with the `features` variable.

They are then all connected using `cbind()` into a large dataset. Based on the `activityID` the `activity_labels` were merged into the dataframe. Then the *Subject* and *Activity* was arranged to the start and then the dataframe was sorted by *Subject*.

After the dataset has been combined the script it uses `grep()` to match the columns containing the mean and standard deviation columns. Those columns are then assigned to the `tidyData` variable and finally `write.table()` was used to produce **tidyData.txt** in the original working directory.